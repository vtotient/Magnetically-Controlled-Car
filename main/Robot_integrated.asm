;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1069 (Apr 23 2015) (MSVC)
; This file was generated Tue Apr 03 13:07:39 2018
;--------------------------------------------------------
$name Robot_integrated
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
	public _prime_sequence
	public _getchar1
	public _manual_mode
	public _Timer2_ISR
	public _UART1_RI
	public _UART1_Init
	public __c51_external_startup
	public _autonomous_prime
	public _Find_Object
	public _Detect_Object
	public _Track_Object
	public _Follow_Tape
	public _Calibrate_LSensors
	public _sonar_op
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
	public _sequence_state
	public _sequence_timer
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
	public _prime_awaken
	public _sequence_timeout
	public _y_dir
	public _x_dir
	public _close
	public _open
	public _boost
	public _autocar
	public _no_signal
	public _parity
	public _Bridge_Rotate_PARM_3
	public _Bridge_Rotate_PARM_2
	public _Rotate_PARM_2
	public _Find_Tape_PARM_2
	public _Follow_Tape_PARM_3
	public _Follow_Tape_PARM_2
	public _Calibrate_LSensors_PARM_3
	public _Calibrate_LSensors_PARM_2
	public _claw_control
	public _Find_Tape
	public _Rotate
	public _Bridge_Rotate
	public _Claw_Pos
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
_Calibrate_LSensors_VL_1_81:
	ds 3
_Follow_Tape_PARM_2:
	ds 3
_Follow_Tape_PARM_3:
	ds 3
_Follow_Tape_gnd_VL_1_93:
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
_Find_Tape_gnd_VM_1_118:
	ds 3
_Rotate_PARM_2:
	ds 3
_Rotate_gnd_VL_1_123:
	ds 3
_Rotate_sloc0_1_0:
	ds 3
_Bridge_Rotate_PARM_2:
	ds 3
_Bridge_Rotate_PARM_3:
	ds 3
_Bridge_Rotate_gnd_VL_1_133:
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
_parity:
	DBIT	1
_no_signal:
	DBIT	1
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
_sequence_timeout:
	DBIT	1
_prime_awaken:
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
_Track_Object_flag_1_110:
	DBIT	1
_Find_Tape_flag_1_119:
	DBIT	1
_autonomous_prime_temp_1_138:
	DBIT	1
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	rseg R_PSEG
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	rseg R_XSEG
_sequence_timer:
	ds 2
_sequence_state:
	ds 2
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
_Calibrate_LSensors_countL_1_82:
	ds 2
_Calibrate_LSensors_countM_1_82:
	ds 2
_Calibrate_LSensors_countR_1_82:
	ds 2
_Calibrate_LSensors_flags_1_82:
	ds 2
_autonomous_prime_gnd_VL_1_138:
	ds 2
_autonomous_prime_gnd_VR_1_138:
	ds 2
