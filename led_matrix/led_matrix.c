// Write to 8x8 Red Led Matrix

#include <stdio.h>
#include <stdlib.h>
#include <EFM8LB1.h>

// ~C51~  

#define SYSCLK 72000000L
#define BAUDRATE 115200L

#define ROW_8 P1_5
#define ROW_4 P1_1
#define ROW_6 P1_7
#define ROW_5 P1_2
#define ROW_1 P1_4
#define ROW_7 P2_0
#define ROW_2 P1_0
#define ROW_3 P1_6
#define COL_1 P3_0
#define COL_2 P3_1
#define COL_3 P2_5
#define COL_4 P2_1
#define COL_5 P2_4
#define COL_7 P2_3
#define COL_6 P2_2
#define COL_8 P2_6

#define TOUCH P0_7

/* Pins P0_1/2 and P2_3 are anolog inputs */

#define ROW_SIZE 8
#define COL_SIZE 8

#define VDD 3.3035 // The measured value of VDD in volts

#define MID_VOLTS 1.64
#define LOW_VOLTS_X 1.34
#define LOW_VOLTS_Y 1.32
#define HIGH_VOLTS_X 1.98
#define HIGH_VOLTS_Y 1.95

#define TIMER_2_FREQ 4000L		//was 4000
#define TIMER_OUT_2 P0_0

void state_machine( void );

volatile unsigned char ISR_state = 0;
volatile unsigned short Timer2_share_i = 0;

volatile unsigned char pic[8] = {255,255,255,255,255,255,255,255};

volatile char upar[8] 	= {0b00011000,0b00111100,0b01111110,0b11111111,0b00111100,0b00111100,0b00111100,0b00111100};
volatile char downar[8]	= {0b00111100,0b00111100,0b00111100,0b00111100,0b11111111,0b01111110,0b00111100,0b00011000};
volatile char leftar[8] 	= {0b00010000,0b00110000,0b01111111,0b11111111,0b11111111,0b01111111,0b00110000,0b00010000};
volatile char rightar[8] = {0b00001000,0b00001100,0b11111110,0b11111111,0b11111111,0b11111110,0b00001100,0b00001000};
volatile char stop_sign[8] = {0b00111100,0b01000010,0b10100001,0b10010001,0b10001001,0b10000101,0b01000010,0b00111100};
	

void change_pic( char* );
volatile int count=0;

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
	TMR2RL=(0x10000L-(SYSCLK/(2*TIMER_2_FREQ))); // Initialize reload value
	TMR2=0xffff;   // Set to reload immediately
	ET2=1;         // Enable Timer2 interrupts
	TR2=1;         // Start Timer2 (TMR2CN is bit addressable)
	
	EA=1; // Enable interrupts

  	
	return 0;
}

void Timer2_ISR (void) interrupt 5
{
	P3_3 = 1;
	TF2H = 0; // Clear Timer2 interrupt flag
	TIMER_OUT_2=!TIMER_OUT_2;
	state_machine();
	P3_3 = 0;
}

void set_row(short row)
{
	ROW_1 = 1;
	ROW_2 = 1;
	ROW_3 = 1;
	ROW_4 = 1;
	ROW_5 = 1;
	ROW_6 = 1;
	ROW_7 = 1;
	ROW_8 = 1;
	switch (row) {
		case 0: {
			ROW_1 = 0;
			break;
		}
		case 1: {
			ROW_2 = 0;
			break;
		}
		case 2: {
			ROW_3 = 0;
			break;
		}
		case 3: {
			ROW_4 = 0;
			break;
		}
		case 4: {
			ROW_5 = 0;
			break;
		}
		case 5: {
			ROW_6 = 0;
			break;
		}
		case 6: {
			ROW_7 = 0;
			break;
		}
		case 7: {
			ROW_8 = 0;
			break;
		}
	}
	return;
}

void set_col(short col)
{	
	switch (col) {
		case 0: {
			COL_1 = 0;
			break;
		}	
		case 1: {
			COL_2 = 0;
			break;
		}	
		case 2: {
			COL_3 = 0;
			break;
		}	
		case 3: {
			COL_4 = 0;
			break;
		}	
		case 4: {
			COL_5 = 0;
			break;
		}	
		case 5: {
			COL_6 = 0;
			break;
		}	
		case 6: {
			COL_7 = 0;
			break;
		}	
		case 7: {
			COL_8 = 0;
			break;
		}	
	}
	return;
}


void clr_cols(void)
{
	COL_1 = 1;
	COL_2 = 1;
	COL_3 = 1;
	COL_4 = 1;
	COL_5 = 1;
	COL_6 = 1;
	COL_7 = 1;
	COL_8 = 1;
}


