;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1069 (Apr 23 2015) (MSVC)
; This file was generated Sun Apr 01 17:12:16 2018
;--------------------------------------------------------
$name Robot_copy
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
	public _main
	public _calculate_DC
	public _Serial_ISR
	public _Timer2_ISR
	public __c51_external_startup
	public _fn4
	public _fn3
	public _fn2
	public _fn1
	public _y_dir
	public _x_dir
	public _M2_dir
	public _M1_dir
	public _main_temp
	public _no_signal1_count
	public _no_signal0_count
	public _y_absolute
	public _x_absolute
	public _M2_duty
	public _M1_duty
	public _M2_temp
	public _M1_temp
	public _pwm_count
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
	rbank1 segment data overlay
	rbank2 segment data overlay
	rbank3 segment data overlay
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	rseg R_DSEG
_pwm_count:
	ds 1
_M1_temp:
	ds 2
_M2_temp:
	ds 2
_M1_duty:
	ds 2
_M2_duty:
	ds 2
_x_absolute:
	ds 2
_y_absolute:
	ds 2
_no_signal0_count:
	ds 2
_no_signal1_count:
	ds 2
_main_temp:
	ds 2
_serial_temp:
	ds 1
_Serial_ISR_i_1_51:
	ds 2
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	rseg R_OSEG
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
_M1_dir:
	DBIT	1
_M2_dir:
	DBIT	1
_x_dir:
	DBIT	1
_y_dir:
	DBIT	1
_fn1:
	DBIT	1
_fn2:
	DBIT	1
_fn3:
	DBIT	1
_fn4:
	DBIT	1
_Serial_ISR_parity_1_51:
	DBIT	1
_Serial_ISR_sloc0_1_0:
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
	rseg R_HOME
	rseg R_GSINIT
	rseg R_CSEG
;--------------------------------------------------------
; Reset entry point and interrupt vectors
;--------------------------------------------------------
	CSEG at 0x0000
	ljmp	_crt0
	CSEG at 0x0023
	ljmp	_Serial_ISR
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
;	C:\Users\root\mcar\Robot copy.c:24: unsigned char pwm_count = 0;
	mov	_pwm_count,#0x00
;	C:\Users\root\mcar\Robot copy.c:25: volatile short M1_temp = 0;
	clr	a
	mov	_M1_temp,a
	mov	(_M1_temp + 1),a
;	C:\Users\root\mcar\Robot copy.c:26: volatile short M2_temp = 0;
	clr	a
	mov	_M2_temp,a
	mov	(_M2_temp + 1),a
;	C:\Users\root\mcar\Robot copy.c:27: volatile short M1_duty = 0;
	clr	a
	mov	_M1_duty,a
	mov	(_M1_duty + 1),a
;	C:\Users\root\mcar\Robot copy.c:28: volatile short M2_duty = 0;
	clr	a
	mov	_M2_duty,a
	mov	(_M2_duty + 1),a
;	C:\Users\root\mcar\Robot copy.c:29: volatile unsigned short x_absolute = 0;
	clr	a
	mov	_x_absolute,a
	mov	(_x_absolute + 1),a
;	C:\Users\root\mcar\Robot copy.c:30: volatile unsigned short y_absolute = 0;
	clr	a
	mov	_y_absolute,a
	mov	(_y_absolute + 1),a
;	C:\Users\root\mcar\Robot copy.c:41: volatile short no_signal0_count = 0;
	clr	a
	mov	_no_signal0_count,a
	mov	(_no_signal0_count + 1),a
;	C:\Users\root\mcar\Robot copy.c:42: volatile short no_signal1_count = 0;
	clr	a
	mov	_no_signal1_count,a
	mov	(_no_signal1_count + 1),a
;	C:\Users\root\mcar\Robot copy.c:44: unsigned int main_temp = 0;
	clr	a
	mov	_main_temp,a
	mov	(_main_temp + 1),a
;	C:\Users\root\mcar\Robot copy.c:31: volatile bit M1_dir = 0;
	clr	_M1_dir
;	C:\Users\root\mcar\Robot copy.c:32: volatile bit M2_dir = 0;
	clr	_M2_dir
;	C:\Users\root\mcar\Robot copy.c:33: volatile bit x_dir = 0;
	clr	_x_dir
;	C:\Users\root\mcar\Robot copy.c:34: volatile bit y_dir = 0;
	clr	_y_dir
