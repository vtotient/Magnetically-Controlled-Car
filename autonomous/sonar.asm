;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1069 (Apr 23 2015) (MSVC)
; This file was generated Fri Mar 30 17:15:13 2018
;--------------------------------------------------------
$name TestingSonar
$optc51 --model-small
	R_DSEG    segment data
	R_CSEG    segment code
	R_BSEG    segment bit
	R_XSEG    segment xdata
	R_PSEG    segment xdata
	R_ISEG    segment idata
	R_OSEG    segment data overlay
	BIT_BANK  segment data overlay
	R_HOME    segment code
	R_GSINIT  segment code
	R_IXSEG   segment xdata
	R_CONST   segment code
	R_XINIT   segment code
	R_DINIT   segment code

;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	public _mot_dir_PARM_2
	public _InitPinADC_PARM_2
	public _main
	public _US_Ratio_CM
	public _Find_Object
	public _Detect_Object
	public _Timer2_ISR
	public __c51_external_startup
	public _Claw_Pos
	public _Distance
	public _sonar_op
	public _claw_control
	public _debug
	public _spin_right
	public _spin_left
	public _stop
	public _mot_dir
	public _Volts_at_Pin
	public _ADC_at_Pin
	public _InitPinADC
	public _waitms
	public _Timer3us
	public _InitADC
	public _claw_pos
	public _CLAW_L
	public _CLAW_R
	public _claw_count
	public _timer_count
	public _pwm
	public _pwmR
	public _pwmL
	public _sonar_state
	public _circ2
	public _break_when_dir_found
	public _dir_flag
	public _find_circle2_flag
	public _find_circle1_flag
	public _find_bridge_flag
	public _dir
	public _MR_dir
	public _ML_dir
	public _pwm_count
	public _sonar_count_2
	public _sonar_count
