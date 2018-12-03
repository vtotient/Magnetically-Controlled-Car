;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1069 (Apr 23 2015) (MSVC)
; This file was generated Wed Mar 21 16:25:33 2018
;--------------------------------------------------------
$name accelerometer
$optc51 --model-small
$printf_float
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
	public _InitPinADC_PARM_2
	public _main
	public _Volts_at_Pin
	public _ADC_at_Pin
	public _InitPinADC
	public _waitms
	public _Timer3us
	public _InitADC
	public __c51_external_startup
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
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	rseg R_DSEG
_main_v_1_59:
	ds 8
_main_x_volts_1_59:
	ds 4
_main_y_volts_1_59:
	ds 4
_main_x_1_59:
	ds 1
_main_sloc0_1_0:
	ds 4
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	rseg	R_OSEG
	rseg	R_OSEG
_InitPinADC_PARM_2:
	ds 1
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
	; The linker places a 'ret' at the end of segment R_DINIT.
;--------------------------------------------------------
; code
;--------------------------------------------------------
	rseg R_CSEG
;------------------------------------------------------------
;Allocation info for local variables in function '_c51_external_startup'
;------------------------------------------------------------
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:22: char _c51_external_startup (void)
;	-----------------------------------------
;	 function _c51_external_startup
;	-----------------------------------------
__c51_external_startup:
	using	0
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:25: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:26: WDTCN = 0xDE; //First key
	mov	_WDTCN,#0xDE
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:27: WDTCN = 0xAD; //Second key
	mov	_WDTCN,#0xAD
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:29: VDM0CN=0x80;       // enable VDD monitor
	mov	_VDM0CN,#0x80
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:30: RSTSRC=0x02|0x04;  // Enable reset on missing clock detector and VDD
	mov	_RSTSRC,#0x06
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:37: SFRPAGE = 0x10;
	mov	_SFRPAGE,#0x10
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:38: PFE0CN  = 0x20; // SYSCLK < 75 MHz.
	mov	_PFE0CN,#0x20
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:39: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:60: CLKSEL = 0x00;
	mov	_CLKSEL,#0x00
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:61: CLKSEL = 0x00;
	mov	_CLKSEL,#0x00
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:62: while ((CLKSEL & 0x80) == 0);
L002001?:
	mov	a,_CLKSEL
	jnb	acc.7,L002001?
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:63: CLKSEL = 0x03;
	mov	_CLKSEL,#0x03
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:64: CLKSEL = 0x03;
	mov	_CLKSEL,#0x03
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:65: while ((CLKSEL & 0x80) == 0);
L002004?:
	mov	a,_CLKSEL
	jnb	acc.7,L002004?
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:70: P0MDOUT |= 0x10; // Enable UART0 TX as push-pull output
	orl	_P0MDOUT,#0x10
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:71: XBR0     = 0x01; // Enable UART0 on P0.4(TX) and P0.5(RX)                     
	mov	_XBR0,#0x01
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:72: XBR1     = 0X00;
	mov	_XBR1,#0x00
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:73: XBR2     = 0x40; // Enable crossbar and weak pull-ups
	mov	_XBR2,#0x40
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:79: SCON0 = 0x10;
	mov	_SCON0,#0x10
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:80: TH1 = 0x100-((SYSCLK/BAUDRATE)/(2L*12L));
	mov	_TH1,#0xE6
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:81: TL1 = TH1;      // Init Timer1
	mov	_TL1,_TH1
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:82: TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit auto-reload
	anl	_TMOD,#0x0F
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:83: TMOD |=  0x20;                       
	orl	_TMOD,#0x20
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:84: TR1 = 1; // START Timer1
	setb	_TR1
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:85: TI = 1;  // Indicate TX0 ready
	setb	_TI
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:87: EA = 0;
	clr	_EA
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:88: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'InitADC'
;------------------------------------------------------------
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:91: void InitADC (void)
;	-----------------------------------------
;	 function InitADC
;	-----------------------------------------
_InitADC:
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:93: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:94: ADC0CN1 = 0b_10_000_000; //14-bit,  Right justified no shifting applied, perform and Accumulate 1 conversion.
	mov	_ADC0CN1,#0x80
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:95: ADC0CF0 = 0b_11111_0_00; // SYSCLK/32
	mov	_ADC0CF0,#0xF8
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:96: ADC0CF1 = 0b_0_0_011110; // Same as default for now
	mov	_ADC0CF1,#0x1E
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:97: ADC0CN0 = 0b_0_0_0_0_0_00_0; // Same as default for now
	mov	_ADC0CN0,#0x00
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:98: ADC0CF2 = 0b_0_01_11111 ; // GND pin, Vref=VDD
	mov	_ADC0CF2,#0x3F
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:99: ADC0CN2 = 0b_0_000_0000;  // Same as default for now. ADC0 conversion initiated on write of 1 to ADBUSY.
	mov	_ADC0CN2,#0x00
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:100: ADEN=1; // Enable ADC
	setb	_ADEN
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer3us'
;------------------------------------------------------------
;us                        Allocated to registers r2 
;i                         Allocated to registers r3 
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:104: void Timer3us(unsigned char us)
;	-----------------------------------------
;	 function Timer3us
;	-----------------------------------------
_Timer3us:
	mov	r2,dpl
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:109: CKCON0|=0b_0100_0000;
	orl	_CKCON0,#0x40
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:111: TMR3RL = (-(SYSCLK)/1000000L); // Set Timer3 to overflow in 1us.
	mov	_TMR3RL,#0xB8
	mov	(_TMR3RL >> 8),#0xFF
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:112: TMR3 = TMR3RL;                 // Initialize Timer3 for first overflow
	mov	_TMR3,_TMR3RL
	mov	(_TMR3 >> 8),(_TMR3RL >> 8)
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:114: TMR3CN0 = 0x04;                 // Sart Timer3 and clear overflow flag
	mov	_TMR3CN0,#0x04
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:115: for (i = 0; i < us; i++)       // Count <us> overflows
	mov	r3,#0x00