void forward (void)
{
	change_pic(upar);
}

void backward(void)
{
	change_pic(downar);
}

void left(void)
{
	change_pic(leftar);
}

void right(void)
{
	change_pic(rightar);
}

void stop(void)
{
	change_pic(stop_sign);
}

void dec_xy (int x, int y)
{
	if (x > 0) {
		if (y > x + 1) right();
		else if ((-y) > x + 1) left();
		else forward();
	} else if (x < 0) {
		if (y > -(x - 1)) right();
		else if (y < x - 1) left();
		else backward();
	} else if (y > 3) right();
	else if (y < -3) left();
	else stop();
}

void change_pic( char* newpic ) 
{
 	for (Timer2_share_i = 0; Timer2_share_i < 8; Timer2_share_i++){
 		pic[Timer2_share_i] = newpic[Timer2_share_i];
 	}
}


void state_machine(void)
{
	static short state;
	static short i;
	state++;
	if (state > 7) state = 0;
	clr_cols();
	set_row(state);
	for(i=7; i>=0; i--){
			if(((pic[state] >> i) & 1) == 1)
				set_col(7-i);
	}
}

void InitADC (void)
{
	SFRPAGE = 0x00;
	ADC0CN1 = 0b_10_000_000; //14-bit,  Right justified no shifting applied, perform and Accumulate 1 conversion.
	ADC0CF0 = 0b_11111_0_00; // SYSCLK/32
	ADC0CF1 = 0b_0_0_011110; // Same as default for now
	ADC0CN0 = 0b_0_0_0_0_0_00_0; // Same as default for now
	ADC0CF2 = 0b_0_01_11111 ; // GND pin, Vref=VDD
	ADC0CN2 = 0b_0_000_0000;  // Same as default for now. ADC0 conversion initiated on write of 1 to ADBUSY.
	ADEN=1; // Enable ADC
}

void InitPinADC (unsigned char portno, unsigned char pin_num)
{
	unsigned char mask;
	
	mask=1<<pin_num;

	SFRPAGE = 0x20;
	switch (portno)
	{
		case 0:
			P0MDIN &= (~mask); // Set pin as analog input
			P0SKIP |= mask; // Skip Crossbar decoding for this pin
		break;
		case 1:
			P1MDIN &= (~mask); // Set pin as analog input
			P1SKIP |= mask; // Skip Crossbar decoding for this pin
		break;
		case 2:
			P2MDIN &= (~mask); // Set pin as analog input
			P2SKIP |= mask; // Skip Crossbar decoding for this pin
		break;
		default:
		break;
	}
	SFRPAGE = 0x00;
}

unsigned int ADC_at_Pin(unsigned char pin)
{
	ADC0MX = pin;   // Select input from pin
	ADBUSY=1;       // Dummy conversion first to select new pin
	while (ADBUSY); // Wait for dummy conversion to finish
	ADBUSY = 1;     // Convert voltage at the pin
	while (ADBUSY); // Wait for conversion to complete
	return (ADC0);
}

float Volts_at_Pin(unsigned char pin)
{
	 return ((ADC_at_Pin(pin)*VDD)/16383.0);
}

void main (void)
{
	float v[3];
	float x, y;
	short roundx;
	short roundy;
	unsigned char temp;
	
	InitPinADC(0, 1); // Accelerometer
	InitPinADC(0, 2); // Accelerometer
	InitADC();
	
	while (1) {
		while(!RI);
		temp = SBUF0;
		temp = SBUF0;
		temp = SBUF0;
		v[0] = Volts_at_Pin(QFP32_MUX_P0_1); // x
		v[1] = Volts_at_Pin(QFP32_MUX_P0_2); // y
		
		// Normalize values between -8 and 8
		x = 16.0 * (v[1] - MID_VOLTS) / (HIGH_VOLTS_X - LOW_VOLTS_X);
		y = -16.0 * (v[0] - MID_VOLTS) / (HIGH_VOLTS_Y - LOW_VOLTS_Y);
		
		// Round
		roundx = x;
		roundy = y;
		
		if (roundx > 7) roundx = 7;
		if (roundx < -7) roundx = -7;
		if (roundy > 7) roundy = 7;
		if (roundy < -7) roundy = -7;
		
		printf ("%d", roundx);//, y=%f, roundx=%d, roundy=%d,     ", v[0], v[1], x, y, roundx, roundy);
		printf (" ");
		printf ("%d", roundy);
		printf (" ");
		printf ("%d", P0_7);
		printf ("\r\n");

		dec_xy (roundx, roundy);
		
	}
}