;--------------------------------------------------------
; Special Function Registers
;--------------------------------------------------------
_ACC            DATA 0xe0
_ADC0ASAH       DATA 0xb6
_ADC0ASAL       DATA 0xb5
_ADC0ASCF       DATA 0xa1
_ADC0ASCT       DATA 0xc7
_ADC0CF0        DATA 0xbc
_ADC0CF1        DATA 0xb9
_ADC0CF2        DATA 0xdf
_ADC0CN0        DATA 0xe8
_ADC0CN1        DATA 0xb2
_ADC0CN2        DATA 0xb3
_ADC0GTH        DATA 0xc4
_ADC0GTL        DATA 0xc3
_ADC0H          DATA 0xbe
_ADC0L          DATA 0xbd
_ADC0LTH        DATA 0xc6
_ADC0LTL        DATA 0xc5
_ADC0MX         DATA 0xbb
_B              DATA 0xf0
_CKCON0         DATA 0x8e
_CKCON1         DATA 0xa6
_CLEN0          DATA 0xc6
_CLIE0          DATA 0xc7
_CLIF0          DATA 0xe8
_CLKSEL         DATA 0xa9
_CLOUT0         DATA 0xd1
_CLU0CF         DATA 0xb1
_CLU0FN         DATA 0xaf
_CLU0MX         DATA 0x84
_CLU1CF         DATA 0xb3
_CLU1FN         DATA 0xb2
_CLU1MX         DATA 0x85
_CLU2CF         DATA 0xb6
_CLU2FN         DATA 0xb5
_CLU2MX         DATA 0x91
_CLU3CF         DATA 0xbf
_CLU3FN         DATA 0xbe
_CLU3MX         DATA 0xae
_CMP0CN0        DATA 0x9b
_CMP0CN1        DATA 0x99
_CMP0MD         DATA 0x9d
_CMP0MX         DATA 0x9f
_CMP1CN0        DATA 0xbf
_CMP1CN1        DATA 0xac
_CMP1MD         DATA 0xab
_CMP1MX         DATA 0xaa
_CRC0CN0        DATA 0xce
_CRC0CN1        DATA 0x86
_CRC0CNT        DATA 0xd3
_CRC0DAT        DATA 0xcb
_CRC0FLIP       DATA 0xcf
_CRC0IN         DATA 0xca
_CRC0ST         DATA 0xd2
_DAC0CF0        DATA 0x91
_DAC0CF1        DATA 0x92
_DAC0H          DATA 0x85
_DAC0L          DATA 0x84
_DAC1CF0        DATA 0x93
_DAC1CF1        DATA 0x94
_DAC1H          DATA 0x8a
_DAC1L          DATA 0x89
_DAC2CF0        DATA 0x95
_DAC2CF1        DATA 0x96
_DAC2H          DATA 0x8c
_DAC2L          DATA 0x8b
_DAC3CF0        DATA 0x9a
_DAC3CF1        DATA 0x9c
_DAC3H          DATA 0x8e
_DAC3L          DATA 0x8d
_DACGCF0        DATA 0x88
_DACGCF1        DATA 0x98
_DACGCF2        DATA 0xa2
_DERIVID        DATA 0xad
_DEVICEID       DATA 0xb5
_DPH            DATA 0x83
_DPL            DATA 0x82
_EIE1           DATA 0xe6
_EIE2           DATA 0xf3
_EIP1           DATA 0xbb
_EIP1H          DATA 0xee
_EIP2           DATA 0xed
_EIP2H          DATA 0xf6
_EMI0CN         DATA 0xe7
_FLKEY          DATA 0xb7
_HFO0CAL        DATA 0xc7
_HFO1CAL        DATA 0xd6
_HFOCN          DATA 0xef
_I2C0ADM        DATA 0xff
_I2C0CN0        DATA 0xba
_I2C0DIN        DATA 0xbc
_I2C0DOUT       DATA 0xbb
_I2C0FCN0       DATA 0xad
_I2C0FCN1       DATA 0xab
_I2C0FCT        DATA 0xf5
_I2C0SLAD       DATA 0xbd
_I2C0STAT       DATA 0xb9
_IE             DATA 0xa8
_IP             DATA 0xb8
_IPH            DATA 0xf2
_IT01CF         DATA 0xe4
_LFO0CN         DATA 0xb1
_P0             DATA 0x80
_P0MASK         DATA 0xfe
_P0MAT          DATA 0xfd
_P0MDIN         DATA 0xf1
_P0MDOUT        DATA 0xa4
_P0SKIP         DATA 0xd4
_P1             DATA 0x90
_P1MASK         DATA 0xee
_P1MAT          DATA 0xed
_P1MDIN         DATA 0xf2
_P1MDOUT        DATA 0xa5
_P1SKIP         DATA 0xd5
_P2             DATA 0xa0
_P2MASK         DATA 0xfc
_P2MAT          DATA 0xfb
_P2MDIN         DATA 0xf3
_P2MDOUT        DATA 0xa6
_P2SKIP         DATA 0xcc
_P3             DATA 0xb0
_P3MDIN         DATA 0xf4
_P3MDOUT        DATA 0x9c
_PCA0CENT       DATA 0x9e
_PCA0CLR        DATA 0x9c
_PCA0CN0        DATA 0xd8
_PCA0CPH0       DATA 0xfc
_PCA0CPH1       DATA 0xea
_PCA0CPH2       DATA 0xec
_PCA0CPH3       DATA 0xf5
_PCA0CPH4       DATA 0x85
_PCA0CPH5       DATA 0xde
_PCA0CPL0       DATA 0xfb
_PCA0CPL1       DATA 0xe9
_PCA0CPL2       DATA 0xeb
_PCA0CPL3       DATA 0xf4
_PCA0CPL4       DATA 0x84
_PCA0CPL5       DATA 0xdd
_PCA0CPM0       DATA 0xda
_PCA0CPM1       DATA 0xdb
_PCA0CPM2       DATA 0xdc
_PCA0CPM3       DATA 0xae
_PCA0CPM4       DATA 0xaf
_PCA0CPM5       DATA 0xcc
_PCA0H          DATA 0xfa
_PCA0L          DATA 0xf9
_PCA0MD         DATA 0xd9
_PCA0POL        DATA 0x96
_PCA0PWM        DATA 0xf7
_PCON0          DATA 0x87
_PCON1          DATA 0xcd
_PFE0CN         DATA 0xc1
_PRTDRV         DATA 0xf6
_PSCTL          DATA 0x8f
_PSTAT0         DATA 0xaa
_PSW            DATA 0xd0
_REF0CN         DATA 0xd1
_REG0CN         DATA 0xc9
_REVID          DATA 0xb6
_RSTSRC         DATA 0xef
_SBCON1         DATA 0x94
_SBRLH1         DATA 0x96
_SBRLL1         DATA 0x95
_SBUF           DATA 0x99
_SBUF0          DATA 0x99
_SBUF1          DATA 0x92
_SCON           DATA 0x98
_SCON0          DATA 0x98
_SCON1          DATA 0xc8
_SFRPAGE        DATA 0xa7
_SFRPGCN        DATA 0xbc
_SFRSTACK       DATA 0xd7
_SMB0ADM        DATA 0xd6
_SMB0ADR        DATA 0xd7
_SMB0CF         DATA 0xc1
_SMB0CN0        DATA 0xc0
_SMB0DAT        DATA 0xc2
_SMB0FCN0       DATA 0xc3
_SMB0FCN1       DATA 0xc4
_SMB0FCT        DATA 0xef
_SMB0RXLN       DATA 0xc5
_SMB0TC         DATA 0xac
_SMOD1          DATA 0x93
_SP             DATA 0x81
_SPI0CFG        DATA 0xa1
_SPI0CKR        DATA 0xa2
_SPI0CN0        DATA 0xf8
_SPI0DAT        DATA 0xa3
_SPI0FCN0       DATA 0x9a
_SPI0FCN1       DATA 0x9b
_SPI0FCT        DATA 0xf7
_SPI0PCF        DATA 0xdf
_TCON           DATA 0x88
_TH0            DATA 0x8c
_TH1            DATA 0x8d
_TL0            DATA 0x8a
_TL1            DATA 0x8b
_TMOD           DATA 0x89
_TMR2CN0        DATA 0xc8
_TMR2CN1        DATA 0xfd
_TMR2H          DATA 0xcf
_TMR2L          DATA 0xce
_TMR2RLH        DATA 0xcb
_TMR2RLL        DATA 0xca
_TMR3CN0        DATA 0x91
_TMR3CN1        DATA 0xfe
_TMR3H          DATA 0x95
_TMR3L          DATA 0x94
_TMR3RLH        DATA 0x93
_TMR3RLL        DATA 0x92
_TMR4CN0        DATA 0x98
_TMR4CN1        DATA 0xff
_TMR4H          DATA 0xa5
_TMR4L          DATA 0xa4
_TMR4RLH        DATA 0xa3
_TMR4RLL        DATA 0xa2
_TMR5CN0        DATA 0xc0
_TMR5CN1        DATA 0xf1
_TMR5H          DATA 0xd5
_TMR5L          DATA 0xd4
_TMR5RLH        DATA 0xd3
_TMR5RLL        DATA 0xd2
_UART0PCF       DATA 0xd9
_UART1FCN0      DATA 0x9d
_UART1FCN1      DATA 0xd8
_UART1FCT       DATA 0xfa
_UART1LIN       DATA 0x9e
_UART1PCF       DATA 0xda
_VDM0CN         DATA 0xff
_WDTCN          DATA 0x97
_XBR0           DATA 0xe1
_XBR1           DATA 0xe2
_XBR2           DATA 0xe3
_XOSC0CN        DATA 0x86
_DPTR           DATA 0x8382
_TMR2RL         DATA 0xcbca
_TMR3RL         DATA 0x9392
_TMR4RL         DATA 0xa3a2
_TMR5RL         DATA 0xd3d2
_TMR0           DATA 0x8c8a
_TMR1           DATA 0x8d8b
_TMR2           DATA 0xcfce
_TMR3           DATA 0x9594
_TMR4           DATA 0xa5a4
_TMR5           DATA 0xd5d4
_SBRL1          DATA 0x9695
_PCA0           DATA 0xfaf9
_PCA0CP0        DATA 0xfcfb
_PCA0CP1        DATA 0xeae9
_PCA0CP2        DATA 0xeceb
_PCA0CP3        DATA 0xf5f4
_PCA0CP4        DATA 0x8584
_PCA0CP5        DATA 0xdedd
_ADC0ASA        DATA 0xb6b5
_ADC0GT         DATA 0xc4c3
_ADC0           DATA 0xbebd
_ADC0LT         DATA 0xc6c5
_DAC0           DATA 0x8584
_DAC1           DATA 0x8a89
_DAC2           DATA 0x8c8b
_DAC3           DATA 0x8e8d
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
_ACC_0          BIT 0xe0
_ACC_1          BIT 0xe1
_ACC_2          BIT 0xe2
_ACC_3          BIT 0xe3
_ACC_4          BIT 0xe4
_ACC_5          BIT 0xe5
_ACC_6          BIT 0xe6
_ACC_7          BIT 0xe7
_TEMPE          BIT 0xe8
_ADGN0          BIT 0xe9
_ADGN1          BIT 0xea
_ADWINT         BIT 0xeb
_ADBUSY         BIT 0xec
_ADINT          BIT 0xed
_IPOEN          BIT 0xee
_ADEN           BIT 0xef
_B_0            BIT 0xf0
_B_1            BIT 0xf1
_B_2            BIT 0xf2
_B_3            BIT 0xf3
_B_4            BIT 0xf4
_B_5            BIT 0xf5
_B_6            BIT 0xf6
_B_7            BIT 0xf7
_C0FIF          BIT 0xe8
_C0RIF          BIT 0xe9
_C1FIF          BIT 0xea
_C1RIF          BIT 0xeb
_C2FIF          BIT 0xec
_C2RIF          BIT 0xed
_C3FIF          BIT 0xee
_C3RIF          BIT 0xef
_D1SRC0         BIT 0x88
_D1SRC1         BIT 0x89
_D1AMEN         BIT 0x8a
_D01REFSL       BIT 0x8b
_D3SRC0         BIT 0x8c
_D3SRC1         BIT 0x8d
_D3AMEN         BIT 0x8e
_D23REFSL       BIT 0x8f
_D0UDIS         BIT 0x98
_D1UDIS         BIT 0x99
_D2UDIS         BIT 0x9a
_D3UDIS         BIT 0x9b
_EX0            BIT 0xa8
_ET0            BIT 0xa9
_EX1            BIT 0xaa
_ET1            BIT 0xab
_ES0            BIT 0xac
_ET2            BIT 0xad
_ESPI0          BIT 0xae
_EA             BIT 0xaf
_PX0            BIT 0xb8
_PT0            BIT 0xb9
_PX1            BIT 0xba
_PT1            BIT 0xbb
_PS0            BIT 0xbc
_PT2            BIT 0xbd
_PSPI0          BIT 0xbe
_P0_0           BIT 0x80
_P0_1           BIT 0x81
_P0_2           BIT 0x82
_P0_3           BIT 0x83
_P0_4           BIT 0x84
_P0_5           BIT 0x85
_P0_6           BIT 0x86
_P0_7           BIT 0x87
_P1_0           BIT 0x90
_P1_1           BIT 0x91
_P1_2           BIT 0x92
_P1_3           BIT 0x93
_P1_4           BIT 0x94
_P1_5           BIT 0x95
_P1_6           BIT 0x96
_P1_7           BIT 0x97
_P2_0           BIT 0xa0
_P2_1           BIT 0xa1
_P2_2           BIT 0xa2
_P2_3           BIT 0xa3
_P2_4           BIT 0xa4
_P2_5           BIT 0xa5
_P2_6           BIT 0xa6
_P3_0           BIT 0xb0
_P3_1           BIT 0xb1
_P3_2           BIT 0xb2
_P3_3           BIT 0xb3
_P3_4           BIT 0xb4
_P3_7           BIT 0xb7
_CCF0           BIT 0xd8
_CCF1           BIT 0xd9
_CCF2           BIT 0xda
_CCF3           BIT 0xdb
_CCF4           BIT 0xdc
_CCF5           BIT 0xdd
_CR             BIT 0xde
_CF             BIT 0xdf
_PARITY         BIT 0xd0
_F1             BIT 0xd1
_OV             BIT 0xd2
_RS0            BIT 0xd3
_RS1            BIT 0xd4
_F0             BIT 0xd5
_AC             BIT 0xd6
_CY             BIT 0xd7
_RI             BIT 0x98
_TI             BIT 0x99
_RB8            BIT 0x9a
_TB8            BIT 0x9b
_REN            BIT 0x9c
_CE             BIT 0x9d
_SMODE          BIT 0x9e
_RI1            BIT 0xc8
_TI1            BIT 0xc9
_RBX1           BIT 0xca
_TBX1           BIT 0xcb
_REN1           BIT 0xcc
_PERR1          BIT 0xcd
_OVR1           BIT 0xce
_SI             BIT 0xc0
_ACK            BIT 0xc1
_ARBLOST        BIT 0xc2
_ACKRQ          BIT 0xc3
_STO            BIT 0xc4
_STA            BIT 0xc5
_TXMODE         BIT 0xc6
_MASTER         BIT 0xc7
_SPIEN          BIT 0xf8
_TXNF           BIT 0xf9
_NSSMD0         BIT 0xfa
_NSSMD1         BIT 0xfb
_RXOVRN         BIT 0xfc
_MODF           BIT 0xfd
_WCOL           BIT 0xfe
_SPIF           BIT 0xff
_IT0            BIT 0x88
_IE0            BIT 0x89
_IT1            BIT 0x8a
_IE1            BIT 0x8b
_TR0            BIT 0x8c
_TF0            BIT 0x8d
_TR1            BIT 0x8e
_TF1            BIT 0x8f
_T2XCLK0        BIT 0xc8
_T2XCLK1        BIT 0xc9
_TR2            BIT 0xca
_T2SPLIT        BIT 0xcb
_TF2CEN         BIT 0xcc
_TF2LEN         BIT 0xcd
_TF2L           BIT 0xce
_TF2H           BIT 0xcf
_T4XCLK0        BIT 0x98
_T4XCLK1        BIT 0x99
_TR4            BIT 0x9a
_T4SPLIT        BIT 0x9b
_TF4CEN         BIT 0x9c
_TF4LEN         BIT 0x9d
_TF4L           BIT 0x9e
_TF4H           BIT 0x9f
_T5XCLK0        BIT 0xc0
_T5XCLK1        BIT 0xc1
_TR5            BIT 0xc2
_T5SPLIT        BIT 0xc3
_TF5CEN         BIT 0xc4
_TF5LEN         BIT 0xc5
_TF5L           BIT 0xc6
_TF5H           BIT 0xc7
_RIE            BIT 0xd8
_RXTO0          BIT 0xd9
_RXTO1          BIT 0xda
_RFRQ           BIT 0xdb
_TIE            BIT 0xdc
_TXHOLD         BIT 0xdd
_TXNF1          BIT 0xde
_TFRQ           BIT 0xdf
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	rbank0 segment data overlay
	rbank2 segment data overlay
