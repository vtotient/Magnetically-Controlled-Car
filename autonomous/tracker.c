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
#define CLAW_L P1_7
#define CLAW_R P2_0

#define LED P2_6
#define SLOWPWM 5
#define BASEPWM 25			//was 20
#define BOOSTPWM 40			//was 75
#define TAPEOFFSET 400
#define SONARFILTER 5

xdata volatile unsigned short pwmL = -1;
xdata volatile unsigned short pwmR = -1;
xdata volatile unsigned short pwm = -1;

volatile bit MR_dir=0;
volatile bit ML_dir=0;
volatile bit dir=0;					//indicates if ccw or cw

//volatile bit found_dir_flag=0;		//set high when the direction is found during track tape 
xdata volatile short dir_count=0;			//used to determine the direction, if <=-7 then cw, if >=7 ccw
xdata volatile unsigned char pwm_count=0;
xdata volatile unsigned short timer_count=0;
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

/*calibrates the sensors given the current room's conditions*/
void Calibrate_LSensors(int *VL, int *VM, int *VR)
{
	xdata unsigned short int Vtemp =0;
	xdata short countL=0;
	xdata short countM=0;
	xdata short countR=0;
	xdata short flags =0;
	
	//have not found good values
	while (flags != 7) {
		//VL
		if ((flags & 2) != 2) {
			Vtemp = Volts_at_Pin(QFP32_MUX_P1_6)*1000;
			
			if (abs(*VL - Vtemp) <= 50) {
				countL++;
			} else {
				countL = 0;
				*VL = Vtemp;
			}
			
			if (countL == 10)
				flags |= 2;
		}
		//VR
		if ((flags & 1) != 1) {
			Vtemp = Volts_at_Pin(QFP32_MUX_P1_4)*1000;
			
			if (abs(*VR-Vtemp) <= 50) {
				countR++;
			} else {
				countR =0;
				*VR = Vtemp;
			}
			
			if (countR == 10)
				flags |= 1;
		}	
		//VM
		if ((flags & 4) != 4) {
			Vtemp = Volts_at_Pin(QFP32_MUX_P1_5)*1000;
			
			if (abs(*VM-Vtemp) <= 50){
				countM++;
			} else {
				countM =0;
				*VM = Vtemp;
			}
			
			if (countM == 10)
				flags |= 4;
		}	
	}
	return;	
}

void Follow_Tape(unsigned short int *gnd_VL, unsigned short int *gnd_VM, unsigned short int *gnd_VR)
{
	//temporary variables until we get the calibrated voltage of the ground***
	xdata unsigned short int tp_VL = *gnd_VL-TAPEOFFSET;
	xdata unsigned short int tp_VR = *gnd_VR-TAPEOFFSET;
	xdata unsigned short int tp_VM = *gnd_VM-TAPEOFFSET;
	
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
		if (dir_count >= 7) dir =1;	 //ccw
		if (dir_count <= -7) dir =0; //cw
		
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
			
		} else if ((dir_count >= 15) || (dir_count <= -15) && break_when_dir_found) {
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
			if (Distance() < 40) {
				pwmL = BOOSTPWM; //approach the object quickly
				pwmR = BOOSTPWM;
			} else {
				pwmL = 0; // temporary just stops
				pwmR = 0;
			}
		} else if ((IRVL < 1000) && (IRVR < 1000)) {
			pwmL = BASEPWM; 
			pwmR = BASEPWM;	
		}
		
		if (Distance() < 4) 
			flag = 1;
	}
	
	pwmL = BASEPWM; 
	pwmR = BASEPWM;	
	waitms(500);
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
		
	while((Volts_at_Pin(QFP32_MUX_P1_6)*1000 < *gnd_VL-TAPEOFFSET) &&
		  (Volts_at_Pin(QFP32_MUX_P1_4)*1000 < *gnd_VR-TAPEOFFSET)); 
	return;
}