;	C:\Users\root\mcar\Robot copy.c:36: volatile bit fn1 = 0;
	clr	_fn1
;	C:\Users\root\mcar\Robot copy.c:37: volatile bit fn2 = 0;
	clr	_fn2
;	C:\Users\root\mcar\Robot copy.c:38: volatile bit fn3 = 0;
	clr	_fn3
;	C:\Users\root\mcar\Robot copy.c:39: volatile bit fn4 = 0;
	clr	_fn4
	; The linker places a 'ret' at the end of segment R_DINIT.
;--------------------------------------------------------
; code
;--------------------------------------------------------
	rseg R_CSEG
;------------------------------------------------------------
;Allocation info for local variables in function '_c51_external_startup'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\root\mcar\Robot copy.c:47: char _c51_external_startup (void)
;	-----------------------------------------
;	 function _c51_external_startup
;	-----------------------------------------
__c51_external_startup:
	using	0
;	C:\Users\root\mcar\Robot copy.c:50: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	C:\Users\root\mcar\Robot copy.c:51: WDTCN = 0xDE; //First key
	mov	_WDTCN,#0xDE
;	C:\Users\root\mcar\Robot copy.c:52: WDTCN = 0xAD; //Second key
	mov	_WDTCN,#0xAD
;	C:\Users\root\mcar\Robot copy.c:54: VDM0CN=0x80;       // enable VDD monitor
	mov	_VDM0CN,#0x80
;	C:\Users\root\mcar\Robot copy.c:55: RSTSRC=0x02|0x04;  // Enable reset on missing clock detector and VDD
	mov	_RSTSRC,#0x06
;	C:\Users\root\mcar\Robot copy.c:62: SFRPAGE = 0x10;
	mov	_SFRPAGE,#0x10
;	C:\Users\root\mcar\Robot copy.c:63: PFE0CN  = 0x20; // SYSCLK < 75 MHz.
	mov	_PFE0CN,#0x20
;	C:\Users\root\mcar\Robot copy.c:64: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	C:\Users\root\mcar\Robot copy.c:85: CLKSEL = 0x00;
	mov	_CLKSEL,#0x00
;	C:\Users\root\mcar\Robot copy.c:86: CLKSEL = 0x00;
	mov	_CLKSEL,#0x00
;	C:\Users\root\mcar\Robot copy.c:87: while ((CLKSEL & 0x80) == 0);
L002001?:
	mov	a,_CLKSEL
	jnb	acc.7,L002001?
;	C:\Users\root\mcar\Robot copy.c:88: CLKSEL = 0x03;
	mov	_CLKSEL,#0x03
;	C:\Users\root\mcar\Robot copy.c:89: CLKSEL = 0x03;
	mov	_CLKSEL,#0x03
;	C:\Users\root\mcar\Robot copy.c:90: while ((CLKSEL & 0x80) == 0);
L002004?:
	mov	a,_CLKSEL
	jnb	acc.7,L002004?
;	C:\Users\root\mcar\Robot copy.c:95: P0MDOUT |= 0x10; // Enable UART0 TX as push-pull output
	orl	_P0MDOUT,#0x10
;	C:\Users\root\mcar\Robot copy.c:96: XBR0     = 0x01; // Enable UART0 on P0.4(TX) and P0.5(RX)
	mov	_XBR0,#0x01
;	C:\Users\root\mcar\Robot copy.c:97: XBR1     = 0X00;
	mov	_XBR1,#0x00
;	C:\Users\root\mcar\Robot copy.c:98: XBR2     = 0x40; // Enable crossbar and weak pull-ups
	mov	_XBR2,#0x40
;	C:\Users\root\mcar\Robot copy.c:104: SCON0 = 0x10;
	mov	_SCON0,#0x10
;	C:\Users\root\mcar\Robot copy.c:105: TH1 = 0x100-((SYSCLK/BAUDRATE)/(2L*12L));
	mov	_TH1,#0xE6
;	C:\Users\root\mcar\Robot copy.c:106: TL1 = TH1;      // Init Timer1
	mov	_TL1,_TH1
;	C:\Users\root\mcar\Robot copy.c:107: TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit auto-reload
	anl	_TMOD,#0x0F
;	C:\Users\root\mcar\Robot copy.c:108: TMOD |=  0x20;
	orl	_TMOD,#0x20