_autonomous_prime_gnd_VM_1_138:
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
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:47: volatile bit find_bridge_flag = 0;
	clr	_find_bridge_flag
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:48: volatile bit find_circle1_flag = 0;
	clr	_find_circle1_flag
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:49: volatile bit find_circle2_flag = 0;
	clr	_find_circle2_flag
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:50: volatile bit dir_flag=0;            //set high to indicate that the dir_count has been incremented, wait for flag low
	clr	_dir_flag
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:51: volatile bit break_when_dir_found = 0;
	clr	_break_when_dir_found
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:52: volatile bit circ2 = 0;
	clr	_circ2
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:53: volatile bit sonar_state = 0;
	clr	_sonar_state
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:57: volatile bit counter_above_100 = 0;
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
;Allocation info for local variables in function 'ADC_at_Pin'
;------------------------------------------------------------
;pin                       Allocated to registers 
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:71: unsigned int ADC_at_Pin(unsigned char pin)
;	-----------------------------------------
;	 function ADC_at_Pin
;	-----------------------------------------
_ADC_at_Pin:
	mov	_ADC0MX,dpl
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:74: ADBUSY=1;       // Dummy conversion first to select new pin
	setb	_ADBUSY
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:75: while (ADBUSY); // Wait for dummy conversion to finish
L006001?:
	jb	_ADBUSY,L006001?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:76: ADBUSY = 1;     // Convert voltage at the pin
	setb	_ADBUSY
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:77: while (ADBUSY); // Wait for conversion to complete
L006004?:
	jb	_ADBUSY,L006004?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:78: return (ADC0);
	mov	dpl,_ADC0
	mov	dph,(_ADC0 >> 8)
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Volts_at_Pin'
;------------------------------------------------------------
;pin                       Allocated to registers r2 
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:81: float Volts_at_Pin(unsigned char pin)
;	-----------------------------------------
;	 function Volts_at_Pin
;	-----------------------------------------
_Volts_at_Pin:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:83: return ((ADC_at_Pin(pin)*VDD)/0b_0011_1111_1111_1111);
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
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:86: void mot_dir(int ML, int MR)
;	-----------------------------------------
;	 function mot_dir
;	-----------------------------------------
_mot_dir:
	mov	r2,dpl
	mov	r3,dph
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:88: ML_dir = ML;
	mov	a,r2
	orl	a,r3
	add	a,#0xff
	mov	_ML_dir,c
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:89: MR_dir = MR;
	mov	a,_mot_dir_PARM_2
	orl	a,(_mot_dir_PARM_2 + 1)
	add	a,#0xff
	mov	_MR_dir,c
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'stop'
;------------------------------------------------------------
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:92: void stop(void){
;	-----------------------------------------
;	 function stop
;	-----------------------------------------
_stop:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:93: pwmL=0;
	mov	dptr,#_pwmL
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:94: pwmR=0;	
	mov	dptr,#_pwmR
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:95: waitms(100);
	mov	dptr,#0x0064
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'spin_left'
;------------------------------------------------------------
;offset                    Allocated to registers r2 r3 
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:98: void spin_left(int offset)
;	-----------------------------------------
;	 function spin_left
;	-----------------------------------------
_spin_left:
	mov	r2,dpl
	mov	r3,dph
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:100: mot_dir(1,0);
	clr	a
	mov	_mot_dir_PARM_2,a
	mov	(_mot_dir_PARM_2 + 1),a
	mov	dptr,#0x0001
	push	ar2
	push	ar3
	lcall	_mot_dir
	pop	ar3
	pop	ar2
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:101: pwmR = BOOSTPWM+offset;
	mov	dptr,#_pwmR
	mov	a,#0x2D
	add	a,r2
	movx	@dptr,a
	clr	a
	addc	a,r3
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:102: pwmL = BASEPWM+offset;
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
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:106: void spin_right(int offset)
;	-----------------------------------------
;	 function spin_right
;	-----------------------------------------
_spin_right:
	mov	r2,dpl
	mov	r3,dph
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:108: mot_dir(0,1);
	mov	_mot_dir_PARM_2,#0x01
	clr	a
	mov	(_mot_dir_PARM_2 + 1),a
	mov	dptr,#0x0000
	push	ar2
	push	ar3
	lcall	_mot_dir
	pop	ar3
	pop	ar2
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:109: pwmL = BOOSTPWM+offset;
	mov	dptr,#_pwmL
	mov	a,#0x2D
	add	a,r2
	movx	@dptr,a
	clr	a
	addc	a,r3
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:110: pwmR = BASEPWM+offset;	
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
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:113: void debug( void )
;	-----------------------------------------
;	 function debug
;	-----------------------------------------
_debug:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:116: stop();
	lcall	_stop
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:117: while(1);
L012002?:
	sjmp	L012002?
;------------------------------------------------------------
;Allocation info for local variables in function 'claw_control'
;------------------------------------------------------------
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:121: void claw_control(void)
;	-----------------------------------------
;	 function claw_control
;	-----------------------------------------
_claw_control:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:123: if (pwm_count >= 22) {
	mov	dptr,#_pwm_count
	movx	a,@dptr
	mov	r2,a
	cjne	r2,#0x16,L013007?
L013007?:
	jc	L013002?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:124: CLAW_L = 0;
	clr	_P1_7
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:125: CLAW_R = 0;
	clr	_P2_0
	ret
L013002?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:127: CLAW_L = (pwm_count < claw_pos) ? 1 : 0;
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
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:128: CLAW_R = (pwm_count < 27 - claw_pos) ? 1 : 0;
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
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:133: void sonar_op(void)
;	-----------------------------------------
;	 function sonar_op
;	-----------------------------------------
_sonar_op:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:136: Trig = pwm_count >= 50?0:1;
	mov	dptr,#_pwm_count
	movx	a,@dptr
	mov	r2,a
	cjne	r2,#0x32,L014014?
L014014?:
	mov	_P1_0,c
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:139: if (!sonar_state) {
	jb	_sonar_state,L014007?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:140: if (P0_7) {
	jnb	_P0_7,L014009?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:141: sonar_state = 1;
	setb	_sonar_state
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:142: sonar_count = 0;
	mov	dptr,#_sonar_count
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
	ret
L014007?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:144: } else if (P0_7) {
	jnb	_P0_7,L014004?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:145: sonar_count++;
	mov	dptr,#_sonar_count
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
	inc	dptr
	movx	a,@dptr
	addc	a,#0x00
	movx	@dptr,a
	ret
L014004?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:148: sonar_count_2 = sonar_count;
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
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:150: sonar_state = 0;
	clr	_sonar_state
L014009?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Calibrate_LSensors'
;------------------------------------------------------------
;VM                        Allocated with name '_Calibrate_LSensors_PARM_2'
;VR                        Allocated with name '_Calibrate_LSensors_PARM_3'
;VL                        Allocated with name '_Calibrate_LSensors_VL_1_81'
;countL                    Allocated with name '_Calibrate_LSensors_countL_1_82'
;countM                    Allocated with name '_Calibrate_LSensors_countM_1_82'
;countR                    Allocated with name '_Calibrate_LSensors_countR_1_82'
;flags                     Allocated with name '_Calibrate_LSensors_flags_1_82'
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:156: void Calibrate_LSensors(int *VL, int *VM, int *VR)
;	-----------------------------------------
;	 function Calibrate_LSensors
;	-----------------------------------------
_Calibrate_LSensors:
	mov	_Calibrate_LSensors_VL_1_81,dpl
	mov	(_Calibrate_LSensors_VL_1_81 + 1),dph
	mov	(_Calibrate_LSensors_VL_1_81 + 2),b
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:158: xdata short countL=0;
	mov	dptr,#_Calibrate_LSensors_countL_1_82
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:159: xdata short countM=0;
	mov	dptr,#_Calibrate_LSensors_countM_1_82
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:160: xdata short countR=0;
	mov	dptr,#_Calibrate_LSensors_countR_1_82
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:161: xdata short flags =0;
	mov	dptr,#_Calibrate_LSensors_flags_1_82
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:163: main_int1 = 0;
	mov	dptr,#_main_int1
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:165: while (flags != 7) {
L015022?:
	mov	dptr,#_Calibrate_LSensors_flags_1_82
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	cjne	r5,#0x07,L015038?
	cjne	r6,#0x00,L015038?
	ljmp	L015024?
L015038?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:167: if ((flags & 2) != 2) {
	anl	ar5,#0x02
	mov	r6,#0x00
	cjne	r5,#0x02,L015039?
	cjne	r6,#0x00,L015039?
	ljmp	L015007?
L015039?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:168: main_int1 = Volts_at_Pin(QFP32_MUX_P1_6)*1000;
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
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:170: if (abs(*VL - main_int1) <= 50) {
	mov	dpl,_Calibrate_LSensors_VL_1_81
	mov	dph,(_Calibrate_LSensors_VL_1_81 + 1)
	mov	b,(_Calibrate_LSensors_VL_1_81 + 2)
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
	jc	L015002?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:171: countL++;
	mov	dptr,#_Calibrate_LSensors_countL_1_82
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
	inc	dptr
	movx	a,@dptr
	addc	a,#0x00
	movx	@dptr,a
	sjmp	L015003?
L015002?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:173: countL = 0;
	mov	dptr,#_Calibrate_LSensors_countL_1_82
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:174: *VL = main_int1;
	mov	dptr,#_main_int1
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	mov	dpl,_Calibrate_LSensors_VL_1_81
	mov	dph,(_Calibrate_LSensors_VL_1_81 + 1)
	mov	b,(_Calibrate_LSensors_VL_1_81 + 2)
	mov	a,r5
	lcall	__gptrput
	inc	dptr
	mov	a,r6
	lcall	__gptrput
L015003?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:177: if (countL == 10)
	mov	dptr,#_Calibrate_LSensors_countL_1_82
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	cjne	r5,#0x0A,L015007?
	cjne	r6,#0x00,L015007?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:178: flags |= 2;
	mov	dptr,#_Calibrate_LSensors_flags_1_82
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	mov	dptr,#_Calibrate_LSensors_flags_1_82
	mov	a,#0x02
	orl	a,r5
	movx	@dptr,a
	inc	dptr
	mov	a,r6
	movx	@dptr,a
L015007?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:181: if ((flags & 1) != 1) {
	mov	dptr,#_Calibrate_LSensors_flags_1_82
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	anl	ar5,#0x01
	mov	r6,#0x00
	cjne	r5,#0x01,L015043?
	cjne	r6,#0x00,L015043?
	ljmp	L015014?
L015043?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:182: main_int1 = Volts_at_Pin(QFP32_MUX_P1_4)*1000;
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
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:184: if (abs(*VR-main_int1) <= 50) {
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
	jc	L015009?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:185: countR++;
	mov	dptr,#_Calibrate_LSensors_countR_1_82
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
	inc	dptr
	movx	a,@dptr
	addc	a,#0x00
	movx	@dptr,a
	sjmp	L015010?
L015009?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:187: countR =0;
	mov	dptr,#_Calibrate_LSensors_countR_1_82
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:188: *VR = main_int1;
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
L015010?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:191: if (countR == 10)
	mov	dptr,#_Calibrate_LSensors_countR_1_82
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	cjne	r2,#0x0A,L015014?
	cjne	r3,#0x00,L015014?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:192: flags |= 1;
	mov	dptr,#_Calibrate_LSensors_flags_1_82
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	mov	dptr,#_Calibrate_LSensors_flags_1_82
	mov	a,#0x01
	orl	a,r2
	movx	@dptr,a
	inc	dptr
	mov	a,r3
	movx	@dptr,a
L015014?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:195: if ((flags & 4) != 4) {
	mov	dptr,#_Calibrate_LSensors_flags_1_82
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	anl	ar2,#0x04
	mov	r3,#0x00
	cjne	r2,#0x04,L015047?
	cjne	r3,#0x00,L015047?
	ljmp	L015022?
L015047?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:196: main_int1 = Volts_at_Pin(QFP32_MUX_P1_5)*1000;
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
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:198: if (abs(*VM-main_int1) <= 50){
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
	jc	L015016?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:199: countM++;
	mov	dptr,#_Calibrate_LSensors_countM_1_82
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
	inc	dptr
	movx	a,@dptr
	addc	a,#0x00
	movx	@dptr,a
	sjmp	L015017?
L015016?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:201: countM =0;
	mov	dptr,#_Calibrate_LSensors_countM_1_82
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:202: *VM = main_int1;
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
L015017?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:205: if (countM == 10)
	mov	dptr,#_Calibrate_LSensors_countM_1_82
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	cjne	r2,#0x0A,L015049?
	cjne	r3,#0x00,L015049?
	sjmp	L015050?
L015049?:
	ljmp	L015022?
L015050?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:206: flags |= 4;
	mov	dptr,#_Calibrate_LSensors_flags_1_82
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	mov	dptr,#_Calibrate_LSensors_flags_1_82
	mov	a,#0x04
	orl	a,r2
	movx	@dptr,a
	inc	dptr
	mov	a,r3
	movx	@dptr,a
	ljmp	L015022?
L015024?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:209: return;	
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Follow_Tape'
;------------------------------------------------------------
;gnd_VM                    Allocated with name '_Follow_Tape_PARM_2'
;gnd_VR                    Allocated with name '_Follow_Tape_PARM_3'
;gnd_VL                    Allocated with name '_Follow_Tape_gnd_VL_1_93'
;sloc0                     Allocated with name '_Follow_Tape_sloc0_1_0'
;sloc1                     Allocated with name '_Follow_Tape_sloc1_1_0'
;sloc2                     Allocated with name '_Follow_Tape_sloc2_1_0'
;sloc3                     Allocated with name '_Follow_Tape_sloc3_1_0'
;sloc4                     Allocated with name '_Follow_Tape_sloc4_1_0'
;tp_VL                     Allocated with name '_Follow_Tape_tp_VL_1_94'
;tp_VR                     Allocated with name '_Follow_Tape_tp_VR_1_94'
;tp_VM                     Allocated with name '_Follow_Tape_tp_VM_1_94'
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:213: void Follow_Tape(unsigned int *gnd_VL, unsigned int *gnd_VM, unsigned int *gnd_VR)
;	-----------------------------------------
;	 function Follow_Tape
;	-----------------------------------------
_Follow_Tape:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:216: xdata unsigned int tp_VL = *gnd_VL-TAPEOFFSET;
	mov	_Follow_Tape_gnd_VL_1_93,dpl
	mov	(_Follow_Tape_gnd_VL_1_93 + 1),dph
	mov	(_Follow_Tape_gnd_VL_1_93 + 2),b
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
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:217: xdata unsigned int tp_VR = *gnd_VR-TAPEOFFSET;
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
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:218: xdata unsigned int tp_VM = *gnd_VM-TAPEOFFSET;
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
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:221: pwmL = BASEPWM;
	mov	dptr,#_pwmL
	mov	a,#0x19
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:222: pwmR = BASEPWM;
	mov	dptr,#_pwmR
	mov	a,#0x19
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:225: mot_dir(0,0);
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
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:226: dir_flag = 1;
	setb	_dir_flag
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:227: dir_count = 0;
	mov	dptr,#_dir_count
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:229: while (1) {
L016058?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:230: if (Volts_at_Pin(QFP32_MUX_P1_5) * 1000 > tp_VM) {			//if M not on tape
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
	jnz	L016091?
	ljmp	L016030?
L016091?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:232: if (Volts_at_Pin(QFP32_MUX_P1_6) * 1000 < tp_VL) {		//if L on tape
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
	jz	L016015?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:233: mot_dir(1,0);
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
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:234: pwmR = BOOSTPWM; // this main way
	mov	dptr,#_pwmR
	mov	a,#0x2D
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:235: pwmL = BOOSTPWM;
	mov	dptr,#_pwmL
	mov	a,#0x2D
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:238: if (dir_flag == 0) {
	jnb	_dir_flag,L016093?
	ljmp	L016031?
L016093?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:239: if (dir_count < 0) dir_count = 1;
	mov	dptr,#_dir_count
	movx	a,@dptr
	mov	r0,a
	inc	dptr
	movx	a,@dptr
	mov	r1,a
	jnb	acc.7,L016002?
	mov	dptr,#_dir_count
	mov	a,#0x01
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	sjmp	L016003?
L016002?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:240: else dir_count++;
	mov	dptr,#_dir_count
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
	inc	dptr
	movx	a,@dptr
	addc	a,#0x00
	movx	@dptr,a
L016003?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:241: dir_flag = 1;
	setb	_dir_flag
	ljmp	L016031?
L016015?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:243: } else if (Volts_at_Pin(QFP32_MUX_P1_4) * 1000 < tp_VR) { //if R on tape
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
	jz	L016012?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:244: mot_dir(0,1);
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
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:245: pwmL = BOOSTPWM; // this main way
	mov	dptr,#_pwmL
	mov	a,#0x2D
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:246: pwmR = BOOSTPWM;	
	mov	dptr,#_pwmR
	mov	a,#0x2D
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:249: if (dir_flag == 0) {
	jnb	_dir_flag,L016096?
	ljmp	L016031?
L016096?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:250: if (dir_count > 0) dir_count = -1;
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
	jnc	L016007?
	mov	dptr,#_dir_count
	mov	a,#0xFF
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
	sjmp	L016008?
L016007?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:251: else dir_count--;
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
L016008?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:252: dir_flag = 1;
	setb	_dir_flag
	ljmp	L016031?
L016012?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:255: mot_dir(0,0);
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
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:256: pwmL = BASEPWM;
	mov	dptr,#_pwmL
	mov	a,#0x19
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:257: pwmR = BASEPWM;	
	mov	dptr,#_pwmR
	mov	a,#0x19
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	ljmp	L016031?
L016030?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:261: } else if ((Volts_at_Pin(QFP32_MUX_P1_6) * 1000 < tp_VL) && (Volts_at_Pin(QFP32_MUX_P1_4) * 1000 < tp_VR) && (Volts_at_Pin(QFP32_MUX_P1_5) * 1000 < tp_VM) && find_circle2_flag) {
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
	jnz	L016098?
	ljmp	L016024?
L016098?:
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
	jnz	L016099?
	ljmp	L016024?
L016099?:
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
	jz	L016024?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:262: find_circle2_flag = 0;
	jbc	_find_circle2_flag,L016101?
	sjmp	L016024?
L016101?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:263: find_circle1_flag = 0;
	clr	_find_circle1_flag
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:264: waitms(2000);		//move towards the middle of the circle
	mov	dptr,#0x07D0
	lcall	_waitms
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:265: stop();
	lcall	_stop
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:266: Claw_Pos(10);
	mov	dptr,#0x000A
	lcall	_Claw_Pos
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:267: waitms(500);
	mov	dptr,#0x01F4
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:268: break;				//we break so that the program can find the tape again (travel back to the main circle)
	ljmp	_waitms
L016024?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:270: } else if ((Volts_at_Pin(QFP32_MUX_P1_6) * 1000 < tp_VL) && (Volts_at_Pin(QFP32_MUX_P1_4) * 1000 < tp_VR) && (Volts_at_Pin(QFP32_MUX_P1_5) * 1000 < tp_VM) && find_circle1_flag) {
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
	jnz	L016102?
	ljmp	L016018?
L016102?:
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
	jz	L016018?
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
	jz	L016018?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:271: find_circle1_flag = 0;
	jbc	_find_circle1_flag,L016105?
	sjmp	L016018?
L016105?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:272: find_circle2_flag = 0;
	clr	_find_circle2_flag
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:274: break;		
	ret
L016018?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:276: mot_dir(0,0);
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
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:277: pwmL = BASEPWM;
	mov	dptr,#_pwmL
	mov	a,#0x19
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:278: pwmR = BASEPWM;	
	mov	dptr,#_pwmR
	mov	a,#0x19
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
L016031?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:282: if (dir_count >= 10) dir =1;	 //ccw
	mov	dptr,#_dir_count
	movx	a,@dptr
	mov	r0,a
	inc	dptr
	movx	a,@dptr
	mov	r1,a
	clr	c
	mov	a,r0
	subb	a,#0x0A
	mov	a,r1
	xrl	a,#0x80
	subb	a,#0x80
	jc	L016033?
	setb	_dir
L016033?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:283: if (dir_count <= -10) dir =0; //cw
	mov	dptr,#_dir_count
	movx	a,@dptr
	mov	r0,a
	inc	dptr
	movx	a,@dptr
	mov	r1,a
	clr	c
	mov	a,#0xF6
	subb	a,r0
	mov	a,#(0xFF ^ 0x80)
	mov	b,r1
	xrl	b,#0x80
	subb	a,b
	jc	L016035?
	clr	_dir
L016035?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:286: if (find_bridge_flag == 1) {
	jb	_find_bridge_flag,L016108?
	ljmp	L016055?
L016108?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:287: if (dir && (Volts_at_Pin(QFP32_MUX_P1_4) * 1000 < tp_VR) && (Volts_at_Pin(QFP32_MUX_P1_5) * 1000 < tp_VM)) {
	jb	_dir,L016109?
	ljmp	L016040?
L016109?:
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
	jnz	L016110?
	ljmp	L016040?
L016110?:
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
	jz	L016040?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:288: find_bridge_flag = 0;
	clr	_find_bridge_flag
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:289: Bridge_Rotate(gnd_VL,gnd_VM,gnd_VR);	//rotate on to the bridge
	mov	_Bridge_Rotate_PARM_2,_Follow_Tape_sloc0_1_0
	mov	(_Bridge_Rotate_PARM_2 + 1),(_Follow_Tape_sloc0_1_0 + 1)
	mov	(_Bridge_Rotate_PARM_2 + 2),(_Follow_Tape_sloc0_1_0 + 2)
	mov	_Bridge_Rotate_PARM_3,_Follow_Tape_sloc1_1_0
	mov	(_Bridge_Rotate_PARM_3 + 1),(_Follow_Tape_sloc1_1_0 + 1)
	mov	(_Bridge_Rotate_PARM_3 + 2),(_Follow_Tape_sloc1_1_0 + 2)
	mov	dpl,_Follow_Tape_gnd_VL_1_93
	mov	dph,(_Follow_Tape_gnd_VL_1_93 + 1)
	mov	b,(_Follow_Tape_gnd_VL_1_93 + 2)
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
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:292: if (circ2) find_circle2_flag = 1;	
	jnb	_circ2,L016037?
	setb	_find_circle2_flag
	sjmp	L016040?
L016037?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:293: else find_circle1_flag = 1;
	setb	_find_circle1_flag
L016040?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:296: if (!dir && (Volts_at_Pin(QFP32_MUX_P1_6) * 1000 < tp_VL) && (Volts_at_Pin(QFP32_MUX_P1_5) * 1000 < tp_VM)) {
	jnb	_dir,L016113?
	ljmp	L016058?
L016113?:
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
	jnz	L016114?
	ljmp	L016058?
L016114?:
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
	jnz	L016115?
	ljmp	L016058?
L016115?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:297: find_bridge_flag = 0;
	clr	_find_bridge_flag
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:298: Bridge_Rotate(gnd_VL,gnd_VM,gnd_VR);	//rotate on to the bridge
	mov	_Bridge_Rotate_PARM_2,_Follow_Tape_sloc0_1_0
	mov	(_Bridge_Rotate_PARM_2 + 1),(_Follow_Tape_sloc0_1_0 + 1)
	mov	(_Bridge_Rotate_PARM_2 + 2),(_Follow_Tape_sloc0_1_0 + 2)
	mov	_Bridge_Rotate_PARM_3,_Follow_Tape_sloc1_1_0
	mov	(_Bridge_Rotate_PARM_3 + 1),(_Follow_Tape_sloc1_1_0 + 1)
	mov	(_Bridge_Rotate_PARM_3 + 2),(_Follow_Tape_sloc1_1_0 + 2)
	mov	dpl,_Follow_Tape_gnd_VL_1_93
	mov	dph,(_Follow_Tape_gnd_VL_1_93 + 1)
	mov	b,(_Follow_Tape_gnd_VL_1_93 + 2)
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
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:301: if (circ2) find_circle2_flag = 1;
	jnb	_circ2,L016044?
	setb	_find_circle2_flag
	ljmp	L016058?
L016044?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:302: else find_circle1_flag = 1;
	setb	_find_circle1_flag
	ljmp	L016058?
L016055?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:305: } else if ((dir_count >= 10) || (dir_count <= -10) && break_when_dir_found) {
	mov	dptr,#_dir_count
	movx	a,@dptr
	mov	r0,a
	inc	dptr
	movx	a,@dptr
	mov	r1,a
	clr	c
	mov	a,r0
	subb	a,#0x0A
	mov	a,r1
	xrl	a,#0x80
	subb	a,#0x80
	jnc	L016050?
	mov	dptr,#_dir_count
	movx	a,@dptr
	mov	r0,a
	inc	dptr
	movx	a,@dptr
	mov	r1,a
	clr	c
	mov	a,#0xF6
	subb	a,r0
	mov	a,#(0xFF ^ 0x80)
	mov	b,r1
	xrl	b,#0x80
	subb	a,b
	jnc	L016118?
	ljmp	L016058?
L016118?:
	jb	_break_when_dir_found,L016119?
	ljmp	L016058?
L016119?:
L016050?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:306: break_when_dir_found = 0;	//reset the break when dir found flag
	clr	_break_when_dir_found
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:307: break;	//if the find_bridge_flag is not set, and the direction has been found, break (to find object in circle)
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Track_Object'
;------------------------------------------------------------
;IRVR                      Allocated with name '_Track_Object_IRVR_1_110'
;IRVL                      Allocated with name '_Track_Object_IRVL_1_110'
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:312: void Track_Object(void)
;	-----------------------------------------
;	 function Track_Object
;	-----------------------------------------
_Track_Object:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:316: bit flag = 0;
	clr	_Track_Object_flag_1_110
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:317: mot_dir(0,0);
	clr	a
	mov	_mot_dir_PARM_2,a
	mov	(_mot_dir_PARM_2 + 1),a
	mov	dpl,a
	mov	dph,a
	lcall	_mot_dir
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:319: while (!flag) {
L017021?:
	jnb	_Track_Object_flag_1_110,L017038?
	ljmp	L017023?
L017038?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:320: IRVR = Volts_at_Pin(QFP32_MUX_P1_2) * 1000;
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
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:321: IRVL = Volts_at_Pin(QFP32_MUX_P1_3) * 1000;
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
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:323: if ((IRVR > 1000) && (IRVL < 1000)) {
	clr	c
	mov	a,#0xE8
	subb	a,r2
	mov	a,#0x03
	subb	a,r3
	clr	a
	rlc	a
	mov	r6,a
	jz	L017016?
	clr	c
	mov	a,r4
	subb	a,#0xE8
	mov	a,r5
	subb	a,#0x03
	jnc	L017016?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:324: pwmL = SLOWPWM;
	mov	dptr,#_pwmL
	mov	a,#0x05
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:325: pwmR = BOOSTPWM;	
	mov	dptr,#_pwmR
	mov	a,#0x2D
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	ljmp	L017017?
L017016?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:326: } else if ((IRVL > 1000) && (IRVR < 1000)) {
	clr	c
	mov	a,#0xE8
	subb	a,r4
	mov	a,#0x03
	subb	a,r5
	clr	a
	rlc	a
	mov	r7,a
	jz	L017012?
	clr	c
	mov	a,r2
	subb	a,#0xE8
	mov	a,r3
	subb	a,#0x03
	jnc	L017012?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:327: pwmL = BOOSTPWM;
	mov	dptr,#_pwmL
	mov	a,#0x2D
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:328: pwmR = SLOWPWM;	
	mov	dptr,#_pwmR
	mov	a,#0x05
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	sjmp	L017017?
L017012?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:329: } else if ((IRVL > 1000) && (IRVR > 1000)) {
	mov	a,r7
	jz	L017008?
	mov	a,r6
	jz	L017008?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:330: if (sonar_count_2 < 30) {
	mov	dptr,#_sonar_count_2
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	clr	c
	mov	a,r6
	subb	a,#0x1E
	mov	a,r7
	subb	a,#0x00
	jnc	L017002?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:331: pwmL = BOOSTPWM; //approach the object quickly
	mov	dptr,#_pwmL
	mov	a,#0x2D
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:332: pwmR = BOOSTPWM;
	mov	dptr,#_pwmR
	mov	a,#0x2D
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	sjmp	L017017?
L017002?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:334: pwmL = BASEPWM; // temporary just stops
	mov	dptr,#_pwmL
	mov	a,#0x19
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:335: pwmR = BASEPWM;
	mov	dptr,#_pwmR
	mov	a,#0x19
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	sjmp	L017017?
L017008?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:337: } else if ((IRVL < 1000) && (IRVR < 1000)) {
	clr	c
	mov	a,r4
	subb	a,#0xE8
	mov	a,r5
	subb	a,#0x03
	jnc	L017017?
	clr	c
	mov	a,r2
	subb	a,#0xE8
	mov	a,r3
	subb	a,#0x03
	jnc	L017017?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:338: pwmL = BASEPWM; 
	mov	dptr,#_pwmL
	mov	a,#0x19
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:339: pwmR = BASEPWM;	
	mov	dptr,#_pwmR
	mov	a,#0x19
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
L017017?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:342: if (sonar_count_2 < 4)
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
	jc	L017048?
	ljmp	L017021?
L017048?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:343: flag = 1;
	setb	_Track_Object_flag_1_110
	ljmp	L017021?
L017023?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:346: pwmL = BASEPWM; 
	mov	dptr,#_pwmL
	mov	a,#0x19
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:347: pwmR = BASEPWM;	
	mov	dptr,#_pwmR
	mov	a,#0x19
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:348: waitms(300);
	mov	dptr,#0x012C
	lcall	_waitms
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:349: stop();
	lcall	_stop
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:350: Claw_Pos(2);
	mov	dptr,#0x0002
	lcall	_Claw_Pos
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:351: waitms(500);
	mov	dptr,#0x01F4
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'Find_Tape'
;------------------------------------------------------------
;motordir                  Allocated with name '_Find_Tape_PARM_2'
;gnd_VM                    Allocated with name '_Find_Tape_gnd_VM_1_118'
;temp                      Allocated to registers 
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:355: void Find_Tape(unsigned short int *gnd_VM, int motordir)
;	-----------------------------------------
;	 function Find_Tape
;	-----------------------------------------
_Find_Tape:
	mov	_Find_Tape_gnd_VM_1_118,dpl
	mov	(_Find_Tape_gnd_VM_1_118 + 1),dph
	mov	(_Find_Tape_gnd_VM_1_118 + 2),b
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:357: bit flag=0;
	clr	_Find_Tape_flag_1_119
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:360: while (!flag) {
L018004?:
	jnb	_Find_Tape_flag_1_119,L018012?
	ljmp	L018006?
L018012?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:361: if (Volts_at_Pin(QFP32_MUX_P1_5)*1000 < *gnd_VM-TAPEOFFSET) { // found tape, proceed with function
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
	mov	dpl,_Find_Tape_gnd_VM_1_118
	mov	dph,(_Find_Tape_gnd_VM_1_118 + 1)
	mov	b,(_Find_Tape_gnd_VM_1_118 + 2)
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
	jz	L018002?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:362: stop();
	lcall	_stop
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:363: flag = 1;
	setb	_Find_Tape_flag_1_119
	ljmp	L018004?
L018002?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:365: mot_dir(motordir,motordir);
	mov	_mot_dir_PARM_2,_Find_Tape_PARM_2
	mov	(_mot_dir_PARM_2 + 1),(_Find_Tape_PARM_2 + 1)
	mov	dpl,_Find_Tape_PARM_2
	mov	dph,(_Find_Tape_PARM_2 + 1)
	lcall	_mot_dir
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:366: pwmL = BASEPWM;
	mov	dptr,#_pwmL
	mov	a,#0x19
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:367: pwmR = BASEPWM;	
	mov	dptr,#_pwmR
	mov	a,#0x19
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	ljmp	L018004?
L018006?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:370: return;
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Rotate'
;------------------------------------------------------------
;gnd_VR                    Allocated with name '_Rotate_PARM_2'
;gnd_VL                    Allocated with name '_Rotate_gnd_VL_1_123'
;sloc0                     Allocated with name '_Rotate_sloc0_1_0'
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:373: void Rotate(unsigned short int *gnd_VL, unsigned short int *gnd_VR)
;	-----------------------------------------
;	 function Rotate
;	-----------------------------------------
_Rotate:
	mov	_Rotate_gnd_VL_1_123,dpl
	mov	(_Rotate_gnd_VL_1_123 + 1),dph
	mov	(_Rotate_gnd_VL_1_123 + 2),b
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:375: if (Volts_at_Pin(QFP32_MUX_P1_6)*1000 < *gnd_VL-TAPEOFFSET) {
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
	mov	dpl,_Rotate_gnd_VL_1_123
	mov	dph,(_Rotate_gnd_VL_1_123 + 1)
	mov	b,(_Rotate_gnd_VL_1_123 + 2)
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
	jz	L019004?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:376: spin_left(10);
	mov	dptr,#0x000A
	lcall	_spin_left
	ljmp	L019014?
L019004?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:377: } else if (Volts_at_Pin(QFP32_MUX_P1_4)*1000 < *gnd_VR-TAPEOFFSET) {
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
	jz	L019014?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:378: spin_right(10);
	mov	dptr,#0x000A
	lcall	_spin_right
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:381: while((Volts_at_Pin(QFP32_MUX_P1_6)*1000 < *gnd_VL-TAPEOFFSET) ||		
L019014?:
	mov	_Rotate_sloc0_1_0,_Rotate_PARM_2
	mov	(_Rotate_sloc0_1_0 + 1),(_Rotate_PARM_2 + 1)
	mov	(_Rotate_sloc0_1_0 + 2),(_Rotate_PARM_2 + 2)
L019007?:
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
	mov	dpl,_Rotate_gnd_VL_1_123
	mov	dph,(_Rotate_gnd_VL_1_123 + 1)
	mov	b,(_Rotate_gnd_VL_1_123 + 2)
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
	jz	L019019?
	ljmp	L019007?
L019019?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:382: (Volts_at_Pin(QFP32_MUX_P1_4)*1000 < *gnd_VR-TAPEOFFSET)); 
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
	jz	L019020?
	ljmp	L019007?
L019020?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:383: return;
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Detect_Object'
;------------------------------------------------------------
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:386: int Detect_Object (void)
;	-----------------------------------------
;	 function Detect_Object
;	-----------------------------------------
_Detect_Object:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:388: if (((Volts_at_Pin(QFP32_MUX_P1_2) * 1000) < 1000) || ((Volts_at_Pin(QFP32_MUX_P1_3) * 1000) < 1000))
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
	jnz	L020001?
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
	jz	L020002?
L020001?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:389: return 1;
	mov	dptr,#0x0001
	ret
L020002?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:390: if (sonar_count_2 <= 25)
	mov	dptr,#_sonar_count_2
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	clr	c
	mov	a,#0x19
	subb	a,r2
	clr	a
	subb	a,r3
	jc	L020005?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:391: return 1;
	mov	dptr,#0x0001
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:393: return 0;
	ret
L020005?:
	mov	dptr,#0x0000
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Find_Object'
;------------------------------------------------------------
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:396: void Find_Object( void )
;	-----------------------------------------
;	 function Find_Object
;	-----------------------------------------
_Find_Object:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:398: Claw_Pos (10);
	mov	dptr,#0x000A
	lcall	_Claw_Pos
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:399: stop();
	lcall	_stop
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:400: waitms(500);
	mov	dptr,#0x01F4
	lcall	_waitms
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:403: if (dir) {
	jnb	_dir,L021002?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:405: mot_dir(1,0);
	clr	a
	mov	_mot_dir_PARM_2,a
	mov	(_mot_dir_PARM_2 + 1),a
	mov	dptr,#0x0001
	lcall	_mot_dir
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:406: pwmR = BASEPWM-10;
	mov	dptr,#_pwmR
	mov	a,#0x0F
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:407: pwmL = BASEPWM+10;
	mov	dptr,#_pwmL
	mov	a,#0x23
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	sjmp	L021004?
L021002?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:410: mot_dir(0,1);
	mov	_mot_dir_PARM_2,#0x01
	clr	a
	mov	(_mot_dir_PARM_2 + 1),a
	mov	dptr,#0x0000
	lcall	_mot_dir
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:411: pwmR = BASEPWM+10;
	mov	dptr,#_pwmR
	mov	a,#0x23
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:412: pwmL = BASEPWM-10;
	mov	dptr,#_pwmL
	mov	a,#0x0F
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:416: while (Detect_Object() != 1);		//locate an object with the IR sensors
L021004?:
	lcall	_Detect_Object
	mov	r2,dpl
	mov	r3,dph
	cjne	r2,#0x01,L021004?
	cjne	r3,#0x00,L021004?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:417: stop();
	ljmp	_stop
;------------------------------------------------------------
;Allocation info for local variables in function 'Bridge_Rotate'
;------------------------------------------------------------
;gnd_VM                    Allocated with name '_Bridge_Rotate_PARM_2'
;gnd_VR                    Allocated with name '_Bridge_Rotate_PARM_3'
;gnd_VL                    Allocated with name '_Bridge_Rotate_gnd_VL_1_133'
;sloc0                     Allocated with name '_Bridge_Rotate_sloc0_1_0'
;sloc1                     Allocated with name '_Bridge_Rotate_sloc1_1_0'
;sloc2                     Allocated with name '_Bridge_Rotate_sloc2_1_0'
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:420: void Bridge_Rotate(unsigned short int* gnd_VL, unsigned short int* gnd_VM, unsigned short int* gnd_VR)
;	-----------------------------------------
;	 function Bridge_Rotate
;	-----------------------------------------
_Bridge_Rotate:
	mov	_Bridge_Rotate_gnd_VL_1_133,dpl
	mov	(_Bridge_Rotate_gnd_VL_1_133 + 1),dph
	mov	(_Bridge_Rotate_gnd_VL_1_133 + 2),b
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:422: if (dir) {
	jb	_dir,L022021?
	ljmp	L022010?
L022021?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:423: mot_dir(0,1);
	mov	_mot_dir_PARM_2,#0x01
	clr	a
	mov	(_mot_dir_PARM_2 + 1),a
	mov	dptr,#0x0000
	lcall	_mot_dir
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:424: pwmL = BASEPWM;
	mov	dptr,#_pwmL
	mov	a,#0x19
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:425: pwmR = BASEPWM;	
	mov	dptr,#_pwmR
	mov	a,#0x19
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:426: waitms(700);
	mov	dptr,#0x02BC
	lcall	_waitms
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:427: while ((Volts_at_Pin(QFP32_MUX_P1_4)*1000 < *gnd_VR-TAPEOFFSET) || (Volts_at_Pin(QFP32_MUX_P1_5)*1000 < *gnd_VM-TAPEOFFSET));
	mov	_Bridge_Rotate_sloc1_1_0,_Bridge_Rotate_PARM_3
	mov	(_Bridge_Rotate_sloc1_1_0 + 1),(_Bridge_Rotate_PARM_3 + 1)
	mov	(_Bridge_Rotate_sloc1_1_0 + 2),(_Bridge_Rotate_PARM_3 + 2)
	mov	_Bridge_Rotate_sloc0_1_0,_Bridge_Rotate_PARM_2
	mov	(_Bridge_Rotate_sloc0_1_0 + 1),(_Bridge_Rotate_PARM_2 + 1)
	mov	(_Bridge_Rotate_sloc0_1_0 + 2),(_Bridge_Rotate_PARM_2 + 2)
L022002?:
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
	jnz	L022002?
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
	jz	L022023?
	ljmp	L022002?
L022023?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:428: waitms(100);
	mov	dptr,#0x0064
	lcall	_waitms
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:429: Find_Tape(gnd_VM,0);
	clr	a
	mov	_Find_Tape_PARM_2,a
	mov	(_Find_Tape_PARM_2 + 1),a
	mov	dpl,_Bridge_Rotate_sloc0_1_0
	mov	dph,(_Bridge_Rotate_sloc0_1_0 + 1)
	mov	b,(_Bridge_Rotate_sloc0_1_0 + 2)
	ljmp	_Find_Tape
L022010?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:431: mot_dir(1,0);
	clr	a
	mov	_mot_dir_PARM_2,a
	mov	(_mot_dir_PARM_2 + 1),a
	mov	dptr,#0x0001
	lcall	_mot_dir
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:432: pwmL = BASEPWM;
	mov	dptr,#_pwmL
	mov	a,#0x19
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:433: pwmR = BASEPWM;	
	mov	dptr,#_pwmR
	mov	a,#0x19
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:434: waitms(700);
	mov	dptr,#0x02BC
	lcall	_waitms
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:435: while ((Volts_at_Pin(QFP32_MUX_P1_6)*1000 < *gnd_VL-TAPEOFFSET) || (Volts_at_Pin(QFP32_MUX_P1_5)*1000 < *gnd_VM-TAPEOFFSET));
	mov	r5,_Bridge_Rotate_PARM_2
	mov	r6,(_Bridge_Rotate_PARM_2 + 1)
	mov	r7,(_Bridge_Rotate_PARM_2 + 2)
L022006?:
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
	mov	dpl,_Bridge_Rotate_gnd_VL_1_133
	mov	dph,(_Bridge_Rotate_gnd_VL_1_133 + 1)
	mov	b,(_Bridge_Rotate_gnd_VL_1_133 + 2)
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
	jz	L022024?
	ljmp	L022006?
L022024?:
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
	jz	L022025?
	ljmp	L022006?
L022025?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:436: waitms(100);
	mov	dptr,#0x0064
	push	ar5
	push	ar6
	push	ar7
	lcall	_waitms
	pop	ar7
	pop	ar6
	pop	ar5
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:437: Find_Tape(gnd_VM,0);
	clr	a
	mov	_Find_Tape_PARM_2,a
	mov	(_Find_Tape_PARM_2 + 1),a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:439: return;
	ljmp	_Find_Tape
;------------------------------------------------------------
;Allocation info for local variables in function 'autonomous_prime'
;------------------------------------------------------------
;gnd_VL                    Allocated with name '_autonomous_prime_gnd_VL_1_138'
;gnd_VR                    Allocated with name '_autonomous_prime_gnd_VR_1_138'
;gnd_VM                    Allocated with name '_autonomous_prime_gnd_VM_1_138'
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:442: void autonomous_prime(void)
;	-----------------------------------------
;	 function autonomous_prime
;	-----------------------------------------
_autonomous_prime:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:450: find_bridge_flag = 0;
	clr	_find_bridge_flag
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:451: Calibrate_LSensors(&gnd_VL,&gnd_VM,&gnd_VR);	
	mov	_Calibrate_LSensors_PARM_2,#_autonomous_prime_gnd_VM_1_138
	mov	(_Calibrate_LSensors_PARM_2 + 1),#(_autonomous_prime_gnd_VM_1_138 >> 8)
	mov	(_Calibrate_LSensors_PARM_2 + 2),#0x00
	mov	_Calibrate_LSensors_PARM_3,#_autonomous_prime_gnd_VR_1_138
	mov	(_Calibrate_LSensors_PARM_3 + 1),#(_autonomous_prime_gnd_VR_1_138 >> 8)
	mov	(_Calibrate_LSensors_PARM_3 + 2),#0x00
	mov	dptr,#_autonomous_prime_gnd_VL_1_138
	mov	b,#0x00
	lcall	_Calibrate_LSensors
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:452: Find_Tape(&gnd_VM,0);		//exits when middle sensor hits tape
	clr	a
	mov	_Find_Tape_PARM_2,a
	mov	(_Find_Tape_PARM_2 + 1),a
	mov	dptr,#_autonomous_prime_gnd_VM_1_138
	mov	b,#0x00
	lcall	_Find_Tape
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:453: Rotate(&gnd_VL,&gnd_VR);			//exits when middle sensor on tape, right and left not
	mov	_Rotate_PARM_2,#_autonomous_prime_gnd_VR_1_138
	mov	(_Rotate_PARM_2 + 1),#(_autonomous_prime_gnd_VR_1_138 >> 8)
	mov	(_Rotate_PARM_2 + 2),#0x00
	mov	dptr,#_autonomous_prime_gnd_VL_1_138
	mov	b,#0x00
	lcall	_Rotate
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:454: break_when_dir_found = 1;
	setb	_break_when_dir_found
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:455: Follow_Tape(&gnd_VL,&gnd_VM,&gnd_VR);		//exits when direction is found
	mov	_Follow_Tape_PARM_2,#_autonomous_prime_gnd_VM_1_138
	mov	(_Follow_Tape_PARM_2 + 1),#(_autonomous_prime_gnd_VM_1_138 >> 8)
	mov	(_Follow_Tape_PARM_2 + 2),#0x00
	mov	_Follow_Tape_PARM_3,#_autonomous_prime_gnd_VR_1_138
	mov	(_Follow_Tape_PARM_3 + 1),#(_autonomous_prime_gnd_VR_1_138 >> 8)
	mov	(_Follow_Tape_PARM_3 + 2),#0x00
	mov	dptr,#_autonomous_prime_gnd_VL_1_138
	mov	b,#0x00
	lcall	_Follow_Tape
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:456: Find_Object();								//exits when an object is detected in front of IR or ultrasonic sensor
	lcall	_Find_Object
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:457: Track_Object();								//exits when claw has been closed on the object
	lcall	_Track_Object
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:459: Find_Tape(&gnd_VM,1);		//exits when middle sensor hits tape (backwards)
	mov	_Find_Tape_PARM_2,#0x01
	clr	a
	mov	(_Find_Tape_PARM_2 + 1),a
	mov	dptr,#_autonomous_prime_gnd_VM_1_138
	mov	b,#0x00
	lcall	_Find_Tape
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:460: Rotate(&gnd_VL,&gnd_VR);			//exits when middle sensor on tape, right and left not
	mov	_Rotate_PARM_2,#_autonomous_prime_gnd_VR_1_138
	mov	(_Rotate_PARM_2 + 1),#(_autonomous_prime_gnd_VR_1_138 >> 8)
	mov	(_Rotate_PARM_2 + 2),#0x00
	mov	dptr,#_autonomous_prime_gnd_VL_1_138
	mov	b,#0x00
	lcall	_Rotate
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:461: dir_count = 0;								//reset direction counter to find new direction
	mov	dptr,#_dir_count
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:462: break_when_dir_found = 1;
	setb	_break_when_dir_found
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:463: Follow_Tape(&gnd_VL,&gnd_VM,&gnd_VR);		//exits when direction is found
	mov	_Follow_Tape_PARM_2,#_autonomous_prime_gnd_VM_1_138
	mov	(_Follow_Tape_PARM_2 + 1),#(_autonomous_prime_gnd_VM_1_138 >> 8)
	mov	(_Follow_Tape_PARM_2 + 2),#0x00
	mov	_Follow_Tape_PARM_3,#_autonomous_prime_gnd_VR_1_138
	mov	(_Follow_Tape_PARM_3 + 1),#(_autonomous_prime_gnd_VR_1_138 >> 8)
	mov	(_Follow_Tape_PARM_3 + 2),#0x00
	mov	dptr,#_autonomous_prime_gnd_VL_1_138
	mov	b,#0x00
	lcall	_Follow_Tape
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:464: find_bridge_flag = 1;						//tell follow_tape to find the bridge
	setb	_find_bridge_flag
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:465: circ2 = 1;									//looking for second circle
	setb	_circ2
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:466: Follow_Tape(&gnd_VL,&gnd_VM,&gnd_VR);		//exits when it has dropped the object in the other circle
	mov	_Follow_Tape_PARM_2,#_autonomous_prime_gnd_VM_1_138
	mov	(_Follow_Tape_PARM_2 + 1),#(_autonomous_prime_gnd_VM_1_138 >> 8)
	mov	(_Follow_Tape_PARM_2 + 2),#0x00
	mov	_Follow_Tape_PARM_3,#_autonomous_prime_gnd_VR_1_138
	mov	(_Follow_Tape_PARM_3 + 1),#(_autonomous_prime_gnd_VR_1_138 >> 8)
	mov	(_Follow_Tape_PARM_3 + 2),#0x00
	mov	dptr,#_autonomous_prime_gnd_VL_1_138
	mov	b,#0x00
	lcall	_Follow_Tape
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:470: Find_Tape(&gnd_VM,1);
	mov	_Find_Tape_PARM_2,#0x01
	clr	a
	mov	(_Find_Tape_PARM_2 + 1),a
	mov	dptr,#_autonomous_prime_gnd_VM_1_138
	mov	b,#0x00
	lcall	_Find_Tape
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:471: Rotate(&gnd_VL,&gnd_VR);			//exits when middle sensor on tape, right and left not
	mov	_Rotate_PARM_2,#_autonomous_prime_gnd_VR_1_138
	mov	(_Rotate_PARM_2 + 1),#(_autonomous_prime_gnd_VR_1_138 >> 8)
	mov	(_Rotate_PARM_2 + 2),#0x00
	mov	dptr,#_autonomous_prime_gnd_VL_1_138
	mov	b,#0x00
	lcall	_Rotate
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:472: Claw_Pos(2);								//close the claw
	mov	dptr,#0x0002
	lcall	_Claw_Pos
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:473: dir_count = 0;
	mov	dptr,#_dir_count
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:474: break_when_dir_found = 1;
	setb	_break_when_dir_found
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:475: Follow_Tape(&gnd_VL,&gnd_VM,&gnd_VR);		//exits when direction is found
	mov	_Follow_Tape_PARM_2,#_autonomous_prime_gnd_VM_1_138
	mov	(_Follow_Tape_PARM_2 + 1),#(_autonomous_prime_gnd_VM_1_138 >> 8)
	mov	(_Follow_Tape_PARM_2 + 2),#0x00
	mov	_Follow_Tape_PARM_3,#_autonomous_prime_gnd_VR_1_138
	mov	(_Follow_Tape_PARM_3 + 1),#(_autonomous_prime_gnd_VR_1_138 >> 8)
	mov	(_Follow_Tape_PARM_3 + 2),#0x00
	mov	dptr,#_autonomous_prime_gnd_VL_1_138
	mov	b,#0x00
	lcall	_Follow_Tape
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:476: find_bridge_flag = 1;						//tell follow_tape to find the bridge
	setb	_find_bridge_flag
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:477: circ2 = 0;									//looking for first circle
	clr	_circ2
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:478: Follow_Tape(&gnd_VL,&gnd_VM,&gnd_VR);		//exits when it has found the first circle (does not have an object)
	mov	_Follow_Tape_PARM_2,#_autonomous_prime_gnd_VM_1_138
	mov	(_Follow_Tape_PARM_2 + 1),#(_autonomous_prime_gnd_VM_1_138 >> 8)
	mov	(_Follow_Tape_PARM_2 + 2),#0x00
	mov	_Follow_Tape_PARM_3,#_autonomous_prime_gnd_VR_1_138
	mov	(_Follow_Tape_PARM_3 + 1),#(_autonomous_prime_gnd_VR_1_138 >> 8)
	mov	(_Follow_Tape_PARM_3 + 2),#0x00
	mov	dptr,#_autonomous_prime_gnd_VL_1_138
	mov	b,#0x00
	lcall	_Follow_Tape
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:481: temp = 0;
	clr	_autonomous_prime_temp_1_138
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:482: while(1) {
L023008?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:483: pwmL = BASEPWM;
	mov	dptr,#_pwmL
	mov	a,#0x19
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:484: pwmR = BASEPWM;
	mov	dptr,#_pwmR
	mov	a,#0x19
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:485: mot_dir(0,0);
	clr	a
	mov	_mot_dir_PARM_2,a
	mov	(_mot_dir_PARM_2 + 1),a
	mov	dpl,a
	mov	dph,a
	lcall	_mot_dir
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:486: waitms(400);			//approach the centre of the circle
	mov	dptr,#0x0190
	lcall	_waitms
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:487: if (temp) dir = 1;
	jnb	_autonomous_prime_temp_1_138,L023002?
	setb	_dir
	sjmp	L023003?
L023002?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:488: else dir = 0;			//used so it goes a different direction each time
	clr	_dir
L023003?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:490: Find_Object();
	lcall	_Find_Object
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:491: Track_Object();
	lcall	_Track_Object
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:492: Find_Tape(&gnd_VM,1);		//exits when middle sensor hits tape (backwards)
	mov	_Find_Tape_PARM_2,#0x01
	clr	a
	mov	(_Find_Tape_PARM_2 + 1),a
	mov	dptr,#_autonomous_prime_gnd_VM_1_138
	mov	b,#0x00
	lcall	_Find_Tape
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:493: Rotate(&gnd_VL,&gnd_VR);			//exits when middle sensor on tape, right and left not
	mov	_Rotate_PARM_2,#_autonomous_prime_gnd_VR_1_138
	mov	(_Rotate_PARM_2 + 1),#(_autonomous_prime_gnd_VR_1_138 >> 8)
	mov	(_Rotate_PARM_2 + 2),#0x00
	mov	dptr,#_autonomous_prime_gnd_VL_1_138
	mov	b,#0x00
	lcall	_Rotate
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:494: dir_count = 0;								//reset direction counter to find new direction
	mov	dptr,#_dir_count
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:495: break_when_dir_found = 1;
	setb	_break_when_dir_found
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:496: Follow_Tape(&gnd_VL,&gnd_VM,&gnd_VR);		//exits when direction is found
	mov	_Follow_Tape_PARM_2,#_autonomous_prime_gnd_VM_1_138
	mov	(_Follow_Tape_PARM_2 + 1),#(_autonomous_prime_gnd_VM_1_138 >> 8)
	mov	(_Follow_Tape_PARM_2 + 2),#0x00
	mov	_Follow_Tape_PARM_3,#_autonomous_prime_gnd_VR_1_138
	mov	(_Follow_Tape_PARM_3 + 1),#(_autonomous_prime_gnd_VR_1_138 >> 8)
	mov	(_Follow_Tape_PARM_3 + 2),#0x00
	mov	dptr,#_autonomous_prime_gnd_VL_1_138
	mov	b,#0x00
	lcall	_Follow_Tape
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:497: find_bridge_flag = 1;						//tell follow_tape to find the bridge
	setb	_find_bridge_flag
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:498: circ2 = 1;									//looking for second circle
	setb	_circ2
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:499: Follow_Tape(&gnd_VL,&gnd_VM,&gnd_VR);		//exits when it has dropped the object in the other circle
	mov	_Follow_Tape_PARM_2,#_autonomous_prime_gnd_VM_1_138
	mov	(_Follow_Tape_PARM_2 + 1),#(_autonomous_prime_gnd_VM_1_138 >> 8)
	mov	(_Follow_Tape_PARM_2 + 2),#0x00
	mov	_Follow_Tape_PARM_3,#_autonomous_prime_gnd_VR_1_138
	mov	(_Follow_Tape_PARM_3 + 1),#(_autonomous_prime_gnd_VR_1_138 >> 8)
	mov	(_Follow_Tape_PARM_3 + 2),#0x00
	mov	dptr,#_autonomous_prime_gnd_VL_1_138
	mov	b,#0x00
	lcall	_Follow_Tape
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:503: Find_Tape(&gnd_VM,1);
	mov	_Find_Tape_PARM_2,#0x01
	clr	a
	mov	(_Find_Tape_PARM_2 + 1),a
	mov	dptr,#_autonomous_prime_gnd_VM_1_138
	mov	b,#0x00
	lcall	_Find_Tape
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:504: Rotate(&gnd_VL,&gnd_VR);			//exits when middle sensor on tape, right and left not
	mov	_Rotate_PARM_2,#_autonomous_prime_gnd_VR_1_138
	mov	(_Rotate_PARM_2 + 1),#(_autonomous_prime_gnd_VR_1_138 >> 8)
	mov	(_Rotate_PARM_2 + 2),#0x00
	mov	dptr,#_autonomous_prime_gnd_VL_1_138
	mov	b,#0x00
	lcall	_Rotate
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:505: Claw_Pos(2);								//close the claw
	mov	dptr,#0x0002
	lcall	_Claw_Pos
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:506: dir_count = 0;
	mov	dptr,#_dir_count
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:507: break_when_dir_found = 1;
	setb	_break_when_dir_found
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:508: Follow_Tape(&gnd_VL,&gnd_VM,&gnd_VR);		//exits when direction is found
	mov	_Follow_Tape_PARM_2,#_autonomous_prime_gnd_VM_1_138
	mov	(_Follow_Tape_PARM_2 + 1),#(_autonomous_prime_gnd_VM_1_138 >> 8)
	mov	(_Follow_Tape_PARM_2 + 2),#0x00
	mov	_Follow_Tape_PARM_3,#_autonomous_prime_gnd_VR_1_138
	mov	(_Follow_Tape_PARM_3 + 1),#(_autonomous_prime_gnd_VR_1_138 >> 8)
	mov	(_Follow_Tape_PARM_3 + 2),#0x00
	mov	dptr,#_autonomous_prime_gnd_VL_1_138
	mov	b,#0x00
	lcall	_Follow_Tape
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:509: find_bridge_flag = 1;						//tell follow_tape to find the bridge
	setb	_find_bridge_flag
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:510: circ2 = 0;									//looking for first circle
	clr	_circ2
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:511: Follow_Tape(&gnd_VL,&gnd_VM,&gnd_VR);		//exits when it has found the first circle (does not have an object)
	mov	_Follow_Tape_PARM_2,#_autonomous_prime_gnd_VM_1_138
	mov	(_Follow_Tape_PARM_2 + 1),#(_autonomous_prime_gnd_VM_1_138 >> 8)
	mov	(_Follow_Tape_PARM_2 + 2),#0x00
	mov	_Follow_Tape_PARM_3,#_autonomous_prime_gnd_VR_1_138
	mov	(_Follow_Tape_PARM_3 + 1),#(_autonomous_prime_gnd_VR_1_138 >> 8)
	mov	(_Follow_Tape_PARM_3 + 2),#0x00
	mov	dptr,#_autonomous_prime_gnd_VL_1_138
	mov	b,#0x00
	lcall	_Follow_Tape
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:513: if (temp) {
	jnb	_autonomous_prime_temp_1_138,L023005?
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:514: stop();
	lcall	_stop
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:515: waitms(1000);
	mov	dptr,#0x03E8
	lcall	_waitms
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:516: break;
	sjmp	L023009?
L023005?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:518: else temp = 1;
	setb	_autonomous_prime_temp_1_138
	ljmp	L023008?
L023009?:
;	D:\School\Elec 291\Project 2\mcar\main\/lewislib.h:520: return;                                     //exit the program
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_c51_external_startup'
;------------------------------------------------------------
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:78: char _c51_external_startup (void)
;	-----------------------------------------
;	 function _c51_external_startup
;	-----------------------------------------
__c51_external_startup:
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:81: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:82: WDTCN = 0xDE; //First key
	mov	_WDTCN,#0xDE
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:83: WDTCN = 0xAD; //Second key
	mov	_WDTCN,#0xAD
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:85: VDM0CN=0x80;       // enable VDD monitor
	mov	_VDM0CN,#0x80
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:86: RSTSRC=0x02|0x04;  // Enable reset on missing clock detector and VDD
	mov	_RSTSRC,#0x06
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:93: SFRPAGE = 0x10;
	mov	_SFRPAGE,#0x10
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:94: PFE0CN  = 0x20; // SYSCLK < 75 MHz.
	mov	_PFE0CN,#0x20
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:95: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:116: CLKSEL = 0x00;
	mov	_CLKSEL,#0x00
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:117: CLKSEL = 0x00;
	mov	_CLKSEL,#0x00
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:118: while ((CLKSEL & 0x80) == 0);
L024001?:
	mov	a,_CLKSEL
	jnb	acc.7,L024001?
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:119: CLKSEL = 0x03;
	mov	_CLKSEL,#0x03
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:120: CLKSEL = 0x03;
	mov	_CLKSEL,#0x03
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:121: while ((CLKSEL & 0x80) == 0);
L024004?:
	mov	a,_CLKSEL
	jnb	acc.7,L024004?
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:126: P0MDOUT |= 0x10; // Enable UART0 TX as push-pull output
	orl	_P0MDOUT,#0x10
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:127: XBR0     = 0x01; // Enable UART0 on P0.4(TX) and P0.5(RX)                     
	mov	_XBR0,#0x01
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:128: XBR1     = 0X00;
	mov	_XBR1,#0x00
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:129: XBR2     = 0x41; // Enable crossbar and uart 1
	mov	_XBR2,#0x41
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:135: SCON0 = 0x10;
	mov	_SCON0,#0x10
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:136: TH1 = 0x100-((SYSCLK/BAUDRATE)/(2L*12L));
	mov	_TH1,#0xE6
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:137: TL1 = TH1;      // Init Timer1
	mov	_TL1,_TH1
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:138: TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit auto-reload
	anl	_TMOD,#0x0F
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:139: TMOD |=  0x20;                       
	orl	_TMOD,#0x20
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:140: TR1 = 1; // START Timer1
	setb	_TR1
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:141: TI = 1;  // Indicate TX0 ready
	setb	_TI
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:144: TMR2CN0=0x00;   // Stop Timer2; Clear TF2;
	mov	_TMR2CN0,#0x00
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:145: CKCON0|=0b_0001_0000; // Timer 2 uses the system clock
	orl	_CKCON0,#0x10
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:146: TMR2RL=(0x10000L-(SYSCLK/10000L)); // Initialize reload value
	mov	_TMR2RL,#0xE0
	mov	(_TMR2RL >> 8),#0xE3
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:147: TMR2=0xffff;   // Set to reload immediately
	mov	_TMR2,#0xFF
	mov	(_TMR2 >> 8),#0xFF
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:148: ET2=1;         // Enable Timer2 interrupts
	setb	_ET2
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:149: TR2=1;         // Start Timer2 (TMR2CN is bit addressable)
	setb	_TR2
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:151: EA = 1;
	setb	_EA
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:153: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'UART1_Init'
;------------------------------------------------------------
;baudrate                  Allocated to registers r2 r3 r4 r5 
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:156: void UART1_Init (unsigned long baudrate)
;	-----------------------------------------
;	 function UART1_Init
;	-----------------------------------------
_UART1_Init:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:158: SFRPAGE = 0x20;
	mov	_SFRPAGE,#0x20
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:159: SMOD1 = 0x0C; // no parity, 8 data bits, 1 stop bit
	mov	_SMOD1,#0x0C
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:160: SCON1 = 0x10;
	mov	_SCON1,#0x10
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:161: SBCON1 =0x00;   // disable baud rate generator
	mov	_SBCON1,#0x00
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:162: SBRL1 = 0x10000L-((SYSCLK/baudrate)/(12L*2L));
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
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:163: TI1 = 1; // indicate ready for TX
	setb	_TI1
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:164: SBCON1 |= 0x40;   // enable baud rate generator
	orl	_SBCON1,#0x40
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:165: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'UART1_RI'
;------------------------------------------------------------
;UART1_char2               Allocated to registers r2 
;i                         Allocated to registers r3 
;j                         Allocated to registers r4 
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:168: void UART1_RI(void) using 3
;	-----------------------------------------
;	 function UART1_RI
;	-----------------------------------------
_UART1_RI:
	using	3
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:171: SFRPAGE = 0x20;
	mov	_SFRPAGE,#0x20
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:175: RI1 = 0;
	clr	_RI1
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:176: SCON1&=0b_0011_1111;    // Clear Overrun and HW Parity error flags
	anl	_SCON1,#0x3F
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:177: UART1_char2 = SBUF1;
	mov	r2,_SBUF1
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:179: for(i=0;i<8;i++)
	mov	r3,#0x00
L026008?:
	cjne	r3,#0x08,L026027?
L026027?:
	jnc	L026011?
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:181: j = (UART1_char2 & 128) / 128;
	mov	a,#0x80
	anl	a,r2
	rl	a
	anl	a,#0x01
	mov	r4,a
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:182: printf("%d", j);
	mov	r5,#0x00
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	a,#__str_0
	push	acc
	mov	a,#(__str_0 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	psw,#0x00
	lcall	_printf
	mov	psw,#0x18
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
	pop	ar3
	pop	ar2
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:183: UART1_char2 <<=1;
	mov	a,r2
	add	a,r2
	mov	r2,a
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:179: for(i=0;i<8;i++)
	inc	r3
	sjmp	L026008?
L026011?:
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:185: printf("\n");
	mov	a,#__str_1
	push	acc
	mov	a,#(__str_1 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	psw,#0x00
	lcall	_printf
	mov	psw,#0x18
	dec	sp
	dec	sp
	dec	sp
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:186: UART1_char2 = SBUF1;
	mov	r2,_SBUF1
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:188: parity = 0;
	clr	_parity
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:189: for (i=0; i<8; i++) {
	mov	r3,#0x00
L026012?:
	cjne	r3,#0x08,L026029?
L026029?:
	jnc	L026015?
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:190: if(UART1_char2 & 1 == 1) parity = !parity;
	mov	a,r2
	jnb	acc.0,L026002?
	cpl	_parity
L026002?:
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:191: UART1_char2 >>= 1;
	mov	a,r2
	clr	c
	rrc	a
	mov	r2,a
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:189: for (i=0; i<8; i++) {
	inc	r3
	sjmp	L026012?
L026015?:
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:193: if(!parity)
	jb	_parity,L026004?
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:196: return;
	ret
L026004?:
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:206: UART1_char2 = SBUF1;
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:207: if(UART1_char2 % 2 == 0)    //Byte 0
	mov	a,_SBUF1
	mov	r2,a
	jb	acc.0,L026006?
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:209: no_signal_0 = 0;     //clear no signal counter
	mov	dptr,#_no_signal_0
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:210: UART1_char2 >>= 1;
	mov	a,r2
	clr	c
	rrc	a
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:213: boost = UART1_char2 % 2;
	mov	r2,a
	rrc	a
	mov	_boost,c
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:214: UART1_char2 >>= 1;
	mov	a,r2
	clr	c
	rrc	a
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:215: autocar = UART1_char2 % 2;
	mov	r2,a
	rrc	a
	mov	_autocar,c
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:216: UART1_char2 >>= 1;
	mov	a,r2
	clr	c
	rrc	a
	mov	r2,a
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:219: y_absolute = UART1_char2 % 8;
	mov	a,#0x07
	anl	a,r2
	mov	dptr,#_y_absolute
	movx	@dptr,a
	inc	dptr
	clr	a
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:220: UART1_char2 >>= 3;
	mov	a,r2
	swap	a
	rl	a
	anl	a,#0x1f
	mov	r2,a
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:221: y_dir = !(UART1_char2 % 2);
	mov	a,#0x01
	anl	a,r2
	mov	r3,a
	cjne	a,#0x01,L026034?
L026034?:
	mov	_y_dir,c
	sjmp	L026007?
L026006?:
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:223: no_signal_1 = 0;    //clear no signal counter
	mov	dptr,#_no_signal_1
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:224: UART1_char2 >>= 1;
	mov	a,r2
	clr	c
	rrc	a
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:227: close = UART1_char2 % 2;
	mov	r2,a
	rrc	a
	mov	_close,c
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:228: UART1_char2 >>= 1;
	mov	a,r2
	clr	c
	rrc	a
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:229: open = UART1_char2 % 2;
	mov	r2,a
	rrc	a
	mov	_open,c
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:230: UART1_char2 >>= 1;
	mov	a,r2
	clr	c
	rrc	a
	mov	r2,a
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:233: x_absolute = UART1_char2 % 8;
	mov	a,#0x07
	anl	a,r2
	mov	r3,a
	mov	dptr,#_x_absolute
	movx	@dptr,a
	inc	dptr
	clr	a
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:234: UART1_char2 >>= 3;
	mov	a,r2
	swap	a
	rl	a
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:235: x_dir = !(UART1_char2 % 2);
	anl	a,#(0x1f&0x01)
	mov	r2,a
	cjne	a,#0x01,L026035?
L026035?:
	mov	_x_dir,c
L026007?:
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:239: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:240: return;
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer2_ISR'
;------------------------------------------------------------
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:243: void Timer2_ISR (void) interrupt 5 using 2
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
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:245: TF2H = 0; // Clear Timer2 interrupt flag
	clr	_TF2H
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:247: pwm_count++;
	mov	dptr,#_pwm_count
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:248: if (pwm_count >= 100) {
	mov	dptr,#_pwm_count
	movx	a,@dptr
	mov	r2,a
	cjne	r2,#0x64,L027031?
L027031?:
	jnc	L027032?
	ljmp	L027012?
L027032?:
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:249: pwm_count=0;
	mov	dptr,#_pwm_count
	clr	a
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:250: counter_above_100 = !counter_above_100;
	cpl	_counter_above_100
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:251: timer_count++;
	mov	dptr,#_timer_count
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
	inc	dptr
	movx	a,@dptr
	addc	a,#0x00
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:252: no_signal_0++;
	mov	dptr,#_no_signal_0
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
	inc	dptr
	movx	a,@dptr
	addc	a,#0x00
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:253: no_signal_1++;
	mov	dptr,#_no_signal_1
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
	inc	dptr
	movx	a,@dptr
	addc	a,#0x00
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:254: if (no_signal_0 >= 250 || no_signal_1 >= 250) no_signal = 1;
	mov	dptr,#_no_signal_0
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	clr	c
	mov	a,r2
	subb	a,#0xFA
	mov	a,r3
	subb	a,#0x00
	jnc	L027001?
	mov	dptr,#_no_signal_1
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	clr	c
	mov	a,r2
	subb	a,#0xFA
	mov	a,r3
	subb	a,#0x00
	jc	L027002?
L027001?:
	setb	_no_signal
	sjmp	L027003?
L027002?:
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:255: else no_signal = 0;
	clr	_no_signal
L027003?:
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:256: if (timer_count >= 50) {        //every 0.5 seconds enter
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
	jc	L027012?
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:257: timer_count =  0;
	mov	dptr,#_timer_count
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:258: dir_flag = 0;
	clr	_dir_flag
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:259: if(!sequence_timeout) sequence_timer++;
	jb	_sequence_timeout,L027006?
	mov	dptr,#_sequence_timer
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
	inc	dptr
	movx	a,@dptr
	addc	a,#0x00
	movx	@dptr,a
L027006?:
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:260: if(sequence_timer >10) sequence_timeout = 1;
	mov	dptr,#_sequence_timer
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	clr	c
	mov	a,#0x0A
	subb	a,r2
	clr	a
	subb	a,r3
	jnc	L027012?
	setb	_sequence_timeout
L027012?:
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:265: if (!ML_dir) {
	jb	_ML_dir,L027014?
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:266: OUTLF = 0;
	clr	_P2_1
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:267: OUTLB =pwm_count>=pwmL?0:1;
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
	sjmp	L027015?
L027014?:
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:269: OUTLB = 0;
	clr	_P2_2
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:270: OUTLF =pwm_count>=pwmL?0:1;
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
L027015?:
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:273: if (MR_dir) {
	jnb	_MR_dir,L027017?
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:274: OUTRF = 0;
	clr	_P2_3
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:275: OUTRB =pwm_count>=pwmR?0:1;
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
	sjmp	L027018?
L027017?:
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:277: OUTRB = 0;
	clr	_P2_4
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:278: OUTRF =pwm_count>=pwmR?0:1;
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
L027018?:
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:281: sonar_op();
	mov	psw,#0x00
	lcall	_sonar_op
	mov	psw,#0x10
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:282: if (!counter_above_100) claw_control();
	jb	_counter_above_100,L027021?
	mov	psw,#0x00
	lcall	_claw_control
	mov	psw,#0x10
L027021?:
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
;Allocation info for local variables in function 'Claw_Pos'
;------------------------------------------------------------
;pos                       Allocated to registers r2 r3 
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:286: void Claw_Pos( short pos ) 
;	-----------------------------------------
;	 function Claw_Pos
;	-----------------------------------------
_Claw_Pos:
	using	0
	mov	r2,dpl
	mov	r3,dph
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:288: claw_pos = pos + 5;
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
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:291: void manual_mode(void)
;	-----------------------------------------
;	 function manual_mode
;	-----------------------------------------
_manual_mode:
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:294: if(open) Claw_Pos(10);
	jnb	_open,L029002?
	mov	dptr,#0x000A
	lcall	_Claw_Pos
L029002?:
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:295: if(close) Claw_Pos(2);
	jnb	_close,L029004?
	mov	dptr,#0x0002
	lcall	_Claw_Pos
L029004?:
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:298: if(no_signal)
	jnb	_no_signal,L029006?
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:300: pwmL = 0;
	mov	dptr,#_pwmL
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:301: pwmR = 0;
	mov	dptr,#_pwmR
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:302: Claw_Pos(-5);
	mov	dptr,#0xFFFB
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:303: return;
	ljmp	_Claw_Pos
L029006?:
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:305: if(y_absolute == 0)     //turn in place
	mov	dptr,#_y_absolute
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	orl	a,r2
	jz	L029031?
	ljmp	L029017?
L029031?:
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:307: main_short1 = x_absolute;
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
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:308: ML_dir = !x_dir;
	mov	c,_x_dir
	cpl	c
	mov	_ML_dir,c
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:309: MR_dir = x_dir;
	mov	c,_x_dir
	mov	_MR_dir,c
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:310: if(boost)
	jnb	_boost,L029008?
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:312: pwmL = main_short1 * BOOST_TURN;  //boost turn speed
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
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:313: pwmR = main_short1 * BOOST_TURN;
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
L029008?:
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:315: pwmL = main_short1 * DFT_TURN;    //default turn speed
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
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:316: pwmR = main_short1 * DFT_TURN;
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
L029017?:
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:319: main_int1 = y_absolute * 100;
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
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:320: main_int2 = main_int1 * x_absolute / TURNING_RADIUS;
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
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:321: if (x_dir)
	jnb	_x_dir,L029011?
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:323: main_int3 = main_int1 + main_int2;      //Left motor
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
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:324: main_int4 = main_int1 - main_int2;      //Right motor
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
	sjmp	L029012?
L029011?:
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:326: main_int3 = main_int1 - main_int2;      //Left motor
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
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:327: main_int4 = main_int1 + main_int2;      //Right motor
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
L029012?:
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:331: ML_dir = y_dir;
	mov	c,_y_dir
	mov	_ML_dir,c
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:332: MR_dir = y_dir;
	mov	c,_y_dir
	mov	_MR_dir,c
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:333: if(boost)
	jnb	_boost,L029014?
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:335: pwmL = main_int3 / BOOST_SPEED;
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
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:336: pwmR = main_int4 / BOOST_SPEED;
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
L029014?:
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:338: pwmL = main_int3 / DFT_SPEED;
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
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:339: pwmR = main_int4 / DFT_SPEED;
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
;Allocation info for local variables in function 'getchar1'
;------------------------------------------------------------
;c                         Allocated to registers 
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:343: char getchar1 (void)
;	-----------------------------------------
;	 function getchar1
;	-----------------------------------------
_getchar1:
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:346: SFRPAGE = 0x20;
	mov	_SFRPAGE,#0x20
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:347: while (!RI1);
L030001?:
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:348: RI1=0;
	jbc	_RI1,L030008?
	sjmp	L030001?
L030008?:
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:350: SCON1&=0b_0011_1111;
	anl	_SCON1,#0x3F
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:351: c = SBUF1;
	mov	dpl,_SBUF1
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:352: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:353: return (c);
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'prime_sequence'
;------------------------------------------------------------
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:356: void prime_sequence(void)
;	-----------------------------------------
;	 function prime_sequence
;	-----------------------------------------
_prime_sequence:
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:358: switch(sequence_state){
	mov	dptr,#_sequence_state
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	clr	c
	mov	a,#0x03
	subb	a,r2
	clr	a
	subb	a,r3
	jnc	L031055?
	ljmp	L031031?
L031055?:
	mov	a,r2
	add	a,r2
	add	a,r2
	mov	dptr,#L031056?
	jmp	@a+dptr
L031056?:
	ljmp	L031001?
	ljmp	L031007?
	ljmp	L031015?
	ljmp	L031023?
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:359: case 0:
L031001?:
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:360: if(open && !close && !boost && !autocar)
	jb	_open,L031057?
	ret
L031057?:
	jnb	_close,L031058?
	ret
L031058?:
	jnb	_boost,L031059?
	ret
L031059?:
	jnb	_autocar,L031060?
	ret
L031060?:
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:362: sequence_state = 1;
	mov	dptr,#_sequence_state
	mov	a,#0x01
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:363: sequence_timer = 0;
	mov	dptr,#_sequence_timer
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:364: sequence_timeout = 0;
	clr	_sequence_timeout
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:366: break;
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:367: case 1:
	ret
L031007?:
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:368: if(!open && close && !boost && !autocar)
	jb	_open,L031009?
	jnb	_close,L031009?
	jb	_boost,L031009?
	jb	_autocar,L031009?
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:369: sequence_state = 2;
	mov	dptr,#_sequence_state
	mov	a,#0x02
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
L031009?:
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:370: if(sequence_timeout) sequence_state = 0;
	jnb	_sequence_timeout,L031033?
	mov	dptr,#_sequence_state
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:371: break;
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:372: case 2:
	ret
L031015?:
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:373: if(!open && !close && boost && !autocar)
	jb	_open,L031017?
	jb	_close,L031017?
	jnb	_boost,L031017?
	jb	_autocar,L031017?
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:374: sequence_state = 3;
	mov	dptr,#_sequence_state
	mov	a,#0x03
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
L031017?:
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:375: if(sequence_timeout) sequence_state = 0;
	jnb	_sequence_timeout,L031033?
	mov	dptr,#_sequence_state
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:376: break;
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:377: case 3:
	ret
L031023?:
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:378: if(!open && !close && !boost && autocar)
	jb	_open,L031025?
	jb	_close,L031025?
	jb	_boost,L031025?
	jnb	_autocar,L031025?
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:380: sequence_state = 0;
	mov	dptr,#_sequence_state
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:381: prime_awaken = 1;
	setb	_prime_awaken
L031025?:
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:383: if(sequence_timeout) sequence_state = 0;
	jnb	_sequence_timeout,L031033?
	mov	dptr,#_sequence_state
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:384: break;
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:385: default:
	ret
L031031?:
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:386: sequence_state = 0;
	mov	dptr,#_sequence_state
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:387: }
L031033?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:391: void main (void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:394: stop();
	lcall	_stop
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:395: autocar = 0;
	clr	_autocar
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:396: sequence_timer = 0;
	mov	dptr,#_sequence_timer
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:397: sequence_state = 0;
	mov	dptr,#_sequence_state
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:398: sequence_timeout = 1;
	setb	_sequence_timeout
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:399: prime_awaken = 0;
	clr	_prime_awaken
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:401: InitPinADC(1, 6); // Configure as analog input    //PR L
	mov	_InitPinADC_PARM_2,#0x06
	mov	dpl,#0x01
	lcall	_InitPinADC
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:402: InitPinADC(1, 5); // Configure as analog input    //PR M
	mov	_InitPinADC_PARM_2,#0x05
	mov	dpl,#0x01
	lcall	_InitPinADC
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:403: InitPinADC(1, 4); // Configure as analog input    //PR R
	mov	_InitPinADC_PARM_2,#0x04
	mov	dpl,#0x01
	lcall	_InitPinADC
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:404: InitPinADC(1, 3); // Configure as analog input    //IR L
	mov	_InitPinADC_PARM_2,#0x03
	mov	dpl,#0x01
	lcall	_InitPinADC
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:405: InitPinADC(1, 2); // Configure as analog input    //IR R
	mov	_InitPinADC_PARM_2,#0x02
	mov	dpl,#0x01
	lcall	_InitPinADC
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:406: InitADC();
	lcall	_InitADC
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:408: UART1_Init(300);
	mov	dptr,#0x012C
	clr	a
	mov	b,a
	lcall	_UART1_Init
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:412: while(1)
L032007?:
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:415: SFRPAGE = 0x20;
	mov	_SFRPAGE,#0x20
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:416: if(RI1) UART1_RI();
	jnb	_RI1,L032002?
	mov	psw,#0x18
	lcall	_UART1_RI
	mov	psw,#0x00
L032002?:
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:417: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:419: prime_sequence();
	lcall	_prime_sequence
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:421: if(prime_awaken)
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:423: prime_awaken = 0;
	jbc	_prime_awaken,L032015?
	sjmp	L032004?
L032015?:
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:427: x_absolute = 0;
	mov	dptr,#_x_absolute
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:428: y_absolute = 0;
	mov	dptr,#_y_absolute
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:429: open = 0;
	clr	_open
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:430: close = 0;
	clr	_close
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:432: autonomous_prime();
	lcall	_autonomous_prime
	sjmp	L032007?
L032004?:
;	D:\School\Elec 291\Project 2\mcar\main\Robot_integrated.c:435: manual_mode();
	lcall	_manual_mode
	sjmp	L032007?
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
	db '%d'
	db 0x00
__str_1:
	db 0x0A
	db 0x00

	CSEG

end