int Detect_Object (void)
{	
	if (((Volts_at_Pin(QFP32_MUX_P1_2) * 1000) < 1000) || ((Volts_at_Pin(QFP32_MUX_P1_3) * 1000) < 1000))
		return 1;
	if ((Distance() <= 40))
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
		pwmR = 0;
		pwmL = BASEPWM;
	} else {
		//rotate right (cw)
		mot_dir(0,1);
		pwmR = BASEPWM;
		pwmL =0;
	}
	
	//change this
	while (Detect_Object() != 1);		//locate an object with the IR sensors
}

void Bridge_Rotate(unsigned short int* gnd_VL, unsigned short int* gnd_VM, unsigned short int* gnd_VR)
{
	if (dir) {
		mot_dir(0,1);
		pwmL = BASEPWM+10;
		pwmR = BASEPWM+10;	
		waitms(700);
		while ((Volts_at_Pin(QFP32_MUX_P1_4)*1000 < *gnd_VR-TAPEOFFSET) || (Volts_at_Pin(QFP32_MUX_P1_5)*1000 < *gnd_VM-TAPEOFFSET));
		Find_Tape(gnd_VM,0);
	} else {
		mot_dir(1,0);
		pwmL = BASEPWM+10;
		pwmR = BASEPWM+10;	
		waitms(700);
		while ((Volts_at_Pin(QFP32_MUX_P1_6)*1000 < *gnd_VL-TAPEOFFSET) || (Volts_at_Pin(QFP32_MUX_P1_5)*1000 < *gnd_VM-TAPEOFFSET));
		Find_Tape(gnd_VM,0);
	}
	return;
}

void main (void)
{
	xdata unsigned short int gnd_VL;
	xdata unsigned short int gnd_VR;
	xdata unsigned short int gnd_VM;
	stop();
		
	InitPinADC(1, 6); // Configure as analog input	//PR L
	InitPinADC(1, 5); // Configure as analog input	//PR M
	InitPinADC(1, 4); // Configure as analog input	//PR R
	InitPinADC(1, 3); // Configure as analog input	//IR L
	InitPinADC(1, 2); // Configure as analog input	//IR R
	InitADC();
	
	//runtime loop
	while(1) {
	
		find_bridge_flag = 0;
		Calibrate_LSensors(&gnd_VL,&gnd_VM,&gnd_VR);	
		Find_Tape(&gnd_VM,0);		//exits when middle sensor hits tape
		Rotate(&gnd_VL,&gnd_VR);			//exits when middle sensor on tape, right and left not
		break_when_dir_found = 1;
		Follow_Tape(&gnd_VL,&gnd_VM,&gnd_VR);		//exits when direction is found
		stop();
		Claw_Pos(10);
		waitms(1000);								//allow the claw to open before IR sensors scan
		Find_Object();								//exits when an object is detected in front of IR or ultrasonic sensor
		Track_Object();								//exits when claw has been closed on the object
		Calibrate_LSensors(&gnd_VL,&gnd_VM,&gnd_VR);																			//needed?
		Find_Tape(&gnd_VM,1);		//exits when middle sensor hits tape (backwards)
		dir_count = 0;								//reset direction counter to find new direction
		Follow_Tape(&gnd_VL,&gnd_VM,&gnd_VR);		//exits when direction is found
		find_bridge_flag = 1;						//tell follow_tape to find the bridge
		circ2 = 1;									//looking for second circle
		Follow_Tape(&gnd_VL,&gnd_VM,&gnd_VR);		//exits when it has dropped the object in the other circle
		
		//on second circle trying to get home
		stop();
		waitms(500);
		Calibrate_LSensors(&gnd_VL,&gnd_VM,&gnd_VR);																			//needed?
		Find_Tape(&gnd_VM,1);
		Rotate(&gnd_VL,&gnd_VR);			//exits when middle sensor on tape, right and left not
		Claw_Pos(2);								//close the claw
		dir_count = 0;
		break_when_dir_found = 1;
		Follow_Tape(&gnd_VL,&gnd_VM,&gnd_VR);		//exits when direction is found
		find_bridge_flag = 1;						//tell follow_tape to find the bridge
		circ2 = 0;									//looking for first circle
		Follow_Tape(&gnd_VL,&gnd_VM,&gnd_VR);		//exits when it has found the first circle (does not have an object)
		
		debug();

		
	}
}