;	C:\Users\root\mcar\Robot copy.c:109: TR1 = 1; // START Timer1
	setb	_TR1
;	C:\Users\root\mcar\Robot copy.c:111: TI = 1;  // Indicate TX0 ready
	setb	_TI
;	C:\Users\root\mcar\Robot copy.c:114: TMR2CN0=0x00;   // Stop Timer2; Clear TF2;
	mov	_TMR2CN0,#0x00
;	C:\Users\root\mcar\Robot copy.c:115: CKCON0|=0b_0001_0000; // Timer 2 uses the system clock
	orl	_CKCON0,#0x10
;	C:\Users\root\mcar\Robot copy.c:116: TMR2RL=(0x10000L-(SYSCLK/10000L)); // Initialize reload value
	mov	_TMR2RL,#0xE0
	mov	(_TMR2RL >> 8),#0xE3
;	C:\Users\root\mcar\Robot copy.c:117: TMR2=0xffff;   // Set to reload immediately
	mov	_TMR2,#0xFF
	mov	(_TMR2 >> 8),#0xFF
;	C:\Users\root\mcar\Robot copy.c:118: ET2=1;         // Enable Timer2 interrupts
	setb	_ET2
;	C:\Users\root\mcar\Robot copy.c:119: TR2=1;         // Start Timer2 (TMR2CN is bit addressable)
	setb	_TR2
;	C:\Users\root\mcar\Robot copy.c:121: EA=1; // Enable interrupts
	setb	_EA
;	C:\Users\root\mcar\Robot copy.c:124: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer2_ISR'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\root\mcar\Robot copy.c:127: void Timer2_ISR (void) interrupt 5 using 2
;	-----------------------------------------
;	 function Timer2_ISR
;	-----------------------------------------
_Timer2_ISR:
	using	2
	push	acc
	push	b
	push	psw
	mov	psw,#0x10
;	C:\Users\root\mcar\Robot copy.c:129: TF2H = 0; // Clear Timer2 interrupt flag
	clr	_TF2H
;	C:\Users\root\mcar\Robot copy.c:131: pwm_count++;
	inc	_pwm_count
;	C:\Users\root\mcar\Robot copy.c:132: if(pwm_count>=100) pwm_count=0;
	mov	a,#0x100 - 0x64
	add	a,_pwm_count
	jnc	L003002?
	mov	_pwm_count,#0x00
L003002?:
;	C:\Users\root\mcar\Robot copy.c:134: if(M1_dir)
	jnb	_M1_dir,L003004?
;	C:\Users\root\mcar\Robot copy.c:136: M1FWD = 0;
	clr	_P2_1
;	C:\Users\root\mcar\Robot copy.c:137: M1BWD =pwm_count>=M1_duty ? 0 : 1;
	mov	r2,_pwm_count
	mov	r3,#0x00
	clr	c
	mov	a,r2
	subb	a,_M1_duty
	mov	a,r3
	xrl	a,#0x80
	mov	b,(_M1_duty + 1)
	xrl	b,#0x80
	subb	a,b
	mov	_P2_2,c
	sjmp	L003005?
L003004?:
;	C:\Users\root\mcar\Robot copy.c:139: M1BWD = 0;
	clr	_P2_2
;	C:\Users\root\mcar\Robot copy.c:140: M1FWD =pwm_count>=M1_duty ? 0 : 1;
	mov	r2,_pwm_count
	mov	r3,#0x00
	clr	c
	mov	a,r2
	subb	a,_M1_duty
	mov	a,r3
	xrl	a,#0x80
	mov	b,(_M1_duty + 1)
	xrl	b,#0x80
	subb	a,b
	mov	_P2_1,c
L003005?:
;	C:\Users\root\mcar\Robot copy.c:142: if(M2_dir)
	jnb	_M2_dir,L003007?
;	C:\Users\root\mcar\Robot copy.c:144: M2FWD = 0;
	clr	_P2_3
;	C:\Users\root\mcar\Robot copy.c:145: M2BWD =pwm_count>=M2_duty ? 0 : 1;
	mov	r2,_pwm_count
	mov	r3,#0x00
	clr	c
	mov	a,r2
	subb	a,_M2_duty
	mov	a,r3
	xrl	a,#0x80
	mov	b,(_M2_duty + 1)
	xrl	b,#0x80
	subb	a,b
	mov	_P2_4,c
	sjmp	L003009?