;--------------------------------------------------------
; overlayable bit register bank
;--------------------------------------------------------
	rseg BIT_BANK
bits:
	ds 1
	b0 equ  bits.0 
	b1 equ  bits.1 
	b2 equ  bits.2 
	b3 equ  bits.3 
	b4 equ  bits.4 
	b5 equ  bits.5 
	b6 equ  bits.6 
	b7 equ  bits.7 
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	rseg R_DSEG
_sonar_count:
	ds 2
_sonar_count_2:
	ds 2
_pwm_count:
	ds 2
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	rseg	R_OSEG
	rseg	R_OSEG
_InitPinADC_PARM_2:
	ds 1
	rseg	R_OSEG
	rseg	R_OSEG
_mot_dir_PARM_2:
	ds 2
	rseg	R_OSEG
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	rseg R_ISEG
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	DSEG
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	rseg R_BSEG
_ML_dir:
	DBIT	1
_MR_dir:
	DBIT	1
_dir:
	DBIT	1
_find_bridge_flag:
	DBIT	1
_find_circle1_flag:
	DBIT	1
_find_circle2_flag:
	DBIT	1
_dir_flag:
	DBIT	1
_break_when_dir_found:
	DBIT	1
_circ2:
	DBIT	1
_sonar_state:
	DBIT	1
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	rseg R_PSEG
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	rseg R_XSEG
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	XSEG
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	rseg R_IXSEG
_pwmL:
	ds 2
