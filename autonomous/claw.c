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
#define CLAW_L P1_7
#define CLAW_R P2_0

#define LED P2_6
#define SLOWPWM 5
#define BASEPWM 20
#define BOOSTPWM 75
#define TAPEOFFSET 400

volatile unsigned short pwmL = -1;
volatile unsigned short pwmR = -1;
volatile unsigned short pwm = -1;
volatile unsigned short claw_pos = 1;


//volatile bit found_dir_flag=0;		//set high when the direction is found during track tape 
volatile short dir_count=0;			//used to determine the direction, if <=-7 then cw, if >=7 ccw
volatile unsigned char pwm_count=0;
volatile unsigned short claw_count = 0;


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

void claw_control(void)
{
	claw_count++;
	if (claw_count > 199) claw_count=0;
	
	if (claw_count < 5)
	{
		P2_1=!P2_1;
		CLAW_L = 1;
		CLAW_R = 1;
	} else if (claw_count >= 22) {
		CLAW_L = 0;
		CLAW_R = 0;
	} else {
		CLAW_L = (claw_count < claw_pos + 5) ? 1 : 0;
		CLAW_R = (claw_count < 22 - claw_pos) ? 1 : 0;
	}
	
}

void Timer2_ISR (void) interrupt 5 using 2
{
	TF2H = 0; // Clear Timer2 interrupt flag
	claw_control();
	
	
}

void main (void)
{
	//runtime loop
	while(1) {
		printf("\nPlease enter claw position(0-4): ");
		scanf("%d", &claw_pos);

	}
}