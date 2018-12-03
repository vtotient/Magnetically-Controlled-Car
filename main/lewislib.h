
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
	if (pwm_count >= 22) {
		CLAW_L = 0;
		CLAW_R = 0;
	} else {
		CLAW_L = (pwm_count < claw_pos) ? 1 : 0;
		CLAW_R = (pwm_count < 27 - claw_pos) ? 1 : 0;
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


/*calibrates the sensors given the current room's conditions*/
void Calibrate_LSensors(int *VL, int *VM, int *VR)
{
	xdata short countL=0;
	xdata short countM=0;
	xdata short countR=0;
	xdata short flags =0;
	
    main_int1 = 0;
	//have not found good values
	while (flags != 7) {
		//VL
		if ((flags & 2) != 2) {
			main_int1 = Volts_at_Pin(QFP32_MUX_P1_6)*1000;
			
			if (abs(*VL - main_int1) <= 50) {
				countL++;
			} else {
				countL = 0;
				*VL = main_int1;
			}
			
			if (countL == 10)
				flags |= 2;
		}
		//VR
		if ((flags & 1) != 1) {
			main_int1 = Volts_at_Pin(QFP32_MUX_P1_4)*1000;
			
			if (abs(*VR-main_int1) <= 50) {
				countR++;
			} else {
				countR =0;
				*VR = main_int1;
			}
			
			if (countR == 10)
				flags |= 1;
		}	
		//VM
		if ((flags & 4) != 4) {
			main_int1 = Volts_at_Pin(QFP32_MUX_P1_5)*1000;
			
			if (abs(*VM-main_int1) <= 50){
				countM++;
			} else {
				countM =0;
				*VM = main_int1;
			}
			
			if (countM == 10)
				flags |= 4;
		}	
	}
	return;	
}


void Follow_Tape(unsigned int *gnd_VL, unsigned int *gnd_VM, unsigned int *gnd_VR)
{
	//temporary variables until we get the calibrated voltage of the ground***
	xdata unsigned int tp_VL = *gnd_VL-TAPEOFFSET;
	xdata unsigned int tp_VR = *gnd_VR-TAPEOFFSET;
	xdata unsigned int tp_VM = *gnd_VM-TAPEOFFSET;
	
	//set base pwm
	pwmL = BASEPWM;
	pwmR = BASEPWM;
	
	//set direction to forward
	mot_dir(0,0);
	dir_flag = 1;
	dir_count = 0;
	
	while (1) {
		if (Volts_at_Pin(QFP32_MUX_P1_5) * 1000 > tp_VM) {			//if M not on tape
	
			if (Volts_at_Pin(QFP32_MUX_P1_6) * 1000 < tp_VL) {		//if L on tape
				mot_dir(1,0);
				pwmR = BOOSTPWM; // this main way
				pwmL = BOOSTPWM;
			
				// direction procedure
				if (dir_flag == 0) {
					if (dir_count < 0) dir_count = 1;
					else dir_count++;
					dir_flag = 1;
				}
			} else if (Volts_at_Pin(QFP32_MUX_P1_4) * 1000 < tp_VR) { //if R on tape
				mot_dir(0,1);
				pwmL = BOOSTPWM; // this main way
				pwmR = BOOSTPWM;	
			
				// direction procedure, dir_flag determines if program ready to take another reading, !find_bridge_flag so the direction doesnt get reset when finding bridge
				if (dir_flag == 0) {
					if (dir_count > 0) dir_count = -1;
					else dir_count--;
					dir_flag = 1;
				}
			} else {				//if all 3 sensors are off tape proceed forward
				mot_dir(0,0);
				pwmL = BASEPWM;
				pwmR = BASEPWM;	
			}
	
		//if all three sensors are on tape, and the **find_circle2_flag** is high, go for 3 second to approach the center of the second circle
		} else if ((Volts_at_Pin(QFP32_MUX_P1_6) * 1000 < tp_VL) && (Volts_at_Pin(QFP32_MUX_P1_4) * 1000 < tp_VR) && (Volts_at_Pin(QFP32_MUX_P1_5) * 1000 < tp_VM) && find_circle2_flag) {
				find_circle2_flag = 0;
				find_circle1_flag = 0;
				waitms(2000);		//move towards the middle of the circle
				stop();
				Claw_Pos(10);
				waitms(500);
				break;				//we break so that the program can find the tape again (travel back to the main circle)
				
		} else if ((Volts_at_Pin(QFP32_MUX_P1_6) * 1000 < tp_VL) && (Volts_at_Pin(QFP32_MUX_P1_4) * 1000 < tp_VR) && (Volts_at_Pin(QFP32_MUX_P1_5) * 1000 < tp_VM) && find_circle1_flag) {
				find_circle1_flag = 0;
				find_circle2_flag = 0;
				//do what needs to be done to find the dir etc etc etc?
				break;		
		} else {	
			mot_dir(0,0);
			pwmL = BASEPWM;
			pwmR = BASEPWM;	
		}
		
		//direction procedure: determines if cw or ccw
		if (dir_count >= 10) dir =1;	 //ccw
		if (dir_count <= -10) dir =0; //cw
		
		//the below determines if the direction was just decided, or if (if enabled) the bridge has been found/turning onto the bridge
		if (find_bridge_flag == 1) {
			if (dir && (Volts_at_Pin(QFP32_MUX_P1_4) * 1000 < tp_VR) && (Volts_at_Pin(QFP32_MUX_P1_5) * 1000 < tp_VM)) {
				find_bridge_flag = 0;
				Bridge_Rotate(gnd_VL,gnd_VM,gnd_VR);	//rotate on to the bridge
				
				//find which circle you are now looking for
				if (circ2) find_circle2_flag = 1;	
				else find_circle1_flag = 1;
			}
			
			if (!dir && (Volts_at_Pin(QFP32_MUX_P1_6) * 1000 < tp_VL) && (Volts_at_Pin(QFP32_MUX_P1_5) * 1000 < tp_VM)) {
				find_bridge_flag = 0;
				Bridge_Rotate(gnd_VL,gnd_VM,gnd_VR);	//rotate on to the bridge
				
				//find which circle you are looking for	
				if (circ2) find_circle2_flag = 1;
				else find_circle1_flag = 1;
			}
			
		} else if ((dir_count >= 10) || (dir_count <= -10) && break_when_dir_found) {
					break_when_dir_found = 0;	//reset the break when dir found flag
					break;	//if the find_bridge_flag is not set, and the direction has been found, break (to find object in circle)
		}
	}
}

void Track_Object(void)
{
	xdata unsigned short int IRVR;
	xdata unsigned short int IRVL;
	bit flag = 0;
	mot_dir(0,0);
		
	while (!flag) {
		IRVR = Volts_at_Pin(QFP32_MUX_P1_2) * 1000;
		IRVL = Volts_at_Pin(QFP32_MUX_P1_3) * 1000;
		
		if ((IRVR > 1000) && (IRVL < 1000)) {
			pwmL = SLOWPWM;
			pwmR = BOOSTPWM;	
		} else if ((IRVL > 1000) && (IRVR < 1000)) {
			pwmL = BOOSTPWM;
			pwmR = SLOWPWM;	
		} else if ((IRVL > 1000) && (IRVR > 1000)) {
			if (sonar_count_2 < 30) {
				pwmL = BOOSTPWM; //approach the object quickly
				pwmR = BOOSTPWM;
			} else {
				pwmL = BASEPWM; // temporary just stops
				pwmR = BASEPWM;
			}
		} else if ((IRVL < 1000) && (IRVR < 1000)) {
			pwmL = BASEPWM; 
			pwmR = BASEPWM;	
		}
		
		if (sonar_count_2 < 4)
			flag = 1;
	}
	
	pwmL = BASEPWM; 
	pwmR = BASEPWM;	
	waitms(300);
	stop();
	Claw_Pos(2);
	waitms(500);
}

//last parameter determines direction of the search (1 forward 0 back)
void Find_Tape(unsigned short int *gnd_VM, int motordir)
{
	bit flag=0;
	int temp = *gnd_VM-TAPEOFFSET;

	while (!flag) {
		if (Volts_at_Pin(QFP32_MUX_P1_5)*1000 < *gnd_VM-TAPEOFFSET) { // found tape, proceed with function
			stop();
			flag = 1;
		} else {
			mot_dir(motordir,motordir);
			pwmL = BASEPWM;
			pwmR = BASEPWM;	
		}
	}
	return;
}

void Rotate(unsigned short int *gnd_VL, unsigned short int *gnd_VR)
{
	if (Volts_at_Pin(QFP32_MUX_P1_6)*1000 < *gnd_VL-TAPEOFFSET) {
		spin_left(10);
	} else if (Volts_at_Pin(QFP32_MUX_P1_4)*1000 < *gnd_VR-TAPEOFFSET) {
		spin_right(10);
	}
		 
	while((Volts_at_Pin(QFP32_MUX_P1_6)*1000 < *gnd_VL-TAPEOFFSET) ||		
		  (Volts_at_Pin(QFP32_MUX_P1_4)*1000 < *gnd_VR-TAPEOFFSET)); 
	return;
}

int Detect_Object (void)
{	
	if (((Volts_at_Pin(QFP32_MUX_P1_2) * 1000) < 1000) || ((Volts_at_Pin(QFP32_MUX_P1_3) * 1000) < 1000))
		return 1;
	if (sonar_count_2 <= 25)
		return 1;
	
	return 0;
}

void Find_Object( void )
{
	Claw_Pos (10);
	stop();
	waitms(500);
	
	//determin rotation from global variable dir, 1=ccw, 0=cw
	if (dir) {
		//rotate left (ccw)
		mot_dir(1,0);
		pwmR = BASEPWM-10;
		pwmL = BASEPWM+10;
	} else {
		//rotate right (cw)
		mot_dir(0,1);
		pwmR = BASEPWM+10;
		pwmL = BASEPWM-10;
	}
	
	//change this
	while (Detect_Object() != 1);		//locate an object with the IR sensors
	stop();
}

void Bridge_Rotate(unsigned short int* gnd_VL, unsigned short int* gnd_VM, unsigned short int* gnd_VR)
{
	if (dir) {
		mot_dir(0,1);
		pwmL = BASEPWM;
		pwmR = BASEPWM;	
		waitms(700);
		while ((Volts_at_Pin(QFP32_MUX_P1_4)*1000 < *gnd_VR-TAPEOFFSET) || (Volts_at_Pin(QFP32_MUX_P1_5)*1000 < *gnd_VM-TAPEOFFSET));
		waitms(100);
		Find_Tape(gnd_VM,0);
	} else {
		mot_dir(1,0);
		pwmL = BASEPWM;
		pwmR = BASEPWM;	
		waitms(700);
		while ((Volts_at_Pin(QFP32_MUX_P1_6)*1000 < *gnd_VL-TAPEOFFSET) || (Volts_at_Pin(QFP32_MUX_P1_5)*1000 < *gnd_VM-TAPEOFFSET));
		waitms(100);
		Find_Tape(gnd_VM,0);
	}
	return;
}

void autonomous_prime(void)
{
	
	xdata unsigned short int gnd_VL;
	xdata unsigned short int gnd_VR;
	xdata unsigned short int gnd_VM;
	bit temp = 0;
	
	find_bridge_flag = 0;
	Calibrate_LSensors(&gnd_VL,&gnd_VM,&gnd_VR);	
	Find_Tape(&gnd_VM,0);		//exits when middle sensor hits tape
	Rotate(&gnd_VL,&gnd_VR);			//exits when middle sensor on tape, right and left not
	break_when_dir_found = 1;
	Follow_Tape(&gnd_VL,&gnd_VM,&gnd_VR);		//exits when direction is found
	Find_Object();								//exits when an object is detected in front of IR or ultrasonic sensor
	Track_Object();								//exits when claw has been closed on the object
//	Calibrate_LSensors(&gnd_VL,&gnd_VM,&gnd_VR);																			//needed?
	Find_Tape(&gnd_VM,1);		//exits when middle sensor hits tape (backwards)
	Rotate(&gnd_VL,&gnd_VR);			//exits when middle sensor on tape, right and left not
	dir_count = 0;								//reset direction counter to find new direction
	break_when_dir_found = 1;
	Follow_Tape(&gnd_VL,&gnd_VM,&gnd_VR);		//exits when direction is found
	find_bridge_flag = 1;						//tell follow_tape to find the bridge
	circ2 = 1;									//looking for second circle
	Follow_Tape(&gnd_VL,&gnd_VM,&gnd_VR);		//exits when it has dropped the object in the other circle
	
	//on second circle trying to get home
//	Calibrate_LSensors(&gnd_VL,&gnd_VM,&gnd_VR);																			//needed?
	Find_Tape(&gnd_VM,1);
	Rotate(&gnd_VL,&gnd_VR);			//exits when middle sensor on tape, right and left not
	Claw_Pos(2);								//close the claw
	dir_count = 0;
	break_when_dir_found = 1;
	Follow_Tape(&gnd_VL,&gnd_VM,&gnd_VR);		//exits when direction is found
	find_bridge_flag = 1;						//tell follow_tape to find the bridge
	circ2 = 0;									//looking for first circle
	Follow_Tape(&gnd_VL,&gnd_VM,&gnd_VR);		//exits when it has found the first circle (does not have an object)
	
	//new code to complete the autonomous sequence	
	temp = 0;
	while(1) {
		pwmL = BASEPWM;
		pwmR = BASEPWM;
		mot_dir(0,0);
	    waitms(400);			//approach the centre of the circle
		if (temp) dir = 1;
		else dir = 0;			//used so it goes a different direction each time
		
		Find_Object();
		Track_Object();
		Find_Tape(&gnd_VM,1);		//exits when middle sensor hits tape (backwards)
		Rotate(&gnd_VL,&gnd_VR);			//exits when middle sensor on tape, right and left not
		dir_count = 0;								//reset direction counter to find new direction
		break_when_dir_found = 1;
		Follow_Tape(&gnd_VL,&gnd_VM,&gnd_VR);		//exits when direction is found
		find_bridge_flag = 1;						//tell follow_tape to find the bridge
		circ2 = 1;									//looking for second circle
		Follow_Tape(&gnd_VL,&gnd_VM,&gnd_VR);		//exits when it has dropped the object in the other circle
		
		//on second circle trying to get home
	//	Calibrate_LSensors(&gnd_VL,&gnd_VM,&gnd_VR);																			//needed?
		Find_Tape(&gnd_VM,1);
		Rotate(&gnd_VL,&gnd_VR);			//exits when middle sensor on tape, right and left not
		Claw_Pos(2);								//close the claw
		dir_count = 0;
		break_when_dir_found = 1;
		Follow_Tape(&gnd_VL,&gnd_VM,&gnd_VR);		//exits when direction is found
		find_bridge_flag = 1;						//tell follow_tape to find the bridge
		circ2 = 0;									//looking for first circle
		Follow_Tape(&gnd_VL,&gnd_VM,&gnd_VR);		//exits when it has found the first circle (does not have an object)
		
		if (temp) {
			stop();
			waitms(1000);
			break;
		}							//temp determines if its on the second cycle, thus no objects left so exit the program
		else temp = 1;
	}	
    return;                                     //exit the program
}
