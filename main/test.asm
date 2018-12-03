;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1069 (Apr 23 2015) (MSVC)
; This file was generated Mon Apr 02 21:05:20 2018
;--------------------------------------------------------
$name test
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
	public _getchar1
	public _UART1_Init
	public __c51_external_startup
	public _autonomous_prime
	public _Find_Object
	public _Detect_Object
	public _Track_Object
	public _Follow_Tape
	public _manual_mode
	public _Calibrate_LSensors
	public _Timer2_ISR
	public _sonar_op
	public _debug
	public _spin_right
	public _spin_left
	public _stop
	public _mot_dir
	public _Volts_at_Pin
	public _ADC_at_Pin
	public _UART1_RI
	public _InitPinADC
	public _waitms
	public _Timer3us
	public _InitADC
	public _pwm_count
	public _claw_pos
	public _sonar_count_2
	public _sonar_count
	public _timer_count
	public _dir_count
	public _no_signal_1
	public _no_signal_0
	public _y_absolute
	public _x_absolute
	public _main_int4
	public _main_int3
	public _main_int2
	public _main_int1
	public _main_short1
	public _pwmR
	public _pwmL
	public _MR_dir
	public _ML_dir
	public _counter_above_100
	public _sonar_state
	public _circ2
	public _break_when_dir_found
	public _dir_flag
	public _find_circle2_flag
	public _find_circle1_flag
	public _find_bridge_flag
	public _dir
	public _y_dir
	public _x_dir
	public _close
	public _open
	public _boost
	public _autocar
	public _Bridge_Rotate_PARM_3
	public _Bridge_Rotate_PARM_2
	public _Rotate_PARM_2
	public _Find_Tape_PARM_2
	public _Follow_Tape_PARM_3
	public _Follow_Tape_PARM_2
	public _Calibrate_LSensors_PARM_3
	public _Calibrate_LSensors_PARM_2
	public _claw_control
	public _Claw_Pos
	public _Find_Tape
	public _Rotate
	public _Bridge_Rotate
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
	rbank3 segment data overlay
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
_Calibrate_LSensors_PARM_2:
	ds 3
_Calibrate_LSensors_PARM_3:
	ds 3
_Calibrate_LSensors_VL_1_93:
	ds 3
_Follow_Tape_PARM_2:
	ds 3
_Follow_Tape_PARM_3:
	ds 3
_Follow_Tape_gnd_VL_1_117:
	ds 3
_Follow_Tape_sloc0_1_0:
	ds 3
_Follow_Tape_sloc1_1_0:
	ds 3
_Follow_Tape_sloc2_1_0:
	ds 4
_Follow_Tape_sloc3_1_0:
	ds 4
_Follow_Tape_sloc4_1_0:
	ds 4
_Find_Tape_PARM_2:
	ds 2
_Find_Tape_gnd_VM_1_142:
	ds 3
_Rotate_PARM_2:
	ds 3
_Rotate_gnd_VL_1_147:
	ds 3
_Rotate_sloc0_1_0:
	ds 3
_Bridge_Rotate_PARM_2:
	ds 3
_Bridge_Rotate_PARM_3:
	ds 3
_Bridge_Rotate_gnd_VL_1_157:
	ds 3
_Bridge_Rotate_sloc0_1_0:
	ds 3
_Bridge_Rotate_sloc1_1_0:
	ds 3
_Bridge_Rotate_sloc2_1_0:
	ds 4
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	rseg	R_OSEG
	rseg	R_OSEG
_InitPinADC_PARM_2:
	ds 1
	rseg	R_OSEG
	rseg	R_OSEG
	rseg	R_OSEG
_mot_dir_PARM_2:
	ds 2
	rseg	R_OSEG
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
_autocar:
	DBIT	1
_boost:
	DBIT	1
_open:
	DBIT	1
_close:
	DBIT	1
_x_dir:
	DBIT	1
_y_dir:
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
_counter_above_100:
	DBIT	1
_ML_dir:
	DBIT	1
_MR_dir:
	DBIT	1
_Track_Object_flag_1_134:
	DBIT	1
_Find_Tape_flag_1_143:
	DBIT	1
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	rseg R_PSEG
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	rseg R_XSEG
_pwmL:
	ds 2
_pwmR:
	ds 2
_main_short1:
	ds 2
_main_int1:
	ds 2
_main_int2:
	ds 2
_main_int3:
	ds 2
_main_int4:
	ds 2
_Calibrate_LSensors_countL_1_94:
	ds 2
_Calibrate_LSensors_countM_1_94:
	ds 2
_Calibrate_LSensors_countR_1_94:
	ds 2
_Calibrate_LSensors_flags_1_94:
	ds 2
_autonomous_prime_gnd_VL_1_162:
	ds 2
_autonomous_prime_gnd_VR_1_162:
	ds 2
_autonomous_prime_gnd_VM_1_162:
	ds 2
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	XSEG
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	rseg R_IXSEG
_x_absolute:
	ds 2
_y_absolute:
	ds 2
_no_signal_0:
	ds 2
_no_signal_1:
	ds 2
_dir_count:
	ds 2
_timer_count:
	ds 2
_sonar_count:
	ds 2
_sonar_count_2:
	ds 2
_claw_pos:
	ds 2
_pwm_count:
	ds 1
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
;	D:\School\Elec 291\Project 2\mcar\main\test.c:44: volatile bit find_bridge_flag = 0;
	clr	_find_bridge_flag
;	D:\School\Elec 291\Project 2\mcar\main\test.c:45: volatile bit find_circle1_flag = 0;
	clr	_find_circle1_flag
;	D:\School\Elec 291\Project 2\mcar\main\test.c:46: volatile bit find_circle2_flag = 0;
	clr	_find_circle2_flag
;	D:\School\Elec 291\Project 2\mcar\main\test.c:47: volatile bit dir_flag=0;            //set high to indicate that the dir_count has been incremented, wait for flag low
	clr	_dir_flag
;	D:\School\Elec 291\Project 2\mcar\main\test.c:48: volatile bit break_when_dir_found = 0;
	clr	_break_when_dir_found
;	D:\School\Elec 291\Project 2\mcar\main\test.c:49: volatile bit circ2 = 0;
	clr	_circ2
;	D:\School\Elec 291\Project 2\mcar\main\test.c:50: volatile bit sonar_state = 0;
	clr	_sonar_state
;	D:\School\Elec 291\Project 2\mcar\main\test.c:54: volatile bit counter_above_100 = 0;
	clr	_counter_above_100
	; The linker places a 'ret' at the end of segment R_DINIT.
;--------------------------------------------------------
; code
;--------------------------------------------------------
	rseg R_CSEG
;------------------------------------------------------------
;Allocation info for local variables in function 'InitADC'
;------------------------------------------------------------
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:2: void InitADC (void)
;	-----------------------------------------
;	 function InitADC
;	-----------------------------------------
_InitADC:
	using	0
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:4: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:5: ADC0CN1 = 0b_10_000_000; //14-bit,  Right justified no shifting applied, perform and Accumulate 1 conversion.
	mov	_ADC0CN1,#0x80
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:6: ADC0CF0 = 0b_11111_0_00; // SYSCLK/32
	mov	_ADC0CF0,#0xF8
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:7: ADC0CF1 = 0b_0_0_011110; // Same as default for now
	mov	_ADC0CF1,#0x1E
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:8: ADC0CN0 = 0b_0_0_0_0_0_00_0; // Same as default for now
	mov	_ADC0CN0,#0x00
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:9: ADC0CF2 = 0b_0_01_11111 ; // GND pin, Vref=VDD
	mov	_ADC0CF2,#0x3F
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:10: ADC0CN2 = 0b_0_000_0000;  // Same as default for now. ADC0 conversion initiated on write of 1 to ADBUSY.
	mov	_ADC0CN2,#0x00
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:11: ADEN=1; // Enable ADC
	setb	_ADEN
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer3us'
;------------------------------------------------------------
;us                        Allocated to registers r2 
;i                         Allocated to registers r3 
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:15: void Timer3us(unsigned char us)
;	-----------------------------------------
;	 function Timer3us
;	-----------------------------------------
_Timer3us:
	mov	r2,dpl
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:20: CKCON0|=0b_0100_0000;
	orl	_CKCON0,#0x40
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:22: TMR3RL = (-(SYSCLK)/1000000L); // Set Timer3 to overflow in 1us.
	mov	_TMR3RL,#0xB8
	mov	(_TMR3RL >> 8),#0xFF
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:23: TMR3 = TMR3RL;                 // Initialize Timer3 for first overflow
	mov	_TMR3,_TMR3RL
	mov	(_TMR3 >> 8),(_TMR3RL >> 8)
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:25: TMR3CN0 = 0x04;                 // Sart Timer3 and clear overflow flag
	mov	_TMR3CN0,#0x04
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:26: for (i = 0; i < us; i++)       // Count <us> overflows
	mov	r3,#0x00
L003004?:
	clr	c
	mov	a,r3
	subb	a,r2
	jnc	L003007?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:28: while (!(TMR3CN0 & 0x80));  // Wait for overflow
L003001?:
	mov	a,_TMR3CN0
	jnb	acc.7,L003001?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:29: TMR3CN0 &= ~(0x80);         // Clear overflow indicator
	anl	_TMR3CN0,#0x7F
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:26: for (i = 0; i < us; i++)       // Count <us> overflows
	inc	r3
	sjmp	L003004?
L003007?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:31: TMR3CN0 = 0 ;                   // Stop Timer3 and clear overflow flag
	mov	_TMR3CN0,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'waitms'
;------------------------------------------------------------
;ms                        Allocated to registers r2 r3 
;j                         Allocated to registers r4 r5 
;k                         Allocated to registers r6 
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:34: void waitms (unsigned int ms)
;	-----------------------------------------
;	 function waitms
;	-----------------------------------------
_waitms:
	mov	r2,dpl
	mov	r3,dph
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:38: for(j=0; j<ms; j++)
	mov	r4,#0x00
	mov	r5,#0x00
L004005?:
	clr	c
	mov	a,r4
	subb	a,r2
	mov	a,r5
	subb	a,r3
	jnc	L004009?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:39: for (k=0; k<4; k++) Timer3us(250);
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
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:38: for(j=0; j<ms; j++)
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
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:44: void InitPinADC (unsigned char portno, unsigned char pinno)
;	-----------------------------------------
;	 function InitPinADC
;	-----------------------------------------
_InitPinADC:
	mov	r2,dpl
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:48: mask=1<<pinno;
	mov	b,_InitPinADC_PARM_2
	inc	b
	mov	a,#0x01
	sjmp	L005013?
L005011?:
	add	a,acc
L005013?:
	djnz	b,L005011?
	mov	r3,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:50: SFRPAGE = 0x20;
	mov	_SFRPAGE,#0x20
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:51: switch (portno)
	cjne	r2,#0x00,L005014?
	sjmp	L005001?
L005014?:
	cjne	r2,#0x01,L005015?
	sjmp	L005002?
L005015?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:53: case 0:
	cjne	r2,#0x02,L005005?
	sjmp	L005003?
L005001?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:54: P0MDIN &= (~mask); // Set pin as analog input
	mov	a,r3
	cpl	a
	mov	r2,a
	anl	_P0MDIN,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:55: P0SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P0SKIP,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:56: break;
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:57: case 1:
	sjmp	L005005?
L005002?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:58: P1MDIN &= (~mask); // Set pin as analog input
	mov	a,r3
	cpl	a
	mov	r2,a
	anl	_P1MDIN,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:59: P1SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P1SKIP,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:60: break;
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:61: case 2:
	sjmp	L005005?
L005003?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:62: P2MDIN &= (~mask); // Set pin as analog input
	mov	a,r3
	cpl	a
	mov	r2,a
	anl	_P2MDIN,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:63: P2SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P2SKIP,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:67: }
L005005?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:68: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'UART1_RI'
;------------------------------------------------------------
;UART1_char2               Allocated to registers r2 
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:71: void UART1_RI(void) using 3
;	-----------------------------------------
;	 function UART1_RI
;	-----------------------------------------
_UART1_RI:
	using	3
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:74: P3_1 = !P3_1;
	cpl	_P3_1
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:75: SFRPAGE = 0x20;
	mov	_SFRPAGE,#0x20
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:79: RI1 = 0;
	clr	_RI1
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:80: SCON1&=0b_0011_1111;    // Clear Overrun and HW Parity error flags
	anl	_SCON1,#0x3F
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:81: UART1_char2 = SBUF1;
	mov	a,_SBUF1
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:92: UART1_char2 = SBUF1;
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:93: if(UART1_char2 % 2 == 0)    //Byte 0
	mov	a,_SBUF1
	mov	r2,a
	jb	acc.0,L006002?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:95: no_signal_0 = 0;     //clear no signal counter
	mov	dptr,#_no_signal_0
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:96: UART1_char2 >>= 1;
	mov	a,r2
	clr	c
	rrc	a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:99: boost = UART1_char2 % 2;
	mov	r2,a
	rrc	a
	mov	_boost,c
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:100: UART1_char2 >>= 1;
	mov	a,r2
	clr	c
	rrc	a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:101: autocar = UART1_char2 % 2;
	mov	r2,a
	rrc	a
	mov	_autocar,c
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:102: UART1_char2 >>= 1;
	mov	a,r2
	clr	c
	rrc	a
	mov	r2,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:105: y_absolute = UART1_char2 % 8;
	mov	a,#0x07
	anl	a,r2
	mov	r3,a
	mov	dptr,#_y_absolute
	movx	@dptr,a
	inc	dptr
	clr	a
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:106: UART1_char2 >>= 3;
	mov	a,r2
	swap	a
	rl	a
	anl	a,#0x1f
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:107: y_dir = UART1_char2 % 2;
	mov	r2,a
	rrc	a
	mov	_y_dir,c
	sjmp	L006003?
L006002?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:109: no_signal_1 = 0;    //clear no signal counter
	mov	dptr,#_no_signal_1
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:110: UART1_char2 >>= 1;
	mov	a,r2
	clr	c
	rrc	a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:113: close = UART1_char2 % 2;
	mov	r2,a
	rrc	a
	mov	_close,c
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:114: UART1_char2 >>= 1;
	mov	a,r2
	clr	c
	rrc	a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:115: open = UART1_char2 % 2;
	mov	r2,a
	rrc	a
	mov	_open,c
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:116: UART1_char2 >>= 1;
	mov	a,r2
	clr	c
	rrc	a
	mov	r2,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:119: x_absolute = UART1_char2 % 8;
	mov	a,#0x07
	anl	a,r2
	mov	r3,a
	mov	dptr,#_x_absolute
	movx	@dptr,a
	inc	dptr
	clr	a
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:120: UART1_char2 >>= 3;
	mov	a,r2
	swap	a
	rl	a
	anl	a,#0x1f
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:121: x_dir = UART1_char2 % 2;
	mov	r2,a
	rrc	a
	mov	_x_dir,c
