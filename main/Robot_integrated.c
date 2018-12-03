#include <EFM8LB1.h>
#include <stdlib.h>
#include <stdio.h>

//Pin definitions
#define OUTRF P2_3  //right forward
#define OUTRB P2_4  //right back
#define OUTLF P2_1  //left forward
#define OUTLB P2_2  //left back
#define Trig  P1_0  //trigger of the sonar, a 50% pwm
#define Echo  P0_7  //echo of the sonar
#define CLAW_L P1_7
#define CLAW_R P2_0

#define MHZ             1000000L
#define SYSCLK          (72*MHZ)
#define BAUDRATE        115200L
#define UART1_baud      300L

#define SLOWPWM         5
#define BASEPWM         25            //was 20
#define BOOSTPWM        45            //was 75
#define TAPEOFFSET      400
#define SONARFILTER     5

#define TURNING_RADIUS  10      //Lower to reduce turning radius, no less than 7
#define BOOST_SPEED     7       //Lower to make faster, no less than 7 (100%)
#define DFT_SPEED       14      //Lower to make faster, no less than 7 (100%)
#define BOOST_TURN      7       //Raise to make turning in place faster, no greater than 14
#define DFT_TURN        4       //Raise to make turning in place faster, no greater than 14

//Variables that change by B-field comm
volatile bit parity, no_signal, autocar, boost, open, close;
volatile bit x_dir, y_dir;
xdata volatile unsigned short x_absolute = 0, y_absolute = 0;
xdata volatile unsigned short no_signal_0 = 0, no_signal_1 = 0;

//Autonomous Prime
xdata volatile unsigned short sequence_timer, sequence_state;
volatile bit sequence_timeout, prime_awaken;
volatile bit dir;
xdata volatile short dir_count=0;            //used to determine the direction, if <=-7 then cw, if >=7 ccw
xdata volatile unsigned short timer_count=0;
xdata volatile unsigned short sonar_count = 0;
xdata volatile unsigned short sonar_count_2 = 0;

volatile bit find_bridge_flag = 0;
volatile bit find_circle1_flag = 0;
volatile bit find_circle2_flag = 0;
volatile bit dir_flag=0;            //set high to indicate that the dir_count has been incremented, wait for flag low
volatile bit break_when_dir_found = 0;
volatile bit circ2 = 0;
volatile bit sonar_state = 0;

//claw controls
xdata volatile unsigned short claw_pos = 2;
volatile bit counter_above_100 = 0;

//motor controls
volatile bit ML_dir, MR_dir;
xdata volatile unsigned short pwmL, pwmR;
xdata volatile unsigned char pwm_count=0;

//main function shared variables
xdata volatile unsigned short main_short1;
xdata volatile unsigned int main_int1, main_int2, main_int3, main_int4;

//function prototypes
void Rotate(unsigned short int *, unsigned short int *);
void Find_Tape(unsigned short int *,int);
void Bridge_Rotate( unsigned short int* , unsigned short int* , unsigned short int* );

void Claw_Pos (int);
void claw_control(void);

#include "lewislib.h"

char _c51_external_startup (void)
{
	// Disable Watchdog with key sequence
	SFRPAGE = 0x00;
	WDTCN = 0xDE; //First key
	WDTCN = 0xAD; //Second key
  
	VDM0CN=0x80;       // enable VDD monitor
	RSTSRC=0x02|0x04;  // Enable reset on missing clock detector and VDD
	
	#if (SYSCLK == 48000000L)	
		SFRPAGE = 0x10;
		PFE0CN  = 0x10; // SYSCLK < 50 MHz.
		SFRPAGE = 0x00;
	#elif (SYSCLK == 72000000L)
		SFRPAGE = 0x10;
		PFE0CN  = 0x20; // SYSCLK < 75 MHz.
		SFRPAGE = 0x00;
	#endif
	
	#if (SYSCLK == 12250000L)
		CLKSEL = 0x10;
		CLKSEL = 0x10;
		while ((CLKSEL & 0x80) == 0);
	#elif (SYSCLK == 24500000L)
		CLKSEL = 0x00;
		CLKSEL = 0x00;
		while ((CLKSEL & 0x80) == 0);
	#elif (SYSCLK == 48000000L)	
		// Before setting clock to 48 MHz, must transition to 24.5 MHz first
		CLKSEL = 0x00;
		CLKSEL = 0x00;
		while ((CLKSEL & 0x80) == 0);
		CLKSEL = 0x07;
		CLKSEL = 0x07;
		while ((CLKSEL & 0x80) == 0);
	#elif (SYSCLK == 72000000L)
		// Before setting clock to 72 MHz, must transition to 24.5 MHz first
		CLKSEL = 0x00;
		CLKSEL = 0x00;
		while ((CLKSEL & 0x80) == 0);
		CLKSEL = 0x03;
		CLKSEL = 0x03;
		while ((CLKSEL & 0x80) == 0);
	#else
		#error SYSCLK must be either 12250000L, 24500000L, 48000000L, or 72000000L
	#endif
	
	P0MDOUT |= 0x10; // Enable UART0 TX as push-pull output
	XBR0     = 0x01; // Enable UART0 on P0.4(TX) and P0.5(RX)                     
	XBR1     = 0X00;
	XBR2     = 0x41; // Enable crossbar and uart 1

	// Configure Uart 0
	#if (((SYSCLK/BAUDRATE)/(2L*12L))>0xFFL)
		#error Timer 0 reload value is incorrect because (SYSCLK/BAUDRATE)/(2L*12L) > 0xFF
	#endif
	SCON0 = 0x10;
	TH1 = 0x100-((SYSCLK/BAUDRATE)/(2L*12L));
	TL1 = TH1;      // Init Timer1
	TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit auto-reload
	TMOD |=  0x20;                       
	TR1 = 1; // START Timer1
	TI = 1;  // Indicate TX0 ready
    
	// Initialize timer 2 for periodic interrupts
	TMR2CN0=0x00;   // Stop Timer2; Clear TF2;
	CKCON0|=0b_0001_0000; // Timer 2 uses the system clock
	TMR2RL=(0x10000L-(SYSCLK/10000L)); // Initialize reload value
	TMR2=0xffff;   // Set to reload immediately
	ET2=1;         // Enable Timer2 interrupts
	TR2=1;         // Start Timer2 (TMR2CN is bit addressable)
	
	EA = 1;

    return 0;
}