L004004?:
	clr	c
	mov	a,r3
	subb	a,r2
	jnc	L004007?
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:117: while (!(TMR3CN0 & 0x80));  // Wait for overflow
L004001?:
	mov	a,_TMR3CN0
	jnb	acc.7,L004001?
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:118: TMR3CN0 &= ~(0x80);         // Clear overflow indicator
	anl	_TMR3CN0,#0x7F
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:115: for (i = 0; i < us; i++)       // Count <us> overflows
	inc	r3
	sjmp	L004004?
L004007?:
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:120: TMR3CN0 = 0 ;                   // Stop Timer3 and clear overflow flag
	mov	_TMR3CN0,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'waitms'
;------------------------------------------------------------
;ms                        Allocated to registers r2 r3 
;j                         Allocated to registers r4 r5 
;k                         Allocated to registers r6 
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:123: void waitms (unsigned int ms)
;	-----------------------------------------
;	 function waitms
;	-----------------------------------------
_waitms:
	mov	r2,dpl
	mov	r3,dph
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:127: for(j=0; j<ms; j++)
	mov	r4,#0x00
	mov	r5,#0x00
L005005?:
	clr	c
	mov	a,r4
	subb	a,r2
	mov	a,r5
	subb	a,r3
	jnc	L005009?
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:128: for (k=0; k<4; k++) Timer3us(250);
	mov	r6,#0x00
L005001?:
	cjne	r6,#0x04,L005018?
L005018?:
	jnc	L005007?
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
	sjmp	L005001?
L005007?:
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:127: for(j=0; j<ms; j++)
	inc	r4
	cjne	r4,#0x00,L005005?
	inc	r5
	sjmp	L005005?
