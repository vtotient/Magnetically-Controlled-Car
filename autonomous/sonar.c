//autonomous ball tracking firmware by Lewis Mason

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
#define SONARFILTER 5

#define LED P2_6
#define SLOWPWM 5
#define BASEPWM 40			//was 20
#define BOOSTPWM 85			//was 75
#define TAPEOFFSET 400

xdata volatile unsigned short pwmL = -1;
xdata volatile unsigned short pwmR = -1;
xdata volatile unsigned short pwm = -1;
volatile bit ML_dir;		//indicates if ccw or cw
volatile bit MR_dir;
volatile bit dir;
//volatile bit found_dir_flag=0;		//set high when the direction is found during track tape 
xdata volatile unsigned short timer_count=0;
volatile int sonar_count = 0;
volatile int sonar_count_2 = 0;
volatile int pwm_count = 0;

volatile bit find_bridge_flag =0;
volatile bit find_circle1_flag = 0;
volatile bit find_circle2_flag = 0;
volatile bit dir_flag=0;			//set high to indicate that the dir_count has been incremented, wait for flag low
volatile bit break_when_dir_found = 0;
volatile bit circ2 = 0;
volatile bit sonar_state = 0;

 
xdata volatile int claw_count = 0;
xdata volatile int CLAW_R = 0;
xdata volatile int CLAW_L = 0;
xdata volatile int claw_pos = 1;



void Close_Claw( void );
void Open_Claw ( void );

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
	claw_control();
	
	//sonar operations
	sonar_op();
}



/**************************************unfinished********/
int Detect_Object (/*int distancepwm*/void)
{
	//if (distancepwm != 0)
	//	if (/*current distance*/ <= distancepwm) return 1;
		
	if (((Volts_at_Pin(QFP32_MUX_P1_2) * 1000) < 1000) || ((Volts_at_Pin(QFP32_MUX_P1_3) * 1000) < 1000))
		return 1;
	
	return 0;
}

void Find_Object( void )
{
	//determin rotation from global variable dir, 1=ccw, 0=cw
	if (dir) {
		//rotate left (ccw)
		mot_dir(1,0);
		pwmR = 0;
		pwmL = BASEPWM;
	} else {
		//rotate right (cw)
		mot_dir(0,1);
		pwmR = BASEPWM;
		pwmL =0;
	}
	
	while (Detect_Object() != 1);		//locate an object with the IR sensors
}


//returns a float, a ratio of the time high vs period time (used for ultrasound distance detection)
float US_Ratio_CM (float ratio)
{
	return (ratio-0.015)/(0.0055);
}


void main (void)
{
	float temp= 0;
	stop();
		
	InitPinADC(1, 6); // Configure as analog input	//PR L
	InitPinADC(1, 5); // Configure as analog input	//PR M
	InitPinADC(1, 4); // Configure as analog input	//PR R
	InitPinADC(1, 3); // Configure as analog input	//IR L
	InitPinADC(1, 2); // Configure as analog input	//IR R
	InitADC();
	P0_7 = 1;
	
	//runtime loop
	while(1) {
		//temp = Volts_at_Pin(QFP32_MUX_P0_7);
	//	printf("%f\n",temp);
	printf("%d %d\n", sonar_state,sonar_count_2);
	}
}