void UART1_Init (unsigned long baudrate)
{
    SFRPAGE = 0x20;
	SMOD1 = 0x0C; // no parity, 8 data bits, 1 stop bit
	SCON1 = 0x10;
	SBCON1 =0x00;   // disable baud rate generator
	SBRL1 = 0x10000L-((SYSCLK/baudrate)/(12L*2L));
	TI1 = 1; // indicate ready for TX
	SBCON1 |= 0x40;   // enable baud rate generator
	SFRPAGE = 0x00;
}

void UART1_RI(void) using 3
{
    unsigned char UART1_char2, i, j;
    SFRPAGE = 0x20;
    //exit interrupt caused by TI1 (although TI1 interrupt is not enabled)
    
    //Process interrupt caused by incoming data
    RI1 = 0;
    SCON1&=0b_0011_1111;    // Clear Overrun and HW Parity error flags
    UART1_char2 = SBUF1;
    
    for(i=0;i<8;i++)
    {
    	j = (UART1_char2 & 128) / 128;
    	printf("%d", j);
    	UART1_char2 <<=1;
    }
    printf("\n");
    UART1_char2 = SBUF1;
    //Perform software parity check
    parity = 0;
    for (i=0; i<8; i++) {
       if(UART1_char2 & 1 == 1) parity = !parity;
       UART1_char2 >>= 1;
    }
    if(!parity)
    {
    	//printf("  Evil\n");
    	return;
    }
    /*-----------------------------------------------------------
     | Data Encoding:                                           |
     | BIT   7       6       5   4   3   2       1       0      |
     | B0    Parity  y_dir   y_absolute  Auto    Boost   0      |
     | B1    Parity  x_dir   x_absolute  Open    Close   1      |
     -----------------------------------------------------------*/
    //Process data that is not corrupted
    //printf("\n");
    UART1_char2 = SBUF1;
    if(UART1_char2 % 2 == 0)    //Byte 0
    {
        no_signal_0 = 0;     //clear no signal counter
        UART1_char2 >>= 1;
        
        //Function bits
        boost = UART1_char2 % 2;
        UART1_char2 >>= 1;
        autocar = UART1_char2 % 2;
        UART1_char2 >>= 1;
        
        //y-axis
        y_absolute = UART1_char2 % 8;
        UART1_char2 >>= 3;
        y_dir = !(UART1_char2 % 2);
    } else {    //Byte 1
        no_signal_1 = 0;    //clear no signal counter
        UART1_char2 >>= 1;
        
        //Function bits
        close = UART1_char2 % 2;
        UART1_char2 >>= 1;
        open = UART1_char2 % 2;
        UART1_char2 >>= 1;
        
        //x-axis
        x_absolute = UART1_char2 % 8;
        UART1_char2 >>= 3;
        x_dir = !(UART1_char2 % 2);
    }
   
    //Set SFRPAGE back to 0
    SFRPAGE = 0x00;
    return;
}