L003007?:
;	C:\Users\root\mcar\Robot copy.c:147: M2BWD = 0;
	clr	_P2_4
;	C:\Users\root\mcar\Robot copy.c:148: M2FWD =pwm_count>=M2_duty ? 0 : 1;
	mov	r2,_pwm_count
	mov	r3,#0x00
	clr	c
	mov	a,r2
	subb	a,_M2_duty
	mov	a,r3
	xrl	a,#0x80
	mov	b,(_M2_duty + 1)
	xrl	b,#0x80
	subb	a,b
	mov	_P2_3,c
L003009?:
	pop	psw
	pop	b
	pop	acc
	reti
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;------------------------------------------------------------
;Allocation info for local variables in function 'Serial_ISR'
;------------------------------------------------------------
;i                         Allocated with name '_Serial_ISR_i_1_51'
;------------------------------------------------------------
;	C:\Users\root\mcar\Robot copy.c:153: void Serial_ISR (void) interrupt 4 using 3
;	-----------------------------------------
;	 function Serial_ISR
;	-----------------------------------------
_Serial_ISR:
	using	3
	push	acc
	push	psw
	mov	psw,#0x18
;	C:\Users\root\mcar\Robot copy.c:158: if(TI)
;	C:\Users\root\mcar\Robot copy.c:160: TI = 0;
	jbc	_TI,L004021?
	sjmp	L004002?
L004021?:
;	C:\Users\root\mcar\Robot copy.c:161: return;
	ljmp	L004011?
L004002?:
;	C:\Users\root\mcar\Robot copy.c:164: RI = 0;
	clr	_RI
;	C:\Users\root\mcar\Robot copy.c:167: parity = 0;
	clr	_Serial_ISR_parity_1_51
;	C:\Users\root\mcar\Robot copy.c:168: serial_temp = SBUF;
	mov	_serial_temp,_SBUF
;	C:\Users\root\mcar\Robot copy.c:169: for (i = 0; i < 8; i++)		//compute total number of 1's in the byte
	mov	_Serial_ISR_i_1_51,#0x08
	clr	a
	mov	(_Serial_ISR_i_1_51 + 1),a
L004010?:
;	C:\Users\root\mcar\Robot copy.c:171: parity = (serial_temp % 2) ? !parity : parity;
	mov	a,_serial_temp
	jnb	acc.0,L004013?
	mov	c,_Serial_ISR_parity_1_51
	cpl	c
	mov	_Serial_ISR_sloc0_1_0,c
	sjmp	L004014?
L004013?:
	mov	c,_Serial_ISR_parity_1_51
	mov	_Serial_ISR_sloc0_1_0,c
L004014?:
	mov	c,_Serial_ISR_sloc0_1_0
	mov	_Serial_ISR_parity_1_51,c
;	C:\Users\root\mcar\Robot copy.c:172: serial_temp/= 2;
	mov	a,_serial_temp
	clr	c
	rrc	a
	mov	_serial_temp,a
	dec	_Serial_ISR_i_1_51
	mov	a,#0xff
	cjne	a,_Serial_ISR_i_1_51,L004023?
	dec	(_Serial_ISR_i_1_51 + 1)
L004023?:
;	C:\Users\root\mcar\Robot copy.c:169: for (i = 0; i < 8; i++)		//compute total number of 1's in the byte
	mov	a,_Serial_ISR_i_1_51
	orl	a,(_Serial_ISR_i_1_51 + 1)
	jnz	L004010?
	mov	_Serial_ISR_i_1_51,#0x08
	clr	a
	mov	(_Serial_ISR_i_1_51 + 1),a
;	C:\Users\root\mcar\Robot copy.c:174: if(!parity) return;			//if odd parity not satisfied, discard byte
	jb	_Serial_ISR_parity_1_51,L004004?
	sjmp	L004011?
L004004?:
;	C:\Users\root\mcar\Robot copy.c:177: serial_temp = SBUF;
;	C:\Users\root\mcar\Robot copy.c:178: if(serial_temp % 2 == 0)
	mov	a,_SBUF
	mov	_serial_temp,a
	jb	acc.0,L004006?
;	C:\Users\root\mcar\Robot copy.c:180: no_signal0_count = 0;
	clr	a
	mov	_no_signal0_count,a
	mov	(_no_signal0_count + 1),a
;	C:\Users\root\mcar\Robot copy.c:181: serial_temp/= 2;
	mov	a,_serial_temp
	clr	c
	rrc	a