_pwmR:
	ds 2
_pwm:
	ds 2
_timer_count:
	ds 2
_claw_count:
	ds 2
_CLAW_R:
	ds 2
_CLAW_L:
	ds 2
_claw_pos:
	ds 2
	rseg R_HOME
	rseg R_GSINIT
	rseg R_CSEG
;--------------------------------------------------------
; Reset entry point and interrupt vectors
;--------------------------------------------------------
	CSEG at 0x0000
	ljmp	_crt0
	CSEG at 0x002b
	ljmp	_Timer2_ISR
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	rseg R_HOME
	rseg R_GSINIT
	rseg R_GSINIT
;--------------------------------------------------------
; data variables initialization
;--------------------------------------------------------
	rseg R_DINIT
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:35: volatile int sonar_count = 0;
	clr	a
	mov	_sonar_count,a
	mov	(_sonar_count + 1),a
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:36: volatile int sonar_count_2 = 0;
	clr	a
	mov	_sonar_count_2,a
	mov	(_sonar_count_2 + 1),a
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:37: volatile int pwm_count = 0;
	clr	a
	mov	_pwm_count,a
	mov	(_pwm_count + 1),a
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:39: volatile bit find_bridge_flag =0;
	clr	_find_bridge_flag
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:40: volatile bit find_circle1_flag = 0;
	clr	_find_circle1_flag
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:41: volatile bit find_circle2_flag = 0;
	clr	_find_circle2_flag
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:42: volatile bit dir_flag=0;			//set high to indicate that the dir_count has been incremented, wait for flag low
	clr	_dir_flag
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:43: volatile bit break_when_dir_found = 0;
	clr	_break_when_dir_found
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:44: volatile bit circ2 = 0;
	clr	_circ2
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:45: volatile bit sonar_state = 0;
	clr	_sonar_state
	; The linker places a 'ret' at the end of segment R_DINIT.
;--------------------------------------------------------
; code
;--------------------------------------------------------
	rseg R_CSEG
;------------------------------------------------------------
;Allocation info for local variables in function 'InitADC'
;------------------------------------------------------------
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:2: void InitADC (void)
;	-----------------------------------------
;	 function InitADC
;	-----------------------------------------
_InitADC:
	using	0
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:4: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:5: ADC0CN1 = 0b_10_000_000; //14-bit,  Right justified no shifting applied, perform and Accumulate 1 conversion.
	mov	_ADC0CN1,#0x80
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:6: ADC0CF0 = 0b_11111_0_00; // SYSCLK/32
	mov	_ADC0CF0,#0xF8
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:7: ADC0CF1 = 0b_0_0_011110; // Same as default for now
	mov	_ADC0CF1,#0x1E
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:8: ADC0CN0 = 0b_0_0_0_0_0_00_0; // Same as default for now
	mov	_ADC0CN0,#0x00
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:9: ADC0CF2 = 0b_0_01_11111 ; // GND pin, Vref=VDD
	mov	_ADC0CF2,#0x3F
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:10: ADC0CN2 = 0b_0_000_0000;  // Same as default for now. ADC0 conversion initiated on write of 1 to ADBUSY.
	mov	_ADC0CN2,#0x00
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:11: ADEN=1; // Enable ADC
	setb	_ADEN
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer3us'
;------------------------------------------------------------
;us                        Allocated to registers r2 
;i                         Allocated to registers r3 
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:15: void Timer3us(unsigned char us)
;	-----------------------------------------
;	 function Timer3us
;	-----------------------------------------
_Timer3us:
	mov	r2,dpl
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:20: CKCON0|=0b_0100_0000;
	orl	_CKCON0,#0x40
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:22: TMR3RL = (-(SYSCLK)/1000000L); // Set Timer3 to overflow in 1us.
	mov	_TMR3RL,#0xB8
	mov	(_TMR3RL >> 8),#0xFF
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:23: TMR3 = TMR3RL;                 // Initialize Timer3 for first overflow
	mov	_TMR3,_TMR3RL
	mov	(_TMR3 >> 8),(_TMR3RL >> 8)
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:25: TMR3CN0 = 0x04;                 // Sart Timer3 and clear overflow flag
	mov	_TMR3CN0,#0x04
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:26: for (i = 0; i < us; i++)       // Count <us> overflows
	mov	r3,#0x00
L003004?:
	clr	c
	mov	a,r3
	subb	a,r2
	jnc	L003007?
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:28: while (!(TMR3CN0 & 0x80));  // Wait for overflow
L003001?:
	mov	a,_TMR3CN0
	jnb	acc.7,L003001?
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:29: TMR3CN0 &= ~(0x80);         // Clear overflow indicator
	anl	_TMR3CN0,#0x7F
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:26: for (i = 0; i < us; i++)       // Count <us> overflows
	inc	r3
	sjmp	L003004?