void Timer2_ISR (void) interrupt 5 using 2
{
    TF2H = 0; // Clear Timer2 interrupt flag
    
    pwm_count++;
    if (pwm_count >= 100) {
        pwm_count=0;
        counter_above_100 = !counter_above_100;
        timer_count++;
        no_signal_0++;
        no_signal_1++;
        if (no_signal_0 >= 250 || no_signal_1 >= 250) no_signal = 1;
        else no_signal = 0;
        if (timer_count >= 50) {        //every 0.5 seconds enter
            timer_count =  0;
            dir_flag = 0;
            if(!sequence_timeout) sequence_timer++;
            if(sequence_timer >10) sequence_timeout = 1;
        }
    }
    
    //motor pwm
    if (!ML_dir) {
        OUTLF = 0;
        OUTLB =pwm_count>=pwmL?0:1;
    } else {
        OUTLB = 0;
        OUTLF =pwm_count>=pwmL?0:1;
    }
    
    if (MR_dir) {
        OUTRF = 0;
        OUTRB =pwm_count>=pwmR?0:1;
    } else {
        OUTRB = 0;
        OUTRF =pwm_count>=pwmR?0:1;
    }
    
    sonar_op();
    if (!counter_above_100) claw_control();
}


void Claw_Pos( short pos ) 
{
	claw_pos = pos + 5;
}

void manual_mode(void)
{
    // Claw controls
    if(open) Claw_Pos(10);
    if(close) Claw_Pos(2);
    
    //Driving
    if(no_signal)
    {
    	pwmL = 0;
    	pwmR = 0;
    	Claw_Pos(-5);
    	return;
    }
    if(y_absolute == 0)     //turn in place
    {
        main_short1 = x_absolute;
        ML_dir = !x_dir;
        MR_dir = x_dir;
        if(boost)
        {
            pwmL = main_short1 * BOOST_TURN;  //boost turn speed
            pwmR = main_short1 * BOOST_TURN;
        } else {
            pwmL = main_short1 * DFT_TURN;    //default turn speed
            pwmR = main_short1 * DFT_TURN;
        }
    } else {                //driving like normal cars
        main_int1 = y_absolute * 100;
        main_int2 = main_int1 * x_absolute / TURNING_RADIUS;
        if (x_dir)
        {
            main_int3 = main_int1 + main_int2;      //Left motor
            main_int4 = main_int1 - main_int2;      //Right motor
        } else {
            main_int3 = main_int1 - main_int2;      //Left motor
            main_int4 = main_int1 + main_int2;      //Right motor
        }
        
        //Assign calculated duty cycle to motors
        ML_dir = y_dir;
        MR_dir = y_dir;
        if(boost)
        {
            pwmL = main_int3 / BOOST_SPEED;
            pwmR = main_int4 / BOOST_SPEED;
        } else {
            pwmL = main_int3 / DFT_SPEED;
            pwmR = main_int4 / DFT_SPEED;
        }
    }
}
char getchar1 (void)
{
	char c;
    SFRPAGE = 0x20;
	while (!RI1);
	RI1=0;
	// Clear Overrun and Parity error flags 
	SCON1&=0b_0011_1111;
	c = SBUF1;
	SFRPAGE = 0x00;
	return (c);
}

void prime_sequence(void)
{
	switch(sequence_state){
		case 0:
			if(open && !close && !boost && !autocar)
			{
				sequence_state = 1;
				sequence_timer = 0;
				sequence_timeout = 0;
			}
			break;
		case 1:
			if(!open && close && !boost && !autocar)
				sequence_state = 2;
			if(sequence_timeout) sequence_state = 0;
			break;
		case 2:
			if(!open && !close && boost && !autocar)
				sequence_state = 3;
			if(sequence_timeout) sequence_state = 0;
			break;
		case 3:
			if(!open && !close && !boost && autocar)
			{
				sequence_state = 0;
				prime_awaken = 1;
			}
			if(sequence_timeout) sequence_state = 0;
			break;
		default:
			sequence_state = 0;
	}
}


void main (void)
{	
	
    stop();
    autocar = 0;
    sequence_timer = 0;
    sequence_state = 0;
	sequence_timeout = 1;
	prime_awaken = 0;
   
    InitPinADC(1, 6); // Configure as analog input    //PR L
    InitPinADC(1, 5); // Configure as analog input    //PR M
    InitPinADC(1, 4); // Configure as analog input    //PR R
    InitPinADC(1, 3); // Configure as analog input    //IR L
    InitPinADC(1, 2); // Configure as analog input    //IR R
    InitADC();
    
    UART1_Init(300);
    //printf("%2X\n", UART1FCN1);
    //printf("%2X\n", EIE2);
    
    while(1)
    {
    	//waitms(1);
    	SFRPAGE = 0x20;
    	if(RI1) UART1_RI();
    	SFRPAGE = 0x00;
    	
    	prime_sequence();
    	
        if(prime_awaken)
        {
        	prime_awaken = 0;
            //EIE2 &= 0xFE;       //disable UART1 interrupt
            
            //clear controls to prevent moving after auto mode
            x_absolute = 0;
            y_absolute = 0;
            open = 0;
            close = 0;
            
            autonomous_prime();
            //EIE2 |= 0x01;       //enable UART1 interrupt
        } else {
            manual_mode();
        }
        //printf("%d %d\n", y_absolute, x_absolute);
    }
}