;	C:\Users\root\mcar\Robot copy.c:182: fn2 = serial_temp % 2;
	mov	_serial_temp,a
	rrc	a
	mov	_fn2,c
;	C:\Users\root\mcar\Robot copy.c:183: serial_temp/= 2;
	mov	a,_serial_temp
	clr	c
	rrc	a
;	C:\Users\root\mcar\Robot copy.c:184: fn1 = serial_temp % 2;
	mov	_serial_temp,a
	rrc	a
	mov	_fn1,c
;	C:\Users\root\mcar\Robot copy.c:185: serial_temp/= 2;
	mov	a,_serial_temp
	clr	c
	rrc	a
	mov	_serial_temp,a
;	C:\Users\root\mcar\Robot copy.c:186: y_absolute = serial_temp % 8;
	mov	a,#0x07
	anl	a,_serial_temp
	mov	r2,a
	mov	_y_absolute,r2
	mov	(_y_absolute + 1),#0x00
;	C:\Users\root\mcar\Robot copy.c:187: serial_temp/= 8;
	mov	a,_serial_temp
	swap	a
	rl	a
	anl	a,#0x1f
;	C:\Users\root\mcar\Robot copy.c:188: y_dir = serial_temp % 2;
	mov	_serial_temp,a
	rrc	a
	mov	_y_dir,c
	sjmp	L004011?
L004006?:
;	C:\Users\root\mcar\Robot copy.c:190: no_signal1_count = 0;
	clr	a
	mov	_no_signal1_count,a
	mov	(_no_signal1_count + 1),a
;	C:\Users\root\mcar\Robot copy.c:191: serial_temp/= 2;
	mov	a,_serial_temp
	clr	c
	rrc	a
;	C:\Users\root\mcar\Robot copy.c:192: fn4 = serial_temp % 2;
	mov	_serial_temp,a
	rrc	a
	mov	_fn4,c
;	C:\Users\root\mcar\Robot copy.c:193: serial_temp/= 2;
	mov	a,_serial_temp
	clr	c
	rrc	a
;	C:\Users\root\mcar\Robot copy.c:194: fn3 = serial_temp % 2;
	mov	_serial_temp,a
	rrc	a
	mov	_fn3,c
;	C:\Users\root\mcar\Robot copy.c:195: serial_temp/= 2;
	mov	a,_serial_temp
	clr	c
	rrc	a
	mov	_serial_temp,a
;	C:\Users\root\mcar\Robot copy.c:196: x_absolute = serial_temp % 8;
	mov	a,#0x07
	anl	a,_serial_temp
	mov	r2,a
	mov	_x_absolute,r2
	mov	(_x_absolute + 1),#0x00
;	C:\Users\root\mcar\Robot copy.c:197: serial_temp/= 8;
	mov	a,_serial_temp
	swap	a
	rl	a
	anl	a,#0x1f
;	C:\Users\root\mcar\Robot copy.c:198: x_dir = serial_temp % 2;
	mov	_serial_temp,a
	rrc	a
	mov	_x_dir,c
L004011?:
	pop	psw
	pop	acc
	reti
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;------------------------------------------------------------
;Allocation info for local variables in function 'calculate_DC'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\root\mcar\Robot copy.c:203: void calculate_DC(void)
;	-----------------------------------------
;	 function calculate_DC
;	-----------------------------------------
_calculate_DC:
	using	0
;	C:\Users\root\mcar\Robot copy.c:205: if (y_absolute == 0)
	mov	a,_y_absolute
	orl	a,(_y_absolute + 1)
	jnz	L005005?
;	C:\Users\root\mcar\Robot copy.c:207: M1_temp = x_absolute * 7;		//turn
	mov	__mulint_PARM_2,_x_absolute
	mov	(__mulint_PARM_2 + 1),(_x_absolute + 1)
	mov	dptr,#0x0007
	lcall	__mulint
	mov	_M1_temp,dpl
	mov	(_M1_temp + 1),dph
;	C:\Users\root\mcar\Robot copy.c:208: M2_temp = x_absolute * 7;
	mov	__mulint_PARM_2,_x_absolute
	mov	(__mulint_PARM_2 + 1),(_x_absolute + 1)
	mov	dptr,#0x0007
	lcall	__mulint
	mov	_M2_temp,dpl
	mov	(_M2_temp + 1),dph
