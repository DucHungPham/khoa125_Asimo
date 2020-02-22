opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 10920"

opt pagewidth 120

	opt pm

	processor	16F685
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
	FNCALL	_main,_sys_init
	FNCALL	_main,_gpio_init
	FNCALL	_main,_timer_init
	FNCALL	_main,_int_init
	FNCALL	_main,_eepromWriteByte
	FNCALL	_main,_SET_EPWM_ON
	FNCALL	_main,_eepromReadByte
	FNCALL	_main,_eepromReadBlock
	FNCALL	_main,_setState
	FNCALL	_main,_get_RFID
	FNCALL	_main,_id_search
	FNCALL	_main,_id_clear
	FNCALL	_main,_beep
	FNCALL	_main,_id_replate
	FNCALL	_id_clear,_id_replate
	FNCALL	_id_replate,___bmul
	FNCALL	_id_replate,_eepromWriteBlock
	FNCALL	_beep,_delay_x10ms
	FNCALL	_eepromWriteBlock,_eepromWriteByte
	FNCALL	_id_search,_comArr
	FNCALL	_id_search,___lbdiv
	FNCALL	_get_RFID,_timerOut
	FNCALL	_get_RFID,___lbdiv
	FNCALL	_eepromReadBlock,_eepromReadByte
	FNROOT	_main
	FNCALL	intlevel1,_ISR
	global	intlevel1
	FNROOT	intlevel1
	global	id_clear@F962
	global	_buzFre
	global	_buffTag
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"MAIN.C"
	line	178

;initializer for id_clear@F962
	retlw	0FFh
	retlw	0FFh
	retlw	0FFh
	retlw	0FFh
	retlw	0FFh
	line	40

;initializer for _buzFre
	retlw	0Ch
	line	44

;initializer for _buffTag
	retlw	0
	retlw	0
	retlw	011h
	retlw	0Bh
	retlw	04Fh
	retlw	0
	retlw	0
	retlw	081h
	retlw	02Fh
	retlw	022h
	retlw	0
	retlw	0
	retlw	07Dh
	retlw	067h
	retlw	05h
	retlw	0
	retlw	0
	retlw	07Eh
	retlw	031h
	retlw	0E7h
	retlw	0
	retlw	0
	retlw	07Eh
	retlw	051h
	retlw	0E6h
	global	_timeOut
	global	_timeTick
	global	_mtState
	global	_keyID
	global	_PSTRCON
_PSTRCON	set	413
	DABS	1,413,1	;_PSTRCON

	global	_SRCON
_SRCON	set	414
	DABS	1,414,1	;_SRCON

	global	_C1SEN
_C1SEN	set	3317
	DABS	1,414,1	;_C1SEN

	global	_C2REN
_C2REN	set	3316
	DABS	1,414,1	;_C2REN

	global	_EEPGD
_EEPGD	set	3175
	DABS	1,396,1	;_EEPGD

	global	_PULSR
_PULSR	set	3314
	DABS	1,414,1	;_PULSR

	global	_PULSS
_PULSS	set	3315
	DABS	1,414,1	;_PULSS

	global	_SR0
_SR0	set	3318
	DABS	1,414,1	;_SR0

	global	_SR1
_SR1	set	3319
	DABS	1,414,1	;_SR1

	global	_STRA
_STRA	set	3304
	DABS	1,413,1	;_STRA

	global	_STRB
_STRB	set	3305
	DABS	1,413,1	;_STRB

	global	_STRC
_STRC	set	3306
	DABS	1,413,1	;_STRC

	global	_STRD
_STRD	set	3307
	DABS	1,413,1	;_STRD

	global	_STRSYNC
_STRSYNC	set	3308
	DABS	1,413,1	;_STRSYNC

	global	_WREN
_WREN	set	3170
	DABS	1,396,1	;_WREN

	global	_EPWM1CON
_EPWM1CON	set	21
	global	_EPWMR1L
_EPWMR1L	set	19
	global	_INTCON
_INTCON	set	11
	global	_PIR1
_PIR1	set	12
	global	_PORTA
_PORTA	set	5
	global	_PORTC
_PORTC	set	7
	global	_PWM1CON
_PWM1CON	set	22
	global	_T1CON
_T1CON	set	16
	global	_T2CON
_T2CON	set	18
	global	_TMR0
_TMR0	set	1
	global	_TMR1H
_TMR1H	set	15
	global	_TMR1L
_TMR1L	set	14
	global	_TMR2
_TMR2	set	17
	global	_EEIF
_EEIF	set	103
	global	_GIE
_GIE	set	95
	global	_PEIE
_PEIE	set	94
	global	_RA3
_RA3	set	43
	global	_RA4
_RA4	set	44
	global	_RC0
_RC0	set	56
	global	_T0IE
_T0IE	set	93
	global	_T0IF
_T0IF	set	90
	global	_TMR1IF
_TMR1IF	set	96
	global	_TMR1ON
_TMR1ON	set	128
	global	_TMR2IF
_TMR2IF	set	97
	global	_EEADR
_EEADR	set	155
	global	_EECON1
_EECON1	set	156
	global	_EEDAT
_EEDAT	set	154
	global	_EPWM1AUX
_EPWM1AUX	set	144
	global	_OPTION
_OPTION	set	129
	global	_OSCCON
_OSCCON	set	143
	global	_PIE1
_PIE1	set	140
	global	_PR2
_PR2	set	146
	global	_TRISA
_TRISA	set	133
	global	_TRISC
_TRISC	set	135
	global	_WPUA
_WPUA	set	149
	global	_WPUC
_WPUC	set	136
	global	_HTS
_HTS	set	1146
	global	_RD
_RD	set	1248
	global	_TMR1IE
_TMR1IE	set	1120
	global	_TMR2IE
_TMR2IE	set	1121
	global	_WR
_WR	set	1256
	file	"smartkey.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_timeOut:
       ds      2

_timeTick:
       ds      2

_mtState:
       ds      1

_keyID:
       ds      5

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"MAIN.C"
	line	178
id_clear@F962:
       ds      5

psect	dataBANK0
	file	"MAIN.C"
	line	40
_buzFre:
       ds      1

psect	dataBANK0
	file	"MAIN.C"
	line	44
_buffTag:
       ds      25

; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
	clrf	((__pbssBANK0)+2)&07Fh
	clrf	((__pbssBANK0)+3)&07Fh
	clrf	((__pbssBANK0)+4)&07Fh
	clrf	((__pbssBANK0)+5)&07Fh
	clrf	((__pbssBANK0)+6)&07Fh
	clrf	((__pbssBANK0)+7)&07Fh
	clrf	((__pbssBANK0)+8)&07Fh
	clrf	((__pbssBANK0)+9)&07Fh
global btemp
psect inittext,class=CODE,delta=2
global init_fetch,btemp
;	Called with low address in FSR and high address in W
init_fetch:
	movf btemp,w
	movwf pclath
	movf btemp+1,w
	movwf pc
global init_ram
;Called with:
;	high address of idata address in btemp 
;	low address of idata address in btemp+1 
;	low address of data in FSR
;	high address + 1 of data in btemp-1
init_ram:
	fcall init_fetch
	movwf indf,f
	incf fsr,f
	movf fsr,w
	xorwf btemp-1,w
	btfsc status,2
	retlw 0
	incf btemp+1,f
	btfsc status,2
	incf btemp,f
	goto init_ram
; Initialize objects allocated to BANK0
psect cinit,class=CODE,delta=2
global init_ram, __pidataBANK0
	bcf	status, 7	;select IRP bank0
	movlw low(__pdataBANK0+31)
	movwf btemp-1,f
	movlw high(__pidataBANK0)
	movwf btemp,f
	movlw low(__pidataBANK0)
	movwf btemp+1,f
	movlw low(__pdataBANK0)
	movwf fsr,f
	fcall init_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_sys_init
?_sys_init:	; 0 bytes @ 0x0
	global	?_gpio_init
?_gpio_init:	; 0 bytes @ 0x0
	global	?_timer_init
?_timer_init:	; 0 bytes @ 0x0
	global	?_int_init
?_int_init:	; 0 bytes @ 0x0
	global	?_SET_EPWM_ON
?_SET_EPWM_ON:	; 0 bytes @ 0x0
	global	?_delay_x10ms
?_delay_x10ms:	; 0 bytes @ 0x0
	global	?_ISR
?_ISR:	; 0 bytes @ 0x0
	global	??_ISR
??_ISR:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_eepromReadByte
?_eepromReadByte:	; 1 bytes @ 0x0
	global	?_get_RFID
?_get_RFID:	; 1 bytes @ 0x0
	ds	2
	global	??_sys_init
??_sys_init:	; 0 bytes @ 0x2
	global	??_gpio_init
??_gpio_init:	; 0 bytes @ 0x2
	global	??_timer_init
??_timer_init:	; 0 bytes @ 0x2
	global	??_int_init
??_int_init:	; 0 bytes @ 0x2
	global	??_eepromReadByte
??_eepromReadByte:	; 0 bytes @ 0x2
	global	?_eepromWriteByte
?_eepromWriteByte:	; 0 bytes @ 0x2
	global	??_SET_EPWM_ON
??_SET_EPWM_ON:	; 0 bytes @ 0x2
	global	??_delay_x10ms
??_delay_x10ms:	; 0 bytes @ 0x2
	global	?_setState
?_setState:	; 0 bytes @ 0x2
	global	?_comArr
?_comArr:	; 1 bytes @ 0x2
	global	?___bmul
?___bmul:	; 1 bytes @ 0x2
	global	?___lbdiv
?___lbdiv:	; 1 bytes @ 0x2
	global	?_timerOut
?_timerOut:	; 2 bytes @ 0x2
	global	eepromReadByte@EEAddr
eepromReadByte@EEAddr:	; 1 bytes @ 0x2
	global	eepromWriteByte@EEData
eepromWriteByte@EEData:	; 1 bytes @ 0x2
	global	comArr@arr2
comArr@arr2:	; 1 bytes @ 0x2
	global	___bmul@multiplicand
___bmul@multiplicand:	; 1 bytes @ 0x2
	global	___lbdiv@divisor
___lbdiv@divisor:	; 1 bytes @ 0x2
	global	timerOut@time
timerOut@time:	; 2 bytes @ 0x2
	global	setState@_tOut
setState@_tOut:	; 2 bytes @ 0x2
	ds	1
	global	??_eepromWriteByte
??_eepromWriteByte:	; 0 bytes @ 0x3
	global	??___bmul
??___bmul:	; 0 bytes @ 0x3
	global	??___lbdiv
??___lbdiv:	; 0 bytes @ 0x3
	global	eepromReadByte@ReEepromData
eepromReadByte@ReEepromData:	; 1 bytes @ 0x3
	global	comArr@len1
comArr@len1:	; 1 bytes @ 0x3
	global	___bmul@product
___bmul@product:	; 1 bytes @ 0x3
	global	___lbdiv@dividend
___lbdiv@dividend:	; 1 bytes @ 0x3
	ds	1
	global	?_eepromReadBlock
?_eepromReadBlock:	; 0 bytes @ 0x4
	global	??_timerOut
??_timerOut:	; 0 bytes @ 0x4
	global	??_setState
??_setState:	; 0 bytes @ 0x4
	global	eepromReadBlock@buff
eepromReadBlock@buff:	; 1 bytes @ 0x4
	global	comArr@len2
comArr@len2:	; 1 bytes @ 0x4
	global	timerOut@Logic
timerOut@Logic:	; 1 bytes @ 0x4
	global	delay_x10ms@t
delay_x10ms@t:	; 1 bytes @ 0x4
	global	setState@stt
setState@stt:	; 1 bytes @ 0x4
	global	___bmul@multiplier
___bmul@multiplier:	; 1 bytes @ 0x4
	global	___lbdiv@counter
___lbdiv@counter:	; 1 bytes @ 0x4
	ds	1
	global	??_comArr
??_comArr:	; 0 bytes @ 0x5
	global	?_beep
?_beep:	; 0 bytes @ 0x5
	global	eepromReadBlock@len
eepromReadBlock@len:	; 1 bytes @ 0x5
	global	eepromWriteByte@EEAddr
eepromWriteByte@EEAddr:	; 1 bytes @ 0x5
	global	beep@rep
beep@rep:	; 1 bytes @ 0x5
	global	___lbdiv@quotient
___lbdiv@quotient:	; 1 bytes @ 0x5
	global	timerOut@CurTimer
timerOut@CurTimer:	; 2 bytes @ 0x5
	ds	1
	global	??_eepromReadBlock
??_eepromReadBlock:	; 0 bytes @ 0x6
	global	?_eepromWriteBlock
?_eepromWriteBlock:	; 0 bytes @ 0x6
	global	??_beep
??_beep:	; 0 bytes @ 0x6
	global	eepromWriteBlock@buff
eepromWriteBlock@buff:	; 1 bytes @ 0x6
	global	beep@delay
beep@delay:	; 1 bytes @ 0x6
	ds	1
	global	??_get_RFID
??_get_RFID:	; 0 bytes @ 0x7
	global	eepromReadBlock@addStart
eepromReadBlock@addStart:	; 1 bytes @ 0x7
	global	eepromWriteBlock@len
eepromWriteBlock@len:	; 1 bytes @ 0x7
	ds	1
	global	??_eepromWriteBlock
??_eepromWriteBlock:	; 0 bytes @ 0x8
	global	eepromReadBlock@i
eepromReadBlock@i:	; 1 bytes @ 0x8
	global	comArr@arr1
comArr@arr1:	; 1 bytes @ 0x8
	ds	1
	global	eepromWriteBlock@addStart
eepromWriteBlock@addStart:	; 1 bytes @ 0x9
	global	comArr@i
comArr@i:	; 1 bytes @ 0x9
	ds	1
	global	?_id_search
?_id_search:	; 1 bytes @ 0xA
	global	eepromWriteBlock@i
eepromWriteBlock@i:	; 1 bytes @ 0xA
	global	id_search@buff
id_search@buff:	; 1 bytes @ 0xA
	ds	1
	global	??_id_search
??_id_search:	; 0 bytes @ 0xB
	global	id_replate@id
id_replate@id:	; 1 bytes @ 0xB
	ds	1
	global	??_id_clear
??_id_clear:	; 0 bytes @ 0xC
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	?_id_replate
?_id_replate:	; 0 bytes @ 0x0
	global	id_search@id_input