L005009?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'InitPinADC'
;------------------------------------------------------------
;pin_num                   Allocated with name '_InitPinADC_PARM_2'
;portno                    Allocated to registers r2 
;mask                      Allocated to registers r3 
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:133: void InitPinADC (unsigned char portno, unsigned char pin_num)
;	-----------------------------------------
;	 function InitPinADC
;	-----------------------------------------
_InitPinADC:
	mov	r2,dpl
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:137: mask=1<<pin_num;
	mov	b,_InitPinADC_PARM_2
	inc	b
	mov	a,#0x01
	sjmp	L006013?
L006011?:
	add	a,acc
L006013?:
	djnz	b,L006011?
	mov	r3,a
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:139: SFRPAGE = 0x20;
	mov	_SFRPAGE,#0x20
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:140: switch (portno)
	cjne	r2,#0x00,L006014?
	sjmp	L006001?
L006014?:
	cjne	r2,#0x01,L006015?
	sjmp	L006002?
L006015?:
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:142: case 0:
	cjne	r2,#0x02,L006005?
	sjmp	L006003?
L006001?:
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:143: P0MDIN &= (~mask); // Set pin as analog input
	mov	a,r3
	cpl	a
	mov	r2,a
	anl	_P0MDIN,a
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:144: P0SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P0SKIP,a
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:145: break;
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:146: case 1:
	sjmp	L006005?
L006002?:
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:147: P1MDIN &= (~mask); // Set pin as analog input
	mov	a,r3
	cpl	a
	mov	r2,a
	anl	_P1MDIN,a
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:148: P1SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P1SKIP,a
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:149: break;
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:150: case 2:
	sjmp	L006005?