;	C:\Users\root\mcar\Robot copy.c:209: M1_dir =  x_dir;
	mov	c,_x_dir
	mov	_M1_dir,c
;	C:\Users\root\mcar\Robot copy.c:210: M2_dir = !x_dir;
	mov	c,_x_dir
	cpl	c
	mov	_M2_dir,c
	ljmp	L005006?
L005005?:
;	C:\Users\root\mcar\Robot copy.c:212: main_temp = y_absolute * 100;
	mov	__mulint_PARM_2,_y_absolute
	mov	(__mulint_PARM_2 + 1),(_y_absolute + 1)
	mov	dptr,#0x0064
	lcall	__mulint
	mov	_main_temp,dpl
	mov	(_main_temp + 1),dph
;	C:\Users\root\mcar\Robot copy.c:213: if (x_dir)
	jb	_x_dir,L005022?
	ljmp	L005002?
L005022?:
;	C:\Users\root\mcar\Robot copy.c:215: M1_temp = (main_temp + main_temp * x_absolute / 10) / 7;
	mov	__mulint_PARM_2,_x_absolute
	mov	(__mulint_PARM_2 + 1),(_x_absolute + 1)
	mov	dpl,_main_temp
	mov	dph,(_main_temp + 1)
	lcall	__mulint
	mov	r2,dpl
	mov	r3,dph
	mov	__divuint_PARM_2,#0x0A
	clr	a
	mov	(__divuint_PARM_2 + 1),a
	mov	dpl,r2
	mov	dph,r3
	lcall	__divuint
	mov	r2,dpl
	mov	r3,dph
	mov	a,r2
	add	a,_main_temp
	mov	dpl,a
	mov	a,r3
	addc	a,(_main_temp + 1)
	mov	dph,a
	mov	__divuint_PARM_2,#0x07
	clr	a
	mov	(__divuint_PARM_2 + 1),a
	lcall	__divuint
	mov	_M1_temp,dpl
	mov	(_M1_temp + 1),dph
;	C:\Users\root\mcar\Robot copy.c:216: M2_temp = (main_temp - main_temp * x_absolute / 10) / 7;
	mov	__mulint_PARM_2,_x_absolute
	mov	(__mulint_PARM_2 + 1),(_x_absolute + 1)
	mov	dpl,_main_temp
	mov	dph,(_main_temp + 1)
	lcall	__mulint
	mov	r2,dpl
	mov	r3,dph
	mov	__divuint_PARM_2,#0x0A
	clr	a
	mov	(__divuint_PARM_2 + 1),a
	mov	dpl,r2
	mov	dph,r3
	lcall	__divuint
	mov	r2,dpl
	mov	r3,dph
	mov	a,_main_temp
	clr	c
	subb	a,r2
	mov	dpl,a
	mov	a,(_main_temp + 1)
	subb	a,r3
	mov	dph,a
	mov	__divuint_PARM_2,#0x07
	clr	a
	mov	(__divuint_PARM_2 + 1),a
	lcall	__divuint
	mov	_M2_temp,dpl
	mov	(_M2_temp + 1),dph
	ljmp	L005003?
L005002?:
;	C:\Users\root\mcar\Robot copy.c:218: M1_temp = (main_temp - main_temp * x_absolute / 10) / 7;
	mov	__mulint_PARM_2,_x_absolute
	mov	(__mulint_PARM_2 + 1),(_x_absolute + 1)
	mov	dpl,_main_temp
	mov	dph,(_main_temp + 1)
	lcall	__mulint
	mov	r2,dpl
	mov	r3,dph
	mov	__divuint_PARM_2,#0x0A
	clr	a
	mov	(__divuint_PARM_2 + 1),a
	mov	dpl,r2
	mov	dph,r3
	lcall	__divuint
	mov	r2,dpl
	mov	r3,dph
	mov	a,_main_temp
	clr	c
	subb	a,r2
	mov	dpl,a
	mov	a,(_main_temp + 1)
	subb	a,r3
	mov	dph,a
	mov	__divuint_PARM_2,#0x07
	clr	a
	mov	(__divuint_PARM_2 + 1),a
	lcall	__divuint
	mov	_M1_temp,dpl
	mov	(_M1_temp + 1),dph