id_search@id_input:	; 1 bytes @ 0x0
	global	id_replate@Cont
id_replate@Cont:	; 1 bytes @ 0x0
	global	get_RFID@RF_serial_55bits
get_RFID@RF_serial_55bits:	; 11 bytes @ 0x0
	ds	1
	global	id_search@i
id_search@i:	; 1 bytes @ 0x1
	global	id_replate@buff
id_replate@buff:	; 1 bytes @ 0x1
	ds	1
	global	??_id_replate
??_id_replate:	; 0 bytes @ 0x2
	ds	2
	global	?_id_clear
?_id_clear:	; 0 bytes @ 0x4
	global	id_clear@idMax
id_clear@idMax:	; 1 bytes @ 0x4
	ds	1
	global	id_clear@tmp
id_clear@tmp:	; 5 bytes @ 0x5
	ds	5
	global	id_clear@idMin
id_clear@idMin:	; 1 bytes @ 0xA
	ds	1
	global	get_RFID@flag_RFID_syn
get_RFID@flag_RFID_syn:	; 1 bytes @ 0xB
	ds	1
	global	get_RFID@even_col
get_RFID@even_col:	; 1 bytes @ 0xC
	ds	1
	global	get_RFID@even_row
get_RFID@even_row:	; 1 bytes @ 0xD
	ds	1
	global	get_RFID@j
get_RFID@j:	; 1 bytes @ 0xE
	ds	1
	global	get_RFID@i
get_RFID@i:	; 1 bytes @ 0xF
	ds	1
	global	get_RFID@flag_RFID_last
get_RFID@flag_RFID_last:	; 1 bytes @ 0x10
	ds	1
	global	get_RFID@timeOutVal
get_RFID@timeOutVal:	; 2 bytes @ 0x11
	ds	2
	global	get_RFID@ii
get_RFID@ii:	; 1 bytes @ 0x13
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x14
	ds	3
	global	main@idState
main@idState:	; 1 bytes @ 0x17
	ds	1
	global	main@tmp
main@tmp:	; 1 bytes @ 0x18
	ds	1
	global	main@idop
main@idop:	; 1 bytes @ 0x19
	ds	1
;;Data sizes: Strings 0, constant 0, data 31, bss 10, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     12      12
;; BANK0           80     26      67
;; BANK1           32      0       0

;;
;; Pointer list with targets:

