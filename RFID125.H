#ifndef _RFID_H
#define _RFID_H

#include "main.h"

#define RFID_ID       RA5

#define timeMax   150//600   		max time of signal				
#define timeMin   72//290 	min time of signal
  						
#define CntH	0
#define CntL 	TMR0
#define CntOn 	T0ON  = 1
#define CntOff 	T0ON  = 0

extern unsigned char keyID[5];
unsigned char get_RFID();//


#endif 