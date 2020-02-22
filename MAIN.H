#ifndef main_h
#define main_h

#include	"SYSCFG.h";
#include 	"MS86Fxx02.h";
#include 	"sysInit.H"
#include 	"rfid125.h"
#include 	"ms82_eeprom.h"
#include 	"ms82_pwm.h"
//#include 	"memHandler.h"

#ifndef _XTAL_FREQ
 // Unless already defined assume 4MHz system frequency
 // This definition is required to calibrate __delay_us() and __delay_ms()
 #define _XTAL_FREQ 8000000
#endif

// Timestamp

// GPIO
#define swMainOut	RA3

#define buzzer		RC0

#define w125		RC5
#define dataIn		RA5

// Status
#define _Open	0
#define tOut_Open	0

#define _PwOn	1
#define tOut_PwOn	12	//~4.30s

#define _Alert		2
#define tOut_Alert  42	//85~6.30s
#define add_Alert 0x08

#define _subTagProg	3

#define _matTagProg	4

#define _norTagProg		5

#define _rProg		6
#define tOut_rProg	7 //~3s

#define _PwTp		7
#define tOut_PwTp	1

#define _firstProg	8
#define tOut_firstProg	4
// save serial numbers
#define serEE	0x10

#define _Timer1			-5000	//*2us = 10ms

//typedef unsigned char uint8_t;
//typedef unsigned int uint16_t;

// Emergency Start password
#define pwES1 8
#define pwES2 3
#define pwES3 3

// byte addess
#define addOldState 0x00
#define addEmgStart 0x01
#define addNoPw 0x02
#define addPwIn1	0x03
#define addPwIn2	0x04
#define addPwIn3	0x05



#endif