L003007?:
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:31: TMR3CN0 = 0 ;                   // Stop Timer3 and clear overflow flag
	mov	_TMR3CN0,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'waitms'
;------------------------------------------------------------
;ms                        Allocated to registers r2 r3 
;j                         Allocated to registers r4 r5 
;k                         Allocated to registers r6 
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:34: void waitms (unsigned int ms)
;	-----------------------------------------
;	 function waitms
;	-----------------------------------------
_waitms:
	mov	r2,dpl
	mov	r3,dph
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:38: for(j=0; j<ms; j++)
	mov	r4,#0x00
	mov	r5,#0x00
L004005?:
	clr	c
	mov	a,r4
	subb	a,r2
	mov	a,r5
	subb	a,r3
	jnc	L004009?
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:39: for (k=0; k<4; k++) Timer3us(250);
	mov	r6,#0x00
L004001?:
	cjne	r6,#0x04,L004018?
L004018?:
	jnc	L004007?
	mov	dpl,#0xFA
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	lcall	_Timer3us
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	inc	r6
	sjmp	L004001?
L004007?:
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:38: for(j=0; j<ms; j++)
	inc	r4
	cjne	r4,#0x00,L004005?
	inc	r5
	sjmp	L004005?
L004009?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'InitPinADC'
;------------------------------------------------------------
;pinno                     Allocated with name '_InitPinADC_PARM_2'
;portno                    Allocated to registers r2 
;mask                      Allocated to registers r3 
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:44: void InitPinADC (unsigned char portno, unsigned char pinno)
;	-----------------------------------------
;	 function InitPinADC
;	-----------------------------------------
_InitPinADC:
	mov	r2,dpl
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:48: mask=1<<pinno;
	mov	b,_InitPinADC_PARM_2
	inc	b
	mov	a,#0x01
	sjmp	L005013?
L005011?:
	add	a,acc
L005013?:
	djnz	b,L005011?
	mov	r3,a
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:50: SFRPAGE = 0x20;
	mov	_SFRPAGE,#0x20
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:51: switch (portno)
	cjne	r2,#0x00,L005014?
	sjmp	L005001?
L005014?:
	cjne	r2,#0x01,L005015?
	sjmp	L005002?
L005015?:
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:53: case 0:
	cjne	r2,#0x02,L005005?
	sjmp	L005003?
L005001?:
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:54: P0MDIN &= (~mask); // Set pin as analog input
	mov	a,r3
	cpl	a
	mov	r2,a
	anl	_P0MDIN,a
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:55: P0SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P0SKIP,a
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:56: break;
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:57: case 1:
	sjmp	L005005?
L005002?:
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:58: P1MDIN &= (~mask); // Set pin as analog input
	mov	a,r3
	cpl	a
	mov	r2,a
	anl	_P1MDIN,a
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:59: P1SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P1SKIP,a
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:60: break;
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:61: case 2:
	sjmp	L005005?