L006003?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:125: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:126: return;
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ADC_at_Pin'
;------------------------------------------------------------
;pin                       Allocated to registers 
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:129: unsigned int ADC_at_Pin(unsigned char pin)
;	-----------------------------------------
;	 function ADC_at_Pin
;	-----------------------------------------
_ADC_at_Pin:
	using	0
	mov	_ADC0MX,dpl
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:132: ADBUSY=1;       // Dummy conversion first to select new pin
	setb	_ADBUSY
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:133: while (ADBUSY); // Wait for dummy conversion to finish
L007001?:
	jb	_ADBUSY,L007001?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:134: ADBUSY = 1;     // Convert voltage at the pin
	setb	_ADBUSY
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:135: while (ADBUSY); // Wait for conversion to complete
L007004?:
	jb	_ADBUSY,L007004?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:136: return (ADC0);
	mov	dpl,_ADC0
	mov	dph,(_ADC0 >> 8)
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Volts_at_Pin'
;------------------------------------------------------------
;pin                       Allocated to registers r2 
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:139: float Volts_at_Pin(unsigned char pin)
;	-----------------------------------------
;	 function Volts_at_Pin
;	-----------------------------------------
_Volts_at_Pin:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:141: return ((ADC_at_Pin(pin)*VDD)/0b_0011_1111_1111_1111);
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
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:144: void mot_dir(int ML, int MR)
;	-----------------------------------------
;	 function mot_dir
;	-----------------------------------------
_mot_dir:
	mov	r2,dpl
	mov	r3,dph
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:146: ML_dir = ML;
	mov	a,r2
	orl	a,r3
	add	a,#0xff
	mov	_ML_dir,c
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:147: MR_dir = MR;
	mov	a,_mot_dir_PARM_2
	orl	a,(_mot_dir_PARM_2 + 1)
	add	a,#0xff
	mov	_MR_dir,c
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'stop'
;------------------------------------------------------------
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:150: void stop(void){
;	-----------------------------------------
;	 function stop
;	-----------------------------------------
_stop:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:151: pwmL=0;
	mov	dptr,#_pwmL
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:152: pwmR=0;	
	mov	dptr,#_pwmR
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:153: waitms(100);
	mov	dptr,#0x0064
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'spin_left'
;------------------------------------------------------------
;offset                    Allocated to registers r2 r3 
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:156: void spin_left(int offset)
;	-----------------------------------------
;	 function spin_left
;	-----------------------------------------
_spin_left:
	mov	r2,dpl
	mov	r3,dph
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:158: mot_dir(1,0);
	clr	a
	mov	_mot_dir_PARM_2,a
	mov	(_mot_dir_PARM_2 + 1),a
	mov	dptr,#0x0001
	push	ar2
	push	ar3
	lcall	_mot_dir
	pop	ar3
	pop	ar2
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:159: pwmR = BOOSTPWM+offset;
	mov	dptr,#_pwmR
	mov	a,#0x28
	add	a,r2
	movx	@dptr,a
	clr	a
	addc	a,r3
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:160: pwmL = BASEPWM+offset;
	mov	dptr,#_pwmL
	mov	a,#0x19
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
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:164: void spin_right(int offset)
;	-----------------------------------------
;	 function spin_right
;	-----------------------------------------
_spin_right:
	mov	r2,dpl
	mov	r3,dph
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:166: mot_dir(0,1);
	mov	_mot_dir_PARM_2,#0x01
	clr	a
	mov	(_mot_dir_PARM_2 + 1),a
	mov	dptr,#0x0000
	push	ar2
	push	ar3
	lcall	_mot_dir
	pop	ar3
	pop	ar2
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:167: pwmL = BOOSTPWM+offset;
	mov	dptr,#_pwmL
	mov	a,#0x28
	add	a,r2
	movx	@dptr,a
	clr	a
	addc	a,r3
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:168: pwmR = BASEPWM+offset;	
	mov	dptr,#_pwmR
	mov	a,#0x19
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
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:171: void debug( void )
;	-----------------------------------------
;	 function debug
;	-----------------------------------------
_debug:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:174: stop();
	lcall	_stop
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:175: while(1);
L013002?:
	sjmp	L013002?
;------------------------------------------------------------
;Allocation info for local variables in function 'claw_control'
;------------------------------------------------------------
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:179: void claw_control(void)
;	-----------------------------------------
;	 function claw_control
;	-----------------------------------------
_claw_control:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:181: if (pwm_count >= 22) {
	mov	dptr,#_pwm_count
	movx	a,@dptr
	mov	r2,a
	cjne	r2,#0x16,L014007?
L014007?:
	jc	L014002?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:182: CLAW_L = 0;
	clr	_P1_7
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:183: CLAW_R = 0;
	clr	_P2_0
	ret
L014002?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:185: CLAW_L = (pwm_count < claw_pos) ? 1 : 0;
	mov	dptr,#_pwm_count
	movx	a,@dptr
	mov	r2,a
	mov	dptr,#_claw_pos
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	mov	r5,#0x00
	clr	c
	mov	a,r2
	subb	a,r3
	mov	a,r5
	subb	a,r4
	mov	_P1_7,c
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:186: CLAW_R = (pwm_count < 27 - claw_pos) ? 1 : 0;
	mov	dptr,#_claw_pos
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	mov	a,#0x1B
	clr	c
	subb	a,r2
	mov	r2,a
	clr	a
	subb	a,r3
	mov	r3,a
	mov	dptr,#_pwm_count
	movx	a,@dptr
	mov	r4,a
	mov	r5,#0x00
	clr	c
	mov	a,r4
	subb	a,r2
	mov	a,r5
	subb	a,r3
	mov	_P2_0,c
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'sonar_op'
;------------------------------------------------------------
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:191: void sonar_op(void)
;	-----------------------------------------
;	 function sonar_op
;	-----------------------------------------
_sonar_op:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:194: Trig = pwm_count >= 50?0:1;
	mov	dptr,#_pwm_count
	movx	a,@dptr
	mov	r2,a
	cjne	r2,#0x32,L015014?
L015014?:
	mov	_P1_0,c
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:197: if (!sonar_state) {
	jb	_sonar_state,L015007?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:198: if (P0_7) {
	jnb	_P0_7,L015009?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:199: sonar_state = 1;
	setb	_sonar_state
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:200: sonar_count = 0;
	mov	dptr,#_sonar_count
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
	ret
L015007?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:202: } else if (P0_7) {
	jnb	_P0_7,L015004?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:203: sonar_count++;
	mov	dptr,#_sonar_count
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
	inc	dptr
	movx	a,@dptr
	addc	a,#0x00
	movx	@dptr,a
	ret
L015004?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:206: sonar_count_2 = sonar_count;
	mov	dptr,#_sonar_count
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	mov	dptr,#_sonar_count_2
	mov	a,r2
	movx	@dptr,a
	inc	dptr
	mov	a,r3
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:208: sonar_state = 0;
	clr	_sonar_state
L015009?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer2_ISR'
;------------------------------------------------------------
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:212: void Timer2_ISR (void) interrupt 5 using 2
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
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:214: TF2H = 0; // Clear Timer2 interrupt flag
	clr	_TF2H
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:216: pwm_count++;
	mov	dptr,#_pwm_count
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:217: if (pwm_count >= 100) {
	mov	dptr,#_pwm_count
	movx	a,@dptr
	mov	r2,a
	cjne	r2,#0x64,L016020?
L016020?:
	jc	L016004?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:218: pwm_count=0;
	mov	dptr,#_pwm_count
	clr	a
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:219: counter_above_100 = !counter_above_100;
	cpl	_counter_above_100
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:220: timer_count++;
	mov	dptr,#_timer_count
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
	inc	dptr
	movx	a,@dptr
	addc	a,#0x00
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:221: if (timer_count >= 50) {        //every 0.5 seconds enter
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
	jc	L016004?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:222: timer_count =  0;
	mov	dptr,#_timer_count
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:223: dir_flag = 0;
	clr	_dir_flag
L016004?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:228: if (!ML_dir) {
	jb	_ML_dir,L016006?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:229: OUTLF = 0;
	clr	_P2_1
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:230: OUTLB =pwm_count>=pwmL?0:1;
	mov	dptr,#_pwm_count
	movx	a,@dptr
	mov	r2,a
	mov	dptr,#_pwmL
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	mov	r5,#0x00
	clr	c
	mov	a,r2
	subb	a,r3
	mov	a,r5
	subb	a,r4
	mov	_P2_2,c
	sjmp	L016007?
L016006?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:232: OUTLB = 0;
	clr	_P2_2
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:233: OUTLF =pwm_count>=pwmL?0:1;
	mov	dptr,#_pwm_count
	movx	a,@dptr
	mov	r2,a
	mov	dptr,#_pwmL
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	mov	r5,#0x00
	clr	c
	mov	a,r2
	subb	a,r3
	mov	a,r5
	subb	a,r4
	mov	_P2_1,c
L016007?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:236: if (MR_dir) {
	jnb	_MR_dir,L016009?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:237: OUTRF = 0;
	clr	_P2_3
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:238: OUTRB =pwm_count>=pwmR?0:1;
	mov	dptr,#_pwm_count
	movx	a,@dptr
	mov	r2,a
	mov	dptr,#_pwmR
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	mov	r5,#0x00
	clr	c
	mov	a,r2
	subb	a,r3
	mov	a,r5
	subb	a,r4
	mov	_P2_4,c
	sjmp	L016010?
L016009?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:240: OUTRB = 0;
	clr	_P2_4
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:241: OUTRF =pwm_count>=pwmR?0:1;
	mov	dptr,#_pwm_count
	movx	a,@dptr
	mov	r2,a
	mov	dptr,#_pwmR
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	mov	r5,#0x00
	clr	c
	mov	a,r2
	subb	a,r3
	mov	a,r5
	subb	a,r4
	mov	_P2_3,c
L016010?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:244: sonar_op();
	mov	psw,#0x00
	lcall	_sonar_op
	mov	psw,#0x10
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:245: if (!counter_above_100) claw_control();
	jb	_counter_above_100,L016013?
	mov	psw,#0x00
	lcall	_claw_control
	mov	psw,#0x10
L016013?:
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
;Allocation info for local variables in function 'Calibrate_LSensors'
;------------------------------------------------------------
;VM                        Allocated with name '_Calibrate_LSensors_PARM_2'
;VR                        Allocated with name '_Calibrate_LSensors_PARM_3'
;VL                        Allocated with name '_Calibrate_LSensors_VL_1_93'
;countL                    Allocated with name '_Calibrate_LSensors_countL_1_94'
;countM                    Allocated with name '_Calibrate_LSensors_countM_1_94'
;countR                    Allocated with name '_Calibrate_LSensors_countR_1_94'
;flags                     Allocated with name '_Calibrate_LSensors_flags_1_94'
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:250: void Calibrate_LSensors(int *VL, int *VM, int *VR)
;	-----------------------------------------
;	 function Calibrate_LSensors
;	-----------------------------------------
_Calibrate_LSensors:
	using	0
	mov	_Calibrate_LSensors_VL_1_93,dpl
	mov	(_Calibrate_LSensors_VL_1_93 + 1),dph
	mov	(_Calibrate_LSensors_VL_1_93 + 2),b
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:252: xdata short countL=0;
	mov	dptr,#_Calibrate_LSensors_countL_1_94
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:253: xdata short countM=0;
	mov	dptr,#_Calibrate_LSensors_countM_1_94
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:254: xdata short countR=0;
	mov	dptr,#_Calibrate_LSensors_countR_1_94
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:255: xdata short flags =0;
	mov	dptr,#_Calibrate_LSensors_flags_1_94
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:257: main_int1 = 0;
	mov	dptr,#_main_int1
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:259: while (flags != 7) {
L017022?:
	mov	dptr,#_Calibrate_LSensors_flags_1_94
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	cjne	r5,#0x07,L017038?
	cjne	r6,#0x00,L017038?
	ljmp	L017024?
L017038?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:261: if ((flags & 2) != 2) {
	anl	ar5,#0x02
	mov	r6,#0x00
	cjne	r5,#0x02,L017039?
	cjne	r6,#0x00,L017039?
	ljmp	L017007?
L017039?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:262: main_int1 = Volts_at_Pin(QFP32_MUX_P1_6)*1000;
	mov	dpl,#0x0C
	lcall	_Volts_at_Pin
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	mov	r0,a
	push	ar5
	push	ar6
	push	ar7
	push	ar0
	mov	dptr,#0x0000
	mov	b,#0x7A
	mov	a,#0x44
	lcall	___fsmul
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	mov	r0,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,r0
	lcall	___fs2uint
	mov	a,dpl
	mov	b,dph
	mov	dptr,#_main_int1
	movx	@dptr,a
	inc	dptr
	mov	a,b
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:264: if (abs(*VL - main_int1) <= 50) {
	mov	dpl,_Calibrate_LSensors_VL_1_93
	mov	dph,(_Calibrate_LSensors_VL_1_93 + 1)
	mov	b,(_Calibrate_LSensors_VL_1_93 + 2)
	lcall	__gptrget
	mov	r5,a
	inc	dptr
	lcall	__gptrget
	mov	r6,a
	mov	dptr,#_main_int1
	movx	a,@dptr
	mov	r7,a
	inc	dptr
	movx	a,@dptr
	mov	r0,a
	mov	a,r5
	clr	c
	subb	a,r7
	mov	dpl,a
	mov	a,r6
	subb	a,r0
	mov	dph,a
	lcall	_abs
	mov	r5,dpl
	mov	r6,dph
	clr	c
	mov	a,#0x32
	subb	a,r5
	clr	a
	xrl	a,#0x80
	mov	b,r6
	xrl	b,#0x80
	subb	a,b
	jc	L017002?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:265: countL++;
	mov	dptr,#_Calibrate_LSensors_countL_1_94
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
	inc	dptr
	movx	a,@dptr
	addc	a,#0x00
	movx	@dptr,a
	sjmp	L017003?
L017002?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:267: countL = 0;
	mov	dptr,#_Calibrate_LSensors_countL_1_94
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:268: *VL = main_int1;
	mov	dptr,#_main_int1
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	mov	dpl,_Calibrate_LSensors_VL_1_93
	mov	dph,(_Calibrate_LSensors_VL_1_93 + 1)
	mov	b,(_Calibrate_LSensors_VL_1_93 + 2)
	mov	a,r5
	lcall	__gptrput
	inc	dptr
	mov	a,r6
	lcall	__gptrput
L017003?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:271: if (countL == 10)
	mov	dptr,#_Calibrate_LSensors_countL_1_94
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	cjne	r5,#0x0A,L017007?
	cjne	r6,#0x00,L017007?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:272: flags |= 2;
	mov	dptr,#_Calibrate_LSensors_flags_1_94
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	mov	dptr,#_Calibrate_LSensors_flags_1_94
	mov	a,#0x02
	orl	a,r5
	movx	@dptr,a
	inc	dptr
	mov	a,r6
	movx	@dptr,a
L017007?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:275: if ((flags & 1) != 1) {
	mov	dptr,#_Calibrate_LSensors_flags_1_94
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	anl	ar5,#0x01
	mov	r6,#0x00
	cjne	r5,#0x01,L017043?
	cjne	r6,#0x00,L017043?
	ljmp	L017014?
L017043?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:276: main_int1 = Volts_at_Pin(QFP32_MUX_P1_4)*1000;
	mov	dpl,#0x0A
	lcall	_Volts_at_Pin
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	mov	r0,a
	push	ar5
	push	ar6
	push	ar7
	push	ar0
	mov	dptr,#0x0000
	mov	b,#0x7A
	mov	a,#0x44
	lcall	___fsmul
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	mov	r0,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,r0
	lcall	___fs2uint
	mov	a,dpl
	mov	b,dph
	mov	dptr,#_main_int1
	movx	@dptr,a
	inc	dptr
	mov	a,b
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:278: if (abs(*VR-main_int1) <= 50) {
	mov	r5,_Calibrate_LSensors_PARM_3
	mov	r6,(_Calibrate_LSensors_PARM_3 + 1)
	mov	r7,(_Calibrate_LSensors_PARM_3 + 2)
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r0,a
	inc	dptr
	lcall	__gptrget
	mov	r1,a
	mov	dptr,#_main_int1
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	mov	a,r0
	clr	c
	subb	a,r2
	mov	dpl,a
	mov	a,r1
	subb	a,r3
	mov	dph,a
	push	ar5
	push	ar6
	push	ar7
	lcall	_abs
	mov	r2,dpl
	mov	r3,dph
	pop	ar7
	pop	ar6
	pop	ar5
	clr	c
	mov	a,#0x32
	subb	a,r2
	clr	a
	xrl	a,#0x80
	mov	b,r3
	xrl	b,#0x80
	subb	a,b
	jc	L017009?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:279: countR++;
	mov	dptr,#_Calibrate_LSensors_countR_1_94
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
	inc	dptr
	movx	a,@dptr
	addc	a,#0x00
	movx	@dptr,a
	sjmp	L017010?
L017009?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:281: countR =0;
	mov	dptr,#_Calibrate_LSensors_countR_1_94
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:282: *VR = main_int1;
	mov	dptr,#_main_int1
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,r2
	lcall	__gptrput
	inc	dptr
	mov	a,r3
	lcall	__gptrput
L017010?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:285: if (countR == 10)
	mov	dptr,#_Calibrate_LSensors_countR_1_94
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	cjne	r2,#0x0A,L017014?
	cjne	r3,#0x00,L017014?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:286: flags |= 1;
	mov	dptr,#_Calibrate_LSensors_flags_1_94
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	mov	dptr,#_Calibrate_LSensors_flags_1_94
	mov	a,#0x01
	orl	a,r2
	movx	@dptr,a
	inc	dptr
	mov	a,r3
	movx	@dptr,a
L017014?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:289: if ((flags & 4) != 4) {
	mov	dptr,#_Calibrate_LSensors_flags_1_94
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	anl	ar2,#0x04
	mov	r3,#0x00
	cjne	r2,#0x04,L017047?
	cjne	r3,#0x00,L017047?
	ljmp	L017022?
L017047?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:290: main_int1 = Volts_at_Pin(QFP32_MUX_P1_5)*1000;
	mov	dpl,#0x0B
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
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fs2uint
	mov	a,dpl
	mov	b,dph
	mov	dptr,#_main_int1
	movx	@dptr,a
	inc	dptr
	mov	a,b
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:292: if (abs(*VM-main_int1) <= 50){
	mov	r2,_Calibrate_LSensors_PARM_2
	mov	r3,(_Calibrate_LSensors_PARM_2 + 1)
	mov	r4,(_Calibrate_LSensors_PARM_2 + 2)
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	r5,a
	inc	dptr
	lcall	__gptrget
	mov	r6,a
	mov	dptr,#_main_int1
	movx	a,@dptr
	mov	r7,a
	inc	dptr
	movx	a,@dptr
	mov	r0,a
	mov	a,r5
	clr	c
	subb	a,r7
	mov	dpl,a
	mov	a,r6
	subb	a,r0
	mov	dph,a
	push	ar2
	push	ar3
	push	ar4
	lcall	_abs
	mov	r5,dpl
	mov	r6,dph
	pop	ar4
	pop	ar3
	pop	ar2
	clr	c
	mov	a,#0x32
	subb	a,r5
	clr	a
	xrl	a,#0x80
	mov	b,r6
	xrl	b,#0x80
	subb	a,b
	jc	L017016?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:293: countM++;
	mov	dptr,#_Calibrate_LSensors_countM_1_94
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
	inc	dptr
	movx	a,@dptr
	addc	a,#0x00
	movx	@dptr,a
	sjmp	L017017?
L017016?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:295: countM =0;
	mov	dptr,#_Calibrate_LSensors_countM_1_94
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:296: *VM = main_int1;
	mov	dptr,#_main_int1
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	__gptrput
	inc	dptr
	mov	a,r6
	lcall	__gptrput
L017017?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:299: if (countM == 10)
	mov	dptr,#_Calibrate_LSensors_countM_1_94
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	cjne	r2,#0x0A,L017049?
	cjne	r3,#0x00,L017049?
	sjmp	L017050?
L017049?:
	ljmp	L017022?
L017050?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:300: flags |= 4;
	mov	dptr,#_Calibrate_LSensors_flags_1_94
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	mov	dptr,#_Calibrate_LSensors_flags_1_94
	mov	a,#0x04
	orl	a,r2
	movx	@dptr,a
	inc	dptr
	mov	a,r3
	movx	@dptr,a
	ljmp	L017022?
L017024?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:303: return;	
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Claw_Pos'
;------------------------------------------------------------
;pos                       Allocated to registers r2 r3 
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:306: void Claw_Pos( int pos ) 
;	-----------------------------------------
;	 function Claw_Pos
;	-----------------------------------------
_Claw_Pos:
	mov	r2,dpl
	mov	r3,dph
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:308: claw_pos = pos + 5;
	mov	dptr,#_claw_pos
	mov	a,#0x05
	add	a,r2
	movx	@dptr,a
	clr	a
	addc	a,r3
	inc	dptr
	movx	@dptr,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'manual_mode'
;------------------------------------------------------------
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:311: void manual_mode(void)
;	-----------------------------------------
;	 function manual_mode
;	-----------------------------------------
_manual_mode:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:314: if(open) Claw_Pos(10);
	jnb	_open,L019002?
	mov	dptr,#0x000A
	lcall	_Claw_Pos
L019002?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:315: if(close) Claw_Pos(2);
	jnb	_close,L019004?
	mov	dptr,#0x0002
	lcall	_Claw_Pos
L019004?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:318: if(y_absolute == 0)     //turn in place
	mov	dptr,#_y_absolute
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	orl	a,r2
	jz	L019027?
	ljmp	L019015?
L019027?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:320: main_short1 = x_absolute;
	mov	dptr,#_x_absolute
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	mov	dptr,#_main_short1
	mov	a,r2
	movx	@dptr,a
	inc	dptr
	mov	a,r3
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:321: ML_dir = !x_dir;
	mov	c,_x_dir
	cpl	c
	mov	_ML_dir,c
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:322: MR_dir = x_dir;
	mov	c,_x_dir
	mov	_MR_dir,c
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:323: if(boost)
	jnb	_boost,L019006?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:325: pwmL = main_short1 * BOOST_TURN;  //boost turn speed
	mov	dptr,#_main_short1
	movx	a,@dptr
	mov	__mulint_PARM_2,a
	inc	dptr
	movx	a,@dptr
	mov	(__mulint_PARM_2 + 1),a
	mov	dptr,#0x0007
	lcall	__mulint
	mov	a,dpl
	mov	b,dph
	mov	dptr,#_pwmL
	movx	@dptr,a
	inc	dptr
	mov	a,b
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:326: pwmR = main_short1 * BOOST_TURN;
	mov	dptr,#_main_short1
	movx	a,@dptr
	mov	__mulint_PARM_2,a
	inc	dptr
	movx	a,@dptr
	mov	(__mulint_PARM_2 + 1),a
	mov	dptr,#0x0007
	lcall	__mulint
	mov	a,dpl
	mov	b,dph
	mov	dptr,#_pwmR
	movx	@dptr,a
	inc	dptr
	mov	a,b
	movx	@dptr,a
	ret
L019006?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:328: pwmL = main_short1 * DFT_TURN;    //default turn speed
	mov	dptr,#_main_short1
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	xch	a,r2
	add	a,acc
	xch	a,r2
	rlc	a
	xch	a,r2
	add	a,acc
	xch	a,r2
	rlc	a
	mov	r3,a
	mov	dptr,#_pwmL
	mov	a,r2
	movx	@dptr,a
	inc	dptr
	mov	a,r3
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:329: pwmR = main_short1 * DFT_TURN;
	mov	dptr,#_main_short1
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	xch	a,r2
	add	a,acc
	xch	a,r2
	rlc	a
	xch	a,r2
	add	a,acc
	xch	a,r2
	rlc	a
	mov	r3,a
	mov	dptr,#_pwmR
	mov	a,r2
	movx	@dptr,a
	inc	dptr
	mov	a,r3
	movx	@dptr,a
	ret
L019015?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:332: main_int1 = y_absolute * 100;
	mov	dptr,#_y_absolute
	movx	a,@dptr
	mov	__mulint_PARM_2,a
	inc	dptr
	movx	a,@dptr
	mov	(__mulint_PARM_2 + 1),a
	mov	dptr,#0x0064
	lcall	__mulint
	mov	a,dpl
	mov	b,dph
	mov	dptr,#_main_int1
	movx	@dptr,a
	inc	dptr
	mov	a,b
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:333: main_int2 = main_int1 * x_absolute / TURNING_RADIUS;
	mov	dptr,#_x_absolute
	movx	a,@dptr
	mov	__mulint_PARM_2,a
	inc	dptr
	movx	a,@dptr
	mov	(__mulint_PARM_2 + 1),a
	mov	dptr,#_main_int1
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	mov	dpl,r2
	mov	dph,r3
	lcall	__mulint
	mov	r2,dpl
	mov	r3,dph
	mov	__divuint_PARM_2,#0x0A
	clr	a
	mov	(__divuint_PARM_2 + 1),a
	mov	dpl,r2
	mov	dph,r3
	lcall	__divuint
	mov	a,dpl
	mov	b,dph
	mov	dptr,#_main_int2
	movx	@dptr,a
	inc	dptr
	mov	a,b
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:334: if (x_dir)
	jnb	_x_dir,L019009?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:336: main_int3 = main_int1 - main_int2;      //Left motor
	mov	dptr,#_main_int2
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	mov	dptr,#_main_int1
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	mov	dptr,#_main_int3
	mov	a,r4
	clr	c
	subb	a,r2
	movx	@dptr,a
	mov	a,r5
	subb	a,r3
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:337: main_int4 = main_int1 + main_int2;      //Right motor
	mov	dptr,#_main_int2
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	mov	dptr,#_main_int1
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	mov	dptr,#_main_int4
	mov	a,r2
	add	a,r4
	movx	@dptr,a
	mov	a,r3
	addc	a,r5
	inc	dptr
	movx	@dptr,a
	sjmp	L019010?
L019009?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:339: main_int3 = main_int1 + main_int2;      //Left motor
	mov	dptr,#_main_int2
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	mov	dptr,#_main_int1
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	mov	dptr,#_main_int3
	mov	a,r2
	add	a,r4
	movx	@dptr,a
	mov	a,r3
	addc	a,r5
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:340: main_int4 = main_int1 - main_int2;      //Right motor
	mov	dptr,#_main_int2
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	mov	dptr,#_main_int1
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	mov	dptr,#_main_int4
	mov	a,r4
	clr	c
	subb	a,r2
	movx	@dptr,a
	mov	a,r5
	subb	a,r3
	inc	dptr
	movx	@dptr,a
L019010?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:344: ML_dir = y_dir;
	mov	c,_y_dir
	mov	_ML_dir,c
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:345: MR_dir = y_dir;
	mov	c,_y_dir
	mov	_MR_dir,c
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:346: if(boost)
	jnb	_boost,L019012?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:348: pwmL = main_int3 / BOOST_SPEED;
	mov	dptr,#_main_int3
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	mov	__divuint_PARM_2,#0x07
	clr	a
	mov	(__divuint_PARM_2 + 1),a
	mov	dpl,r2
	mov	dph,r3
	lcall	__divuint
	mov	a,dpl
	mov	b,dph
	mov	dptr,#_pwmL
	movx	@dptr,a
	inc	dptr
	mov	a,b
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:349: pwmR = main_int4 / BOOST_SPEED;
	mov	dptr,#_main_int4
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	mov	__divuint_PARM_2,#0x07
	clr	a
	mov	(__divuint_PARM_2 + 1),a
	mov	dpl,r2
	mov	dph,r3
	lcall	__divuint
	mov	a,dpl
	mov	b,dph
	mov	dptr,#_pwmR
	movx	@dptr,a
	inc	dptr
	mov	a,b
	movx	@dptr,a
	ret
L019012?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:351: pwmL = main_int3 / DFT_SPEED;
	mov	dptr,#_main_int3
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	mov	__divuint_PARM_2,#0x0E
	clr	a
	mov	(__divuint_PARM_2 + 1),a
	mov	dpl,r2
	mov	dph,r3
	lcall	__divuint
	mov	a,dpl
	mov	b,dph
	mov	dptr,#_pwmL
	movx	@dptr,a
	inc	dptr
	mov	a,b
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:352: pwmR = main_int4 / DFT_SPEED;
	mov	dptr,#_main_int4
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	mov	__divuint_PARM_2,#0x0E
	clr	a
	mov	(__divuint_PARM_2 + 1),a
	mov	dpl,r2
	mov	dph,r3
	lcall	__divuint
	mov	a,dpl
	mov	b,dph
	mov	dptr,#_pwmR
	movx	@dptr,a
	inc	dptr
	mov	a,b
	movx	@dptr,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Follow_Tape'
;------------------------------------------------------------
;gnd_VM                    Allocated with name '_Follow_Tape_PARM_2'
;gnd_VR                    Allocated with name '_Follow_Tape_PARM_3'
;gnd_VL                    Allocated with name '_Follow_Tape_gnd_VL_1_117'
;sloc0                     Allocated with name '_Follow_Tape_sloc0_1_0'
;sloc1                     Allocated with name '_Follow_Tape_sloc1_1_0'
;sloc2                     Allocated with name '_Follow_Tape_sloc2_1_0'
;sloc3                     Allocated with name '_Follow_Tape_sloc3_1_0'
;sloc4                     Allocated with name '_Follow_Tape_sloc4_1_0'
;tp_VL                     Allocated with name '_Follow_Tape_tp_VL_1_118'
;tp_VR                     Allocated with name '_Follow_Tape_tp_VR_1_118'
;tp_VM                     Allocated with name '_Follow_Tape_tp_VM_1_118'
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:357: void Follow_Tape(unsigned int *gnd_VL, unsigned int *gnd_VM, unsigned int *gnd_VR)
;	-----------------------------------------
;	 function Follow_Tape
;	-----------------------------------------
_Follow_Tape:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:360: xdata unsigned int tp_VL = *gnd_VL-TAPEOFFSET;
	mov	_Follow_Tape_gnd_VL_1_117,dpl
	mov	(_Follow_Tape_gnd_VL_1_117 + 1),dph
	mov	(_Follow_Tape_gnd_VL_1_117 + 2),b
	lcall	__gptrget
	mov	r5,a
	inc	dptr
	lcall	__gptrget
	mov	r6,a
	mov	a,r5
	add	a,#0x70
	mov	r5,a
	mov	a,r6
	addc	a,#0xfe
	mov	r6,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:361: xdata unsigned int tp_VR = *gnd_VR-TAPEOFFSET;
	mov	_Follow_Tape_sloc1_1_0,_Follow_Tape_PARM_3
	mov	(_Follow_Tape_sloc1_1_0 + 1),(_Follow_Tape_PARM_3 + 1)
	mov	(_Follow_Tape_sloc1_1_0 + 2),(_Follow_Tape_PARM_3 + 2)
	mov	dpl,_Follow_Tape_sloc1_1_0
	mov	dph,(_Follow_Tape_sloc1_1_0 + 1)
	mov	b,(_Follow_Tape_sloc1_1_0 + 2)
	lcall	__gptrget
	mov	r2,a
	inc	dptr
	lcall	__gptrget
	mov	r3,a
	mov	a,r2
	add	a,#0x70
	mov	r2,a
	mov	a,r3
	addc	a,#0xfe
	mov	r3,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:362: xdata unsigned int tp_VM = *gnd_VM-TAPEOFFSET;
	mov	_Follow_Tape_sloc0_1_0,_Follow_Tape_PARM_2
	mov	(_Follow_Tape_sloc0_1_0 + 1),(_Follow_Tape_PARM_2 + 1)
	mov	(_Follow_Tape_sloc0_1_0 + 2),(_Follow_Tape_PARM_2 + 2)
	mov	dpl,_Follow_Tape_sloc0_1_0
	mov	dph,(_Follow_Tape_sloc0_1_0 + 1)
	mov	b,(_Follow_Tape_sloc0_1_0 + 2)
	lcall	__gptrget
	mov	r4,a
	inc	dptr
	lcall	__gptrget
	mov	r7,a
	mov	a,r4
	add	a,#0x70
	mov	r4,a
	mov	a,r7
	addc	a,#0xfe
	mov	r7,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:365: pwmL = BASEPWM;
	mov	dptr,#_pwmL
	mov	a,#0x19
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:366: pwmR = BASEPWM;
	mov	dptr,#_pwmR
	mov	a,#0x19
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:369: mot_dir(0,0);
	clr	a
	mov	_mot_dir_PARM_2,a
	mov	(_mot_dir_PARM_2 + 1),a
	mov	dpl,a
	mov	dph,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	lcall	_mot_dir
	pop	ar7
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:370: dir_flag = 1;
	setb	_dir_flag
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:371: dir_count = 0;
	mov	dptr,#_dir_count
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:373: while (1) {
L020058?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:374: if (Volts_at_Pin(QFP32_MUX_P1_5) * 1000 > tp_VM) {			//if M not on tape
	push	ar5
	push	ar6
	mov	dpl,#0x0B
	push	ar2
	push	ar3
	push	ar4
	push	ar7
	lcall	_Volts_at_Pin
	mov	r0,dpl
	mov	r1,dph
	mov	r5,b
	mov	r6,a
	push	ar0
	push	ar1
	push	ar5
	push	ar6
	mov	dptr,#0x0000
	mov	b,#0x7A
	mov	a,#0x44
	lcall	___fsmul
	mov	r5,dpl
	mov	r6,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar7
	pop	ar4
	mov	dpl,r4
	mov	dph,r7
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	lcall	___uint2fs
	mov	_Follow_Tape_sloc2_1_0,dpl
	mov	(_Follow_Tape_sloc2_1_0 + 1),dph
	mov	(_Follow_Tape_sloc2_1_0 + 2),b
	mov	(_Follow_Tape_sloc2_1_0 + 3),a
	pop	ar1
	pop	ar0
	pop	ar7
	pop	ar6
	pop	ar5
	push	ar6
	push	ar7
	push	_Follow_Tape_sloc2_1_0
	push	(_Follow_Tape_sloc2_1_0 + 1)
	push	(_Follow_Tape_sloc2_1_0 + 2)
	push	(_Follow_Tape_sloc2_1_0 + 3)
	mov	dpl,r5
	mov	dph,r6
	mov	b,r0
	mov	a,r1
	lcall	___fsgt
	mov	r5,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar7
	pop	ar6
	pop	ar4
	pop	ar3
	pop	ar2
	mov	a,r5
	pop	ar6
	pop	ar5
	jnz	L020091?
	ljmp	L020030?
L020091?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:376: if (Volts_at_Pin(QFP32_MUX_P1_6) * 1000 < tp_VL) {		//if L on tape
	push	ar4
	push	ar7
	mov	dpl,#0x0C
	push	ar2
	push	ar3
	push	ar5
	push	ar6
	lcall	_Volts_at_Pin
	mov	r0,dpl
	mov	r1,dph
	mov	r4,b
	mov	r7,a
	pop	ar6
	pop	ar5
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	push	ar4
	push	ar7
	mov	dptr,#0x0000
	mov	b,#0x7A
	mov	a,#0x44
	lcall	___fsmul
	mov	_Follow_Tape_sloc3_1_0,dpl
	mov	(_Follow_Tape_sloc3_1_0 + 1),dph
	mov	(_Follow_Tape_sloc3_1_0 + 2),b
	mov	(_Follow_Tape_sloc3_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar7
	pop	ar6
	pop	ar5
	pop	ar4
	mov	dpl,r5
	mov	dph,r6
	push	ar5
	push	ar6
	lcall	___uint2fs
	mov	r4,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	push	ar7
	push	ar4
	push	ar7
	push	ar0
	push	ar1
	mov	dpl,_Follow_Tape_sloc3_1_0
	mov	dph,(_Follow_Tape_sloc3_1_0 + 1)
	mov	b,(_Follow_Tape_sloc3_1_0 + 2)
	mov	a,(_Follow_Tape_sloc3_1_0 + 3)
	lcall	___fslt
	mov	r4,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar7
	pop	ar6
	pop	ar5
	pop	ar3
	pop	ar2
	mov	a,r4
	pop	ar7
	pop	ar4
	jz	L020015?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:377: mot_dir(1,0);
	clr	a
	mov	_mot_dir_PARM_2,a
	mov	(_mot_dir_PARM_2 + 1),a
	mov	dptr,#0x0001
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	lcall	_mot_dir
	pop	ar7
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:378: pwmR = BOOSTPWM; // this main way
	mov	dptr,#_pwmR
	mov	a,#0x28
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:379: pwmL = BOOSTPWM;
	mov	dptr,#_pwmL
	mov	a,#0x28
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:382: if (dir_flag == 0) {
	jnb	_dir_flag,L020093?
	ljmp	L020031?
L020093?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:383: if (dir_count < 0) dir_count = 1;
	mov	dptr,#_dir_count
	movx	a,@dptr
	mov	r0,a
	inc	dptr
	movx	a,@dptr
	mov	r1,a
	jnb	acc.7,L020002?
	mov	dptr,#_dir_count
	mov	a,#0x01
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	sjmp	L020003?
L020002?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:384: else dir_count++;
	mov	dptr,#_dir_count
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
	inc	dptr
	movx	a,@dptr
	addc	a,#0x00
	movx	@dptr,a
L020003?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:385: dir_flag = 1;
	setb	_dir_flag
	ljmp	L020031?
L020015?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:387: } else if (Volts_at_Pin(QFP32_MUX_P1_4) * 1000 < tp_VR) { //if R on tape
	push	ar4
	push	ar7
	mov	dpl,#0x0A
	push	ar2
	push	ar3
	push	ar5
	push	ar6
	lcall	_Volts_at_Pin
	mov	r0,dpl
	mov	r1,dph
	mov	r4,b
	mov	r7,a
	pop	ar6
	pop	ar5
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	push	ar4
	push	ar7
	mov	dptr,#0x0000
	mov	b,#0x7A
	mov	a,#0x44
	lcall	___fsmul
	mov	_Follow_Tape_sloc3_1_0,dpl
	mov	(_Follow_Tape_sloc3_1_0 + 1),dph
	mov	(_Follow_Tape_sloc3_1_0 + 2),b
	mov	(_Follow_Tape_sloc3_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar7
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	mov	dpl,r2
	mov	dph,r3
	push	ar2
	push	ar3
	push	ar5
	push	ar6
	lcall	___uint2fs
	mov	r4,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	push	ar7
	push	ar4
	push	ar7
	push	ar0
	push	ar1
	mov	dpl,_Follow_Tape_sloc3_1_0
	mov	dph,(_Follow_Tape_sloc3_1_0 + 1)
	mov	b,(_Follow_Tape_sloc3_1_0 + 2)
	mov	a,(_Follow_Tape_sloc3_1_0 + 3)
	lcall	___fslt
	mov	r4,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar7
	pop	ar6
	pop	ar5
	pop	ar3
	pop	ar2
	mov	a,r4
	pop	ar7
	pop	ar4
	jz	L020012?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:388: mot_dir(0,1);
	mov	_mot_dir_PARM_2,#0x01
	clr	a
	mov	(_mot_dir_PARM_2 + 1),a
	mov	dptr,#0x0000
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	lcall	_mot_dir
	pop	ar7
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:389: pwmL = BOOSTPWM; // this main way
	mov	dptr,#_pwmL
	mov	a,#0x28
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:390: pwmR = BOOSTPWM;	
	mov	dptr,#_pwmR
	mov	a,#0x28
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:393: if (dir_flag == 0) {
	jnb	_dir_flag,L020096?
	ljmp	L020031?
L020096?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:394: if (dir_count > 0) dir_count = -1;
	mov	dptr,#_dir_count
	movx	a,@dptr
	mov	r0,a
	inc	dptr
	movx	a,@dptr
	mov	r1,a
	clr	c
	clr	a
	subb	a,r0
	clr	a
	xrl	a,#0x80
	mov	b,r1
	xrl	b,#0x80
	subb	a,b
	jnc	L020007?
	mov	dptr,#_dir_count
	mov	a,#0xFF
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
	sjmp	L020008?
L020007?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:395: else dir_count--;
	mov	dptr,#_dir_count
	movx	a,@dptr
	add	a,#0xff
	mov	r0,a
	inc	dptr
	movx	a,@dptr
	addc	a,#0xff
	mov	r1,a
	mov	dptr,#_dir_count
	mov	a,r0
	movx	@dptr,a
	inc	dptr
	mov	a,r1
	movx	@dptr,a
L020008?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:396: dir_flag = 1;
	setb	_dir_flag
	ljmp	L020031?
L020012?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:399: mot_dir(0,0);
	clr	a
	mov	_mot_dir_PARM_2,a
	mov	(_mot_dir_PARM_2 + 1),a
	mov	dpl,a
	mov	dph,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	lcall	_mot_dir
	pop	ar7
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:400: pwmL = BASEPWM;
	mov	dptr,#_pwmL
	mov	a,#0x19
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:401: pwmR = BASEPWM;	
	mov	dptr,#_pwmR
	mov	a,#0x19
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	ljmp	L020031?
L020030?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:405: } else if ((Volts_at_Pin(QFP32_MUX_P1_6) * 1000 < tp_VL) && (Volts_at_Pin(QFP32_MUX_P1_4) * 1000 < tp_VR) && (Volts_at_Pin(QFP32_MUX_P1_5) * 1000 < tp_VM) && find_circle2_flag) {
	push	ar4
	push	ar7
	mov	dpl,#0x0C
	push	ar2
	push	ar3
	push	ar5
	push	ar6
	lcall	_Volts_at_Pin
	mov	r0,dpl
	mov	r1,dph
	mov	r4,b
	mov	r7,a
	push	ar0
	push	ar1
	push	ar4
	push	ar7
	mov	dptr,#0x0000
	mov	b,#0x7A
	mov	a,#0x44
	lcall	___fsmul
	mov	r4,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar6
	pop	ar5
	mov	dpl,r5
	mov	dph,r6
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	lcall	___uint2fs
	mov	_Follow_Tape_sloc3_1_0,dpl
	mov	(_Follow_Tape_sloc3_1_0 + 1),dph
	mov	(_Follow_Tape_sloc3_1_0 + 2),b
	mov	(_Follow_Tape_sloc3_1_0 + 3),a
	pop	ar1
	pop	ar0
	pop	ar7
	pop	ar6
	pop	ar5
	pop	ar4
	push	ar5
	push	ar6
	push	ar7
	push	_Follow_Tape_sloc3_1_0
	push	(_Follow_Tape_sloc3_1_0 + 1)
	push	(_Follow_Tape_sloc3_1_0 + 2)
	push	(_Follow_Tape_sloc3_1_0 + 3)
	mov	dpl,r4
	mov	dph,r7
	mov	b,r0
	mov	a,r1
	lcall	___fslt
	mov	r4,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar7
	pop	ar6
	pop	ar5
	pop	ar3
	pop	ar2
	mov	a,r4
	pop	ar7
	pop	ar4
	jnz	L020098?
	ljmp	L020024?
L020098?:
	push	ar4
	push	ar7
	mov	dpl,#0x0A
	push	ar2
	push	ar3
	push	ar5
	push	ar6
	lcall	_Volts_at_Pin
	mov	r0,dpl
	mov	r1,dph
	mov	r4,b
	mov	r7,a
	pop	ar6
	pop	ar5
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	push	ar4
	push	ar7
	mov	dptr,#0x0000
	mov	b,#0x7A
	mov	a,#0x44
	lcall	___fsmul
	mov	_Follow_Tape_sloc4_1_0,dpl
	mov	(_Follow_Tape_sloc4_1_0 + 1),dph
	mov	(_Follow_Tape_sloc4_1_0 + 2),b
	mov	(_Follow_Tape_sloc4_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar7
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	mov	dpl,r2
	mov	dph,r3
	push	ar2
	push	ar3
	push	ar5
	push	ar6
	lcall	___uint2fs
	mov	r4,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	push	ar7
	push	ar4
	push	ar7
	push	ar0
	push	ar1
	mov	dpl,_Follow_Tape_sloc4_1_0
	mov	dph,(_Follow_Tape_sloc4_1_0 + 1)
	mov	b,(_Follow_Tape_sloc4_1_0 + 2)
	mov	a,(_Follow_Tape_sloc4_1_0 + 3)
	lcall	___fslt
	mov	r4,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar7
	pop	ar6
	pop	ar5
	pop	ar3
	pop	ar2
	mov	a,r4
	pop	ar7
	pop	ar4
	jnz	L020099?
	ljmp	L020024?
L020099?:
	push	ar4
	push	ar7
	mov	dpl,#0x0B
	push	ar2
	push	ar3
	push	ar5
	push	ar6
	lcall	_Volts_at_Pin
	mov	r0,dpl
	mov	r1,dph
	mov	r4,b
	mov	r7,a
	push	ar0
	push	ar1
	push	ar4
	push	ar7
	mov	dptr,#0x0000
	mov	b,#0x7A
	mov	a,#0x44
	lcall	___fsmul
	mov	r4,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar7
	push	_Follow_Tape_sloc2_1_0
	push	(_Follow_Tape_sloc2_1_0 + 1)
	push	(_Follow_Tape_sloc2_1_0 + 2)
	push	(_Follow_Tape_sloc2_1_0 + 3)
	mov	dpl,r4
	mov	dph,r7
	mov	b,r0
	mov	a,r1
	lcall	___fslt
	mov	r4,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar7
	pop	ar6
	pop	ar5
	pop	ar3
	pop	ar2
	mov	a,r4
	pop	ar7
	pop	ar4
	jz	L020024?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:406: find_circle2_flag = 0;
	jbc	_find_circle2_flag,L020101?
	sjmp	L020024?
L020101?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:407: find_circle1_flag = 0;
	clr	_find_circle1_flag
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:408: waitms(2000);		//move towards the middle of the circle
	mov	dptr,#0x07D0
	lcall	_waitms
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:409: stop();
	lcall	_stop
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:410: Claw_Pos(10);
	mov	dptr,#0x000A
	lcall	_Claw_Pos
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:411: waitms(500);
	mov	dptr,#0x01F4
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:412: break;				//we break so that the program can find the tape again (travel back to the main circle)
	ljmp	_waitms
L020024?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:414: } else if ((Volts_at_Pin(QFP32_MUX_P1_6) * 1000 < tp_VL) && (Volts_at_Pin(QFP32_MUX_P1_4) * 1000 < tp_VR) && (Volts_at_Pin(QFP32_MUX_P1_5) * 1000 < tp_VM) && find_circle1_flag) {
	push	ar4
	push	ar7
	mov	dpl,#0x0C
	push	ar2
	push	ar3
	push	ar5
	push	ar6
	lcall	_Volts_at_Pin
	mov	r0,dpl
	mov	r1,dph
	mov	r4,b
	mov	r7,a
	push	ar0
	push	ar1
	push	ar4
	push	ar7
	mov	dptr,#0x0000
	mov	b,#0x7A
	mov	a,#0x44
	lcall	___fsmul
	mov	r4,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar7
	push	_Follow_Tape_sloc3_1_0
	push	(_Follow_Tape_sloc3_1_0 + 1)
	push	(_Follow_Tape_sloc3_1_0 + 2)
	push	(_Follow_Tape_sloc3_1_0 + 3)
	mov	dpl,r4
	mov	dph,r7
	mov	b,r0
	mov	a,r1
	lcall	___fslt
	mov	r4,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar7
	pop	ar6
	pop	ar5
	pop	ar3
	pop	ar2
	mov	a,r4
	pop	ar7
	pop	ar4
	jnz	L020102?
	ljmp	L020018?
L020102?:
	push	ar4
	push	ar7
	mov	dpl,#0x0A
	push	ar2
	push	ar3
	push	ar5
	push	ar6
	lcall	_Volts_at_Pin
	mov	r0,dpl
	mov	r1,dph
	mov	r4,b
	mov	r7,a
	pop	ar6
	pop	ar5
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	push	ar4
	push	ar7
	mov	dptr,#0x0000
	mov	b,#0x7A
	mov	a,#0x44
	lcall	___fsmul
	mov	_Follow_Tape_sloc4_1_0,dpl
	mov	(_Follow_Tape_sloc4_1_0 + 1),dph
	mov	(_Follow_Tape_sloc4_1_0 + 2),b
	mov	(_Follow_Tape_sloc4_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar7
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	mov	dpl,r2
	mov	dph,r3
	push	ar2
	push	ar3
	push	ar5
	push	ar6
	lcall	___uint2fs
	mov	r4,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	push	ar7
	push	ar4
	push	ar7
	push	ar0
	push	ar1
	mov	dpl,_Follow_Tape_sloc4_1_0
	mov	dph,(_Follow_Tape_sloc4_1_0 + 1)
	mov	b,(_Follow_Tape_sloc4_1_0 + 2)
	mov	a,(_Follow_Tape_sloc4_1_0 + 3)
	lcall	___fslt
	mov	r4,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar7
	pop	ar6
	pop	ar5
	pop	ar3
	pop	ar2
	mov	a,r4
	pop	ar7
	pop	ar4
	jz	L020018?
	push	ar4
	push	ar7
	mov	dpl,#0x0B
	push	ar2
	push	ar3
	push	ar5
	push	ar6
	lcall	_Volts_at_Pin
	mov	r0,dpl
	mov	r1,dph
	mov	r4,b
	mov	r7,a
	push	ar0
	push	ar1
	push	ar4
	push	ar7
	mov	dptr,#0x0000
	mov	b,#0x7A
	mov	a,#0x44
	lcall	___fsmul
	mov	r4,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar7
	push	_Follow_Tape_sloc2_1_0
	push	(_Follow_Tape_sloc2_1_0 + 1)
	push	(_Follow_Tape_sloc2_1_0 + 2)
	push	(_Follow_Tape_sloc2_1_0 + 3)
	mov	dpl,r4
	mov	dph,r7
	mov	b,r0
	mov	a,r1
	lcall	___fslt
	mov	r4,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar7
	pop	ar6
	pop	ar5
	pop	ar3
	pop	ar2
	mov	a,r4
	pop	ar7
	pop	ar4
	jz	L020018?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:415: find_circle1_flag = 0;
	jbc	_find_circle1_flag,L020105?
	sjmp	L020018?
L020105?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:416: find_circle2_flag = 0;
	clr	_find_circle2_flag
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:418: break;		
	ret
L020018?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:420: mot_dir(0,0);
	clr	a
	mov	_mot_dir_PARM_2,a
	mov	(_mot_dir_PARM_2 + 1),a
	mov	dpl,a
	mov	dph,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	lcall	_mot_dir
	pop	ar7
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:421: pwmL = BASEPWM;
	mov	dptr,#_pwmL
	mov	a,#0x19
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:422: pwmR = BASEPWM;	
	mov	dptr,#_pwmR
	mov	a,#0x19
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
L020031?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:426: if (dir_count >= 7) dir =1;	 //ccw
	mov	dptr,#_dir_count
	movx	a,@dptr
	mov	r0,a
	inc	dptr
	movx	a,@dptr
	mov	r1,a
	clr	c
	mov	a,r0
	subb	a,#0x07
	mov	a,r1
	xrl	a,#0x80
	subb	a,#0x80
	jc	L020033?
	setb	_dir
L020033?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:427: if (dir_count <= -7) dir =0; //cw
	mov	dptr,#_dir_count
	movx	a,@dptr
	mov	r0,a
	inc	dptr
	movx	a,@dptr
	mov	r1,a
	clr	c
	mov	a,#0xF9
	subb	a,r0
	mov	a,#(0xFF ^ 0x80)
	mov	b,r1
	xrl	b,#0x80
	subb	a,b
	jc	L020035?
	clr	_dir
L020035?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:430: if (find_bridge_flag == 1) {
	jb	_find_bridge_flag,L020108?
	ljmp	L020055?
L020108?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:431: if (dir && (Volts_at_Pin(QFP32_MUX_P1_4) * 1000 < tp_VR) && (Volts_at_Pin(QFP32_MUX_P1_5) * 1000 < tp_VM)) {
	jb	_dir,L020109?
	ljmp	L020040?
L020109?:
	push	ar4
	push	ar7
	mov	dpl,#0x0A
	push	ar2
	push	ar3
	push	ar5
	push	ar6
	lcall	_Volts_at_Pin
	mov	r0,dpl
	mov	r1,dph
	mov	r4,b
	mov	r7,a
	pop	ar6
	pop	ar5
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	push	ar4
	push	ar7
	mov	dptr,#0x0000
	mov	b,#0x7A
	mov	a,#0x44
	lcall	___fsmul
	mov	_Follow_Tape_sloc4_1_0,dpl
	mov	(_Follow_Tape_sloc4_1_0 + 1),dph
	mov	(_Follow_Tape_sloc4_1_0 + 2),b
	mov	(_Follow_Tape_sloc4_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar7
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	mov	dpl,r2
	mov	dph,r3
	push	ar2
	push	ar3
	push	ar5
	push	ar6
	lcall	___uint2fs
	mov	r4,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	push	ar7
	push	ar4
	push	ar7
	push	ar0
	push	ar1
	mov	dpl,_Follow_Tape_sloc4_1_0
	mov	dph,(_Follow_Tape_sloc4_1_0 + 1)
	mov	b,(_Follow_Tape_sloc4_1_0 + 2)
	mov	a,(_Follow_Tape_sloc4_1_0 + 3)
	lcall	___fslt
	mov	r4,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar7
	pop	ar6
	pop	ar5
	pop	ar3
	pop	ar2
	mov	a,r4
	pop	ar7
	pop	ar4
	jnz	L020110?
	ljmp	L020040?
L020110?:
	push	ar4
	push	ar7
	mov	dpl,#0x0B
	push	ar2
	push	ar3
	push	ar5
	push	ar6
	lcall	_Volts_at_Pin
	mov	r0,dpl
	mov	r1,dph
	mov	r4,b
	mov	r7,a
	push	ar0
	push	ar1
	push	ar4
	push	ar7
	mov	dptr,#0x0000
	mov	b,#0x7A
	mov	a,#0x44
	lcall	___fsmul
	mov	r4,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar7
	push	_Follow_Tape_sloc2_1_0
	push	(_Follow_Tape_sloc2_1_0 + 1)
	push	(_Follow_Tape_sloc2_1_0 + 2)
	push	(_Follow_Tape_sloc2_1_0 + 3)
	mov	dpl,r4
	mov	dph,r7
	mov	b,r0
	mov	a,r1
	lcall	___fslt
	mov	r4,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar7
	pop	ar6
	pop	ar5
	pop	ar3
	pop	ar2
	mov	a,r4
	pop	ar7
	pop	ar4
	jz	L020040?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:432: find_bridge_flag = 0;
	clr	_find_bridge_flag
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:433: Bridge_Rotate(gnd_VL,gnd_VM,gnd_VR);	//rotate on to the bridge
	mov	_Bridge_Rotate_PARM_2,_Follow_Tape_sloc0_1_0
	mov	(_Bridge_Rotate_PARM_2 + 1),(_Follow_Tape_sloc0_1_0 + 1)
	mov	(_Bridge_Rotate_PARM_2 + 2),(_Follow_Tape_sloc0_1_0 + 2)
	mov	_Bridge_Rotate_PARM_3,_Follow_Tape_sloc1_1_0
	mov	(_Bridge_Rotate_PARM_3 + 1),(_Follow_Tape_sloc1_1_0 + 1)
	mov	(_Bridge_Rotate_PARM_3 + 2),(_Follow_Tape_sloc1_1_0 + 2)
	mov	dpl,_Follow_Tape_gnd_VL_1_117
	mov	dph,(_Follow_Tape_gnd_VL_1_117 + 1)
	mov	b,(_Follow_Tape_gnd_VL_1_117 + 2)
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	lcall	_Bridge_Rotate
	pop	ar7
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:436: if (circ2) find_circle2_flag = 1;	
	jnb	_circ2,L020037?
	setb	_find_circle2_flag
	sjmp	L020040?
L020037?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:437: else find_circle1_flag = 1;
	setb	_find_circle1_flag
L020040?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:440: if (!dir && (Volts_at_Pin(QFP32_MUX_P1_6) * 1000 < tp_VL) && (Volts_at_Pin(QFP32_MUX_P1_5) * 1000 < tp_VM)) {
	jnb	_dir,L020113?
	ljmp	L020058?
L020113?:
	push	ar4
	push	ar7
	mov	dpl,#0x0C
	push	ar2
	push	ar3
	push	ar5
	push	ar6
	lcall	_Volts_at_Pin
	mov	r0,dpl
	mov	r1,dph
	mov	r4,b
	mov	r7,a
	pop	ar6
	pop	ar5
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	push	ar4
	push	ar7
	mov	dptr,#0x0000
	mov	b,#0x7A
	mov	a,#0x44
	lcall	___fsmul
	mov	_Follow_Tape_sloc4_1_0,dpl
	mov	(_Follow_Tape_sloc4_1_0 + 1),dph
	mov	(_Follow_Tape_sloc4_1_0 + 2),b
	mov	(_Follow_Tape_sloc4_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar7
	pop	ar6
	pop	ar5
	pop	ar4
	mov	dpl,r5
	mov	dph,r6
	push	ar5
	push	ar6
	lcall	___uint2fs
	mov	r4,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	push	ar7
	push	ar4
	push	ar7
	push	ar0
	push	ar1
	mov	dpl,_Follow_Tape_sloc4_1_0
	mov	dph,(_Follow_Tape_sloc4_1_0 + 1)
	mov	b,(_Follow_Tape_sloc4_1_0 + 2)
	mov	a,(_Follow_Tape_sloc4_1_0 + 3)
	lcall	___fslt
	mov	r4,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar7
	pop	ar6
	pop	ar5
	pop	ar3
	pop	ar2
	mov	a,r4
	pop	ar7
	pop	ar4
	jnz	L020114?
	ljmp	L020058?
L020114?:
	push	ar4
	push	ar7
	mov	dpl,#0x0B
	push	ar2
	push	ar3
	push	ar5
	push	ar6
	lcall	_Volts_at_Pin
	mov	r0,dpl
	mov	r1,dph
	mov	r4,b
	mov	r7,a
	push	ar0
	push	ar1
	push	ar4
	push	ar7
	mov	dptr,#0x0000
	mov	b,#0x7A
	mov	a,#0x44
	lcall	___fsmul
	mov	r4,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar7
	push	_Follow_Tape_sloc2_1_0
	push	(_Follow_Tape_sloc2_1_0 + 1)
	push	(_Follow_Tape_sloc2_1_0 + 2)
	push	(_Follow_Tape_sloc2_1_0 + 3)
	mov	dpl,r4
	mov	dph,r7
	mov	b,r0
	mov	a,r1
	lcall	___fslt
	mov	r4,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar7
	pop	ar6
	pop	ar5
	pop	ar3
	pop	ar2
	mov	a,r4
	pop	ar7
	pop	ar4
	jnz	L020115?
	ljmp	L020058?
L020115?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:441: find_bridge_flag = 0;
	clr	_find_bridge_flag
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:442: Bridge_Rotate(gnd_VL,gnd_VM,gnd_VR);	//rotate on to the bridge
	mov	_Bridge_Rotate_PARM_2,_Follow_Tape_sloc0_1_0
	mov	(_Bridge_Rotate_PARM_2 + 1),(_Follow_Tape_sloc0_1_0 + 1)
	mov	(_Bridge_Rotate_PARM_2 + 2),(_Follow_Tape_sloc0_1_0 + 2)
	mov	_Bridge_Rotate_PARM_3,_Follow_Tape_sloc1_1_0
	mov	(_Bridge_Rotate_PARM_3 + 1),(_Follow_Tape_sloc1_1_0 + 1)
	mov	(_Bridge_Rotate_PARM_3 + 2),(_Follow_Tape_sloc1_1_0 + 2)
	mov	dpl,_Follow_Tape_gnd_VL_1_117
	mov	dph,(_Follow_Tape_gnd_VL_1_117 + 1)
	mov	b,(_Follow_Tape_gnd_VL_1_117 + 2)
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	lcall	_Bridge_Rotate
	pop	ar7
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:445: if (circ2) find_circle2_flag = 1;
	jnb	_circ2,L020044?
	setb	_find_circle2_flag
	ljmp	L020058?
L020044?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:446: else find_circle1_flag = 1;
	setb	_find_circle1_flag
	ljmp	L020058?
L020055?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:449: } else if ((dir_count >= 15) || (dir_count <= -15) && break_when_dir_found) {
	mov	dptr,#_dir_count
	movx	a,@dptr
	mov	r0,a
	inc	dptr
	movx	a,@dptr
	mov	r1,a
	clr	c
	mov	a,r0
	subb	a,#0x0F
	mov	a,r1
	xrl	a,#0x80
	subb	a,#0x80
	jnc	L020050?
	mov	dptr,#_dir_count
	movx	a,@dptr
	mov	r0,a
	inc	dptr
	movx	a,@dptr
	mov	r1,a
	clr	c
	mov	a,#0xF1
	subb	a,r0
	mov	a,#(0xFF ^ 0x80)
	mov	b,r1
	xrl	b,#0x80
	subb	a,b
	jnc	L020118?
	ljmp	L020058?
L020118?:
	jb	_break_when_dir_found,L020119?
	ljmp	L020058?
L020119?:
L020050?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:450: break_when_dir_found = 0;	//reset the break when dir found flag
	clr	_break_when_dir_found
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:451: break;	//if the find_bridge_flag is not set, and the direction has been found, break (to find object in circle)
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Track_Object'
;------------------------------------------------------------
;IRVR                      Allocated with name '_Track_Object_IRVR_1_134'
;IRVL                      Allocated with name '_Track_Object_IRVL_1_134'
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:456: void Track_Object(void)
;	-----------------------------------------
;	 function Track_Object
;	-----------------------------------------
_Track_Object:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:460: bit flag = 0;
	clr	_Track_Object_flag_1_134
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:461: mot_dir(0,0);
	clr	a
	mov	_mot_dir_PARM_2,a
	mov	(_mot_dir_PARM_2 + 1),a
	mov	dpl,a
	mov	dph,a
	lcall	_mot_dir
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:463: while (!flag) {
L021021?:
	jnb	_Track_Object_flag_1_134,L021038?
	ljmp	L021023?
L021038?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:464: IRVR = Volts_at_Pin(QFP32_MUX_P1_2) * 1000;
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
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fs2uint
	mov	r2,dpl
	mov	r3,dph
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:465: IRVL = Volts_at_Pin(QFP32_MUX_P1_3) * 1000;
	mov	dpl,#0x09
	push	ar2
	push	ar3
	lcall	_Volts_at_Pin
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	dptr,#0x0000
	mov	b,#0x7A
	mov	a,#0x44
	lcall	___fsmul
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r7
	lcall	___fs2uint
	mov	r4,dpl
	mov	r5,dph
	pop	ar3
	pop	ar2
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:467: if ((IRVR > 1000) && (IRVL < 1000)) {
	clr	c
	mov	a,#0xE8
	subb	a,r2
	mov	a,#0x03
	subb	a,r3
	clr	a
	rlc	a
	mov	r6,a
	jz	L021016?
	clr	c
	mov	a,r4
	subb	a,#0xE8
	mov	a,r5
	subb	a,#0x03
	jnc	L021016?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:468: pwmL = SLOWPWM;
	mov	dptr,#_pwmL
	mov	a,#0x05
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:469: pwmR = BOOSTPWM;	
	mov	dptr,#_pwmR
	mov	a,#0x28
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	ljmp	L021017?
L021016?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:470: } else if ((IRVL > 1000) && (IRVR < 1000)) {
	clr	c
	mov	a,#0xE8
	subb	a,r4
	mov	a,#0x03
	subb	a,r5
	clr	a
	rlc	a
	mov	r7,a
	jz	L021012?
	clr	c
	mov	a,r2
	subb	a,#0xE8
	mov	a,r3
	subb	a,#0x03
	jnc	L021012?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:471: pwmL = BOOSTPWM;
	mov	dptr,#_pwmL
	mov	a,#0x28
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:472: pwmR = SLOWPWM;	
	mov	dptr,#_pwmR
	mov	a,#0x05
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	sjmp	L021017?
L021012?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:473: } else if ((IRVL > 1000) && (IRVR > 1000)) {
	mov	a,r7
	jz	L021008?
	mov	a,r6
	jz	L021008?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:474: if (sonar_count_2 < 40) {
	mov	dptr,#_sonar_count_2
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	clr	c
	mov	a,r6
	subb	a,#0x28
	mov	a,r7
	subb	a,#0x00
	jnc	L021002?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:475: pwmL = BOOSTPWM; //approach the object quickly
	mov	dptr,#_pwmL
	mov	a,#0x28
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:476: pwmR = BOOSTPWM;
	mov	dptr,#_pwmR
	mov	a,#0x28
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	sjmp	L021017?
L021002?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:478: pwmL = 0; // temporary just stops
	mov	dptr,#_pwmL
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:479: pwmR = 0;
	mov	dptr,#_pwmR
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
	sjmp	L021017?
L021008?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:481: } else if ((IRVL < 1000) && (IRVR < 1000)) {
	clr	c
	mov	a,r4
	subb	a,#0xE8
	mov	a,r5
	subb	a,#0x03
	jnc	L021017?
	clr	c
	mov	a,r2
	subb	a,#0xE8
	mov	a,r3
	subb	a,#0x03
	jnc	L021017?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:482: pwmL = BASEPWM; 
	mov	dptr,#_pwmL
	mov	a,#0x19
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:483: pwmR = BASEPWM;	
	mov	dptr,#_pwmR
	mov	a,#0x19
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
L021017?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:486: if (sonar_count_2 < 4)
	mov	dptr,#_sonar_count_2
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	clr	c
	mov	a,r2
	subb	a,#0x04
	mov	a,r3
	subb	a,#0x00
	jc	L021048?
	ljmp	L021021?
L021048?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:487: flag = 1;
	setb	_Track_Object_flag_1_134
	ljmp	L021021?
L021023?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:490: pwmL = BASEPWM; 
	mov	dptr,#_pwmL
	mov	a,#0x19
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:491: pwmR = BASEPWM;	
	mov	dptr,#_pwmR
	mov	a,#0x19
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:492: waitms(500);
	mov	dptr,#0x01F4
	lcall	_waitms
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:493: stop();
	lcall	_stop
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:494: Claw_Pos(2);
	mov	dptr,#0x0002
	lcall	_Claw_Pos
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:495: waitms(500);
	mov	dptr,#0x01F4
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'Find_Tape'
;------------------------------------------------------------
;motordir                  Allocated with name '_Find_Tape_PARM_2'
;gnd_VM                    Allocated with name '_Find_Tape_gnd_VM_1_142'
;temp                      Allocated to registers 
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:499: void Find_Tape(unsigned short int *gnd_VM, int motordir)
;	-----------------------------------------
;	 function Find_Tape
;	-----------------------------------------
_Find_Tape:
	mov	_Find_Tape_gnd_VM_1_142,dpl
	mov	(_Find_Tape_gnd_VM_1_142 + 1),dph
	mov	(_Find_Tape_gnd_VM_1_142 + 2),b
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:501: bit flag=0;
	clr	_Find_Tape_flag_1_143
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:504: while (!flag) {
L022004?:
	jnb	_Find_Tape_flag_1_143,L022012?
	ljmp	L022006?
L022012?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:505: if (Volts_at_Pin(QFP32_MUX_P1_5)*1000 < *gnd_VM-TAPEOFFSET) { // found tape, proceed with function
	mov	dpl,#0x0B
	lcall	_Volts_at_Pin
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	mov	r0,a
	push	ar5
	push	ar6
	push	ar7
	push	ar0
	mov	dptr,#0x0000
	mov	b,#0x7A
	mov	a,#0x44
	lcall	___fsmul
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	mov	r0,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,_Find_Tape_gnd_VM_1_142
	mov	dph,(_Find_Tape_gnd_VM_1_142 + 1)
	mov	b,(_Find_Tape_gnd_VM_1_142 + 2)
	lcall	__gptrget
	mov	r1,a
	inc	dptr
	lcall	__gptrget
	mov	r2,a
	mov	a,r1
	add	a,#0x70
	mov	dpl,a
	mov	a,r2
	addc	a,#0xfe
	mov	dph,a
	push	ar5
	push	ar6
	push	ar7
	push	ar0
	lcall	___uint2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r1,a
	pop	ar0
	pop	ar7
	pop	ar6
	pop	ar5
	push	ar2
	push	ar3
	push	ar4
	push	ar1
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,r0
	lcall	___fslt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L022002?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:506: stop();
	lcall	_stop
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:507: flag = 1;
	setb	_Find_Tape_flag_1_143
	ljmp	L022004?
L022002?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:509: mot_dir(motordir,motordir);
	mov	_mot_dir_PARM_2,_Find_Tape_PARM_2
	mov	(_mot_dir_PARM_2 + 1),(_Find_Tape_PARM_2 + 1)
	mov	dpl,_Find_Tape_PARM_2
	mov	dph,(_Find_Tape_PARM_2 + 1)
	lcall	_mot_dir
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:510: pwmL = BASEPWM;
	mov	dptr,#_pwmL
	mov	a,#0x19
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:511: pwmR = BASEPWM;	
	mov	dptr,#_pwmR
	mov	a,#0x19
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	ljmp	L022004?
L022006?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:514: return;
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Rotate'
;------------------------------------------------------------
;gnd_VR                    Allocated with name '_Rotate_PARM_2'
;gnd_VL                    Allocated with name '_Rotate_gnd_VL_1_147'
;sloc0                     Allocated with name '_Rotate_sloc0_1_0'
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:517: void Rotate(unsigned short int *gnd_VL, unsigned short int *gnd_VR)
;	-----------------------------------------
;	 function Rotate
;	-----------------------------------------
_Rotate:
	mov	_Rotate_gnd_VL_1_147,dpl
	mov	(_Rotate_gnd_VL_1_147 + 1),dph
	mov	(_Rotate_gnd_VL_1_147 + 2),b
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:519: if (Volts_at_Pin(QFP32_MUX_P1_6)*1000 < *gnd_VL-TAPEOFFSET) {
	mov	dpl,#0x0C
	lcall	_Volts_at_Pin
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	mov	r0,a
	push	ar5
	push	ar6
	push	ar7
	push	ar0
	mov	dptr,#0x0000
	mov	b,#0x7A
	mov	a,#0x44
	lcall	___fsmul
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	mov	r0,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,_Rotate_gnd_VL_1_147
	mov	dph,(_Rotate_gnd_VL_1_147 + 1)
	mov	b,(_Rotate_gnd_VL_1_147 + 2)
	lcall	__gptrget
	mov	r1,a
	inc	dptr
	lcall	__gptrget
	mov	r2,a
	mov	a,r1
	add	a,#0x70
	mov	dpl,a
	mov	a,r2
	addc	a,#0xfe
	mov	dph,a
	push	ar5
	push	ar6
	push	ar7
	push	ar0
	lcall	___uint2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r1,a
	pop	ar0
	pop	ar7
	pop	ar6
	pop	ar5
	push	ar2
	push	ar3
	push	ar4
	push	ar1
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,r0
	lcall	___fslt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L023004?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:520: spin_left(10);
	mov	dptr,#0x000A
	lcall	_spin_left
	ljmp	L023015?
L023004?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:521: } else if (Volts_at_Pin(QFP32_MUX_P1_4)*1000 < *gnd_VR-TAPEOFFSET) {
	mov	dpl,#0x0A
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
	mov	r6,_Rotate_PARM_2
	mov	r7,(_Rotate_PARM_2 + 1)
	mov	r0,(_Rotate_PARM_2 + 2)
	mov	dpl,r6
	mov	dph,r7
	mov	b,r0
	lcall	__gptrget
	mov	r6,a
	inc	dptr
	lcall	__gptrget
	mov	r7,a
	mov	a,r6
	add	a,#0x70
	mov	dpl,a
	mov	a,r7
	addc	a,#0xfe
	mov	dph,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	___uint2fs
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	push	ar6
	push	ar7
	push	ar0
	push	ar1
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
	jz	L023015?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:522: spin_right(10);
	mov	dptr,#0x000A
	lcall	_spin_right
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:525: while((Volts_at_Pin(QFP32_MUX_P1_6)*1000 < *gnd_VL-TAPEOFFSET) &&
L023015?:
	mov	_Rotate_sloc0_1_0,_Rotate_PARM_2
	mov	(_Rotate_sloc0_1_0 + 1),(_Rotate_PARM_2 + 1)
	mov	(_Rotate_sloc0_1_0 + 2),(_Rotate_PARM_2 + 2)
L023007?:
	mov	dpl,#0x0C
	lcall	_Volts_at_Pin
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	mov	r0,a
	push	ar5
	push	ar6
	push	ar7
	push	ar0
	mov	dptr,#0x0000
	mov	b,#0x7A
	mov	a,#0x44
	lcall	___fsmul
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	mov	r0,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,_Rotate_gnd_VL_1_147
	mov	dph,(_Rotate_gnd_VL_1_147 + 1)
	mov	b,(_Rotate_gnd_VL_1_147 + 2)
	lcall	__gptrget
	mov	r1,a
	inc	dptr
	lcall	__gptrget
	mov	r2,a
	mov	a,r1
	add	a,#0x70
	mov	dpl,a
	mov	a,r2
	addc	a,#0xfe
	mov	dph,a
	push	ar5
	push	ar6
	push	ar7
	push	ar0
	lcall	___uint2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r1,a
	pop	ar0
	pop	ar7
	pop	ar6
	pop	ar5
	push	ar2
	push	ar3
	push	ar4
	push	ar1
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,r0
	lcall	___fslt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L023018?
	ljmp	L023009?
L023018?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:526: (Volts_at_Pin(QFP32_MUX_P1_4)*1000 < *gnd_VR-TAPEOFFSET)); 
	mov	dpl,#0x0A
	lcall	_Volts_at_Pin
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	mov	r0,a
	push	ar5
	push	ar6
	push	ar7
	push	ar0
	mov	dptr,#0x0000
	mov	b,#0x7A
	mov	a,#0x44
	lcall	___fsmul
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	mov	r0,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,_Rotate_sloc0_1_0
	mov	dph,(_Rotate_sloc0_1_0 + 1)
	mov	b,(_Rotate_sloc0_1_0 + 2)
	lcall	__gptrget
	mov	r1,a
	inc	dptr
	lcall	__gptrget
	mov	r2,a
	mov	a,r1
	add	a,#0x70
	mov	dpl,a
	mov	a,r2
	addc	a,#0xfe
	mov	dph,a
	push	ar5
	push	ar6
	push	ar7
	push	ar0
	lcall	___uint2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r1,a
	pop	ar0
	pop	ar7
	pop	ar6
	pop	ar5
	push	ar2
	push	ar3
	push	ar4
	push	ar1
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,r0
	lcall	___fslt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L023019?
	ljmp	L023007?
L023019?:
L023009?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:527: return;
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Detect_Object'
;------------------------------------------------------------
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:530: int Detect_Object (void)
;	-----------------------------------------
;	 function Detect_Object
;	-----------------------------------------
_Detect_Object:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:532: if (((Volts_at_Pin(QFP32_MUX_P1_2) * 1000) < 1000) || ((Volts_at_Pin(QFP32_MUX_P1_3) * 1000) < 1000))
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
	jnz	L024001?
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
	jz	L024002?
L024001?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:533: return 1;
	mov	dptr,#0x0001
	ret
L024002?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:534: if (sonar_count_2 <= 40)
	mov	dptr,#_sonar_count_2
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	clr	c
	mov	a,#0x28
	subb	a,r2
	clr	a
	subb	a,r3
	jc	L024005?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:535: return 1;
	mov	dptr,#0x0001
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:537: return 0;
	ret
L024005?:
	mov	dptr,#0x0000
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Find_Object'
;------------------------------------------------------------
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:540: void Find_Object( void )
;	-----------------------------------------
;	 function Find_Object
;	-----------------------------------------
_Find_Object:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:542: Claw_Pos (10);
	mov	dptr,#0x000A
	lcall	_Claw_Pos
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:543: stop();
	lcall	_stop
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:544: waitms(500);
	mov	dptr,#0x01F4
	lcall	_waitms
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:547: if (dir) {
	jnb	_dir,L025002?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:549: mot_dir(1,0);
	clr	a
	mov	_mot_dir_PARM_2,a
	mov	(_mot_dir_PARM_2 + 1),a
	mov	dptr,#0x0001
	lcall	_mot_dir
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:550: pwmR = 0;
	mov	dptr,#_pwmR
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:551: pwmL = BASEPWM;
	mov	dptr,#_pwmL
	mov	a,#0x19
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	sjmp	L025004?
L025002?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:554: mot_dir(0,1);
	mov	_mot_dir_PARM_2,#0x01
	clr	a
	mov	(_mot_dir_PARM_2 + 1),a
	mov	dptr,#0x0000
	lcall	_mot_dir
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:555: pwmR = BASEPWM;
	mov	dptr,#_pwmR
	mov	a,#0x19
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:556: pwmL =0;
	mov	dptr,#_pwmL
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:560: while (Detect_Object() != 1);		//locate an object with the IR sensors
L025004?:
	lcall	_Detect_Object
	mov	r2,dpl
	mov	r3,dph
	cjne	r2,#0x01,L025004?
	cjne	r3,#0x00,L025004?
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Bridge_Rotate'
;------------------------------------------------------------
;gnd_VM                    Allocated with name '_Bridge_Rotate_PARM_2'
;gnd_VR                    Allocated with name '_Bridge_Rotate_PARM_3'
;gnd_VL                    Allocated with name '_Bridge_Rotate_gnd_VL_1_157'
;sloc0                     Allocated with name '_Bridge_Rotate_sloc0_1_0'
;sloc1                     Allocated with name '_Bridge_Rotate_sloc1_1_0'
;sloc2                     Allocated with name '_Bridge_Rotate_sloc2_1_0'
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:563: void Bridge_Rotate(unsigned short int* gnd_VL, unsigned short int* gnd_VM, unsigned short int* gnd_VR)
;	-----------------------------------------
;	 function Bridge_Rotate
;	-----------------------------------------
_Bridge_Rotate:
	mov	_Bridge_Rotate_gnd_VL_1_157,dpl
	mov	(_Bridge_Rotate_gnd_VL_1_157 + 1),dph
	mov	(_Bridge_Rotate_gnd_VL_1_157 + 2),b
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:565: if (dir) {
	jb	_dir,L026021?
	ljmp	L026010?
L026021?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:566: mot_dir(0,1);
	mov	_mot_dir_PARM_2,#0x01
	clr	a
	mov	(_mot_dir_PARM_2 + 1),a
	mov	dptr,#0x0000
	lcall	_mot_dir
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:567: pwmL = BASEPWM+10;
	mov	dptr,#_pwmL
	mov	a,#0x23
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:568: pwmR = BASEPWM+10;	
	mov	dptr,#_pwmR
	mov	a,#0x23
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:569: waitms(700);
	mov	dptr,#0x02BC
	lcall	_waitms
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:570: while ((Volts_at_Pin(QFP32_MUX_P1_4)*1000 < *gnd_VR-TAPEOFFSET) || (Volts_at_Pin(QFP32_MUX_P1_5)*1000 < *gnd_VM-TAPEOFFSET));
	mov	_Bridge_Rotate_sloc1_1_0,_Bridge_Rotate_PARM_3
	mov	(_Bridge_Rotate_sloc1_1_0 + 1),(_Bridge_Rotate_PARM_3 + 1)
	mov	(_Bridge_Rotate_sloc1_1_0 + 2),(_Bridge_Rotate_PARM_3 + 2)
	mov	_Bridge_Rotate_sloc0_1_0,_Bridge_Rotate_PARM_2
	mov	(_Bridge_Rotate_sloc0_1_0 + 1),(_Bridge_Rotate_PARM_2 + 1)
	mov	(_Bridge_Rotate_sloc0_1_0 + 2),(_Bridge_Rotate_PARM_2 + 2)
L026002?:
	mov	dpl,#0x0A
	lcall	_Volts_at_Pin
	mov	r0,dpl
	mov	r1,dph
	mov	r5,b
	mov	r6,a
	push	ar0
	push	ar1
	push	ar5
	push	ar6
	mov	dptr,#0x0000
	mov	b,#0x7A
	mov	a,#0x44
	lcall	___fsmul
	mov	_Bridge_Rotate_sloc2_1_0,dpl
	mov	(_Bridge_Rotate_sloc2_1_0 + 1),dph
	mov	(_Bridge_Rotate_sloc2_1_0 + 2),b
	mov	(_Bridge_Rotate_sloc2_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,_Bridge_Rotate_sloc1_1_0
	mov	dph,(_Bridge_Rotate_sloc1_1_0 + 1)
	mov	b,(_Bridge_Rotate_sloc1_1_0 + 2)
	lcall	__gptrget
	mov	r1,a
	inc	dptr
	lcall	__gptrget
	mov	r5,a
	mov	a,r1
	add	a,#0x70
	mov	dpl,a
	mov	a,r5
	addc	a,#0xfe
	mov	dph,a
	lcall	___uint2fs
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	mov	r0,a
	push	ar5
	push	ar6
	push	ar7
	push	ar0
	mov	dpl,_Bridge_Rotate_sloc2_1_0
	mov	dph,(_Bridge_Rotate_sloc2_1_0 + 1)
	mov	b,(_Bridge_Rotate_sloc2_1_0 + 2)
	mov	a,(_Bridge_Rotate_sloc2_1_0 + 3)
	lcall	___fslt
	mov	r5,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r5
	jnz	L026002?
	mov	dpl,#0x0B
	lcall	_Volts_at_Pin
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	mov	r0,a
	push	ar5
	push	ar6
	push	ar7
	push	ar0
	mov	dptr,#0x0000
	mov	b,#0x7A
	mov	a,#0x44
	lcall	___fsmul
	mov	_Bridge_Rotate_sloc2_1_0,dpl
	mov	(_Bridge_Rotate_sloc2_1_0 + 1),dph
	mov	(_Bridge_Rotate_sloc2_1_0 + 2),b
	mov	(_Bridge_Rotate_sloc2_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,_Bridge_Rotate_sloc0_1_0
	mov	dph,(_Bridge_Rotate_sloc0_1_0 + 1)
	mov	b,(_Bridge_Rotate_sloc0_1_0 + 2)
	lcall	__gptrget
	mov	r1,a
	inc	dptr
	lcall	__gptrget
	mov	r5,a
	mov	a,r1
	add	a,#0x70
	mov	dpl,a
	mov	a,r5
	addc	a,#0xfe
	mov	dph,a
	lcall	___uint2fs
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	mov	r0,a
	push	ar5
	push	ar6
	push	ar7
	push	ar0
	mov	dpl,_Bridge_Rotate_sloc2_1_0
	mov	dph,(_Bridge_Rotate_sloc2_1_0 + 1)
	mov	b,(_Bridge_Rotate_sloc2_1_0 + 2)
	mov	a,(_Bridge_Rotate_sloc2_1_0 + 3)
	lcall	___fslt
	mov	r5,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r5
	jz	L026023?
	ljmp	L026002?
L026023?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:571: Find_Tape(gnd_VM,0);
	clr	a
	mov	_Find_Tape_PARM_2,a
	mov	(_Find_Tape_PARM_2 + 1),a
	mov	dpl,_Bridge_Rotate_sloc0_1_0
	mov	dph,(_Bridge_Rotate_sloc0_1_0 + 1)
	mov	b,(_Bridge_Rotate_sloc0_1_0 + 2)
	ljmp	_Find_Tape
L026010?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:573: mot_dir(1,0);
	clr	a
	mov	_mot_dir_PARM_2,a
	mov	(_mot_dir_PARM_2 + 1),a
	mov	dptr,#0x0001
	lcall	_mot_dir
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:574: pwmL = BASEPWM+10;
	mov	dptr,#_pwmL
	mov	a,#0x23
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:575: pwmR = BASEPWM+10;	
	mov	dptr,#_pwmR
	mov	a,#0x23
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:576: waitms(700);
	mov	dptr,#0x02BC
	lcall	_waitms
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:577: while ((Volts_at_Pin(QFP32_MUX_P1_6)*1000 < *gnd_VL-TAPEOFFSET) || (Volts_at_Pin(QFP32_MUX_P1_5)*1000 < *gnd_VM-TAPEOFFSET));
	mov	r5,_Bridge_Rotate_PARM_2
	mov	r6,(_Bridge_Rotate_PARM_2 + 1)
	mov	r7,(_Bridge_Rotate_PARM_2 + 2)
L026006?:
	push	ar5
	push	ar6
	push	ar7
	mov	dpl,#0x0C
	push	ar5
	push	ar6
	push	ar7
	lcall	_Volts_at_Pin
	mov	r0,dpl
	mov	r1,dph
	mov	r2,b
	mov	r3,a
	push	ar0
	push	ar1
	push	ar2
	push	ar3
	mov	dptr,#0x0000
	mov	b,#0x7A
	mov	a,#0x44
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r0,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar7
	pop	ar6
	pop	ar5
	mov	dpl,_Bridge_Rotate_gnd_VL_1_157
	mov	dph,(_Bridge_Rotate_gnd_VL_1_157 + 1)
	mov	b,(_Bridge_Rotate_gnd_VL_1_157 + 2)
	lcall	__gptrget
	mov	r1,a
	inc	dptr
	lcall	__gptrget
	mov	r5,a
	mov	a,r1
	add	a,#0x70
	mov	dpl,a
	mov	a,r5
	addc	a,#0xfe
	mov	dph,a
	push	ar2
	push	ar3
	push	ar4
	push	ar0
	lcall	___uint2fs
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	mov	r1,a
	pop	ar0
	pop	ar4
	pop	ar3
	pop	ar2
	push	ar5
	push	ar6
	push	ar7
	push	ar5
	push	ar6
	push	ar7
	push	ar1
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r0
	lcall	___fslt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar7
	pop	ar6
	pop	ar5
	pop	ar7
	pop	ar6
	pop	ar5
	mov	a,r2
	jz	L026024?
	ljmp	L026006?
L026024?:
	mov	dpl,#0x0B
	push	ar5
	push	ar6
	push	ar7
	lcall	_Volts_at_Pin
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r0,a
	push	ar2
	push	ar3
	push	ar4
	push	ar0
	mov	dptr,#0x0000
	mov	b,#0x7A
	mov	a,#0x44
	lcall	___fsmul
	mov	_Bridge_Rotate_sloc2_1_0,dpl
	mov	(_Bridge_Rotate_sloc2_1_0 + 1),dph
	mov	(_Bridge_Rotate_sloc2_1_0 + 2),b
	mov	(_Bridge_Rotate_sloc2_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar7
	pop	ar6
	pop	ar5
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r1,a
	inc	dptr
	lcall	__gptrget
	mov	r2,a
	mov	a,r1
	add	a,#0x70
	mov	dpl,a
	mov	a,r2
	addc	a,#0xfe
	mov	dph,a
	push	ar5
	push	ar6
	push	ar7
	lcall	___uint2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r0,a
	push	ar2
	push	ar3
	push	ar4
	push	ar0
	mov	dpl,_Bridge_Rotate_sloc2_1_0
	mov	dph,(_Bridge_Rotate_sloc2_1_0 + 1)
	mov	b,(_Bridge_Rotate_sloc2_1_0 + 2)
	mov	a,(_Bridge_Rotate_sloc2_1_0 + 3)
	lcall	___fslt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar7
	pop	ar6
	pop	ar5
	mov	a,r2
	jz	L026025?
	ljmp	L026006?
L026025?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:578: Find_Tape(gnd_VM,0);
	clr	a
	mov	_Find_Tape_PARM_2,a
	mov	(_Find_Tape_PARM_2 + 1),a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:580: return;
	ljmp	_Find_Tape
;------------------------------------------------------------
;Allocation info for local variables in function 'autonomous_prime'
;------------------------------------------------------------
;gnd_VL                    Allocated with name '_autonomous_prime_gnd_VL_1_162'
;gnd_VR                    Allocated with name '_autonomous_prime_gnd_VR_1_162'
;gnd_VM                    Allocated with name '_autonomous_prime_gnd_VM_1_162'
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:583: void autonomous_prime(void)
;	-----------------------------------------
;	 function autonomous_prime
;	-----------------------------------------
_autonomous_prime:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:590: find_bridge_flag = 0;
	clr	_find_bridge_flag
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:591: Calibrate_LSensors(&gnd_VL,&gnd_VM,&gnd_VR);	
	mov	_Calibrate_LSensors_PARM_2,#_autonomous_prime_gnd_VM_1_162
	mov	(_Calibrate_LSensors_PARM_2 + 1),#(_autonomous_prime_gnd_VM_1_162 >> 8)
	mov	(_Calibrate_LSensors_PARM_2 + 2),#0x00
	mov	_Calibrate_LSensors_PARM_3,#_autonomous_prime_gnd_VR_1_162
	mov	(_Calibrate_LSensors_PARM_3 + 1),#(_autonomous_prime_gnd_VR_1_162 >> 8)
	mov	(_Calibrate_LSensors_PARM_3 + 2),#0x00
	mov	dptr,#_autonomous_prime_gnd_VL_1_162
	mov	b,#0x00
	lcall	_Calibrate_LSensors
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:592: Find_Tape(&gnd_VM,0);		//exits when middle sensor hits tape
	clr	a
	mov	_Find_Tape_PARM_2,a
	mov	(_Find_Tape_PARM_2 + 1),a
	mov	dptr,#_autonomous_prime_gnd_VM_1_162
	mov	b,#0x00
	lcall	_Find_Tape
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:593: Rotate(&gnd_VL,&gnd_VR);			//exits when middle sensor on tape, right and left not
	mov	_Rotate_PARM_2,#_autonomous_prime_gnd_VR_1_162
	mov	(_Rotate_PARM_2 + 1),#(_autonomous_prime_gnd_VR_1_162 >> 8)
	mov	(_Rotate_PARM_2 + 2),#0x00
	mov	dptr,#_autonomous_prime_gnd_VL_1_162
	mov	b,#0x00
	lcall	_Rotate
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:594: break_when_dir_found = 1;
	setb	_break_when_dir_found
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:595: Follow_Tape(&gnd_VL,&gnd_VM,&gnd_VR);		//exits when direction is found
	mov	_Follow_Tape_PARM_2,#_autonomous_prime_gnd_VM_1_162
	mov	(_Follow_Tape_PARM_2 + 1),#(_autonomous_prime_gnd_VM_1_162 >> 8)
	mov	(_Follow_Tape_PARM_2 + 2),#0x00
	mov	_Follow_Tape_PARM_3,#_autonomous_prime_gnd_VR_1_162
	mov	(_Follow_Tape_PARM_3 + 1),#(_autonomous_prime_gnd_VR_1_162 >> 8)
	mov	(_Follow_Tape_PARM_3 + 2),#0x00
	mov	dptr,#_autonomous_prime_gnd_VL_1_162
	mov	b,#0x00
	lcall	_Follow_Tape
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:596: stop();
	lcall	_stop
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:597: Claw_Pos(10);
	mov	dptr,#0x000A
	lcall	_Claw_Pos
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:598: waitms(1000);								//allow the claw to open before IR sensors scan
	mov	dptr,#0x03E8
	lcall	_waitms
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:599: Find_Object();								//exits when an object is detected in front of IR or ultrasonic sensor
	lcall	_Find_Object
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:600: Track_Object();								//exits when claw has been closed on the object
	lcall	_Track_Object
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:601: Calibrate_LSensors(&gnd_VL,&gnd_VM,&gnd_VR);																			//needed?
	mov	_Calibrate_LSensors_PARM_2,#_autonomous_prime_gnd_VM_1_162
	mov	(_Calibrate_LSensors_PARM_2 + 1),#(_autonomous_prime_gnd_VM_1_162 >> 8)
	mov	(_Calibrate_LSensors_PARM_2 + 2),#0x00
	mov	_Calibrate_LSensors_PARM_3,#_autonomous_prime_gnd_VR_1_162
	mov	(_Calibrate_LSensors_PARM_3 + 1),#(_autonomous_prime_gnd_VR_1_162 >> 8)
	mov	(_Calibrate_LSensors_PARM_3 + 2),#0x00
	mov	dptr,#_autonomous_prime_gnd_VL_1_162
	mov	b,#0x00
	lcall	_Calibrate_LSensors
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:602: Find_Tape(&gnd_VM,1);		//exits when middle sensor hits tape (backwards)
	mov	_Find_Tape_PARM_2,#0x01
	clr	a
	mov	(_Find_Tape_PARM_2 + 1),a
	mov	dptr,#_autonomous_prime_gnd_VM_1_162
	mov	b,#0x00
	lcall	_Find_Tape
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:603: dir_count = 0;								//reset direction counter to find new direction
	mov	dptr,#_dir_count
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:604: Follow_Tape(&gnd_VL,&gnd_VM,&gnd_VR);		//exits when direction is found
	mov	_Follow_Tape_PARM_2,#_autonomous_prime_gnd_VM_1_162
	mov	(_Follow_Tape_PARM_2 + 1),#(_autonomous_prime_gnd_VM_1_162 >> 8)
	mov	(_Follow_Tape_PARM_2 + 2),#0x00
	mov	_Follow_Tape_PARM_3,#_autonomous_prime_gnd_VR_1_162
	mov	(_Follow_Tape_PARM_3 + 1),#(_autonomous_prime_gnd_VR_1_162 >> 8)
	mov	(_Follow_Tape_PARM_3 + 2),#0x00
	mov	dptr,#_autonomous_prime_gnd_VL_1_162
	mov	b,#0x00
	lcall	_Follow_Tape
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:605: find_bridge_flag = 1;						//tell follow_tape to find the bridge
	setb	_find_bridge_flag
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:606: circ2 = 1;									//looking for second circle
	setb	_circ2
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:607: Follow_Tape(&gnd_VL,&gnd_VM,&gnd_VR);		//exits when it has dropped the object in the other circle
	mov	_Follow_Tape_PARM_2,#_autonomous_prime_gnd_VM_1_162
	mov	(_Follow_Tape_PARM_2 + 1),#(_autonomous_prime_gnd_VM_1_162 >> 8)
	mov	(_Follow_Tape_PARM_2 + 2),#0x00
	mov	_Follow_Tape_PARM_3,#_autonomous_prime_gnd_VR_1_162
	mov	(_Follow_Tape_PARM_3 + 1),#(_autonomous_prime_gnd_VR_1_162 >> 8)
	mov	(_Follow_Tape_PARM_3 + 2),#0x00
	mov	dptr,#_autonomous_prime_gnd_VL_1_162
	mov	b,#0x00
	lcall	_Follow_Tape
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:610: stop();
	lcall	_stop
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:611: waitms(500);
	mov	dptr,#0x01F4
	lcall	_waitms
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:612: Calibrate_LSensors(&gnd_VL,&gnd_VM,&gnd_VR);																			//needed?
	mov	_Calibrate_LSensors_PARM_2,#_autonomous_prime_gnd_VM_1_162
	mov	(_Calibrate_LSensors_PARM_2 + 1),#(_autonomous_prime_gnd_VM_1_162 >> 8)
	mov	(_Calibrate_LSensors_PARM_2 + 2),#0x00
	mov	_Calibrate_LSensors_PARM_3,#_autonomous_prime_gnd_VR_1_162
	mov	(_Calibrate_LSensors_PARM_3 + 1),#(_autonomous_prime_gnd_VR_1_162 >> 8)
	mov	(_Calibrate_LSensors_PARM_3 + 2),#0x00
	mov	dptr,#_autonomous_prime_gnd_VL_1_162
	mov	b,#0x00
	lcall	_Calibrate_LSensors
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:613: Find_Tape(&gnd_VM,1);
	mov	_Find_Tape_PARM_2,#0x01
	clr	a
	mov	(_Find_Tape_PARM_2 + 1),a
	mov	dptr,#_autonomous_prime_gnd_VM_1_162
	mov	b,#0x00
	lcall	_Find_Tape
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:614: Rotate(&gnd_VL,&gnd_VR);			//exits when middle sensor on tape, right and left not
	mov	_Rotate_PARM_2,#_autonomous_prime_gnd_VR_1_162
	mov	(_Rotate_PARM_2 + 1),#(_autonomous_prime_gnd_VR_1_162 >> 8)
	mov	(_Rotate_PARM_2 + 2),#0x00
	mov	dptr,#_autonomous_prime_gnd_VL_1_162
	mov	b,#0x00
	lcall	_Rotate
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:615: Claw_Pos(2);								//close the claw
	mov	dptr,#0x0002
	lcall	_Claw_Pos
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:616: dir_count = 0;
	mov	dptr,#_dir_count
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:617: break_when_dir_found = 1;
	setb	_break_when_dir_found
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:618: Follow_Tape(&gnd_VL,&gnd_VM,&gnd_VR);		//exits when direction is found
	mov	_Follow_Tape_PARM_2,#_autonomous_prime_gnd_VM_1_162
	mov	(_Follow_Tape_PARM_2 + 1),#(_autonomous_prime_gnd_VM_1_162 >> 8)
	mov	(_Follow_Tape_PARM_2 + 2),#0x00
	mov	_Follow_Tape_PARM_3,#_autonomous_prime_gnd_VR_1_162
	mov	(_Follow_Tape_PARM_3 + 1),#(_autonomous_prime_gnd_VR_1_162 >> 8)
	mov	(_Follow_Tape_PARM_3 + 2),#0x00
	mov	dptr,#_autonomous_prime_gnd_VL_1_162
	mov	b,#0x00
	lcall	_Follow_Tape
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:619: find_bridge_flag = 1;						//tell follow_tape to find the bridge
	setb	_find_bridge_flag
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:620: circ2 = 0;									//looking for first circle
	clr	_circ2
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:621: Follow_Tape(&gnd_VL,&gnd_VM,&gnd_VR);		//exits when it has found the first circle (does not have an object)
	mov	_Follow_Tape_PARM_2,#_autonomous_prime_gnd_VM_1_162
	mov	(_Follow_Tape_PARM_2 + 1),#(_autonomous_prime_gnd_VM_1_162 >> 8)
	mov	(_Follow_Tape_PARM_2 + 2),#0x00
	mov	_Follow_Tape_PARM_3,#_autonomous_prime_gnd_VR_1_162
	mov	(_Follow_Tape_PARM_3 + 1),#(_autonomous_prime_gnd_VR_1_162 >> 8)
	mov	(_Follow_Tape_PARM_3 + 2),#0x00
	mov	dptr,#_autonomous_prime_gnd_VL_1_162
	mov	b,#0x00
	lcall	_Follow_Tape
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:623: stop();
	lcall	_stop
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:624: waitms(500);
	mov	dptr,#0x01F4
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:625: return;                                     //exit the program
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function '_c51_external_startup'
;------------------------------------------------------------
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\main\test.c:75: char _c51_external_startup (void)
;	-----------------------------------------
;	 function _c51_external_startup
;	-----------------------------------------
__c51_external_startup:
;	D:\School\Elec 291\Project 2\mcar\main\test.c:78: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	D:\School\Elec 291\Project 2\mcar\main\test.c:79: WDTCN = 0xDE; //First key
	mov	_WDTCN,#0xDE
;	D:\School\Elec 291\Project 2\mcar\main\test.c:80: WDTCN = 0xAD; //Second key
	mov	_WDTCN,#0xAD
;	D:\School\Elec 291\Project 2\mcar\main\test.c:82: VDM0CN=0x80;       // enable VDD monitor
	mov	_VDM0CN,#0x80
;	D:\School\Elec 291\Project 2\mcar\main\test.c:83: RSTSRC=0x02|0x04;  // Enable reset on missing clock detector and VDD
	mov	_RSTSRC,#0x06
;	D:\School\Elec 291\Project 2\mcar\main\test.c:90: SFRPAGE = 0x10;
	mov	_SFRPAGE,#0x10
;	D:\School\Elec 291\Project 2\mcar\main\test.c:91: PFE0CN  = 0x20; // SYSCLK < 75 MHz.
	mov	_PFE0CN,#0x20
;	D:\School\Elec 291\Project 2\mcar\main\test.c:92: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	D:\School\Elec 291\Project 2\mcar\main\test.c:113: CLKSEL = 0x00;
	mov	_CLKSEL,#0x00
;	D:\School\Elec 291\Project 2\mcar\main\test.c:114: CLKSEL = 0x00;
	mov	_CLKSEL,#0x00
;	D:\School\Elec 291\Project 2\mcar\main\test.c:115: while ((CLKSEL & 0x80) == 0);
L028001?:
	mov	a,_CLKSEL
	jnb	acc.7,L028001?
;	D:\School\Elec 291\Project 2\mcar\main\test.c:116: CLKSEL = 0x03;
	mov	_CLKSEL,#0x03
;	D:\School\Elec 291\Project 2\mcar\main\test.c:117: CLKSEL = 0x03;
	mov	_CLKSEL,#0x03
;	D:\School\Elec 291\Project 2\mcar\main\test.c:118: while ((CLKSEL & 0x80) == 0);
L028004?:
	mov	a,_CLKSEL
	jnb	acc.7,L028004?
;	D:\School\Elec 291\Project 2\mcar\main\test.c:123: P0MDOUT |= 0x10; // Enable UART0 TX as push-pull output
	orl	_P0MDOUT,#0x10
;	D:\School\Elec 291\Project 2\mcar\main\test.c:124: XBR0     = 0x01; // Enable UART0 on P0.4(TX) and P0.5(RX)                     
	mov	_XBR0,#0x01
;	D:\School\Elec 291\Project 2\mcar\main\test.c:125: XBR1     = 0X00;
	mov	_XBR1,#0x00
;	D:\School\Elec 291\Project 2\mcar\main\test.c:126: XBR2     = 0x41; // Enable crossbar and uart 1
	mov	_XBR2,#0x41
;	D:\School\Elec 291\Project 2\mcar\main\test.c:132: SCON0 = 0x10;
	mov	_SCON0,#0x10
;	D:\School\Elec 291\Project 2\mcar\main\test.c:133: TH1 = 0x100-((SYSCLK/BAUDRATE)/(2L*12L));
	mov	_TH1,#0xE6
;	D:\School\Elec 291\Project 2\mcar\main\test.c:134: TL1 = TH1;      // Init Timer1
	mov	_TL1,_TH1
;	D:\School\Elec 291\Project 2\mcar\main\test.c:135: TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit auto-reload
	anl	_TMOD,#0x0F
;	D:\School\Elec 291\Project 2\mcar\main\test.c:136: TMOD |=  0x20;                       
	orl	_TMOD,#0x20
;	D:\School\Elec 291\Project 2\mcar\main\test.c:137: TR1 = 1; // START Timer1
	setb	_TR1
;	D:\School\Elec 291\Project 2\mcar\main\test.c:138: TI = 1;  // Indicate TX0 ready
	setb	_TI
;	D:\School\Elec 291\Project 2\mcar\main\test.c:141: TMR2CN0=0x00;   // Stop Timer2; Clear TF2;
	mov	_TMR2CN0,#0x00
;	D:\School\Elec 291\Project 2\mcar\main\test.c:142: CKCON0|=0b_0001_0000; // Timer 2 uses the system clock
	orl	_CKCON0,#0x10
;	D:\School\Elec 291\Project 2\mcar\main\test.c:143: TMR2RL=(0x10000L-(SYSCLK/10000L)); // Initialize reload value
	mov	_TMR2RL,#0xE0
	mov	(_TMR2RL >> 8),#0xE3
;	D:\School\Elec 291\Project 2\mcar\main\test.c:144: TMR2=0xffff;   // Set to reload immediately
	mov	_TMR2,#0xFF
	mov	(_TMR2 >> 8),#0xFF
;	D:\School\Elec 291\Project 2\mcar\main\test.c:145: ET2=1;         // Enable Timer2 interrupts
	setb	_ET2
;	D:\School\Elec 291\Project 2\mcar\main\test.c:146: TR2=1;         // Start Timer2 (TMR2CN is bit addressable)
	setb	_TR2
;	D:\School\Elec 291\Project 2\mcar\main\test.c:150: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'UART1_Init'
;------------------------------------------------------------
;baudrate                  Allocated to registers r2 r3 r4 r5 
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\main\test.c:153: void UART1_Init (unsigned long baudrate)
;	-----------------------------------------
;	 function UART1_Init
;	-----------------------------------------
_UART1_Init:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
;	D:\School\Elec 291\Project 2\mcar\main\test.c:155: SFRPAGE = 0x20;
	mov	_SFRPAGE,#0x20
;	D:\School\Elec 291\Project 2\mcar\main\test.c:156: SMOD1 = 0x0C; // no parity, 8 data bits, 1 stop bit
	mov	_SMOD1,#0x0C
;	D:\School\Elec 291\Project 2\mcar\main\test.c:157: SCON1 = 0x10;
	mov	_SCON1,#0x10
;	D:\School\Elec 291\Project 2\mcar\main\test.c:158: SBCON1 =0x00;   // disable baud rate generator
	mov	_SBCON1,#0x00
;	D:\School\Elec 291\Project 2\mcar\main\test.c:159: SBRL1 = 0x10000L-((SYSCLK/baudrate)/(12L*2L));
	mov	__divulong_PARM_2,r2
	mov	(__divulong_PARM_2 + 1),r3
	mov	(__divulong_PARM_2 + 2),r4
	mov	(__divulong_PARM_2 + 3),r5
	mov	dptr,#0xA200
	mov	b,#0x4A
	mov	a,#0x04
	lcall	__divulong
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	__divulong_PARM_2,#0x18
	clr	a
	mov	(__divulong_PARM_2 + 1),a
	mov	(__divulong_PARM_2 + 2),a
	mov	(__divulong_PARM_2 + 3),a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	__divulong
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	clr	a
	clr	c
	subb	a,r2
	mov	r2,a
	clr	a
	subb	a,r3
	mov	r3,a
	mov	a,#0x01
	subb	a,r4
	clr	a
	subb	a,r5
	mov	_SBRL1,r2
	mov	(_SBRL1 >> 8),r3
;	D:\School\Elec 291\Project 2\mcar\main\test.c:160: TI1 = 1; // indicate ready for TX
	setb	_TI1
;	D:\School\Elec 291\Project 2\mcar\main\test.c:161: SBCON1 |= 0x40;   // enable baud rate generator
	orl	_SBCON1,#0x40
;	D:\School\Elec 291\Project 2\mcar\main\test.c:162: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'getchar1'
;------------------------------------------------------------
;c                         Allocated to registers 
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\main\test.c:166: char getchar1 (void)
;	-----------------------------------------
;	 function getchar1
;	-----------------------------------------
_getchar1:
;	D:\School\Elec 291\Project 2\mcar\main\test.c:169: SFRPAGE = 0x20;
	mov	_SFRPAGE,#0x20
;	D:\School\Elec 291\Project 2\mcar\main\test.c:170: while (!RI1);
L030001?:
;	D:\School\Elec 291\Project 2\mcar\main\test.c:171: RI1=0;
	jbc	_RI1,L030008?
	sjmp	L030001?
L030008?:
;	D:\School\Elec 291\Project 2\mcar\main\test.c:173: SCON1&=0b_0011_1111;
	anl	_SCON1,#0x3F
;	D:\School\Elec 291\Project 2\mcar\main\test.c:174: c = SBUF1;
	mov	dpl,_SBUF1
;	D:\School\Elec 291\Project 2\mcar\main\test.c:175: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	D:\School\Elec 291\Project 2\mcar\main\test.c:176: return (c);
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\main\test.c:178: void main (void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	D:\School\Elec 291\Project 2\mcar\main\test.c:190: UART1_Init(300);
	mov	dptr,#0x012C
	clr	a
	mov	b,a
	lcall	_UART1_Init
;	D:\School\Elec 291\Project 2\mcar\main\test.c:191: printf("%2X\n", UART1FCN1);
	mov	r2,_UART1FCN1
	mov	r3,#0x00
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
	add	a,#0xfb
	mov	sp,a
;	D:\School\Elec 291\Project 2\mcar\main\test.c:192: printf("%2X\n", EIE2);
	mov	r2,_EIE2
	mov	r3,#0x00
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
	add	a,#0xfb
	mov	sp,a
;	D:\School\Elec 291\Project 2\mcar\main\test.c:193: while(1)
L031005?:
;	D:\School\Elec 291\Project 2\mcar\main\test.c:195: P3_1 = !P3_1;
	cpl	_P3_1
;	D:\School\Elec 291\Project 2\mcar\main\test.c:197: getchar();
	lcall	_getchar
;	D:\School\Elec 291\Project 2\mcar\main\test.c:198: if(autocar)
	jnb	_autocar,L031002?
;	D:\School\Elec 291\Project 2\mcar\main\test.c:203: x_absolute = 0;
	mov	dptr,#_x_absolute
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\test.c:204: y_absolute = 0;
	mov	dptr,#_y_absolute
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\test.c:205: open = 0;
	clr	_open
;	D:\School\Elec 291\Project 2\mcar\main\test.c:206: close = 0;
	clr	_close
	sjmp	L031003?
L031002?:
;	D:\School\Elec 291\Project 2\mcar\main\test.c:211: manual_mode();
	lcall	_manual_mode
L031003?:
;	D:\School\Elec 291\Project 2\mcar\main\test.c:213: printf("%d %d", TI1, RI1);
	mov	c,_RI1
	clr	a
	rlc	a
	mov	r2,a
	mov	r3,#0x00
	mov	c,_TI1
	clr	a
	rlc	a
	mov	r4,a
	mov	r5,#0x00
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	a,#__str_1
	push	acc
	mov	a,#(__str_1 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
	sjmp	L031005?
	rseg R_CSEG

	rseg R_XINIT
__xinit__x_absolute:
	db 0x00,0x00	; 0
__xinit__y_absolute:
	db 0x00,0x00	; 0
__xinit__no_signal_0:
	db 0x00,0x00	; 0
__xinit__no_signal_1:
	db 0x00,0x00	; 0
__xinit__dir_count:
	db 0x00,0x00	;  0
__xinit__timer_count:
	db 0x00,0x00	; 0
__xinit__sonar_count:
	db 0x00,0x00	; 0
__xinit__sonar_count_2:
	db 0x00,0x00	; 0
__xinit__claw_pos:
	db 0x02,0x00	; 2
__xinit__pwm_count:
	db 0x00	; 0 

	rseg R_CONST
__str_0:
	db '%2X'
	db 0x0A
	db 0x00
__str_1:
	db '%d %d'
	db 0x00

	CSEG

end