L006003?:
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:151: P2MDIN &= (~mask); // Set pin as analog input
	mov	a,r3
	cpl	a
	mov	r2,a
	anl	_P2MDIN,a
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:152: P2SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P2SKIP,a
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:156: }
L006005?:
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:157: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ADC_at_Pin'
;------------------------------------------------------------
;pin                       Allocated to registers 
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:160: unsigned int ADC_at_Pin(unsigned char pin)
;	-----------------------------------------
;	 function ADC_at_Pin
;	-----------------------------------------
_ADC_at_Pin:
	mov	_ADC0MX,dpl
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:163: ADBUSY=1;       // Dummy conversion first to select new pin
	setb	_ADBUSY
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:164: while (ADBUSY); // Wait for dummy conversion to finish
L007001?:
	jb	_ADBUSY,L007001?
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:165: ADBUSY = 1;     // Convert voltage at the pin
	setb	_ADBUSY
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:166: while (ADBUSY); // Wait for conversion to complete
L007004?:
	jb	_ADBUSY,L007004?
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:167: return (ADC0);
	mov	dpl,_ADC0
	mov	dph,(_ADC0 >> 8)
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Volts_at_Pin'
;------------------------------------------------------------
;pin                       Allocated to registers r2 
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:170: float Volts_at_Pin(unsigned char pin)
;	-----------------------------------------
;	 function Volts_at_Pin
;	-----------------------------------------
_Volts_at_Pin:
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:172: return ((ADC_at_Pin(pin)*VDD)/16383.0);
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
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;v                         Allocated with name '_main_v_1_59'
;x_volts                   Allocated with name '_main_x_volts_1_59'
;y_volts                   Allocated with name '_main_y_volts_1_59'
;x                         Allocated with name '_main_x_1_59'
;y                         Allocated to registers r7 
;sloc0                     Allocated with name '_main_sloc0_1_0'
;------------------------------------------------------------
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:175: void main (void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:181: waitms(500); // Give PuTTy a chance to start before sending
	mov	dptr,#0x01F4
	lcall	_waitms
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:182: printf("\x1b[2J"); // Clear screen using ANSI escape sequence.
	mov	a,#__str_0
	push	acc
	mov	a,#(__str_0 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:184: InitPinADC(0, 1); // Configure P2.2 as analog input
	mov	_InitPinADC_PARM_2,#0x01
	mov	dpl,#0x00
	lcall	_InitPinADC
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:185: InitPinADC(0, 2); // Configure P2.3 as analog input
	mov	_InitPinADC_PARM_2,#0x02
	mov	dpl,#0x00
	lcall	_InitPinADC
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:186: InitADC();
	lcall	_InitADC
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:188: while(1)
L009018?:
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:191: v[0] = Volts_at_Pin(QFP32_MUX_P0_1); // x
	mov	dpl,#0x00
	lcall	_Volts_at_Pin
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	_main_v_1_59,r2
	mov	(_main_v_1_59 + 1),r3
	mov	(_main_v_1_59 + 2),r4
	mov	(_main_v_1_59 + 3),r5
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:192: v[1] = Volts_at_Pin(QFP32_MUX_P0_2); // y
	mov	dpl,#0x01
	lcall	_Volts_at_Pin
	mov	_main_sloc0_1_0,dpl
	mov	(_main_sloc0_1_0 + 1),dph
	mov	(_main_sloc0_1_0 + 2),b
	mov	(_main_sloc0_1_0 + 3),a
	mov	(_main_v_1_59 + 0x0004),_main_sloc0_1_0
	mov	((_main_v_1_59 + 0x0004) + 1),(_main_sloc0_1_0 + 1)
	mov	((_main_v_1_59 + 0x0004) + 2),(_main_sloc0_1_0 + 2)
	mov	((_main_v_1_59 + 0x0004) + 3),(_main_sloc0_1_0 + 3)
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:195: x_volts = 16.0 * (v[0] - MID_VOLTS) / (HIGH_VOLTS_X - LOW_VOLTS_X);
	mov	a,#0x85
	push	acc
	mov	a,#0xEB
	push	acc
	mov	a,#0xD1
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_main_v_1_59
	mov	dph,(_main_v_1_59 + 1)
	mov	b,(_main_v_1_59 + 2)
	mov	a,(_main_v_1_59 + 3)
	lcall	___fssub
	mov	r6,dpl
	mov	r7,dph
	mov	r2,b
	mov	r3,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar6
	push	ar7
	push	ar2
	push	ar3
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0x41
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,#0x0A
	push	acc
	mov	a,#0xD7
	push	acc
	mov	a,#0x23
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	_main_x_volts_1_59,dpl
	mov	(_main_x_volts_1_59 + 1),dph
	mov	(_main_x_volts_1_59 + 2),b
	mov	(_main_x_volts_1_59 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:196: y_volts = -16.0 * (v[1] - MID_VOLTS) / (HIGH_VOLTS_Y - LOW_VOLTS_Y);
	mov	a,#0x85
	push	acc
	mov	a,#0xEB
	push	acc
	mov	a,#0xD1
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_main_sloc0_1_0
	mov	dph,(_main_sloc0_1_0 + 1)
	mov	b,(_main_sloc0_1_0 + 2)
	mov	a,(_main_sloc0_1_0 + 3)
	lcall	___fssub
	mov	r6,dpl
	mov	r7,dph
	mov	r2,b
	mov	r3,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar6
	push	ar7
	push	ar2
	push	ar3
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0xC1
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,#0xAE
	push	acc
	mov	a,#0x47
	push	acc
	mov	a,#0x21
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	_main_y_volts_1_59,dpl
	mov	(_main_y_volts_1_59 + 1),dph
	mov	(_main_y_volts_1_59 + 2),b
	mov	(_main_y_volts_1_59 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:199: if (x_volts < 3 && x_volts > -3) x_volts = 0;
	clr	a
	push	acc
	push	acc
	mov	a,#0x40
	push	acc
	push	acc
	mov	dpl,_main_x_volts_1_59
	mov	dph,(_main_x_volts_1_59 + 1)
	mov	b,(_main_x_volts_1_59 + 2)
	mov	a,(_main_x_volts_1_59 + 3)
	lcall	___fslt
	mov	r6,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r6
	jz	L009002?
	clr	a
	push	acc
	push	acc
	mov	a,#0x40
	push	acc
	mov	a,#0xC0
	push	acc
	mov	dpl,_main_x_volts_1_59
	mov	dph,(_main_x_volts_1_59 + 1)
	mov	b,(_main_x_volts_1_59 + 2)
	mov	a,(_main_x_volts_1_59 + 3)
	lcall	___fsgt
	mov	r6,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r6
	jz	L009002?
	mov	_main_x_volts_1_59,#0x00
	mov	(_main_x_volts_1_59 + 1),#0x00
	mov	(_main_x_volts_1_59 + 2),#0x00
	mov	(_main_x_volts_1_59 + 3),#0x00
L009002?:
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:200: if (y_volts < 3 && y_volts > -3) y_volts = 0;
	clr	a
	push	acc
	push	acc
	mov	a,#0x40
	push	acc
	push	acc
	mov	dpl,_main_y_volts_1_59
	mov	dph,(_main_y_volts_1_59 + 1)
	mov	b,(_main_y_volts_1_59 + 2)
	mov	a,(_main_y_volts_1_59 + 3)
	lcall	___fslt
	mov	r6,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r6
	jz	L009005?
	clr	a
	push	acc
	push	acc
	mov	a,#0x40
	push	acc
	mov	a,#0xC0
	push	acc
	mov	dpl,_main_y_volts_1_59
	mov	dph,(_main_y_volts_1_59 + 1)
	mov	b,(_main_y_volts_1_59 + 2)
	mov	a,(_main_y_volts_1_59 + 3)
	lcall	___fsgt
	mov	r6,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r6
	jz	L009005?
	mov	_main_y_volts_1_59,#0x00
	mov	(_main_y_volts_1_59 + 1),#0x00
	mov	(_main_y_volts_1_59 + 2),#0x00
	mov	(_main_y_volts_1_59 + 3),#0x00
L009005?:
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:202: if (x_volts > 9) x_volts = 9;
	clr	a
	push	acc
	push	acc
	mov	a,#0x10
	push	acc
	mov	a,#0x41
	push	acc
	mov	dpl,_main_x_volts_1_59
	mov	dph,(_main_x_volts_1_59 + 1)
	mov	b,(_main_x_volts_1_59 + 2)
	mov	a,(_main_x_volts_1_59 + 3)
	lcall	___fsgt
	mov	r6,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r6
	jz	L009010?
	mov	_main_x_volts_1_59,#0x00
	mov	(_main_x_volts_1_59 + 1),#0x00
	mov	(_main_x_volts_1_59 + 2),#0x10
	mov	(_main_x_volts_1_59 + 3),#0x41
	sjmp	L009011?
L009010?:
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:203: else if (x_volts < -9) x_volts = -9;
	clr	a
	push	acc
	push	acc
	mov	a,#0x10
	push	acc
	mov	a,#0xC1
	push	acc
	mov	dpl,_main_x_volts_1_59
	mov	dph,(_main_x_volts_1_59 + 1)
	mov	b,(_main_x_volts_1_59 + 2)
	mov	a,(_main_x_volts_1_59 + 3)
	lcall	___fslt
	mov	r6,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r6
	jz	L009011?
	mov	_main_x_volts_1_59,#0x00
	mov	(_main_x_volts_1_59 + 1),#0x00
	mov	(_main_x_volts_1_59 + 2),#0x10
	mov	(_main_x_volts_1_59 + 3),#0xC1
L009011?:
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:204: if (y_volts > 8) y_volts = 8;
	clr	a
	push	acc
	push	acc
	push	acc
	mov	a,#0x41
	push	acc
	mov	dpl,_main_y_volts_1_59
	mov	dph,(_main_y_volts_1_59 + 1)
	mov	b,(_main_y_volts_1_59 + 2)
	mov	a,(_main_y_volts_1_59 + 3)
	lcall	___fsgt
	mov	r6,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r6
	jz	L009015?
	mov	_main_y_volts_1_59,#0x00
	mov	(_main_y_volts_1_59 + 1),#0x00
	mov	(_main_y_volts_1_59 + 2),#0x00
	mov	(_main_y_volts_1_59 + 3),#0x41
	sjmp	L009016?
L009015?:
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:205: else if (y_volts < -9) y_volts = -9;
	clr	a
	push	acc
	push	acc
	mov	a,#0x10
	push	acc
	mov	a,#0xC1
	push	acc
	mov	dpl,_main_y_volts_1_59
	mov	dph,(_main_y_volts_1_59 + 1)
	mov	b,(_main_y_volts_1_59 + 2)
	mov	a,(_main_y_volts_1_59 + 3)
	lcall	___fslt
	mov	r6,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r6
	jz	L009016?
	mov	_main_y_volts_1_59,#0x00
	mov	(_main_y_volts_1_59 + 1),#0x00
	mov	(_main_y_volts_1_59 + 2),#0x10
	mov	(_main_y_volts_1_59 + 3),#0xC1
L009016?:
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:208: x = x_volts;
	mov	dpl,_main_x_volts_1_59
	mov	dph,(_main_x_volts_1_59 + 1)
	mov	b,(_main_x_volts_1_59 + 2)
	mov	a,(_main_x_volts_1_59 + 3)
	lcall	___fs2schar
	mov	_main_x_1_59,dpl
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:209: y = y_volts;
	mov	dpl,_main_y_volts_1_59
	mov	dph,(_main_y_volts_1_59 + 1)
	mov	b,(_main_y_volts_1_59 + 2)
	mov	a,(_main_y_volts_1_59 + 3)
	lcall	___fs2schar
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:211: printf ("V@xPin=%7.5fV, V@yPin=%7.5fV, x_volts=%f, y_volts=%f, x=%d, y=%d,   \r", v[0], v[1], x_volts, y_volts, x, y);
	mov	a,dpl
	mov	r7,a
	rlc	a
	subb	a,acc
	mov	r6,a
	mov	a,_main_x_1_59
	mov	r2,a
	rlc	a
	subb	a,acc
	mov	r3,a
	push	ar7
	push	ar6
	push	ar2
	push	ar3
	push	_main_y_volts_1_59
	push	(_main_y_volts_1_59 + 1)
	push	(_main_y_volts_1_59 + 2)
	push	(_main_y_volts_1_59 + 3)
	push	_main_x_volts_1_59
	push	(_main_x_volts_1_59 + 1)
	push	(_main_x_volts_1_59 + 2)
	push	(_main_x_volts_1_59 + 3)
	push	(_main_v_1_59 + 0x0004)
	push	((_main_v_1_59 + 0x0004) + 1)
	push	((_main_v_1_59 + 0x0004) + 2)
	push	((_main_v_1_59 + 0x0004) + 3)
	push	_main_v_1_59
	push	(_main_v_1_59 + 1)
	push	(_main_v_1_59 + 2)
	push	(_main_v_1_59 + 3)
	mov	a,#__str_1
	push	acc
	mov	a,#(__str_1 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xe9
	mov	sp,a
;	D:\School\Elec 291\Project 2\mcar\accelerometer\accelerometer.c:212: waitms(500);
	mov	dptr,#0x01F4
	lcall	_waitms
	ljmp	L009018?
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST
__str_0:
	db 0x1B
	db '[2J'
	db 0x00
__str_1:
	db 'V@xPin=%7.5fV, V@yPin=%7.5fV, x_volts=%f, y_volts=%f, x=%d, '
	db 'y=%d,   '
	db 0x0D
	db 0x00

	CSEG

end