L005003?:
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:62: P2MDIN &= (~mask); // Set pin as analog input
	mov	a,r3
	cpl	a
	mov	r2,a
	anl	_P2MDIN,a
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:63: P2SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P2SKIP,a
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:67: }
L005005?:
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:68: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ADC_at_Pin'
;------------------------------------------------------------
;pin                       Allocated to registers 
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:71: unsigned int ADC_at_Pin(unsigned char pin)
;	-----------------------------------------
;	 function ADC_at_Pin
;	-----------------------------------------
_ADC_at_Pin:
	mov	_ADC0MX,dpl
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:74: ADBUSY=1;       // Dummy conversion first to select new pin
	setb	_ADBUSY
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:75: while (ADBUSY); // Wait for dummy conversion to finish
L006001?:
	jb	_ADBUSY,L006001?
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:76: ADBUSY = 1;     // Convert voltage at the pin
	setb	_ADBUSY
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:77: while (ADBUSY); // Wait for conversion to complete
L006004?:
	jb	_ADBUSY,L006004?
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:78: return (ADC0);
	mov	dpl,_ADC0
	mov	dph,(_ADC0 >> 8)
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Volts_at_Pin'
;------------------------------------------------------------
;pin                       Allocated to registers r2 
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:81: float Volts_at_Pin(unsigned char pin)
;	-----------------------------------------
;	 function Volts_at_Pin
;	-----------------------------------------
_Volts_at_Pin:
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:83: return ((ADC_at_Pin(pin)*VDD)/0b_0011_1111_1111_1111);
	lcall	_ADC_at_Pin
	lcall	___uint2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x6C8B
	mov	b,#0x53
	mov	a,#0x40
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	clr	a
	push	acc
	mov	a,#0xFC
	push	acc
	mov	a,#0x7F
	push	acc
	mov	a,#0x46
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'mot_dir'
;------------------------------------------------------------
;MR                        Allocated with name '_mot_dir_PARM_2'
;ML                        Allocated to registers r2 r3 
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:86: void mot_dir(int ML, int MR)
;	-----------------------------------------
;	 function mot_dir
;	-----------------------------------------
_mot_dir:
	mov	r2,dpl
	mov	r3,dph
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:88: ML_dir = ML;
	mov	a,r2
	orl	a,r3
	add	a,#0xff
	mov	_ML_dir,c
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:89: MR_dir = MR;
	mov	a,_mot_dir_PARM_2
	orl	a,(_mot_dir_PARM_2 + 1)
	add	a,#0xff
	mov	_MR_dir,c
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'stop'
;------------------------------------------------------------
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:92: void stop(void){
;	-----------------------------------------
;	 function stop
;	-----------------------------------------
_stop:
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:93: pwmL=0;
	mov	dptr,#_pwmL
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:94: pwmR=0;	
	mov	dptr,#_pwmR
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:95: waitms(100);
	mov	dptr,#0x0064
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'spin_left'
;------------------------------------------------------------
;offset                    Allocated to registers r2 r3 
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:98: void spin_left(int offset)
;	-----------------------------------------
;	 function spin_left
;	-----------------------------------------
_spin_left:
	mov	r2,dpl
	mov	r3,dph
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:100: mot_dir(1,0);
	clr	a
	mov	_mot_dir_PARM_2,a
	mov	(_mot_dir_PARM_2 + 1),a
	mov	dptr,#0x0001
	push	ar2
	push	ar3
	lcall	_mot_dir
	pop	ar3
	pop	ar2
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:101: pwmR = BOOSTPWM+offset;
	mov	dptr,#_pwmR
	mov	a,#0x55
	add	a,r2
	movx	@dptr,a
	clr	a
	addc	a,r3
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:102: pwmL = BASEPWM+offset;
	mov	dptr,#_pwmL
	mov	a,#0x28
	add	a,r2
	movx	@dptr,a
	clr	a
	addc	a,r3
	inc	dptr
	movx	@dptr,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'spin_right'
;------------------------------------------------------------
;offset                    Allocated to registers r2 r3 
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:106: void spin_right(int offset)
;	-----------------------------------------
;	 function spin_right
;	-----------------------------------------
_spin_right:
	mov	r2,dpl
	mov	r3,dph
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:108: mot_dir(0,1);
	mov	_mot_dir_PARM_2,#0x01
	clr	a
	mov	(_mot_dir_PARM_2 + 1),a
	mov	dptr,#0x0000
	push	ar2
	push	ar3
	lcall	_mot_dir
	pop	ar3
	pop	ar2
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:109: pwmL = BOOSTPWM+offset;
	mov	dptr,#_pwmL
	mov	a,#0x55
	add	a,r2
	movx	@dptr,a
	clr	a
	addc	a,r3
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:110: pwmR = BASEPWM+offset;	
	mov	dptr,#_pwmR
	mov	a,#0x28
	add	a,r2
	movx	@dptr,a
	clr	a
	addc	a,r3
	inc	dptr
	movx	@dptr,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'debug'
;------------------------------------------------------------
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:113: void debug( void )
;	-----------------------------------------
;	 function debug
;	-----------------------------------------
_debug:
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:116: stop();
	lcall	_stop
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:117: while(1);
L012002?:
	sjmp	L012002?
;------------------------------------------------------------
;Allocation info for local variables in function 'claw_control'
;------------------------------------------------------------
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:121: void claw_control(void)
;	-----------------------------------------
;	 function claw_control
;	-----------------------------------------
_claw_control:
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:123: claw_count++;
	mov	dptr,#_claw_count
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
	inc	dptr
	movx	a,@dptr
	addc	a,#0x00
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:124: if (claw_count > 199) claw_count=0;
	mov	dptr,#_claw_count
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	clr	c
	mov	a,#0xC7
	subb	a,r2
	clr	a
	xrl	a,#0x80
	mov	b,r3
	xrl	b,#0x80
	subb	a,b
	jnc	L013002?
	mov	dptr,#_claw_count
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
L013002?:
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:126: if (claw_count < 5)
	mov	dptr,#_claw_count
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	clr	c
	mov	a,r2
	subb	a,#0x05
	mov	a,r3
	xrl	a,#0x80
	subb	a,#0x80
	jnc	L013007?
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:128: P2_1=!P2_1;
	cpl	_P2_1
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:129: CLAW_L = 1;
	mov	dptr,#_CLAW_L
	mov	a,#0x01
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:130: CLAW_R = 1;
	mov	dptr,#_CLAW_R
	mov	a,#0x01
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	ret
L013007?:
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:131: } else if (claw_count >= 22) {
	mov	dptr,#_claw_count
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	clr	c
	mov	a,r2
	subb	a,#0x16
	mov	a,r3
	xrl	a,#0x80
	subb	a,#0x80
	jc	L013004?
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:132: CLAW_L = 0;
	mov	dptr,#_CLAW_L
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:133: CLAW_R = 0;
	mov	dptr,#_CLAW_R
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
	ret
L013004?:
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:135: CLAW_L = (claw_count < claw_pos + 5) ? 1 : 0;
	mov	dptr,#_claw_pos
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	mov	a,#0x05
	add	a,r2
	mov	r2,a
	clr	a
	addc	a,r3
	mov	r3,a
	mov	dptr,#_claw_count
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	clr	c
	mov	a,r4
	subb	a,r2
	mov	a,r5
	xrl	a,#0x80
	mov	b,r3
	xrl	b,#0x80
	subb	a,b
	jnc	L013011?
	mov	r2,#0x01
	sjmp	L013012?
L013011?:
	mov	r2,#0x00
L013012?:
	mov	dptr,#_CLAW_L
	mov	a,r2
	movx	@dptr,a
	inc	dptr
	clr	a
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:136: CLAW_R = (claw_count < 22 - claw_pos) ? 1 : 0;
	mov	dptr,#_claw_pos
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	mov	a,#0x16
	clr	c
	subb	a,r2
	mov	r2,a
	clr	a
	subb	a,r3
	mov	r3,a
	mov	dptr,#_claw_count
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	clr	c
	mov	a,r4
	subb	a,r2
	mov	a,r5
	xrl	a,#0x80
	mov	b,r3
	xrl	b,#0x80
	subb	a,b
	jnc	L013013?
	mov	r2,#0x01
	sjmp	L013014?
L013013?:
	mov	r2,#0x00
L013014?:
	mov	dptr,#_CLAW_R
	mov	a,r2
	movx	@dptr,a
	inc	dptr
	clr	a
	movx	@dptr,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'sonar_op'
;------------------------------------------------------------
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:141: void sonar_op(void)
;	-----------------------------------------
;	 function sonar_op
;	-----------------------------------------
_sonar_op:
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:144: Trig = pwm_count >= 50?0:1;
	clr	c
	mov	a,_pwm_count
	subb	a,#0x32
	mov	a,(_pwm_count + 1)
	xrl	a,#0x80
	subb	a,#0x80
	mov	_P1_0,c
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:147: if (!sonar_state) {
	jb	_sonar_state,L014007?
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:148: if (P0_7) {
	jnb	_P0_7,L014009?
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:149: sonar_state = 1;
	setb	_sonar_state
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:150: sonar_count = 0;
	clr	a
	mov	_sonar_count,a
	mov	(_sonar_count + 1),a
	ret
L014007?:
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:152: } else if (P0_7) {
	jnb	_P0_7,L014004?
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:153: sonar_count++;
	mov	a,#0x01
	add	a,_sonar_count
	mov	_sonar_count,a
	clr	a
	addc	a,(_sonar_count + 1)
	mov	(_sonar_count + 1),a
	ret
L014004?:
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:156: sonar_count_2 = sonar_count;
	mov	_sonar_count_2,_sonar_count
	mov	(_sonar_count_2 + 1),(_sonar_count + 1)
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:158: sonar_state = 0;
	clr	_sonar_state
L014009?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Distance'
;------------------------------------------------------------
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:162: float Distance ( void )
;	-----------------------------------------
;	 function Distance
;	-----------------------------------------
_Distance:
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:164: return sonar_count_2;	
	mov	dpl,_sonar_count_2
	mov	dph,(_sonar_count_2 + 1)
	ljmp	___sint2fs
;------------------------------------------------------------
;Allocation info for local variables in function 'Claw_Pos'
;------------------------------------------------------------
;pos                       Allocated to registers r2 r3 
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:167: void Claw_Pos( int pos ) 
;	-----------------------------------------
;	 function Claw_Pos
;	-----------------------------------------
_Claw_Pos:
	mov	r2,dpl
	mov	r3,dph
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\/lewislib.h:169: claw_pos = pos;
	mov	dptr,#_claw_pos
	mov	a,r2
	movx	@dptr,a
	inc	dptr
	mov	a,r3
	movx	@dptr,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_c51_external_startup'
;------------------------------------------------------------
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:60: char _c51_external_startup (void)
;	-----------------------------------------
;	 function _c51_external_startup
;	-----------------------------------------
__c51_external_startup:
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:63: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:64: WDTCN = 0xDE; //First key
	mov	_WDTCN,#0xDE
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:65: WDTCN = 0xAD; //Second key
	mov	_WDTCN,#0xAD
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:67: VDM0CN=0x80;       // enable VDD monitor
	mov	_VDM0CN,#0x80
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:68: RSTSRC=0x02|0x04;  // Enable reset on missing clock detector and VDD
	mov	_RSTSRC,#0x06
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:75: SFRPAGE = 0x10;
	mov	_SFRPAGE,#0x10
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:76: PFE0CN  = 0x20; // SYSCLK < 75 MHz.
	mov	_PFE0CN,#0x20
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:77: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:98: CLKSEL = 0x00;
	mov	_CLKSEL,#0x00
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:99: CLKSEL = 0x00;
	mov	_CLKSEL,#0x00
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:100: while ((CLKSEL & 0x80) == 0);
L017001?:
	mov	a,_CLKSEL
	jnb	acc.7,L017001?
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:101: CLKSEL = 0x03;
	mov	_CLKSEL,#0x03
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:102: CLKSEL = 0x03;
	mov	_CLKSEL,#0x03
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:103: while ((CLKSEL & 0x80) == 0);
L017004?:
	mov	a,_CLKSEL
	jnb	acc.7,L017004?
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:108: P0MDOUT |= 0x10; // Enable UART0 TX as push-pull output
	orl	_P0MDOUT,#0x10
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:109: XBR0     = 0x01; // Enable UART0 on P0.4(TX) and P0.5(RX)                     
	mov	_XBR0,#0x01
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:110: XBR1     = 0X00;
	mov	_XBR1,#0x00
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:111: XBR2     = 0x40; // Enable crossbar and weak pull-ups
	mov	_XBR2,#0x40
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:117: SCON0 = 0x10;
	mov	_SCON0,#0x10
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:118: TH1 = 0x100-((SYSCLK/BAUDRATE)/(2L*12L));
	mov	_TH1,#0xE6
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:119: TL1 = TH1;      // Init Timer1
	mov	_TL1,_TH1
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:120: TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit auto-reload
	anl	_TMOD,#0x0F
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:121: TMOD |=  0x20;                       
	orl	_TMOD,#0x20
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:122: TR1 = 1; // START Timer1
	setb	_TR1
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:123: TI = 1;  // Indicate TX0 ready
	setb	_TI
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:126: TMR2CN0=0x00;   // Stop Timer2; Clear TF2;
	mov	_TMR2CN0,#0x00
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:127: CKCON0|=0b_0001_0000; // Timer 2 uses the system clock
	orl	_CKCON0,#0x10
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:128: TMR2RL=(0x10000L-(SYSCLK/10000L)); // Initialize reload value
	mov	_TMR2RL,#0xE0
	mov	(_TMR2RL >> 8),#0xE3
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:129: TMR2=0xffff;   // Set to reload immediately
	mov	_TMR2,#0xFF
	mov	(_TMR2 >> 8),#0xFF
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:130: ET2=1;         // Enable Timer2 interrupts
	setb	_ET2
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:131: TR2=1;         // Start Timer2 (TMR2CN is bit addressable)
	setb	_TR2
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:133: EA=1; // Enable interrupts
	setb	_EA
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:135: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer2_ISR'
;------------------------------------------------------------
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:138: void Timer2_ISR (void) interrupt 5 using 2
;	-----------------------------------------
;	 function Timer2_ISR
;	-----------------------------------------
_Timer2_ISR:
	using	2
	push	bits
	push	acc
	push	b
	push	dpl
	push	dph
	push	(0+2)
	push	(0+3)
	push	(0+4)
	push	(0+5)
	push	(0+6)
	push	(0+7)
	push	(0+0)
	push	(0+1)
	push	psw
	mov	psw,#0x10
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:140: TF2H = 0; // Clear Timer2 interrupt flag
	clr	_TF2H
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:142: pwm_count++;
	mov	a,#0x01
	add	a,_pwm_count
	mov	_pwm_count,a
	clr	a
	addc	a,(_pwm_count + 1)
	mov	(_pwm_count + 1),a
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:143: if (pwm_count >= 100) {
	clr	c
	mov	a,_pwm_count
	subb	a,#0x64
	mov	a,(_pwm_count + 1)
	xrl	a,#0x80
	subb	a,#0x80
	jc	L018004?
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:144: pwm_count=0;
	clr	a
	mov	_pwm_count,a
	mov	(_pwm_count + 1),a
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:145: timer_count++;
	mov	dptr,#_timer_count
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
	inc	dptr
	movx	a,@dptr
	addc	a,#0x00
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:146: if (timer_count >= 50) {		//every 0.5 seconds enter
	mov	dptr,#_timer_count
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	clr	c
	mov	a,r2
	subb	a,#0x32
	mov	a,r3
	subb	a,#0x00
	jc	L018004?
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:147: timer_count =  0;
	mov	dptr,#_timer_count
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:148: dir_flag = 0;	
	clr	_dir_flag
L018004?:
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:151: claw_control();
	mov	psw,#0x00
	lcall	_claw_control
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:154: sonar_op();
	mov	psw,#0x00
	lcall	_sonar_op
	mov	psw,#0x10
	pop	psw
	pop	(0+1)
	pop	(0+0)
	pop	(0+7)
	pop	(0+6)
	pop	(0+5)
	pop	(0+4)
	pop	(0+3)
	pop	(0+2)
	pop	dph
	pop	dpl
	pop	b
	pop	acc
	pop	bits
	reti
;------------------------------------------------------------
;Allocation info for local variables in function 'Detect_Object'
;------------------------------------------------------------
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:160: int Detect_Object (/*int distancepwm*/void)
;	-----------------------------------------
;	 function Detect_Object
;	-----------------------------------------
_Detect_Object:
	using	0
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:165: if (((Volts_at_Pin(QFP32_MUX_P1_2) * 1000) < 1000) || ((Volts_at_Pin(QFP32_MUX_P1_3) * 1000) < 1000))
	mov	dpl,#0x08
	lcall	_Volts_at_Pin
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x0000
	mov	b,#0x7A
	mov	a,#0x44
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	clr	a
	push	acc
	push	acc
	mov	a,#0x7A
	push	acc
	mov	a,#0x44
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fslt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L019001?
	mov	dpl,#0x09
	lcall	_Volts_at_Pin
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x0000
	mov	b,#0x7A
	mov	a,#0x44
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	clr	a
	push	acc
	push	acc
	mov	a,#0x7A
	push	acc
	mov	a,#0x44
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fslt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L019002?
L019001?:
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:166: return 1;
	mov	dptr,#0x0001
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:168: return 0;
	ret
L019002?:
	mov	dptr,#0x0000
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Find_Object'
;------------------------------------------------------------
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:171: void Find_Object( void )
;	-----------------------------------------
;	 function Find_Object
;	-----------------------------------------
_Find_Object:
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:174: if (dir) {
	jnb	_dir,L020002?
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:176: mot_dir(1,0);
	clr	a
	mov	_mot_dir_PARM_2,a
	mov	(_mot_dir_PARM_2 + 1),a
	mov	dptr,#0x0001
	lcall	_mot_dir
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:177: pwmR = 0;
	mov	dptr,#_pwmR
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:178: pwmL = BASEPWM;
	mov	dptr,#_pwmL
	mov	a,#0x28
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	sjmp	L020004?
L020002?:
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:181: mot_dir(0,1);
	mov	_mot_dir_PARM_2,#0x01
	clr	a
	mov	(_mot_dir_PARM_2 + 1),a
	mov	dptr,#0x0000
	lcall	_mot_dir
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:182: pwmR = BASEPWM;
	mov	dptr,#_pwmR
	mov	a,#0x28
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:183: pwmL =0;
	mov	dptr,#_pwmL
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:186: while (Detect_Object() != 1);		//locate an object with the IR sensors
L020004?:
	lcall	_Detect_Object
	mov	r2,dpl
	mov	r3,dph
	cjne	r2,#0x01,L020004?
	cjne	r3,#0x00,L020004?
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'US_Ratio_CM'
;------------------------------------------------------------
;ratio                     Allocated to registers r2 r3 r4 r5 
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:191: float US_Ratio_CM (float ratio)
;	-----------------------------------------
;	 function US_Ratio_CM
;	-----------------------------------------
_US_Ratio_CM:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:193: return (ratio-0.015)/(0.0055);
	mov	a,#0x8F
	push	acc
	mov	a,#0xC2
	push	acc
	mov	a,#0x75
	push	acc
	mov	a,#0x3C
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fssub
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,#0x58
	push	acc
	mov	a,#0x39
	push	acc
	mov	a,#0xB4
	push	acc
	mov	a,#0x3B
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;temp                      Allocated to registers 
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:197: void main (void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:200: stop();
	lcall	_stop
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:202: InitPinADC(1, 6); // Configure as analog input	//PR L
	mov	_InitPinADC_PARM_2,#0x06
	mov	dpl,#0x01
	lcall	_InitPinADC
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:203: InitPinADC(1, 5); // Configure as analog input	//PR M
	mov	_InitPinADC_PARM_2,#0x05
	mov	dpl,#0x01
	lcall	_InitPinADC
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:204: InitPinADC(1, 4); // Configure as analog input	//PR R
	mov	_InitPinADC_PARM_2,#0x04
	mov	dpl,#0x01
	lcall	_InitPinADC
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:205: InitPinADC(1, 3); // Configure as analog input	//IR L
	mov	_InitPinADC_PARM_2,#0x03
	mov	dpl,#0x01
	lcall	_InitPinADC
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:206: InitPinADC(1, 2); // Configure as analog input	//IR R
	mov	_InitPinADC_PARM_2,#0x02
	mov	dpl,#0x01
	lcall	_InitPinADC
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:207: InitADC();
	lcall	_InitADC
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:208: P0_7 = 1;
	setb	_P0_7
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:211: while(1) {
L022002?:
;	D:\School\Elec 291\Project 2\mcar\autonomous_firmware\TestingSonar.c:214: printf("%d %d\n", sonar_state,sonar_count_2);
	mov	c,_sonar_state
	clr	a
	rlc	a
	mov	r2,a
	mov	r3,#0x00
	push	_sonar_count_2
	push	(_sonar_count_2 + 1)
	push	ar2
	push	ar3
	mov	a,#__str_0
	push	acc
	mov	a,#(__str_0 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
	sjmp	L022002?
	rseg R_CSEG

	rseg R_XINIT
__xinit__pwmL:
	db 0xFF,0xFF	; 65535
__xinit__pwmR:
	db 0xFF,0xFF	; 65535
__xinit__pwm:
	db 0xFF,0xFF	; 65535
__xinit__timer_count:
	db 0x00,0x00	; 0
__xinit__claw_count:
	db 0x00,0x00	;  0
__xinit__CLAW_R:
	db 0x00,0x00	;  0
__xinit__CLAW_L:
	db 0x00,0x00	;  0
__xinit__claw_pos:
	db 0x01,0x00	;  1

	rseg R_CONST
__str_0:
	db '%d %d'
	db 0x0A
	db 0x00

	CSEG

end
