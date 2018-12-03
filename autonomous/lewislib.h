
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

// Uses Timer3 to delay <us> micro-seconds. 
void Timer3us(unsigned char us)
{
	unsigned char i;               // usec counter
	
	// The input for Timer 3 is selected as SYSCLK by setting T3ML (bit 6) of CKCON0:
	CKCON0|=0b_0100_0000;
	
	TMR3RL = (-(SYSCLK)/1000000L); // Set Timer3 to overflow in 1us.
	TMR3 = TMR3RL;                 // Initialize Timer3 for first overflow
	
	TMR3CN0 = 0x04;                 // Sart Timer3 and clear overflow flag
	for (i = 0; i < us; i++)       // Count <us> overflows
	{
		while (!(TMR3CN0 & 0x80));  // Wait for overflow
		TMR3CN0 &= ~(0x80);         // Clear overflow indicator
	}
	TMR3CN0 = 0 ;                   // Stop Timer3 and clear overflow flag
}

void waitms (unsigned int ms)
{
	unsigned int j;
	unsigned char k;
	for(j=0; j<ms; j++)
		for (k=0; k<4; k++) Timer3us(250);
}

#define VDD 3.3035 // The measured value of VDD in volts

void InitPinADC (unsigned char portno, unsigned char pinno)
{
	unsigned char mask;
	
	mask=1<<pinno;

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
	 return ((ADC_at_Pin(pin)*VDD)/0b_0011_1111_1111_1111);
}

void mot_dir(int ML, int MR)
{
	ML_dir = ML;
	MR_dir = MR;
}

void stop(void){
	pwmL=0;
	pwmR=0;	
	waitms(100);
}

void spin_left(int offset)
{
	mot_dir(1,0);
	pwmR = BOOSTPWM+offset;
	pwmL = BASEPWM+offset;
}


void spin_right(int offset)
{
	mot_dir(0,1);
	pwmL = BOOSTPWM+offset;
	pwmR = BASEPWM+offset;	
}

void debug( void )
{

				stop();
				while(1);
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

void sonar_op(void)
{
	//sonar pwm, always 50
	Trig = pwm_count >= 50?0:1;
	
	//operations with the sonar
	if (!sonar_state) {
		if (P0_7) {
			sonar_state = 1;
			sonar_count = 0;
		}
	} else if (P0_7) {
		sonar_count++;
	} else {
		//if (((0.9*sonar_count_2 + 0.1*sonar_count) - sonar_count_2) <= 5) {
			sonar_count_2 = sonar_count;
	//	}
		sonar_state = 0;
	}
}

float Distance ( void )
{
	return sonar_count_2;	
}

void Claw_Pos( int pos ) 
{
	claw_pos = pos;
}