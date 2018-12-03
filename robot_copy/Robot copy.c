//
//  Robot.c
//  
//
//  Created by Gilbert Tan on 2018-03-14.
//

#include <stdlib.h>
#include <stdio.h>
#include <EFM8LB1.h>

// ~C51~

#define SYSCLK 72000000L
#define BAUDRATE 115200L

#define M1FWD P2_1
#define M1BWD P2_2
#define M2FWD P2_3
#define M2BWD P2_4

#define BOOST fn2

unsigned char pwm_count = 0;
volatile short M1_temp = 0;
volatile short M2_temp = 0;
volatile short M1_duty = 0;
volatile short M2_duty = 0;
volatile unsigned short x_absolute = 0;
volatile unsigned short y_absolute = 0;
volatile bit M1_dir = 0;
volatile bit M2_dir = 0;
volatile bit x_dir = 0;
volatile bit y_dir = 0;

volatile bit fn1 = 0;
volatile bit fn2 = 0;
volatile bit fn3 = 0;
volatile bit fn4 = 0;

volatile short no_signal0_count = 0;
volatile short no_signal1_count = 0;

unsigned int main_temp = 0;
static unsigned char serial_temp;

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
			 //ES0 = 1; // Enable UART 0 interrupt
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
	if(pwm_count>=100) pwm_count=0;
		
		if(M1_dir)
		{
			M1FWD = 0;
			M1BWD =pwm_count>=M1_duty ? 0 : 1;
		}else{
			M1BWD = 0;
			M1FWD =pwm_count>=M1_duty ? 0 : 1;
		}
	if(M2_dir)
	{
		M2FWD = 0;
		M2BWD =pwm_count>=M2_duty ? 0 : 1;
	} else {
		M2BWD = 0;
		M2FWD =pwm_count>=M2_duty ? 0 : 1;
	}
	
}

void Serial_ISR (void) interrupt 4 using 3
{
	static bit parity;
	static short i;
	
	if(TI)
	{
		TI = 0;
		return;
	}
	
	RI = 0;
	
	/* Odd parity check */
	parity = 0;
	serial_temp = SBUF;
	for (i = 0; i < 8; i++)		//compute total number of 1's in the byte
	{
		parity = (serial_temp % 2) ? !parity : parity;
		serial_temp/= 2;
	}
	if(!parity) return;			//if odd parity not satisfied, discard byte
	
	/* Assign values */
	serial_temp = SBUF;
	if(serial_temp % 2 == 0)
	{
		no_signal0_count = 0;
		serial_temp/= 2;
		fn2 = serial_temp % 2;
		serial_temp/= 2;
		fn1 = serial_temp % 2;
		serial_temp/= 2;
		y_absolute = serial_temp % 8;
		serial_temp/= 8;
		y_dir = serial_temp % 2;
	} else {
		no_signal1_count = 0;
		serial_temp/= 2;
		fn4 = serial_temp % 2;
		serial_temp/= 2;
		fn3 = serial_temp % 2;
		serial_temp/= 2;
		x_absolute = serial_temp % 8;
		serial_temp/= 8;
		x_dir = serial_temp % 2;
	}
	
}

void calculate_DC(void)
{
	if (y_absolute == 0)
	{
		M1_temp = x_absolute * 7;		//turn
		M2_temp = x_absolute * 7;
		M1_dir =  x_dir;
		M2_dir = !x_dir;
	} else {
		main_temp = y_absolute * 100;
		if (x_dir)
		{
			M1_temp = (main_temp + main_temp * x_absolute / 10) / 7;
			M2_temp = (main_temp - main_temp * x_absolute / 10) / 7;
		} else {
			M1_temp = (main_temp - main_temp * x_absolute / 10) / 7;
			M2_temp = (main_temp + main_temp * x_absolute / 10) / 7;
		}
		M1_temp = (M1_temp > 100) ? 100 : M1_temp;
		M2_temp = (M2_temp > 100) ? 100 : M2_temp;
		M1_dir = y_dir;
		M2_dir = y_dir;
	}
	
	if (BOOST)
	{
		M1_duty = M1_temp;
		M2_duty = M2_temp;
	} else {
		M1_duty = M1_temp / 2;
		M2_duty = M2_temp / 2;
	}
}

void main(void) using 1
{
	while(1)
	{
		calculate_DC();
	}
}
