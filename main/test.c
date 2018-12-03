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

#define SLOWPWM         5
#define BASEPWM         25            //was 20
#define BOOSTPWM        40            //was 75
#define TAPEOFFSET      400
#define SONARFILTER     5

#define TURNING_RADIUS  10      //Lower to reduce turning radius, no less than 7
#define BOOST_SPEED     7       //Lower to make faster, no less than 7 (100%)
#define DFT_SPEED       14      //Lower to make faster, no less than 7 (100%)
#define BOOST_TURN      7       //Raise to make turning in place faster, no greater than 14
#define DFT_TURN        4       //Raise to make turning in place faster, no greater than 14

//Variables that change by B-field comm
volatile bit autocar, boost, open, close;
volatile bit x_dir, y_dir;
xdata volatile unsigned short x_absolute = 0, y_absolute = 0;
xdata volatile unsigned short no_signal_0 = 0, no_signal_1 = 0;

//Autonomous Prime
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
	
//	EA = 1;

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
void main (void)
{	
	/*
    stop();
   
    InitPinADC(1, 6); // Configure as analog input    //PR L
    InitPinADC(1, 5); // Configure as analog input    //PR M
    InitPinADC(1, 4); // Configure as analog input    //PR R
    InitPinADC(1, 3); // Configure as analog input    //IR L
    InitPinADC(1, 2); // Configure as analog input    //IR R
    InitADC();
    */
    UART1_Init(300);
    printf("%2X\n", UART1FCN1);
    printf("%2X\n", EIE2);
    while(1)
    {
    	P3_1 = !P3_1;
    	//waitms(1);
    	getchar();
        if(autocar)
        {
            //EIE2 &= 0xFE;       //disable UART1 interrupt
            
            //clear controls to prevent moving after auto mode
            x_absolute = 0;
            y_absolute = 0;
            open = 0;
            close = 0;
            
           // autonomous_prime();
            //EIE2 |= 0x01;       //enable UART1 interrupt
        } else {
            manual_mode();
        }
        printf("%d %d", TI1, RI1);
    }
}