;; ?_timerOut	unsigned int  size(1) Largest target is 0
;;
;; id_replate@Cont	PTR unsigned char  size(1) Largest target is 5
;;		 -> id_clear@tmp(BANK0[5]), keyID(BANK0[5]), 
;;
;; id_replate@buff	PTR unsigned char  size(1) Largest target is 25
;;		 -> buffTag(BANK0[25]), 
;;
;; id_search@buff	PTR unsigned char  size(1) Largest target is 25
;;		 -> buffTag(BANK0[25]), 
;;
;; id_search@id_input	PTR unsigned char  size(1) Largest target is 5
;;		 -> keyID(BANK0[5]), 
;;
;; comArr@arr2	PTR unsigned char  size(1) Largest target is 25
;;		 -> buffTag(BANK0[25]), 
;;
;; comArr@arr1	PTR unsigned char  size(1) Largest target is 5
;;		 -> keyID(BANK0[5]), 
;;
;; eepromWriteBlock@buff	PTR unsigned char  size(1) Largest target is 25
;;		 -> buffTag(BANK0[25]), 
;;
;; eepromReadBlock@buff	PTR unsigned char  size(1) Largest target is 25
;;		 -> buffTag(BANK0[25]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_id_search
;;   _main->_id_replate
;;   _id_clear->_id_replate
;;   _id_replate->_eepromWriteBlock
;;   _beep->_delay_x10ms
;;   _eepromWriteBlock->_eepromWriteByte
;;   _id_search->_comArr
;;   _get_RFID->_timerOut
;;   _eepromReadBlock->_eepromReadByte
;;
;; Critical Paths under _ISR in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_get_RFID
;;   _id_clear->_id_replate
;;
;; Critical Paths under _ISR in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK1
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 3, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 6     6      0    4517
;;                                             20 BANK0      6     6      0
;;                           _sys_init
;;                          _gpio_init
;;                         _timer_init
;;                           _int_init
;;                    _eepromWriteByte
;;                        _SET_EPWM_ON
;;                     _eepromReadByte
;;                    _eepromReadBlock
;;                           _setState
;;                           _get_RFID
;;                          _id_search
;;                           _id_clear
;;                               _beep
;;                         _id_replate
;; ---------------------------------------------------------------------------------
;; (1) _id_clear                                             7     6      1     718
;;                                              4 BANK0      7     6      1
;;                         _id_replate
;; ---------------------------------------------------------------------------------
;; (1) _id_replate                                           5     3      2     623
;;                                             11 COMMON     1     1      0
;;                                              0 BANK0      4     2      2
;;                             ___bmul
;;                   _eepromWriteBlock
;; ---------------------------------------------------------------------------------
;; (1) _beep                                                 2     1      1      66
;;                                              5 COMMON     2     1      1
;;                        _delay_x10ms
;; ---------------------------------------------------------------------------------
;; (2) _eepromWriteBlock                                     5     3      2     178
;;                                              6 COMMON     5     3      2
;;                    _eepromWriteByte
;; ---------------------------------------------------------------------------------
;; (1) _id_search                                            4     3      1     518
;;                                             10 COMMON     2     1      1
;;                                              0 BANK0      2     2      0
;;                             _comArr
;;                            ___lbdiv
;; ---------------------------------------------------------------------------------
;; (2) _delay_x10ms                                          3     3      0      22
;;                                              2 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (1) _get_RFID                                            21    21      0    1917
;;                                              7 COMMON     1     1      0
;;                                              0 BANK0     20    20      0
;;                           _timerOut
;;                            ___lbdiv
;; ---------------------------------------------------------------------------------
;; (3) _eepromWriteByte                                      4     3      1      44
;;                                              2 COMMON     4     3      1
;; ---------------------------------------------------------------------------------
;; (1) _eepromReadBlock                                      5     3      2     179
;;                                              4 COMMON     5     3      2
;;                     _eepromReadByte
;; ---------------------------------------------------------------------------------
;; (1) _sys_init                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) ___lbdiv                                              4     3      1     162
;;                                              2 COMMON     4     3      1
;; ---------------------------------------------------------------------------------
;; (2) ___bmul                                               3     2      1      92
;;                                              2 COMMON     3     2      1
;; ---------------------------------------------------------------------------------
;; (1) _setState                                             3     1      2      44
;;                                              2 COMMON     3     1      2
;; ---------------------------------------------------------------------------------
;; (1) _SET_EPWM_ON                                          0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _timerOut                                             5     3      2      90
;;                                              2 COMMON     5     3      2
;; ---------------------------------------------------------------------------------
;; (2) _comArr                                               8     5      3     222
;;                                              2 COMMON     8     5      3
;; ---------------------------------------------------------------------------------
;; (2) _eepromReadByte                                       2     2      0      45
;;                                              2 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (1) _int_init                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _timer_init                                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _gpio_init                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (5) _ISR                                                  2     2      0       0
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 5
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _sys_init
;;   _gpio_init
;;   _timer_init
;;   _int_init
;;   _eepromWriteByte
;;   _SET_EPWM_ON
;;   _eepromReadByte
;;   _eepromReadBlock
;;     _eepromReadByte
;;   _setState
;;   _get_RFID
;;     _timerOut
;;     ___lbdiv
;;   _id_search
;;     _comArr
;;     ___lbdiv
;;   _id_clear
;;     _id_replate
;;       ___bmul
;;       _eepromWriteBlock
;;         _eepromWriteByte
;;   _beep
;;     _delay_x10ms
;;   _id_replate
;;     ___bmul
;;     _eepromWriteBlock
;;       _eepromWriteByte
;;
;; _ISR (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;SFR2                 0      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               20      0       0       6        0.0%
;;BITBANK1            20      0       0       5        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      53       8        0.0%
;;ABS                  0      0      4F       7        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       4       2        0.0%
;;BANK0               50     1A      43       4       83.8%
;;BITBANK0            50      0       0       3        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      C       C       1       85.7%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA              80      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 193 in file "MAIN.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  idop            1   25[BANK0 ] unsigned char 
;;  tmp             1   24[BANK0 ] unsigned char 
;;  idState         1   23[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       3       0
;;      Temps:          0       3       0
;;      Totals:         0       6       0
;;Total ram usage:        6 bytes
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_sys_init
;;		_gpio_init
;;		_timer_init
;;		_int_init
;;		_eepromWriteByte
;;		_SET_EPWM_ON
;;		_eepromReadByte
;;		_eepromReadBlock
;;		_setState
;;		_get_RFID
;;		_id_search
;;		_id_clear
;;		_beep
;;		_id_replate
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"MAIN.C"
	line	193
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 3
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	196
	
l5762:	
# 196 "MAIN.C"
 MOVLW 0x07 ;#
	line	197
# 197 "MAIN.C"
 MOVWF 0x19 ;#
psect	maintext
	line	200
	
l5764:	
;MAIN.C: 200: unsigned char idop,tmp,idState=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@idState)
	line	201
	
l5766:	
# 201 "MAIN.C"
clrwdt ;#
psect	maintext
	line	203
	
l5768:	
;MAIN.C: 203: sys_init();
	fcall	_sys_init
	line	204
	
l5770:	
;MAIN.C: 204: gpio_init();
	fcall	_gpio_init
	line	206
	
l5772:	
;MAIN.C: 206: timer_init();
	fcall	_timer_init
	line	207
	
l5774:	
;MAIN.C: 207: int_init();
	fcall	_int_init
	line	213
	
l5776:	
;MAIN.C: 213: eepromWriteByte(0x7F,0xAA);
	movlw	(0AAh)
	movwf	(?_eepromWriteByte)
	movlw	(07Fh)
	fcall	_eepromWriteByte
	line	214
	
l5778:	
;MAIN.C: 214: eepromWriteByte(0x7F,0xAA);
	movlw	(0AAh)
	movwf	(?_eepromWriteByte)
	movlw	(07Fh)
	fcall	_eepromWriteByte
	line	217
	
l5780:	
;MAIN.C: 217: TRISC &=0xfe;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(135)^080h+(0/8),(0)&7	;volatile
	line	219
	
l5782:	
;MAIN.C: 219: SET_EPWM_ON();
	fcall	_SET_EPWM_ON
	line	223
	
l5784:	
;MAIN.C: 223: _delay((unsigned long)((20)*(8000000/4000.0)));
	opt asmopt_off
movlw	52
	bcf	status, 5	;RP0=0, select bank0
movwf	((??_main+0)+0+1),f
	movlw	241
movwf	((??_main+0)+0),f
u1797:
	decfsz	((??_main+0)+0),f
	goto	u1797
	decfsz	((??_main+0)+0+1),f
	goto	u1797
	nop2
opt asmopt_on

	line	228
	
l5786:	
;MAIN.C: 228: if(eepromReadByte(0x06)!=0){
	movlw	(06h)
	fcall	_eepromReadByte
	xorlw	0
	skipnz
	goto	u1581
	goto	u1580
u1581:
	goto	l5790
u1580:
	line	232
	
l5788:	
;MAIN.C: 232: eepromWriteByte(0x06,0);
	clrf	(?_eepromWriteByte)
	movlw	(06h)
	fcall	_eepromWriteByte
	line	233
;MAIN.C: 233: eepromWriteByte(0x06+1,0);
	clrf	(?_eepromWriteByte)
	movlw	(07h)
	fcall	_eepromWriteByte
	line	234
;MAIN.C: 234: eepromWriteByte(0x06+2,0xc7);
	movlw	(0C7h)
	movwf	(?_eepromWriteByte)
	movlw	(08h)
	fcall	_eepromWriteByte
	line	235
;MAIN.C: 235: eepromWriteByte(0x06+3,0xee);
	movlw	(0EEh)
	movwf	(?_eepromWriteByte)
	movlw	(09h)
	fcall	_eepromWriteByte
	line	236
;MAIN.C: 236: eepromWriteByte(0x06+4,0xc7);
	movlw	(0C7h)
	movwf	(?_eepromWriteByte)
	movlw	(0Ah)
	fcall	_eepromWriteByte
	line	239
	
l5790:	
;MAIN.C: 238: }
;MAIN.C: 239: eepromReadBlock(0x06,buffTag,5*5);
	movlw	(_buffTag)&0ffh
	movwf	(?_eepromReadBlock)
	movlw	(019h)
	movwf	0+(?_eepromReadBlock)+01h
	movlw	(06h)
	fcall	_eepromReadBlock
	line	241
	
l5792:	
;MAIN.C: 241: setState(1,45);
	movlw	02Dh
	movwf	(?_setState)
	clrf	(?_setState+1)
	movlw	(01h)
	fcall	_setState
	line	245
	
l5794:	
;MAIN.C: 245: tmp=0;
	clrf	(main@tmp)
	line	249
	
l5796:	
;MAIN.C: 249: idop = get_RFID();
	fcall	_get_RFID
	movwf	(main@idop)
	line	251
	
l5798:	
;MAIN.C: 251: if(idop){
	movf	(main@idop),w
	skipz
	goto	u1590
	goto	l5880
u1590:
	line	252
	
l5800:	
;MAIN.C: 252: idop = id_search(keyID,buffTag);
	movlw	(_buffTag)&0ffh
	movwf	(?_id_search)
	movlw	(_keyID)&0ffh
	fcall	_id_search
	movwf	(main@idop)
	line	253
;MAIN.C: 253: switch (mtState){
	goto	l5876
	line	256
	
l5802:	
;MAIN.C: 255: case 2:
;MAIN.C: 256: if((idop>1) && (idop <6))
	movlw	(02h)
	subwf	(main@idop),w
	skipc
	goto	u1601
	goto	u1600
u1601:
	goto	l5808
u1600:
	
l5804:	
	movlw	(06h)
	subwf	(main@idop),w
	skipnc
	goto	u1611
	goto	u1610
u1611:
	goto	l5808
u1610:
	line	258
	
l5806:	
;MAIN.C: 257: {
;MAIN.C: 258: setState(0,0);
	clrf	(?_setState)
	clrf	(?_setState+1)
	movlw	(0)
	fcall	_setState
	line	260
;MAIN.C: 260: }
	goto	l3491
	line	261
	
l5808:	
;MAIN.C: 261: else if(idop==1)
	decf	(main@idop),w
	skipz
	goto	u1621
	goto	u1620
u1621:
	goto	l3491
u1620:
	line	264
	
l5810:	
;MAIN.C: 262: {
;MAIN.C: 264: id_clear(2,5);
	movlw	(05h)
	movwf	(?_id_clear)
	movlw	(02h)
	fcall	_id_clear
	line	265
	
l5812:	
;MAIN.C: 265: setState(3,0);
	clrf	(?_setState)
	clrf	(?_setState+1)
	movlw	(03h)
	fcall	_setState
	line	266
	
l5814:	
;MAIN.C: 266: tmp=1;
	clrf	(main@tmp)
	incf	(main@tmp),f
	line	268
	
l5816:	
;MAIN.C: 268: beep(10,3);
	movlw	(03h)
	movwf	(?_beep)
	movlw	(0Ah)
	fcall	_beep
	goto	l3491
	line	282
	
l5818:	
;MAIN.C: 282: if(idop==1 && idState == 0){
	decf	(main@idop),w
	skipz
	goto	u1631
	goto	u1630
u1631:
	goto	l5830
u1630:
	
l5820:	
	movf	(main@idState),f
	skipz
	goto	u1641
	goto	u1640
u1641:
	goto	l5830
u1640:
	line	284
	
l5822:	
;MAIN.C: 284: id_clear(2,5);
	movlw	(05h)
	movwf	(?_id_clear)
	movlw	(02h)
	fcall	_id_clear
	line	285
	
l5824:	
;MAIN.C: 285: setState(3,0);
	clrf	(?_setState)
	clrf	(?_setState+1)
	movlw	(03h)
	fcall	_setState
	line	286
	
l5826:	
;MAIN.C: 286: tmp=1;
	clrf	(main@tmp)
	incf	(main@tmp),f
	line	288
	
l5828:	
;MAIN.C: 288: beep(10,3);
	movlw	(03h)
	movwf	(?_beep)
	movlw	(0Ah)
	fcall	_beep
	line	293
;MAIN.C: 293: }
	goto	l3491
	line	294
	
l5830:	
;MAIN.C: 294: else if(idop==2 && idState == 0){
	movf	(main@idop),w
	xorlw	02h
	skipz
	goto	u1651
	goto	u1650
u1651:
	goto	l3491
u1650:
	
l5832:	
	movf	(main@idState),f
	skipz
	goto	u1661
	goto	u1660
u1661:
	goto	l3491
u1660:
	line	296
	
l5834:	
;MAIN.C: 296: id_clear(3,5);
	movlw	(05h)
	movwf	(?_id_clear)
	movlw	(03h)
	fcall	_id_clear
	line	297
	
l5836:	
;MAIN.C: 297: setState(5,0);
	clrf	(?_setState)
	clrf	(?_setState+1)
	movlw	(05h)
	fcall	_setState
	line	298
	
l5838:	
;MAIN.C: 298: tmp=2;
	movlw	(02h)
	movwf	(main@tmp)
	line	300
	
l5840:	
;MAIN.C: 300: beep(10,2);
	movlw	(02h)
	movwf	(?_beep)
	movlw	(0Ah)
	fcall	_beep
	goto	l3491
	line	309
	
l5842:	
;MAIN.C: 309: if (idState == 0){
	movf	(main@idState),f
	skipz
	goto	u1671
	goto	u1670
u1671:
	goto	l5856
u1670:
	line	316
	
l5844:	
;MAIN.C: 316: if( idop !=1){
	decf	(main@idop),w
	skipnz
	goto	u1681
	goto	u1680
u1681:
	goto	l3491
u1680:
	line	317
	
l5846:	
;MAIN.C: 317: tmp++;
	incf	(main@tmp),f
	line	319
	
l5848:	
;MAIN.C: 319: if(tmp <=5){
	movlw	(06h)
	subwf	(main@tmp),w
	skipnc
	goto	u1691
	goto	u1690
u1691:
	goto	l3491
u1690:
	line	320
	
l5850:	
;MAIN.C: 320: id_replate(tmp,keyID,buffTag);
	movlw	(_keyID)&0ffh
	movwf	(?_id_replate)
	movlw	(_buffTag)&0ffh
	movwf	(0+?_id_replate+01h)
	movf	(main@tmp),w
	fcall	_id_replate
	line	321
	
l5852:	
;MAIN.C: 321: timeTick=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	323
	
l5854:	
;MAIN.C: 323: beep(10,1);
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(0Ah)
	fcall	_beep
	goto	l3491
	line	335
	
l5856:	
;MAIN.C: 335: beep(10,1);
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(0Ah)
	fcall	_beep
	goto	l3491
	line	344
	
l5858:	
;MAIN.C: 344: if(idState == 0){
	movf	(main@idState),f
	skipz
	goto	u1701
	goto	u1700
u1701:
	goto	l5872
u1700:
	line	345
	
l5860:	
;MAIN.C: 345: if( idop >2){
	movlw	(03h)
	subwf	(main@idop),w
	skipc
	goto	u1711
	goto	u1710
u1711:
	goto	l3491
u1710:
	line	346
	
l5862:	
;MAIN.C: 346: tmp++;
	incf	(main@tmp),f
	line	348
	
l5864:	
;MAIN.C: 348: if(tmp <=5){
	movlw	(06h)
	subwf	(main@tmp),w
	skipnc
	goto	u1721
	goto	u1720
u1721:
	goto	l3491
u1720:
	line	349
	
l5866:	
;MAIN.C: 349: id_replate(tmp,keyID,buffTag);
	movlw	(_keyID)&0ffh
	movwf	(?_id_replate)
	movlw	(_buffTag)&0ffh
	movwf	(0+?_id_replate+01h)
	movf	(main@tmp),w
	fcall	_id_replate
	line	350
	
l5868:	
;MAIN.C: 350: timeTick=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	353
	
l5870:	
;MAIN.C: 353: beep(10,1);
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(0Ah)
	fcall	_beep
	goto	l3491
	line	364
	
l5872:	
;MAIN.C: 364: beep(10,1);
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(0Ah)
	fcall	_beep
	goto	l3491
	line	253
	
l5876:	
	movf	(_mtState),w
	; Switch size 1, requested type "space"
; Number of cases is 6, Range of values is 0 to 6
; switch strategies available:
; Name         Instructions Cycles
; direct_byte           13     6 (fixed)
; simple_byte           19    10 (average)
; jumptable            260     6 (fixed)
; rangetable            11     6 (fixed)
; spacedrange           20     9 (fixed)
; locatedrange           7     3 (fixed)
;	Chosen strategy is direct_byte

	movwf fsr
	movlw	7
	subwf	fsr,w
skipnc
goto l3491
movlw high(S5954)
movwf pclath
	movlw low(S5954)
	addwf fsr,w
	movwf pc
psect	swtext1,local,class=CONST,delta=2
global __pswtext1
__pswtext1:
S5954:
	ljmp	l3491
	ljmp	l5802
	ljmp	l5802
	ljmp	l5842
	ljmp	l3491
	ljmp	l5858
	ljmp	l5818
psect	maintext

	line	372
	
l3491:	
	line	374
;MAIN.C: 374: idState = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@idState)
	incf	(main@idState),f
	line	375
	
l5878:	
;MAIN.C: 375: _delay((unsigned long)((61)*(8000000/4000.0)));
	opt asmopt_off
movlw	159
movwf	((??_main+0)+0+1),f
	movlw	111
movwf	((??_main+0)+0),f
u1807:
	decfsz	((??_main+0)+0),f
	goto	u1807
	decfsz	((??_main+0)+0+1),f
	goto	u1807
	nop2
opt asmopt_on

	line	376
;MAIN.C: 376: }
	goto	l5884
	line	378
	
l5880:	
;MAIN.C: 377: else{
;MAIN.C: 378: idState =0;
	clrf	(main@idState)
	line	379
	
l5882:	
;MAIN.C: 379: _delay((unsigned long)((150)*(8000000/4000.0)));
	opt asmopt_off
movlw  2
movwf	((??_main+0)+0+2),f
movlw	134
movwf	((??_main+0)+0+1),f
	movlw	153
movwf	((??_main+0)+0),f
u1817:
	decfsz	((??_main+0)+0),f
	goto	u1817
	decfsz	((??_main+0)+0+1),f
	goto	u1817
	decfsz	((??_main+0)+0+2),f
	goto	u1817
opt asmopt_on

	line	384
	
l5884:	
;MAIN.C: 380: }
;MAIN.C: 384: if((timeOut!=0)&&( timeTick > timeOut)){
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_timeOut+1),w
	iorwf	(_timeOut),w
	skipnz
	goto	u1731
	goto	u1730
u1731:
	goto	l5900
u1730:
	
l5886:	
	movf	(_timeTick+1),w
	subwf	(_timeOut+1),w
	skipz
	goto	u1745
	movf	(_timeTick),w
	subwf	(_timeOut),w
u1745:
	skipnc
	goto	u1741
	goto	u1740
u1741:
	goto	l5900
u1740:
	goto	l5898
	line	389
	
l5890:	
;MAIN.C: 389: setState(2,220);
	movlw	0DCh
	movwf	(?_setState)
	clrf	(?_setState+1)
	movlw	(02h)
	fcall	_setState
	line	391
;MAIN.C: 391: break;
	goto	l5900
	line	393
	
l5892:	
;MAIN.C: 393: setState(6,35);
	movlw	023h
	movwf	(?_setState)
	clrf	(?_setState+1)
	movlw	(06h)
	fcall	_setState
	line	394
;MAIN.C: 394: break;
	goto	l5900
	line	396
	
l5894:	
;MAIN.C: 396: setState(2,0);
	clrf	(?_setState)
	clrf	(?_setState+1)
	movlw	(02h)
	fcall	_setState
	line	399
;MAIN.C: 399: break;
	goto	l5900
	line	386
	
l5898:	
	movf	(_mtState),w
	; Switch size 1, requested type "space"
; Number of cases is 3, Range of values is 1 to 6
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           10     6 (average)
; direct_byte           15     9 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	1^0	; case 1
	skipnz
	goto	l5890
	xorlw	2^1	; case 2
	skipnz
	goto	l5892
	xorlw	6^2	; case 6
	skipnz
	goto	l5894
	goto	l5900
	opt asmopt_on

	line	405
	
l5900:	
;MAIN.C: 402: }
;MAIN.C: 405: if(mtState==0) RA3 = 1;
	movf	(_mtState),f
	skipz
	goto	u1751
	goto	u1750
u1751:
	goto	l3516
u1750:
	
l5902:	
	bsf	(43/8),(43)&7
	goto	l5904
	line	406
	
l3516:	
;MAIN.C: 406: else RA3 =0;
	bcf	(43/8),(43)&7
	line	435
	
l5904:	
;MAIN.C: 435: if (mtState == 2) {
	movf	(_mtState),w
	xorlw	02h
	skipz
	goto	u1761
	goto	u1760
u1761:
	goto	l3518
u1760:
	line	437
	
l5906:	
;MAIN.C: 437: TMR1ON = 1; T0IE = 1;
	bsf	(128/8),(128)&7
	bsf	(93/8),(93)&7
	line	438
	
l5908:	
;MAIN.C: 438: if (timeTick % 4 == 0) {
	movf	(_timeTick),w
	andlw	03h
	btfss	status,2
	goto	u1771
	goto	u1770
u1771:
	goto	l5916
u1770:
	line	440
	
l5910:	
;MAIN.C: 440: if (buzFre == 0x6a) {
	movf	(_buzFre),w
	xorlw	06Ah
	skipz
	goto	u1781
	goto	u1780
u1781:
	goto	l5914
u1780:
	line	441
	
l5912:	
;MAIN.C: 441: buzFre = 12;
	movlw	(0Ch)
	movwf	(_buzFre)
	line	442
;MAIN.C: 442: } else {
	goto	l5916
	line	443
	
l5914:	
;MAIN.C: 443: buzFre = 0x6a;
	movlw	(06Ah)
	movwf	(_buzFre)
	goto	l5916
	line	447
	
l3518:	
	bcf	(128/8),(128)&7
	bcf	(93/8),(93)&7
	line	451
	
l5916:	
;MAIN.C: 451: timeTick++;
	incf	(_timeTick),f
	skipnz
	incf	(_timeTick+1),f
	goto	l5796
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	455
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_id_clear
psect	text506,local,class=CODE,delta=2
global __ptext506
__ptext506:

;; *************** function _id_clear *****************
;; Defined at:
;;		line 177 in file "MAIN.C"
;; Parameters:    Size  Location     Type
;;  idMin           1    wreg     unsigned char 
;;  idMax           1    4[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  idMin           1   10[BANK0 ] unsigned char 
;;  tmp             5    5[BANK0 ] unsigned char [5]
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       1       0
;;      Locals:         0       6       0
;;      Temps:          0       0       0
;;      Totals:         0       7       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_id_replate
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text506
	file	"MAIN.C"
	line	177
	global	__size_of_id_clear
	__size_of_id_clear	equ	__end_of_id_clear-_id_clear
	
_id_clear:	
	opt	stack 3
; Regs used in _id_clear: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;id_clear@idMin stored from wreg
	line	178
	movwf	(id_clear@idMin)
	
l5754:	
;MAIN.C: 178: unsigned char tmp[5]={0xff,0xff,0xff,0xff,0xff};
	movlw	(id_clear@tmp)&0ffh
	movwf	fsr0
	movf	(id_clear@F962),w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	incf	fsr0,f
	movf	(id_clear@F962)+1,w
	movwf	indf
	incf	fsr0,f
	movf	(id_clear@F962)+2,w
	movwf	indf
	incf	fsr0,f
	movf	(id_clear@F962)+3,w
	movwf	indf
	incf	fsr0,f
	movf	(id_clear@F962)+4,w
	movwf	indf
	line	179
	goto	l5760
	line	180
	
l5756:	
;MAIN.C: 180: id_replate(idMin,tmp,buffTag);
	movlw	(id_clear@tmp)&0ffh
	movwf	(?_id_replate)
	movlw	(_buffTag)&0ffh
	movwf	(0+?_id_replate+01h)
	movf	(id_clear@idMin),w
	fcall	_id_replate
	line	179
	
l5758:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(id_clear@idMin),f
	
l5760:	
	movf	(id_clear@idMin),w
	subwf	(id_clear@idMax),w
	skipnc
	goto	u1571
	goto	u1570
u1571:
	goto	l5756
u1570:
	line	181
	
l3471:	
	return
	opt stack 0
GLOBAL	__end_of_id_clear
	__end_of_id_clear:
;; =============== function _id_clear ends ============

	signat	_id_clear,8312
	global	_id_replate
psect	text507,local,class=CODE,delta=2
global __ptext507
__ptext507:

;; *************** function _id_replate *****************
;; Defined at:
;;		line 163 in file "MAIN.C"
;; Parameters:    Size  Location     Type
;;  id              1    wreg     unsigned char 
;;  Cont            1    0[BANK0 ] PTR unsigned char 
;;		 -> id_clear@tmp(5), keyID(5), 
;;  buff            1    1[BANK0 ] PTR unsigned char 
;;		 -> buffTag(25), 
;; Auto vars:     Size  Location     Type
;;  id              1   11[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       2       0
;;      Locals:         1       0       0
;;      Temps:          0       2       0
;;      Totals:         1       4       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		___bmul
;;		_eepromWriteBlock
;; This function is called by:
;;		_id_clear
;;		_main
;; This function uses a non-reentrant model
;;
psect	text507
	file	"MAIN.C"
	line	163
	global	__size_of_id_replate
	__size_of_id_replate	equ	__end_of_id_replate-_id_replate
	
_id_replate:	
	opt	stack 4
; Regs used in _id_replate: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;id_replate@id stored from wreg
	movwf	(id_replate@id)
	line	164
	
l5740:	
;MAIN.C: 164: id=(id-1)*5;
	movlw	(05h)
	movwf	(?___bmul)
	movf	(id_replate@id),w
	addlw	0FFh
	fcall	___bmul
	movwf	(id_replate@id)
	line	167
	
l5742:	
;MAIN.C: 165: {
;MAIN.C: 166: {
;MAIN.C: 167: *(buff+id) = *Cont;
	movf	(id_replate@Cont),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_id_replate+0)+0
	movf	(id_replate@id),w
	addwf	(id_replate@buff),w
	movwf	(??_id_replate+1)+0
	movf	0+(??_id_replate+1)+0,w
	movwf	fsr0
	movf	(??_id_replate+0)+0,w
	movwf	indf
	line	168
	
l5744:	
;MAIN.C: 168: *(buff+1+id) = *(Cont+1);
	movf	(id_replate@Cont),w
	addlw	01h
	movwf	fsr0
	movf	indf,w
	movwf	(??_id_replate+0)+0
	movf	(id_replate@id),w
	addwf	(id_replate@buff),w
	movwf	(??_id_replate+1)+0
	movf	0+(??_id_replate+1)+0,w
	addlw	01h
	movwf	fsr0
	movf	(??_id_replate+0)+0,w
	movwf	indf
	line	169
	
l5746:	
;MAIN.C: 169: *(buff+2+id) = *(Cont+2);
	movf	(id_replate@Cont),w
	addlw	02h
	movwf	fsr0
	movf	indf,w
	movwf	(??_id_replate+0)+0
	movf	(id_replate@id),w
	addwf	(id_replate@buff),w
	movwf	(??_id_replate+1)+0
	movf	0+(??_id_replate+1)+0,w
	addlw	02h
	movwf	fsr0
	movf	(??_id_replate+0)+0,w
	movwf	indf
	line	170
	
l5748:	
;MAIN.C: 170: *(buff+3+id) = *(Cont+3);
	movf	(id_replate@Cont),w
	addlw	03h
	movwf	fsr0
	movf	indf,w
	movwf	(??_id_replate+0)+0
	movf	(id_replate@id),w
	addwf	(id_replate@buff),w
	movwf	(??_id_replate+1)+0
	movf	0+(??_id_replate+1)+0,w
	addlw	03h
	movwf	fsr0
	movf	(??_id_replate+0)+0,w
	movwf	indf
	line	171
	
l5750:	
;MAIN.C: 171: *(buff+4+id) = *(Cont+4);
	movf	(id_replate@Cont),w
	addlw	04h
	movwf	fsr0
	movf	indf,w
	movwf	(??_id_replate+0)+0
	movf	(id_replate@id),w
	addwf	(id_replate@buff),w
	movwf	(??_id_replate+1)+0
	movf	0+(??_id_replate+1)+0,w
	addlw	04h
	movwf	fsr0
	movf	(??_id_replate+0)+0,w
	movwf	indf
	line	175
	
l5752:	
;MAIN.C: 172: }
;MAIN.C: 173: }
;MAIN.C: 175: eepromWriteBlock(0x06,buffTag,25);
	movlw	(_buffTag)&0ffh
	movwf	(?_eepromWriteBlock)
	movlw	(019h)
	movwf	0+(?_eepromWriteBlock)+01h
	movlw	(06h)
	fcall	_eepromWriteBlock
	line	176
	
l3463:	
	return
	opt stack 0
GLOBAL	__end_of_id_replate
	__end_of_id_replate:
;; =============== function _id_replate ends ============

	signat	_id_replate,12408
	global	_beep
psect	text508,local,class=CODE,delta=2
global __ptext508
__ptext508:

;; *************** function _beep *****************
;; Defined at:
;;		line 61 in file "MAIN.C"
;; Parameters:    Size  Location     Type
;;  delay           1    wreg     unsigned char 
;;  rep             1    5[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  delay           1    6[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         1       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_delay_x10ms
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text508
	file	"MAIN.C"
	line	61
	global	__size_of_beep
	__size_of_beep	equ	__end_of_beep-_beep
	
_beep:	
	opt	stack 5
; Regs used in _beep: [wreg+status,2+status,0+pclath+cstack]
;beep@delay stored from wreg
	line	63
	movwf	(beep@delay)
	
l5724:	
;MAIN.C: 63: TMR1ON = 1;T0IE = 1;
	bsf	(128/8),(128)&7
	bsf	(93/8),(93)&7
	line	65
;MAIN.C: 65: while(rep--){
	goto	l5738
	
l3445:	
	line	66
;MAIN.C: 66: TMR1ON = 1;T0IE = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(128/8),(128)&7
	bsf	(93/8),(93)&7
	line	67
	
l5726:	
;MAIN.C: 67: buzFre=42;
	movlw	(02Ah)
	movwf	(_buzFre)
	line	68
	
l5728:	
;MAIN.C: 68: delay_x10ms(delay);
	movf	(beep@delay),w
	fcall	_delay_x10ms
	line	69
	
l5730:	
;MAIN.C: 69: T0IE = 0;
	bcf	(93/8),(93)&7
	line	70
	
l5732:	
;MAIN.C: 70: TMR1ON = 0;RC0 =0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(128/8),(128)&7
	
l5734:	
	bcf	(56/8),(56)&7
	line	71
	
l5736:	
;MAIN.C: 71: delay_x10ms(20);
	movlw	(014h)
	fcall	_delay_x10ms
	line	65
	
l5738:	
	decf	(beep@rep),f
	movf	((beep@rep)),w
	xorlw	0FFh
	skipz
	goto	u1561
	goto	u1560
u1561:
	goto	l3445
u1560:
	
l3446:	
	line	74
;MAIN.C: 72: }
;MAIN.C: 74: T0IE = 0;
	bcf	(93/8),(93)&7
	line	84
	
l3447:	
	return
	opt stack 0
GLOBAL	__end_of_beep
	__end_of_beep:
;; =============== function _beep ends ============

	signat	_beep,8312
	global	_eepromWriteBlock
psect	text509,local,class=CODE,delta=2
global __ptext509
__ptext509:

;; *************** function _eepromWriteBlock *****************
;; Defined at:
;;		line 43 in file "ms82_eeprom.c"
;; Parameters:    Size  Location     Type
;;  addStart        1    wreg     unsigned char 
;;  buff            1    6[COMMON] PTR unsigned char 
;;		 -> buffTag(25), 
;;  len             1    7[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  addStart        1    9[COMMON] unsigned char 
;;  i               1   10[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 160/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         2       0       0
;;      Locals:         2       0       0
;;      Temps:          1       0       0
;;      Totals:         5       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_eepromWriteByte
;; This function is called by:
;;		_id_replate
;; This function uses a non-reentrant model
;;
psect	text509
	file	"ms82_eeprom.c"
	line	43
	global	__size_of_eepromWriteBlock
	__size_of_eepromWriteBlock	equ	__end_of_eepromWriteBlock-_eepromWriteBlock
	
_eepromWriteBlock:	
	opt	stack 4
; Regs used in _eepromWriteBlock: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;eepromWriteBlock@addStart stored from wreg
	line	45
	movwf	(eepromWriteBlock@addStart)
	
l5716:	
;ms82_eeprom.c: 44: unsigned char i;
;ms82_eeprom.c: 45: for(i=0;i<len;i++){
	clrf	(eepromWriteBlock@i)
	goto	l5722
	line	46
	
l5718:	
;ms82_eeprom.c: 46: eepromWriteByte(addStart+i,buff[i]);
	movf	(eepromWriteBlock@i),w
	addwf	(eepromWriteBlock@buff),w
	movwf	(??_eepromWriteBlock+0)+0
	movf	0+(??_eepromWriteBlock+0)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(?_eepromWriteByte)
	movf	(eepromWriteBlock@i),w
	addwf	(eepromWriteBlock@addStart),w
	fcall	_eepromWriteByte
	line	45
	
l5720:	
	incf	(eepromWriteBlock@i),f
	
l5722:	
	movf	(eepromWriteBlock@len),w
	subwf	(eepromWriteBlock@i),w
	skipc
	goto	u1551
	goto	u1550
u1551:
	goto	l5718
u1550:
	line	49
	
l1337:	
	return
	opt stack 0
GLOBAL	__end_of_eepromWriteBlock
	__end_of_eepromWriteBlock:
;; =============== function _eepromWriteBlock ends ============

	signat	_eepromWriteBlock,12408
	global	_id_search
psect	text510,local,class=CODE,delta=2
global __ptext510
__ptext510:

;; *************** function _id_search *****************
;; Defined at:
;;		line 155 in file "MAIN.C"
;; Parameters:    Size  Location     Type
;;  id_input        1    wreg     PTR unsigned char 
;;		 -> keyID(5), 
;;  buff            1   10[COMMON] PTR unsigned char 
;;		 -> buffTag(25), 
;; Auto vars:     Size  Location     Type
;;  id_input        1    0[BANK0 ] PTR unsigned char 
;;		 -> keyID(5), 
;;  i               1    1[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         1       0       0
;;      Locals:         0       2       0
;;      Temps:          1       0       0
;;      Totals:         2       2       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_comArr
;;		___lbdiv
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text510
	file	"MAIN.C"
	line	155
	global	__size_of_id_search
	__size_of_id_search	equ	__end_of_id_search-_id_search
	
_id_search:	
	opt	stack 5
; Regs used in _id_search: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;id_search@id_input stored from wreg
	line	157
	movwf	(id_search@id_input)
	
l5696:	
;MAIN.C: 156: unsigned char i;
;MAIN.C: 157: for(i=0;i<21;i+=5){
	clrf	(id_search@i)
	line	158
	
l5702:	
;MAIN.C: 158: if(comArr(id_input,buff+i,5,5))
	movf	(id_search@i),w
	addwf	(id_search@buff),w
	movwf	(?_comArr)
	movlw	(05h)
	movwf	0+(?_comArr)+01h
	movlw	(05h)
	movwf	0+(?_comArr)+02h
	movf	(id_search@id_input),w
	fcall	_comArr
	xorlw	0
	skipnz
	goto	u1531
	goto	u1530
u1531:
	goto	l5708
u1530:
	line	159
	
l5704:	
;MAIN.C: 159: return i/5 +1;
	movlw	(05h)
	movwf	(?___lbdiv)
	movf	(id_search@i),w
	fcall	___lbdiv
	movwf	(??_id_search+0)+0
	incf	0+(??_id_search+0)+0,w
	goto	l3460
	line	157
	
l5708:	
	movlw	(05h)
	addwf	(id_search@i),f
	
l5710:	
	movlw	(015h)
	subwf	(id_search@i),w
	skipc
	goto	u1541
	goto	u1540
u1541:
	goto	l5702
u1540:
	line	161
	
l5712:	
;MAIN.C: 160: }
;MAIN.C: 161: return 255;
	movlw	(0FFh)
	line	162
	
l3460:	
	return
	opt stack 0
GLOBAL	__end_of_id_search
	__end_of_id_search:
;; =============== function _id_search ends ============

	signat	_id_search,8313
	global	_delay_x10ms
psect	text511,local,class=CODE,delta=2
global __ptext511
__ptext511:

;; *************** function _delay_x10ms *****************
;; Defined at:
;;		line 57 in file "MAIN.C"
;; Parameters:    Size  Location     Type
;;  t               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  t               1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         1       0       0
;;      Temps:          2       0       0
;;      Totals:         3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_beep
;; This function uses a non-reentrant model
;;
psect	text511
	file	"MAIN.C"
	line	57
	global	__size_of_delay_x10ms
	__size_of_delay_x10ms	equ	__end_of_delay_x10ms-_delay_x10ms
	
_delay_x10ms:	
	opt	stack 5
; Regs used in _delay_x10ms: [wreg+status,2+status,0]
;delay_x10ms@t stored from wreg
	movwf	(delay_x10ms@t)
	line	58
	
l5690:	
;MAIN.C: 58: while(t--)
	goto	l5694
	line	59
	
l5692:	
;MAIN.C: 59: _delay((unsigned long)((10)*(8000000/4000.0)));
	opt asmopt_off
movlw	26
movwf	((??_delay_x10ms+0)+0+1),f
	movlw	248
movwf	((??_delay_x10ms+0)+0),f
u1827:
	decfsz	((??_delay_x10ms+0)+0),f
	goto	u1827
	decfsz	((??_delay_x10ms+0)+0+1),f
	goto	u1827
	clrwdt
opt asmopt_on

	line	58
	
l5694:	
	decf	(delay_x10ms@t),f
	movf	((delay_x10ms@t)),w
	xorlw	0FFh
	skipz
	goto	u1521
	goto	u1520
u1521:
	goto	l5692
u1520:
	line	60
	
l3441:	
	return
	opt stack 0
GLOBAL	__end_of_delay_x10ms
	__end_of_delay_x10ms:
;; =============== function _delay_x10ms ends ============

	signat	_delay_x10ms,4216
	global	_get_RFID
psect	text512,local,class=CODE,delta=2
global __ptext512
__ptext512:

;; *************** function _get_RFID *****************
;; Defined at:
;;		line 21 in file "rfid125.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  RF_serial_55   11    0[BANK0 ] unsigned char [11]
;;  timeOutVal      2   17[BANK0 ] unsigned int 
;;  ii              1   19[BANK0 ] unsigned char 
;;  flag_RFID_la    1   16[BANK0 ] unsigned char 
;;  i               1   15[BANK0 ] unsigned char 
;;  j               1   14[BANK0 ] unsigned char 
;;  even_row        1   13[BANK0 ] unsigned char 
;;  even_col        1   12[BANK0 ] unsigned char 
;;  flag_RFID_sy    1   11[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0      20       0
;;      Temps:          1       0       0
;;      Totals:         1      20       0
;;Total ram usage:       21 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_timerOut
;;		___lbdiv
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text512
	file	"rfid125.c"
	line	21
	global	__size_of_get_RFID
	__size_of_get_RFID	equ	__end_of_get_RFID-_get_RFID
	
_get_RFID:	
	opt	stack 5
; Regs used in _get_RFID: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	30
	
l5468:	
;rfid125.c: 23: unsigned char RF_serial_55bits[11];
;rfid125.c: 24: unsigned int timeOutVal;
;rfid125.c: 25: unsigned char i,ii,j;
;rfid125.c: 26: unsigned char flag_RFID_syn, flag_RFID_last;
;rfid125.c: 27: unsigned char even_row, even_col;
;rfid125.c: 30: flag_RFID_syn = 0;
	clrf	(get_RFID@flag_RFID_syn)
	line	33
	
l5470:	
;rfid125.c: 33: i=16;
	movlw	(010h)
	movwf	(get_RFID@i)
	line	36
	
l5472:	
;rfid125.c: 35: {
;rfid125.c: 36: timeOutVal=timerOut(1,600);
	movlw	low(0258h)
	movwf	(?_timerOut)
	movlw	high(0258h)
	movwf	((?_timerOut))+1
	movlw	(01h)
	fcall	_timerOut
	movf	(1+(?_timerOut)),w
	movwf	(get_RFID@timeOutVal+1)
	movf	(0+(?_timerOut)),w
	movwf	(get_RFID@timeOutVal)
	line	37
	
l5474:	
;rfid125.c: 37: if(timeOutVal==0) return 0;
	movf	((get_RFID@timeOutVal+1)),w
	iorwf	((get_RFID@timeOutVal)),w
	skipz
	goto	u1091
	goto	u1090
u1091:
	goto	l5480
u1090:
	
l5476:	
	movlw	(0)
	goto	l2047
	line	39
	
l5480:	
;rfid125.c: 39: timeOutVal=timerOut(0,600);
	movlw	low(0258h)
	movwf	(?_timerOut)
	movlw	high(0258h)
	movwf	((?_timerOut))+1
	movlw	(0)
	fcall	_timerOut
	movf	(1+(?_timerOut)),w
	movwf	(get_RFID@timeOutVal+1)
	movf	(0+(?_timerOut)),w
	movwf	(get_RFID@timeOutVal)
	line	40
	
l5482:	
;rfid125.c: 40: if(timeOutVal==0) return 0;
	movf	((get_RFID@timeOutVal+1)),w
	iorwf	((get_RFID@timeOutVal)),w
	skipz
	goto	u1101
	goto	u1100
u1101:
	goto	l5488
u1100:
	goto	l5476
	line	42
	
l5488:	
;rfid125.c: 42: i--;
	decf	(get_RFID@i),f
	line	44
	
l5490:	
;rfid125.c: 43: }
;rfid125.c: 44: while(timeOutVal<290 && i>0);
	movlw	high(0122h)
	subwf	(get_RFID@timeOutVal+1),w
	movlw	low(0122h)
	skipnz
	subwf	(get_RFID@timeOutVal),w
	skipnc
	goto	u1111
	goto	u1110
u1111:
	goto	l2051
u1110:
	
l5492:	
	movf	(get_RFID@i),f
	skipz
	goto	u1121
	goto	u1120
u1121:
	goto	l5472
u1120:
	
l2051:	
	line	45
;rfid125.c: 45: flag_RFID_last = 1;
	clrf	(get_RFID@flag_RFID_last)
	incf	(get_RFID@flag_RFID_last),f
	line	46
	
l5494:	
;rfid125.c: 46: i = 0;
	clrf	(get_RFID@i)
	line	47
;rfid125.c: 47: while(i<64)
	goto	l5560
	line	49
	
l5496:	
;rfid125.c: 48: {
;rfid125.c: 49: for(ii=0;ii<9;ii++)
	clrf	(get_RFID@ii)
	line	51
	
l5502:	
;rfid125.c: 50: {
;rfid125.c: 51: timeOutVal=timerOut(flag_RFID_last,600);
	movlw	low(0258h)
	movwf	(?_timerOut)
	movlw	high(0258h)
	movwf	((?_timerOut))+1
	movf	(get_RFID@flag_RFID_last),w
	fcall	_timerOut
	movf	(1+(?_timerOut)),w
	movwf	(get_RFID@timeOutVal+1)
	movf	(0+(?_timerOut)),w
	movwf	(get_RFID@timeOutVal)
	line	52
	
l5504:	
;rfid125.c: 52: if(timeOutVal==0) return 0;
	movf	((get_RFID@timeOutVal+1)),w
	iorwf	((get_RFID@timeOutVal)),w
	skipz
	goto	u1131
	goto	u1130
u1131:
	goto	l5510
u1130:
	goto	l5476
	line	55
	
l5510:	
;rfid125.c: 54: if(0==flag_RFID_last && timeOutVal<=290 ||
;rfid125.c: 55: 1==flag_RFID_last && timeOutVal>290)
	movf	(get_RFID@flag_RFID_last),f
	skipz
	goto	u1141
	goto	u1140
u1141:
	goto	l5514
u1140:
	
l5512:	
	movlw	high(0123h)
	subwf	(get_RFID@timeOutVal+1),w
	movlw	low(0123h)
	skipnz
	subwf	(get_RFID@timeOutVal),w
	skipc
	goto	u1151
	goto	u1150
u1151:
	goto	l5518
u1150:
	
l5514:	
	decf	(get_RFID@flag_RFID_last),w
	skipz
	goto	u1161
	goto	u1160
u1161:
	goto	l5532
u1160:
	
l5516:	
	movlw	high(0123h)
	subwf	(get_RFID@timeOutVal+1),w
	movlw	low(0123h)
	skipnz
	subwf	(get_RFID@timeOutVal),w
	skipc
	goto	u1171
	goto	u1170
u1171:
	goto	l5532
u1170:
	line	57
	
l5518:	
;rfid125.c: 56: {
;rfid125.c: 57: if(!flag_RFID_last)
	movf	(get_RFID@flag_RFID_last),f
	skipz
	goto	u1181
	goto	u1180
u1181:
	goto	l5528
u1180:
	line	59
	
l5520:	
;rfid125.c: 58: {
;rfid125.c: 59: timeOutVal=timerOut(1,290);
	movlw	low(0122h)
	movwf	(?_timerOut)
	movlw	high(0122h)
	movwf	((?_timerOut))+1
	movlw	(01h)
	fcall	_timerOut
	movf	(1+(?_timerOut)),w
	movwf	(get_RFID@timeOutVal+1)
	movf	(0+(?_timerOut)),w
	movwf	(get_RFID@timeOutVal)
	line	60
	
l5522:	
;rfid125.c: 60: if(timeOutVal==0) return 0;
	movf	((get_RFID@timeOutVal+1)),w
	iorwf	((get_RFID@timeOutVal)),w
	skipz
	goto	u1191
	goto	u1190
u1191:
	goto	l5528
u1190:
	goto	l5476
	line	62
	
l5528:	
;rfid125.c: 61: }
;rfid125.c: 62: flag_RFID_last = 0;
	clrf	(get_RFID@flag_RFID_last)
	line	63
	
l5530:	
;rfid125.c: 63: i++;
	incf	(get_RFID@i),f
	line	64
;rfid125.c: 64: }
	goto	l5552
	line	67
	
l5532:	
;rfid125.c: 65: else
;rfid125.c: 66: if(0==flag_RFID_last && timeOutVal>290 ||
;rfid125.c: 67: 1==flag_RFID_last && timeOutVal<=290)
	movf	(get_RFID@flag_RFID_last),f
	skipz
	goto	u1201
	goto	u1200
u1201:
	goto	l5536
u1200:
	
l5534:	
	movlw	high(0123h)
	subwf	(get_RFID@timeOutVal+1),w
	movlw	low(0123h)
	skipnz
	subwf	(get_RFID@timeOutVal),w
	skipnc
	goto	u1211
	goto	u1210
u1211:
	goto	l5540
u1210:
	
l5536:	
	decf	(get_RFID@flag_RFID_last),w
	skipz
	goto	u1221
	goto	u1220
u1221:
	goto	l5552
u1220:
	
l5538:	
	movlw	high(0123h)
	subwf	(get_RFID@timeOutVal+1),w
	movlw	low(0123h)
	skipnz
	subwf	(get_RFID@timeOutVal),w
	skipnc
	goto	u1231
	goto	u1230
u1231:
	goto	l5552
u1230:
	line	69
	
l5540:	
;rfid125.c: 68: {
;rfid125.c: 69: if(flag_RFID_last)
	movf	(get_RFID@flag_RFID_last),w
	skipz
	goto	u1240
	goto	l2070
u1240:
	line	71
	
l5542:	
;rfid125.c: 70: {
;rfid125.c: 71: timeOutVal=timerOut(0,290);
	movlw	low(0122h)
	movwf	(?_timerOut)
	movlw	high(0122h)
	movwf	((?_timerOut))+1
	movlw	(0)
	fcall	_timerOut
	movf	(1+(?_timerOut)),w
	movwf	(get_RFID@timeOutVal+1)
	movf	(0+(?_timerOut)),w
	movwf	(get_RFID@timeOutVal)
	line	72
	
l5544:	
;rfid125.c: 72: if(timeOutVal==0) return 0;
	movf	((get_RFID@timeOutVal+1)),w
	iorwf	((get_RFID@timeOutVal)),w
	skipz
	goto	u1251
	goto	u1250
u1251:
	goto	l2070
u1250:
	goto	l5476
	line	73
	
l2070:	
	line	74
;rfid125.c: 73: }
;rfid125.c: 74: flag_RFID_last = 1;
	clrf	(get_RFID@flag_RFID_last)
	incf	(get_RFID@flag_RFID_last),f
	line	75
	
l5550:	
;rfid125.c: 75: i++;
	incf	(get_RFID@i),f
	line	77
;rfid125.c: 77: break;
	goto	l5556
	line	49
	
l5552:	
	incf	(get_RFID@ii),f
	
l5554:	
	movlw	(09h)
	subwf	(get_RFID@ii),w
	skipc
	goto	u1261
	goto	u1260
u1261:
	goto	l5502
u1260:
	line	81
	
l5556:	
;rfid125.c: 78: }
;rfid125.c: 80: }
;rfid125.c: 81: if(9==ii)
	movf	(get_RFID@ii),w
	xorlw	09h
	skipz
	goto	u1271
	goto	u1270
u1271:
	goto	l5560
u1270:
	line	83
	
l5558:	
;rfid125.c: 82: {
;rfid125.c: 83: flag_RFID_syn = 1;
	clrf	(get_RFID@flag_RFID_syn)
	incf	(get_RFID@flag_RFID_syn),f
	line	84
;rfid125.c: 84: break;
	goto	l5562
	line	47
	
l5560:	
	movlw	(040h)
	subwf	(get_RFID@i),w
	skipc
	goto	u1281
	goto	u1280
u1281:
	goto	l5496
u1280:
	line	88
	
l5562:	
;rfid125.c: 85: }
;rfid125.c: 86: }
;rfid125.c: 88: if(!flag_RFID_syn)
	movf	(get_RFID@flag_RFID_syn),f
	skipz
	goto	u1291
	goto	u1290
u1291:
	goto	l5568
u1290:
	goto	l5476
	line	92
	
l5568:	
;rfid125.c: 91: }
;rfid125.c: 92: for(ii=0;ii<55;ii++)
	clrf	(get_RFID@ii)
	line	94
	
l5574:	
;rfid125.c: 93: {
;rfid125.c: 94: i = ii/5;
	movlw	(05h)
	movwf	(?___lbdiv)
	movf	(get_RFID@ii),w
	fcall	___lbdiv
	movwf	(get_RFID@i)
	line	95
	
l5576:	
;rfid125.c: 95: timeOutVal=timerOut(flag_RFID_last,600);
	movlw	low(0258h)
	movwf	(?_timerOut)
	movlw	high(0258h)
	movwf	((?_timerOut))+1
	movf	(get_RFID@flag_RFID_last),w
	fcall	_timerOut
	movf	(1+(?_timerOut)),w
	movwf	(get_RFID@timeOutVal+1)
	movf	(0+(?_timerOut)),w
	movwf	(get_RFID@timeOutVal)
	line	96
	
l5578:	
;rfid125.c: 96: if(timeOutVal==0) return 0;
	movf	((get_RFID@timeOutVal+1)),w
	iorwf	((get_RFID@timeOutVal)),w
	skipz
	goto	u1301
	goto	u1300
u1301:
	goto	l5584
u1300:
	goto	l5476
	line	99
	
l5584:	
;rfid125.c: 98: if(0==flag_RFID_last && timeOutVal<=290 ||
;rfid125.c: 99: 1==flag_RFID_last && timeOutVal>290)
	movf	(get_RFID@flag_RFID_last),f
	skipz
	goto	u1311
	goto	u1310
u1311:
	goto	l5588
u1310:
	
l5586:	
	movlw	high(0123h)
	subwf	(get_RFID@timeOutVal+1),w
	movlw	low(0123h)
	skipnz
	subwf	(get_RFID@timeOutVal),w
	skipc
	goto	u1321
	goto	u1320
u1321:
	goto	l5592
u1320:
	
l5588:	
	decf	(get_RFID@flag_RFID_last),w
	skipz
	goto	u1331
	goto	u1330
u1331:
	goto	l5608
u1330:
	
l5590:	
	movlw	high(0123h)
	subwf	(get_RFID@timeOutVal+1),w
	movlw	low(0123h)
	skipnz
	subwf	(get_RFID@timeOutVal),w
	skipc
	goto	u1341
	goto	u1340
u1341:
	goto	l5608
u1340:
	line	101
	
l5592:	
;rfid125.c: 100: {
;rfid125.c: 101: if(!flag_RFID_last)
	movf	(get_RFID@flag_RFID_last),f
	skipz
	goto	u1351
	goto	u1350
u1351:
	goto	l5602
u1350:
	line	103
	
l5594:	
;rfid125.c: 102: {
;rfid125.c: 103: timeOutVal=timerOut(1,290);
	movlw	low(0122h)
	movwf	(?_timerOut)
	movlw	high(0122h)
	movwf	((?_timerOut))+1
	movlw	(01h)
	fcall	_timerOut
	movf	(1+(?_timerOut)),w
	movwf	(get_RFID@timeOutVal+1)
	movf	(0+(?_timerOut)),w
	movwf	(get_RFID@timeOutVal)
	line	104
	
l5596:	
;rfid125.c: 104: if(timeOutVal==0) return 0;
	movf	((get_RFID@timeOutVal+1)),w
	iorwf	((get_RFID@timeOutVal)),w
	skipz
	goto	u1361
	goto	u1360
u1361:
	goto	l5602
u1360:
	goto	l5476
	line	106
	
l5602:	
;rfid125.c: 105: }
;rfid125.c: 106: flag_RFID_last = 0;
	clrf	(get_RFID@flag_RFID_last)
	line	107
	
l5604:	
;rfid125.c: 107: RF_serial_55bits[i] <<= 1;
	movf	(get_RFID@i),w
	addlw	get_RFID@RF_serial_55bits&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	clrc
	rlf	indf,f
	line	108
	
l5606:	
;rfid125.c: 108: RF_serial_55bits[i] |= 0x01;
	movf	(get_RFID@i),w
	addlw	get_RFID@RF_serial_55bits&0ffh
	movwf	fsr0
	bsf	indf+(0/8),(0)&7
	line	109
;rfid125.c: 109: }
	goto	l5628
	line	112
	
l5608:	
;rfid125.c: 110: else
;rfid125.c: 111: if(0==flag_RFID_last && timeOutVal>290 ||
;rfid125.c: 112: 1==flag_RFID_last && timeOutVal<=290)
	movf	(get_RFID@flag_RFID_last),f
	skipz
	goto	u1371
	goto	u1370
u1371:
	goto	l5612
u1370:
	
l5610:	
	movlw	high(0123h)
	subwf	(get_RFID@timeOutVal+1),w
	movlw	low(0123h)
	skipnz
	subwf	(get_RFID@timeOutVal),w
	skipnc
	goto	u1381
	goto	u1380
u1381:
	goto	l5616
u1380:
	
l5612:	
	decf	(get_RFID@flag_RFID_last),w
	skipz
	goto	u1391
	goto	u1390
u1391:
	goto	l5628
u1390:
	
l5614:	
	movlw	high(0123h)
	subwf	(get_RFID@timeOutVal+1),w
	movlw	low(0123h)
	skipnz
	subwf	(get_RFID@timeOutVal),w
	skipnc
	goto	u1401
	goto	u1400
u1401:
	goto	l5628
u1400:
	line	114
	
l5616:	
;rfid125.c: 113: {
;rfid125.c: 114: if(flag_RFID_last)
	movf	(get_RFID@flag_RFID_last),w
	skipz
	goto	u1410
	goto	l2091
u1410:
	line	116
	
l5618:	
;rfid125.c: 115: {
;rfid125.c: 116: timeOutVal=timerOut(0,600);
	movlw	low(0258h)
	movwf	(?_timerOut)
	movlw	high(0258h)
	movwf	((?_timerOut))+1
	movlw	(0)
	fcall	_timerOut
	movf	(1+(?_timerOut)),w
	movwf	(get_RFID@timeOutVal+1)
	movf	(0+(?_timerOut)),w
	movwf	(get_RFID@timeOutVal)
	line	117
	
l5620:	
;rfid125.c: 117: if(timeOutVal==0) return 0;
	movf	((get_RFID@timeOutVal+1)),w
	iorwf	((get_RFID@timeOutVal)),w
	skipz
	goto	u1421
	goto	u1420
u1421:
	goto	l2091
u1420:
	goto	l5476
	line	118
	
l2091:	
	line	119
;rfid125.c: 118: }
;rfid125.c: 119: flag_RFID_last = 1;
	clrf	(get_RFID@flag_RFID_last)
	incf	(get_RFID@flag_RFID_last),f
	line	120
	
l5626:	
;rfid125.c: 120: RF_serial_55bits[i] <<= 1;
	movf	(get_RFID@i),w
	addlw	get_RFID@RF_serial_55bits&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	clrc
	rlf	indf,f
	line	92
	
l5628:	
	incf	(get_RFID@ii),f
	
l5630:	
	movlw	(037h)
	subwf	(get_RFID@ii),w
	skipc
	goto	u1431
	goto	u1430
u1431:
	goto	l5574
u1430:
	line	123
	
l5632:	
;rfid125.c: 121: }
;rfid125.c: 122: }
;rfid125.c: 123: if(55==ii)
	movf	(get_RFID@ii),w
	xorlw	037h
	skipz
	goto	u1441
	goto	u1440
u1441:
	goto	l5476
u1440:
	line	125
	
l5634:	
;rfid125.c: 124: {
;rfid125.c: 125: even_col = 0;
	clrf	(get_RFID@even_col)
	line	126
;rfid125.c: 126: for(ii=0;ii<10;ii++)
	clrf	(get_RFID@ii)
	line	128
	
l5640:	
;rfid125.c: 127: {
;rfid125.c: 128: even_row = (RF_serial_55bits[ii] & 0x01);
	movf	(get_RFID@ii),w
	addlw	get_RFID@RF_serial_55bits&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(get_RFID@even_row)
	
l5642:	
	movlw	(01h)
	andwf	(get_RFID@even_row),f
	line	129
	
l5644:	
;rfid125.c: 129: for(j=1;j<5;j++)
	clrf	(get_RFID@j)
	incf	(get_RFID@j),f
	line	131
	
l5650:	
;rfid125.c: 130: {
;rfid125.c: 131: even_row = even_row ^ ((RF_serial_55bits[ii]>>j) & 0x01);
	movf	(get_RFID@ii),w
	addlw	get_RFID@RF_serial_55bits&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_get_RFID+0)+0
	incf	(get_RFID@j),w
	goto	u1454
u1455:
	clrc
	rrf	(??_get_RFID+0)+0,f
u1454:
	addlw	-1
	skipz
	goto	u1455
	movf	0+(??_get_RFID+0)+0,w
	andlw	01h
	xorwf	(get_RFID@even_row),f
	line	129
	
l5652:	
	incf	(get_RFID@j),f
	
l5654:	
	movlw	(05h)
	subwf	(get_RFID@j),w
	skipc
	goto	u1461
	goto	u1460
u1461:
	goto	l5650
u1460:
	
l2097:	
	line	133
;rfid125.c: 132: }
;rfid125.c: 133: if(even_row & 0x01)
	btfss	(get_RFID@even_row),(0)&7
	goto	u1471
	goto	u1470
u1471:
	goto	l5660
u1470:
	goto	l5476
	line	138
	
l5660:	
;rfid125.c: 136: }
;rfid125.c: 138: RF_serial_55bits[ii] <<= 3;
	movf	(get_RFID@ii),w
	addlw	get_RFID@RF_serial_55bits&0ffh
	movwf	fsr0
	rlf	indf,f
	rlf	indf,f
	rlf	indf,w
	andlw	0f8h
	movwf	indf
	line	140
;rfid125.c: 140: i = RF_serial_55bits[ii];
	movf	(get_RFID@ii),w
	addlw	get_RFID@RF_serial_55bits&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(get_RFID@i)
	line	141
	
l5662:	
;rfid125.c: 141: if( 0==ii%2 )
	btfsc	(get_RFID@ii),(0)&7
	goto	u1481
	goto	u1480
u1481:
	goto	l5666
u1480:
	line	143
	
l5664:	
;rfid125.c: 142: {
;rfid125.c: 143: keyID[ii/2] = (i & 0xF0);
	clrc
	rrf	(get_RFID@ii),w
	addlw	_keyID&0ffh
	movwf	fsr0
	movf	(get_RFID@i),w
	movwf	indf
	clrc
	rrf	(get_RFID@ii),w
	addlw	_keyID&0ffh
	movwf	fsr0
	movlw	(0F0h)
	andwf	indf,f
	line	144
;rfid125.c: 144: }
	goto	l5670
	line	147
	
l5666:	
;rfid125.c: 145: else
;rfid125.c: 146: {
;rfid125.c: 147: i >>=4;
swapf	(get_RFID@i),f
	movlw	15
	andwf	(get_RFID@i),f

	line	148
	
l5668:	
;rfid125.c: 148: keyID[ii/2] |= (i & 0x0F);
	clrc
	rrf	(get_RFID@ii),w
	addlw	_keyID&0ffh
	movwf	fsr0
	movf	(get_RFID@i),w
	andlw	0Fh
	iorwf	indf,f
	line	150
	
l5670:	
;rfid125.c: 149: }
;rfid125.c: 150: even_col ^= RF_serial_55bits[ii];
	movf	(get_RFID@ii),w
	addlw	get_RFID@RF_serial_55bits&0ffh
	movwf	fsr0
	movf	indf,w
	xorwf	(get_RFID@even_col),f
	line	126
	
l5672:	
	incf	(get_RFID@ii),f
	
l5674:	
	movlw	(0Ah)
	subwf	(get_RFID@ii),w
	skipc
	goto	u1491
	goto	u1490
u1491:
	goto	l5640
u1490:
	
l2095:	
	line	152
;rfid125.c: 151: }
;rfid125.c: 152: RF_serial_55bits[10] <<= 3;
	rlf	0+(get_RFID@RF_serial_55bits)+0Ah,f
	rlf	0+(get_RFID@RF_serial_55bits)+0Ah,f
	rlf	0+(get_RFID@RF_serial_55bits)+0Ah,w
	andlw	0f8h
	movwf	0+(get_RFID@RF_serial_55bits)+0Ah
	line	153
	
l5676:	
;rfid125.c: 153: keyID[0] =0x00;
	clrf	(_keyID)
	line	154
	
l5678:	
;rfid125.c: 154: if(((RF_serial_55bits[10] & 0xf0)==(even_col & 0xf0)) && (0==(RF_serial_55bits[10]&0x08)))
	movlw	(0F0h)
	andwf	(get_RFID@even_col),w
	movwf	(??_get_RFID+0)+0
	movf	0+(get_RFID@RF_serial_55bits)+0Ah,w
	andlw	0F0h
	xorwf	0+(??_get_RFID+0)+0,w
	skipz
	goto	u1501
	goto	u1500
u1501:
	goto	l5476
u1500:
	
l5680:	
	btfsc	0+(get_RFID@RF_serial_55bits)+0Ah,(3)&7
	goto	u1511
	goto	u1510
u1511:
	goto	l5476
u1510:
	line	157
	
l5682:	
;rfid125.c: 155: {
;rfid125.c: 157: return 1;
	movlw	(01h)
	line	161
	
l2047:	
	return
	opt stack 0
GLOBAL	__end_of_get_RFID
	__end_of_get_RFID:
;; =============== function _get_RFID ends ============

	signat	_get_RFID,89
	global	_eepromWriteByte
psect	text513,local,class=CODE,delta=2
global __ptext513
__ptext513:

;; *************** function _eepromWriteByte *****************
;; Defined at:
;;		line 26 in file "ms82_eeprom.c"
;; Parameters:    Size  Location     Type
;;  EEAddr          1    wreg     unsigned char 
;;  EEData          1    2[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  EEAddr          1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/20
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         1       0       0
;;      Locals:         1       0       0
;;      Temps:          2       0       0
;;      Totals:         4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_eepromWriteBlock
;;		_main
;; This function uses a non-reentrant model
;;
psect	text513
	file	"ms82_eeprom.c"
	line	26
	global	__size_of_eepromWriteByte
	__size_of_eepromWriteByte	equ	__end_of_eepromWriteByte-_eepromWriteByte
	
_eepromWriteByte:	
	opt	stack 4
; Regs used in _eepromWriteByte: [wreg]
;eepromWriteByte@EEAddr stored from wreg
	movwf	(eepromWriteByte@EEAddr)
	line	27
	
l5456:	
;ms82_eeprom.c: 27: GIE = 0;
	bcf	(95/8),(95)&7
	line	30
;ms82_eeprom.c: 29: {
;ms82_eeprom.c: 30: while(GIE) asm("clrwdt");
	goto	l1325
	
l1326:	
# 30 "ms82_eeprom.c"
clrwdt ;#
psect	text513
	
l1325:	
	btfsc	(95/8),(95)&7
	goto	u1071
	goto	u1070
u1071:
	goto	l1326
u1070:
	line	31
	
l5458:	
;ms82_eeprom.c: 31: EEADR = EEAddr;
	movf	(eepromWriteByte@EEAddr),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(155)^080h	;volatile
	line	32
;ms82_eeprom.c: 32: EEDAT = EEData;
	movf	(eepromWriteByte@EEData),w
	movwf	(154)^080h	;volatile
	line	33
	
l5460:	
;ms82_eeprom.c: 33: EEIF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(103/8),(103)&7
	line	34
;ms82_eeprom.c: 34: EECON1 = 0x34;
	movlw	(034h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(156)^080h	;volatile
	line	35
	
l5462:	
;ms82_eeprom.c: 35: WR = 1;
	bsf	(1256/8)^080h,(1256)&7
	line	36
;ms82_eeprom.c: 36: while(WR) asm("clrwdt");
	goto	l1328
	
l1329:	
# 36 "ms82_eeprom.c"
clrwdt ;#
psect	text513
	
l1328:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfsc	(1256/8)^080h,(1256)&7
	goto	u1081
	goto	u1080
u1081:
	goto	l1329
u1080:
	line	37
	
l5464:	
;ms82_eeprom.c: 37: _delay((unsigned long)((2)*(8000000/4000.0)));
	opt asmopt_off
movlw	6
movwf	((??_eepromWriteByte+0)+0+1),f
	movlw	48
movwf	((??_eepromWriteByte+0)+0),f
u1837:
	decfsz	((??_eepromWriteByte+0)+0),f
	goto	u1837
	decfsz	((??_eepromWriteByte+0)+0+1),f
	goto	u1837
	clrwdt
opt asmopt_on

	line	39
	
l5466:	
;ms82_eeprom.c: 38: }
;ms82_eeprom.c: 39: GIE = 1;
	bsf	(95/8),(95)&7
	line	40
	
l1331:	
	return
	opt stack 0
GLOBAL	__end_of_eepromWriteByte
	__end_of_eepromWriteByte:
;; =============== function _eepromWriteByte ends ============

	signat	_eepromWriteByte,8312
	global	_eepromReadBlock
psect	text514,local,class=CODE,delta=2
global __ptext514
__ptext514:

;; *************** function _eepromReadBlock *****************
;; Defined at:
;;		line 18 in file "ms82_eeprom.c"
;; Parameters:    Size  Location     Type
;;  addStart        1    wreg     unsigned char 
;;  buff            1    4[COMMON] PTR unsigned char 
;;		 -> buffTag(25), 
;;  len             1    5[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  addStart        1    7[COMMON] unsigned char 
;;  i               1    8[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/20
;;		On exit  : 0/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         2       0       0
;;      Locals:         2       0       0
;;      Temps:          1       0       0
;;      Totals:         5       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_eepromReadByte
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text514
	file	"ms82_eeprom.c"
	line	18
	global	__size_of_eepromReadBlock
	__size_of_eepromReadBlock	equ	__end_of_eepromReadBlock-_eepromReadBlock
	
_eepromReadBlock:	
	opt	stack 5
; Regs used in _eepromReadBlock: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;eepromReadBlock@addStart stored from wreg
	line	20
	movwf	(eepromReadBlock@addStart)
	
l5448:	
;ms82_eeprom.c: 19: unsigned char i;
;ms82_eeprom.c: 20: for(i=0;i<len;i++){
	clrf	(eepromReadBlock@i)
	goto	l5454
	line	21
	
l5450:	
;ms82_eeprom.c: 21: buff[i] = eepromReadByte(addStart+i);
	movf	(eepromReadBlock@i),w
	addwf	(eepromReadBlock@buff),w
	movwf	(??_eepromReadBlock+0)+0
	movf	0+(??_eepromReadBlock+0)+0,w
	movwf	fsr0
	movf	(eepromReadBlock@i),w
	addwf	(eepromReadBlock@addStart),w
	fcall	_eepromReadByte
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	20
	
l5452:	
	incf	(eepromReadBlock@i),f
	
l5454:	
	movf	(eepromReadBlock@len),w
	subwf	(eepromReadBlock@i),w
	skipc
	goto	u1061
	goto	u1060
u1061:
	goto	l5450
u1060:
	line	23
	
l1322:	
	return
	opt stack 0
GLOBAL	__end_of_eepromReadBlock
	__end_of_eepromReadBlock:
;; =============== function _eepromReadBlock ends ============

	signat	_eepromReadBlock,12408
	global	_sys_init
psect	text515,local,class=CODE,delta=2
global __ptext515
__ptext515:

;; *************** function _sys_init *****************
;; Defined at:
;;		line 3 in file "sysinit.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 60/20
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text515
	file	"sysinit.c"
	line	3
	global	__size_of_sys_init
	__size_of_sys_init	equ	__end_of_sys_init-_sys_init
	
_sys_init:	
	opt	stack 6
; Regs used in _sys_init: [wreg]
	line	21
	
l5444:	
;sysinit.c: 21: OSCCON = 0B01100001;
	movlw	(061h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(143)^080h	;volatile
	line	22
	
l5446:	
;sysinit.c: 22: _nop();
	nop
	line	28
;sysinit.c: 28: while(HTS==0);
	
l651:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1146/8)^080h,(1146)&7
	goto	u1051
	goto	u1050
u1051:
	goto	l651
u1050:
	line	30
	
l654:	
	return
	opt stack 0
GLOBAL	__end_of_sys_init
	__end_of_sys_init:
;; =============== function _sys_init ends ============

	signat	_sys_init,88
	global	___lbdiv
psect	text516,local,class=CODE,delta=2
global __ptext516
__ptext516:

;; *************** function ___lbdiv *****************
;; Defined at:
;;		line 5 in file "D:\OneDrive\SmarRF\MCU\MC82\IDE\ORIGINIDE_V2.0.9\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lbdiv.c"
;; Parameters:    Size  Location     Type
;;  dividend        1    wreg     unsigned char 
;;  divisor         1    2[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  dividend        1    3[COMMON] unsigned char 
;;  quotient        1    5[COMMON] unsigned char 
;;  counter         1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         1       0       0
;;      Locals:         3       0       0
;;      Temps:          0       0       0
;;      Totals:         4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_get_RFID
;;		_id_search
;; This function uses a non-reentrant model
;;
psect	text516
	file	"D:\OneDrive\SmarRF\MCU\MC82\IDE\ORIGINIDE_V2.0.9\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lbdiv.c"
	line	5
	global	__size_of___lbdiv
	__size_of___lbdiv	equ	__end_of___lbdiv-___lbdiv
	
___lbdiv:	
	opt	stack 5
; Regs used in ___lbdiv: [wreg+status,2+status,0]
;___lbdiv@dividend stored from wreg
	line	9
	movwf	(___lbdiv@dividend)
	
l5420:	
	clrf	(___lbdiv@quotient)
	line	10
	
l5422:	
	movf	(___lbdiv@divisor),w
	skipz
	goto	u1010
	goto	l5440
u1010:
	line	11
	
l5424:	
	clrf	(___lbdiv@counter)
	incf	(___lbdiv@counter),f
	line	12
	goto	l5428
	
l4222:	
	line	13
	clrc
	rlf	(___lbdiv@divisor),f
	line	14
	
l5426:	
	incf	(___lbdiv@counter),f
	line	12
	
l5428:	
	btfss	(___lbdiv@divisor),(7)&7
	goto	u1021
	goto	u1020
u1021:
	goto	l4222
u1020:
	line	16
	
l4224:	
	line	17
	clrc
	rlf	(___lbdiv@quotient),f
	line	18
	
l5430:	
	movf	(___lbdiv@divisor),w
	subwf	(___lbdiv@dividend),w
	skipc
	goto	u1031
	goto	u1030
u1031:
	goto	l5436
u1030:
	line	19
	
l5432:	
	movf	(___lbdiv@divisor),w
	subwf	(___lbdiv@dividend),f
	line	20
	
l5434:	
	bsf	(___lbdiv@quotient)+(0/8),(0)&7
	line	22
	
l5436:	
	clrc
	rrf	(___lbdiv@divisor),f
	line	23
	
l5438:	
	decfsz	(___lbdiv@counter),f
	goto	u1041
	goto	u1040
u1041:
	goto	l4224
u1040:
	line	25
	
l5440:	
	movf	(___lbdiv@quotient),w
	line	26
	
l4227:	
	return
	opt stack 0
GLOBAL	__end_of___lbdiv
	__end_of___lbdiv:
;; =============== function ___lbdiv ends ============

	signat	___lbdiv,8313
	global	___bmul
psect	text517,local,class=CODE,delta=2
global __ptext517
__ptext517:

;; *************** function ___bmul *****************
;; Defined at:
;;		line 3 in file "D:\OneDrive\SmarRF\MCU\MC82\IDE\ORIGINIDE_V2.0.9\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\bmul.c"
;; Parameters:    Size  Location     Type
;;  multiplier      1    wreg     unsigned char 
;;  multiplicand    1    2[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  multiplier      1    4[COMMON] unsigned char 
;;  product         1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         1       0       0
;;      Locals:         2       0       0
;;      Temps:          0       0       0
;;      Totals:         3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_id_replate
;; This function uses a non-reentrant model
;;
psect	text517
	file	"D:\OneDrive\SmarRF\MCU\MC82\IDE\ORIGINIDE_V2.0.9\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\bmul.c"
	line	3
	global	__size_of___bmul
	__size_of___bmul	equ	__end_of___bmul-___bmul
	
___bmul:	
	opt	stack 5
; Regs used in ___bmul: [wreg+status,2+status,0]
;___bmul@multiplier stored from wreg
	movwf	(___bmul@multiplier)
	line	4
	
l5404:	
	clrf	(___bmul@product)
	line	7
	
l5406:	
	btfss	(___bmul@multiplier),(0)&7
	goto	u991
	goto	u990
u991:
	goto	l5410
u990:
	line	8
	
l5408:	
	movf	(___bmul@multiplicand),w
	addwf	(___bmul@product),f
	line	9
	
l5410:	
	clrc
	rlf	(___bmul@multiplicand),f
	line	10
	
l5412:	
	clrc
	rrf	(___bmul@multiplier),f
	line	11
	
l5414:	
	movf	(___bmul@multiplier),f
	skipz
	goto	u1001
	goto	u1000
u1001:
	goto	l5406
u1000:
	line	12
	
l5416:	
	movf	(___bmul@product),w
	line	13
	
l4191:	
	return
	opt stack 0
GLOBAL	__end_of___bmul
	__end_of___bmul:
;; =============== function ___bmul ends ============

	signat	___bmul,8313
	global	_setState
psect	text518,local,class=CODE,delta=2
global __ptext518
__ptext518:

;; *************** function _setState *****************
;; Defined at:
;;		line 148 in file "MAIN.C"
;; Parameters:    Size  Location     Type
;;  stt             1    wreg     unsigned char 
;;  _tOut           2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  stt             1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/20
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         2       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text518
	file	"MAIN.C"
	line	148
	global	__size_of_setState
	__size_of_setState	equ	__end_of_setState-_setState
	
_setState:	
	opt	stack 6
; Regs used in _setState: [wreg+status,2]
;setState@stt stored from wreg
	line	150
	movwf	(setState@stt)
	
l5398:	
;MAIN.C: 150: mtState = stt;
	movf	(setState@stt),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_mtState)
	line	151
	
l5400:	
;MAIN.C: 151: timeTick =0;
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	152
	
l5402:	
;MAIN.C: 152: timeOut = _tOut;
	movf	(setState@_tOut+1),w
	movwf	(_timeOut+1)
	movf	(setState@_tOut),w
	movwf	(_timeOut)
	line	153
	
l3454:	
	return
	opt stack 0
GLOBAL	__end_of_setState
	__end_of_setState:
;; =============== function _setState ends ============

	signat	_setState,8312
	global	_SET_EPWM_ON
psect	text519,local,class=CODE,delta=2
global __ptext519
__ptext519:

;; *************** function _SET_EPWM_ON *****************
;; Defined at:
;;		line 11 in file "ms82_pwm.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 60/20
;;		On exit  : 60/20
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text519
	file	"ms82_pwm.c"
	line	11
	global	__size_of_SET_EPWM_ON
	__size_of_SET_EPWM_ON	equ	__end_of_SET_EPWM_ON-_SET_EPWM_ON
	
_SET_EPWM_ON:	
	opt	stack 6
; Regs used in _SET_EPWM_ON: [wreg+status,2]
	line	12
	
l5372:	
;ms82_pwm.c: 12: TRISC |= 0b00000100;
	bsf	(135)^080h+(2/8),(2)&7	;volatile
	line	13
	
l5374:	
;ms82_pwm.c: 13: PR2 = 15;
	movlw	(0Fh)
	movwf	(146)^080h	;volatile
	line	14
	
l5376:	
;ms82_pwm.c: 14: EPWMR1L =0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(19)	;volatile
	line	15
	
l5378:	
;ms82_pwm.c: 15: EPWM1CON = 0b10011100;
	movlw	(09Ch)
	movwf	(21)	;volatile
	line	16
;ms82_pwm.c: 16: TMR2 = 0;
	clrf	(17)	;volatile
	line	17
	
l5380:	
;ms82_pwm.c: 17: TMR2IF = 0;
	bcf	(97/8),(97)&7
	line	18
	
l5382:	
;ms82_pwm.c: 18: T2CON = 0B00000100;
	movlw	(04h)
	movwf	(18)	;volatile
	line	19
;ms82_pwm.c: 19: while(TMR2IF==1) asm("clrwdt");
	goto	l2750
	
l2751:	
# 19 "ms82_pwm.c"
clrwdt ;#
psect	text519
	
l2750:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(97/8),(97)&7
	goto	u961
	goto	u960
u961:
	goto	l2751
u960:
	line	20
	
l5384:	
;ms82_pwm.c: 20: PWM1CON = 0b00010000;
	movlw	(010h)
	movwf	(22)	;volatile
	line	21
;ms82_pwm.c: 21: EPWM1AUX = 0b10001000;
	movlw	(088h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	line	22
	
l5386:	
;ms82_pwm.c: 22: TRISC &= 0b11111011;
	bcf	(135)^080h+(2/8),(2)&7	;volatile
	line	23
	
l2753:	
	return
	opt stack 0
GLOBAL	__end_of_SET_EPWM_ON
	__end_of_SET_EPWM_ON:
;; =============== function _SET_EPWM_ON ends ============

	signat	_SET_EPWM_ON,88
	global	_timerOut
psect	text520,local,class=CODE,delta=2
global __ptext520
__ptext520:

;; *************** function _timerOut *****************
;; Defined at:
;;		line 6 in file "rfid125.c"
;; Parameters:    Size  Location     Type
;;  Logic           1    wreg     unsigned char 
;;  time            2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  Logic           1    4[COMMON] unsigned char 
;;  CurTimer        2    5[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;                  2    2[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         2       0       0
;;      Locals:         3       0       0
;;      Temps:          0       0       0
;;      Totals:         5       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_get_RFID
;; This function uses a non-reentrant model
;;
psect	text520
	file	"rfid125.c"
	line	6
	global	__size_of_timerOut
	__size_of_timerOut	equ	__end_of_timerOut-_timerOut
	
_timerOut:	
	opt	stack 5
; Regs used in _timerOut: [wreg+status,2]
;timerOut@Logic stored from wreg
	line	8
	movwf	(timerOut@Logic)
	
l5352:	
;rfid125.c: 7: unsigned int CurTimer;
;rfid125.c: 8: TMR1ON = 0;
	bcf	(128/8),(128)&7
	line	9
	
l5354:	
;rfid125.c: 9: TMR1H = 0;
	clrf	(15)	;volatile
	line	10
;rfid125.c: 10: TMR1L = 0;
	clrf	(14)	;volatile
	line	11
	
l5356:	
;rfid125.c: 11: TMR1IF = 0;
	bcf	(96/8),(96)&7
	line	12
	
l5358:	
;rfid125.c: 12: TMR1ON = 1;
	bsf	(128/8),(128)&7
	line	13
;rfid125.c: 13: while(RA4==Logic){
	goto	l5366
	line	14
	
l5360:	
;rfid125.c: 14: CurTimer= (TMR1H <<8 )| TMR1L;
	movf	(15),w	;volatile
	movwf	(timerOut@CurTimer+1)
	clrf	(timerOut@CurTimer)
	movf	(14),w	;volatile
	iorwf	(timerOut@CurTimer),f
	line	15
;rfid125.c: 15: if(CurTimer>time)
	movf	(timerOut@CurTimer+1),w
	subwf	(timerOut@time+1),w
	skipz
	goto	u945
	movf	(timerOut@CurTimer),w
	subwf	(timerOut@time),w
u945:
	skipnc
	goto	u941
	goto	u940
u941:
	goto	l5366
u940:
	line	16
	
l5362:	
;rfid125.c: 16: return 0;
	clrf	(?_timerOut)
	clrf	(?_timerOut+1)
	goto	l2041
	line	13
	
l5366:	
	movlw	0
	btfsc	(44/8),(44)&7
	movlw	1
	xorwf	(timerOut@Logic),w
	skipnz
	goto	u951
	goto	u950
u951:
	goto	l5360
u950:
	line	18
	
l5368:	
;rfid125.c: 17: }
;rfid125.c: 18: return CurTimer;
	movf	(timerOut@CurTimer+1),w
	movwf	(?_timerOut+1)
	movf	(timerOut@CurTimer),w
	movwf	(?_timerOut)
	line	19
	
l2041:	
	return
	opt stack 0
GLOBAL	__end_of_timerOut
	__end_of_timerOut:
;; =============== function _timerOut ends ============

	signat	_timerOut,8314
	global	_comArr
psect	text521,local,class=CODE,delta=2
global __ptext521
__ptext521:

;; *************** function _comArr *****************
;; Defined at:
;;		line 52 in file "ms82_eeprom.c"
;; Parameters:    Size  Location     Type
;;  arr1            1    wreg     PTR unsigned char 
;;		 -> keyID(5), 
;;  arr2            1    2[COMMON] PTR unsigned char 
;;		 -> buffTag(25), 
;;  len1            1    3[COMMON] unsigned char 
;;  len2            1    4[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  arr1            1    8[COMMON] PTR unsigned char 
;;		 -> keyID(5), 
;;  i               1    9[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         3       0       0
;;      Locals:         2       0       0
;;      Temps:          3       0       0
;;      Totals:         8       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_id_search
;; This function uses a non-reentrant model
;;
psect	text521
	file	"ms82_eeprom.c"
	line	52
	global	__size_of_comArr
	__size_of_comArr	equ	__end_of_comArr-_comArr
	
_comArr:	
	opt	stack 5
; Regs used in _comArr: [wreg-fsr0h+status,2+status,0]
;comArr@arr1 stored from wreg
	line	55
	movwf	(comArr@arr1)
	
l5320:	
;ms82_eeprom.c: 53: unsigned char i;
;ms82_eeprom.c: 55: if(len1!=len2)
	movf	(comArr@len1),w
	xorwf	(comArr@len2),w
	skipnz
	goto	u901
	goto	u900
u901:
	goto	l5328
u900:
	line	56
	
l5322:	
;ms82_eeprom.c: 56: return 0;
	movlw	(0)
	goto	l1341
	line	58
	
l5328:	
;ms82_eeprom.c: 57: else{
;ms82_eeprom.c: 58: for(i=0;i<len1;i++){
	clrf	(comArr@i)
	goto	l5338
	line	59
	
l5330:	
;ms82_eeprom.c: 59: if(*(arr1+i) != *(arr2+i)){
	movf	(comArr@i),w
	addwf	(comArr@arr2),w
	movwf	(??_comArr+0)+0
	movf	0+(??_comArr+0)+0,w
	movwf	fsr
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_comArr+1)+0
	movf	(comArr@i),w
	addwf	(comArr@arr1),w
	movwf	(??_comArr+2)+0
	movf	0+(??_comArr+2)+0,w
	movwf	fsr0
	movf	indf,w
	xorwf	(??_comArr+1)+0,w
	skipnz
	goto	u911
	goto	u910
u911:
	goto	l5336
u910:
	goto	l5322
	line	58
	
l5336:	
	incf	(comArr@i),f
	
l5338:	
	movf	(comArr@len1),w
	subwf	(comArr@i),w
	skipc
	goto	u921
	goto	u920
u921:
	goto	l5330
u920:
	line	63
	
l5340:	
;ms82_eeprom.c: 61: }
;ms82_eeprom.c: 62: }
;ms82_eeprom.c: 63: if(i==len1)
	movf	(comArr@i),w
	xorwf	(comArr@len1),w
	skipz
	goto	u931
	goto	u930
u931:
	goto	l5322
u930:
	line	64
	
l5342:	
;ms82_eeprom.c: 64: return 1;
	movlw	(01h)
	line	68
	
l1341:	
	return
	opt stack 0
GLOBAL	__end_of_comArr
	__end_of_comArr:
;; =============== function _comArr ends ============

	signat	_comArr,16505
	global	_eepromReadByte
psect	text522,local,class=CODE,delta=2
global __ptext522
__ptext522:

;; *************** function _eepromReadByte *****************
;; Defined at:
;;		line 7 in file "ms82_eeprom.c"
;; Parameters:    Size  Location     Type
;;  EEAddr          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  EEAddr          1    2[COMMON] unsigned char 
;;  ReEepromData    1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/20
;;		On exit  : 60/20
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         2       0       0
;;      Temps:          0       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_eepromReadBlock
;;		_main
;; This function uses a non-reentrant model
;;
psect	text522
	file	"ms82_eeprom.c"
	line	7
	global	__size_of_eepromReadByte
	__size_of_eepromReadByte	equ	__end_of_eepromReadByte-_eepromReadByte
	
_eepromReadByte:	
	opt	stack 5
; Regs used in _eepromReadByte: [wreg]
;eepromReadByte@EEAddr stored from wreg
	line	10
	movwf	(eepromReadByte@EEAddr)
	
l5312:	
;ms82_eeprom.c: 8: unsigned char ReEepromData;
;ms82_eeprom.c: 10: EEADR = EEAddr;
	movf	(eepromReadByte@EEAddr),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(155)^080h	;volatile
	line	11
	
l5314:	
;ms82_eeprom.c: 11: RD = 1;
	bsf	(1248/8)^080h,(1248)&7
	line	12
;ms82_eeprom.c: 12: ReEepromData = EEDAT;
	movf	(154)^080h,w	;volatile
	movwf	(eepromReadByte@ReEepromData)
	line	13
	
l5316:	
;ms82_eeprom.c: 13: RD = 0;
	bcf	(1248/8)^080h,(1248)&7
	line	14
;ms82_eeprom.c: 14: return ReEepromData;
	movf	(eepromReadByte@ReEepromData),w
	line	15
	
l1316:	
	return
	opt stack 0
GLOBAL	__end_of_eepromReadByte
	__end_of_eepromReadByte:
;; =============== function _eepromReadByte ends ============

	signat	_eepromReadByte,4217
	global	_int_init
psect	text523,local,class=CODE,delta=2
global __ptext523
__ptext523:

;; *************** function _int_init *****************
;; Defined at:
;;		line 66 in file "sysinit.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/20
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text523
	file	"sysinit.c"
	line	66
	global	__size_of_int_init
	__size_of_int_init	equ	__end_of_int_init-_int_init
	
_int_init:	
	opt	stack 6
; Regs used in _int_init: [status,2]
	line	71
	
l5292:	
;sysinit.c: 71: INTCON = 0B00000000;
	clrf	(11)	;volatile
	line	72
;sysinit.c: 72: PIE1 = 0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(140)^080h	;volatile
	line	73
;sysinit.c: 73: PIR1 = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(12)	;volatile
	line	85
	
l5294:	
;sysinit.c: 85: T0IF = 0;
	bcf	(90/8),(90)&7
	line	86
	
l5296:	
;sysinit.c: 86: T0IE = 0;
	bcf	(93/8),(93)&7
	line	87
	
l5298:	
;sysinit.c: 87: TMR1ON = 0;
	bcf	(128/8),(128)&7
	line	89
	
l5300:	
;sysinit.c: 89: TMR2IF = 0;
	bcf	(97/8),(97)&7
	line	90
	
l5302:	
;sysinit.c: 90: TMR2IE = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1121/8)^080h,(1121)&7
	line	93
	
l5304:	
;sysinit.c: 93: TMR1IF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(96/8),(96)&7
	line	94
	
l5306:	
;sysinit.c: 94: TMR1IE = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1120/8)^080h,(1120)&7
	line	96
	
l5308:	
;sysinit.c: 96: PEIE = 0;
	bcf	(94/8),(94)&7
	line	98
	
l5310:	
;sysinit.c: 98: GIE = 1;
	bsf	(95/8),(95)&7
	line	99
	
l663:	
	return
	opt stack 0
GLOBAL	__end_of_int_init
	__end_of_int_init:
;; =============== function _int_init ends ============

	signat	_int_init,88
	global	_timer_init
psect	text524,local,class=CODE,delta=2
global __ptext524
__ptext524:

;; *************** function _timer_init *****************
;; Defined at:
;;		line 44 in file "sysinit.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 60/20
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text524
	file	"sysinit.c"
	line	44
	global	__size_of_timer_init
	__size_of_timer_init	equ	__end_of_timer_init-_timer_init
	
_timer_init:	
	opt	stack 6
; Regs used in _timer_init: [wreg]
	line	46
	
l5290:	
;sysinit.c: 46: OPTION = 0B00000001;
	movlw	(01h)
	movwf	(129)^080h	;volatile
	line	59
;sysinit.c: 59: TMR1H = -5000>>8;
	movlw	(0ECh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(15)	;volatile
	line	60
;sysinit.c: 60: TMR1L = -5000;
	movlw	(078h)
	movwf	(14)	;volatile
	line	61
;sysinit.c: 61: T1CON = 0B00100001;
	movlw	(021h)
	movwf	(16)	;volatile
	line	63
	
l660:	
	return
	opt stack 0
GLOBAL	__end_of_timer_init
	__end_of_timer_init:
;; =============== function _timer_init ends ============

	signat	_timer_init,88
	global	_gpio_init
psect	text525,local,class=CODE,delta=2
global __ptext525
__ptext525:

;; *************** function _gpio_init *****************
;; Defined at:
;;		line 32 in file "sysinit.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 60/20
;;		On exit  : 60/20
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text525
	file	"sysinit.c"
	line	32
	global	__size_of_gpio_init
	__size_of_gpio_init	equ	__end_of_gpio_init-_gpio_init
	
_gpio_init:	
	opt	stack 6
; Regs used in _gpio_init: [wreg+status,2]
	line	34
	
l5280:	
;sysinit.c: 34: PORTA = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(5)	;volatile
	line	35
	
l5282:	
;sysinit.c: 35: TRISA = 0B01110111;
	movlw	(077h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	36
	
l5284:	
;sysinit.c: 36: WPUA = 0B10010000;
	movlw	(090h)
	movwf	(149)^080h	;volatile
	line	37
	
l5286:	
;sysinit.c: 37: PORTC = 0B00000010;
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(7)	;volatile
	line	38
	
l5288:	
;sysinit.c: 38: TRISC = 0B11111110;
	movlw	(0FEh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(135)^080h	;volatile
	line	39
;sysinit.c: 39: WPUC = 0B00000000;
	clrf	(136)^080h	;volatile
	line	41
	
l657:	
	return
	opt stack 0
GLOBAL	__end_of_gpio_init
	__end_of_gpio_init:
;; =============== function _gpio_init ends ============

	signat	_gpio_init,88
	global	_ISR
psect	text526,local,class=CODE,delta=2
global __ptext526
__ptext526:

;; *************** function _ISR *****************
;; Defined at:
;;		line 87 in file "MAIN.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          2       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text526
	file	"MAIN.C"
	line	87
	global	__size_of_ISR
	__size_of_ISR	equ	__end_of_ISR-_ISR
	
_ISR:	
	opt	stack 3
; Regs used in _ISR: [wreg]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_ISR+0)
	movf	pclath,w
	movwf	(??_ISR+1)
	ljmp	_ISR
psect	text526
	line	113
	
i1l5388:	
;MAIN.C: 113: if(T0IE&&T0IF)
	btfss	(93/8),(93)&7
	goto	u97_21
	goto	u97_20
u97_21:
	goto	i1l3451
u97_20:
	
i1l5390:	
	btfss	(90/8),(90)&7
	goto	u98_21
	goto	u98_20
u98_21:
	goto	i1l3451
u98_20:
	line	115
	
i1l5392:	
;MAIN.C: 114: {
;MAIN.C: 115: T0IF = 0;
	bcf	(90/8),(90)&7
	line	117
	
i1l5394:	
;MAIN.C: 117: TMR0 = buzFre;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_buzFre),w
	movwf	(1)	;volatile
	line	118
;MAIN.C: 118: RC0 = ~RC0;
	movlw	1<<((56)&7)
	xorwf	((56)/8),f
	line	145
	
i1l3451:	
	movf	(??_ISR+1),w
	movwf	pclath
	swapf	(??_ISR+0)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_ISR
	__end_of_ISR:
;; =============== function _ISR ends ============

	signat	_ISR,88
psect	text527,local,class=CODE,delta=2
global __ptext527
__ptext527:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
