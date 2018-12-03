#include <stdio.h>
#include <stdlib.h>
#include <EFM8LB1.h>
#include <math.h>

// ~C51~  

#define SYSCLK 72000000L
#define BAUDRATE 115200L

#define OUTRF P2_3	//right forward
#define OUTRB P2_4  //right back
#define OUTLF P2_1  //left forward
#define OUTLB P2_2  //left back
#define Trig  P1_0	//trigger of the sonar, a 50% pwm
#define Echo  P0_7	//echo of the sonar
#define CLAW_L P1_7
#define CLAW_R P2_0

#define LED P2_6
#define SLOWPWM 5
#define BASEPWM 25			//was 20
#define BOOSTPWM 40			//was 75
#define TAPEOFFSET 400
#define SONARFILTER 5

volatile unsigned short pwmL = -1;
volatile unsigned short pwmR = -1;

volatile bit MR_dir=0;
volatile bit ML_dir=0;
volatile bit dir=0;					//indicates if ccw or cw

//volatile bit found_dir_flag=0;		//set high when the direction is found during track tape 
volatile short dir_count=0;			//used to determine the direction, if <=-7 then cw, if >=7 ccw
volatile unsigned char pwm_count=0;
volatile unsigned short timer_count=0;
volatile int sonar_count = 0;
volatile int sonar_count_2 = 0;


volatile bit find_bridge_flag =0;
volatile bit find_circle1_flag = 0;
volatile bit find_circle2_flag = 0;
volatile bit dir_flag=0;			//set high to indicate that the dir_count has been incremented, wait for flag low
volatile bit break_when_dir_found = 0;
volatile bit circ2 = 0;
volatile bit sonar_state = 0;

//claw
volatile unsigned short claw_pos = 2;
volatile unsigned short claw_count = 0;

//data reception
volatile unsigned char dp1;			//x axis
volatile unsigned char dp2;			//y axis

void Rotate(unsigned short int *, unsigned short int *);
void Find_Tape(unsigned short int *,int);
void Bridge_Rotate( unsigned short int* gnd_VL, unsigned short int* gnd_VM, unsigned short int* gnd_VR);
void Claw_Pos (int);


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
	XBR2     = 0x40; // Enable crossbar and weak pull-ups

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
	
	EA=1; // Enable interrupts

	return 0;
}

void Timer2_ISR (void) interrupt 5 using 2
{
	TF2H = 0; // Clear Timer2 interrupt flag
	
	pwm_count++;
	if (pwm_count >= 100) {
		pwm_count=0;
		timer_count++;
		if (timer_count >= 50) {		//every 0.5 seconds enter
			timer_count =  0;
			dir_flag = 0;	
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
	claw_control();	
}

void main (void)
{
	stop();
		
	InitPinADC(1, 6); // Configure as analog input	//PR L
	InitPinADC(1, 5); // Configure as analog input	//PR M
	InitPinADC(1, 4); // Configure as analog input	//PR R
	InitPinADC(1, 3); // Configure as analog input	//IR L
	InitPinADC(1, 2); // Configure as analog input	//IR R
	InitADC();
	
	while(1) {
		
		//data packet 1 commands
		// ((dp1 >> 2) & 1) is open
		// ((dp1 >> 1) & 1) is close
		// (dp1 & 1) is the byte number
		// ((dp1 >> 3) & 0b00001111) is x axis
		
		//data packet 2 commands
		// ((dp2 >> 2) & 1) is Auto
		// ((dp2 >> 1) & 1) is Boost
		// (dp2 & 1) is the byte number
		// ((dp2 >> 3) & 0b00001111) is y axis
		
		//the axis half-byte commands
		// (y & 0b0111) is the absolute y
		// (x & 0b0111) is the absolute x
		// (y >> 3) & 1 is the y-dir
		// (x >> 3) & 1 is the x-dir
		
		if (open && close)
			Run_Autonomous();
		else if (open) 
			Claw_Pos(10);
		else if (close) 
			Claw_Pos(3);
			
	}
}