;	C:\Users\root\mcar\Robot copy.c:219: M2_temp = (main_temp + main_temp * x_absolute / 10) / 7;
	mov	__mulint_PARM_2,_x_absolute
	mov	(__mulint_PARM_2 + 1),(_x_absolute + 1)
	mov	dpl,_main_temp
	mov	dph,(_main_temp + 1)
	lcall	__mulint
	mov	r2,dpl
	mov	r3,dph
	mov	__divuint_PARM_2,#0x0A
	clr	a
	mov	(__divuint_PARM_2 + 1),a
	mov	dpl,r2
	mov	dph,r3
	lcall	__divuint
	mov	r2,dpl
	mov	r3,dph
	mov	a,r2
	add	a,_main_temp
	mov	dpl,a
	mov	a,r3
	addc	a,(_main_temp + 1)
	mov	dph,a
	mov	__divuint_PARM_2,#0x07
	clr	a
	mov	(__divuint_PARM_2 + 1),a
	lcall	__divuint
	mov	_M2_temp,dpl
	mov	(_M2_temp + 1),dph
L005003?:
;	C:\Users\root\mcar\Robot copy.c:221: M1_temp = (M1_temp > 100) ? 100 : M1_temp;
	clr	c
	mov	a,#0x64
	subb	a,_M1_temp
	clr	a
	xrl	a,#0x80
	mov	b,(_M1_temp + 1)
	xrl	b,#0x80
	subb	a,b
	jnc	L005012?
	mov	r2,#0x64
	mov	r3,#0x00
	sjmp	L005013?
L005012?:
	mov	r2,_M1_temp
	mov	r3,(_M1_temp + 1)
L005013?:
	mov	_M1_temp,r2
	mov	(_M1_temp + 1),r3
;	C:\Users\root\mcar\Robot copy.c:222: M2_temp = (M2_temp > 100) ? 100 : M2_temp;
	clr	c
	mov	a,#0x64
	subb	a,_M2_temp
	clr	a
	xrl	a,#0x80
	mov	b,(_M2_temp + 1)
	xrl	b,#0x80
	subb	a,b
	jnc	L005014?
	mov	r2,#0x64
	mov	r3,#0x00
	sjmp	L005015?
L005014?:
	mov	r2,_M2_temp
	mov	r3,(_M2_temp + 1)
L005015?:
	mov	_M2_temp,r2
	mov	(_M2_temp + 1),r3
;	C:\Users\root\mcar\Robot copy.c:223: M1_dir = y_dir;
	mov	c,_y_dir
	mov	_M1_dir,c
;	C:\Users\root\mcar\Robot copy.c:224: M2_dir = y_dir;
	mov	c,_y_dir
	mov	_M2_dir,c
L005006?:
;	C:\Users\root\mcar\Robot copy.c:227: if (BOOST)
	jnb	_fn2,L005008?
;	C:\Users\root\mcar\Robot copy.c:229: M1_duty = M1_temp;
	mov	_M1_duty,_M1_temp
	mov	(_M1_duty + 1),(_M1_temp + 1)
;	C:\Users\root\mcar\Robot copy.c:230: M2_duty = M2_temp;
	mov	_M2_duty,_M2_temp
	mov	(_M2_duty + 1),(_M2_temp + 1)
	ret
L005008?:
;	C:\Users\root\mcar\Robot copy.c:232: M1_duty = M1_temp / 2;
	mov	__divsint_PARM_2,#0x02
	clr	a
	mov	(__divsint_PARM_2 + 1),a
	mov	dpl,_M1_temp
	mov	dph,(_M1_temp + 1)
	lcall	__divsint
	mov	_M1_duty,dpl
	mov	(_M1_duty + 1),dph
;	C:\Users\root\mcar\Robot copy.c:233: M2_duty = M2_temp / 2;
	mov	__divsint_PARM_2,#0x02
	clr	a
	mov	(__divsint_PARM_2 + 1),a
	mov	dpl,_M2_temp
	mov	dph,(_M2_temp + 1)
	lcall	__divsint
	mov	_M2_duty,dpl
	mov	(_M2_duty + 1),dph
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\root\mcar\Robot copy.c:237: void main(void) using 1
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
	using	1
;	C:\Users\root\mcar\Robot copy.c:239: while(1)
L006002?:
;	C:\Users\root\mcar\Robot copy.c:241: calculate_DC();
	mov	psw,#0x00
	lcall	_calculate_DC
	mov	psw,#0x08
	sjmp	L006002?
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST

	CSEG

end
