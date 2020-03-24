//Project: smartkey.prj
// Device: MS82Fxx02
// Memory: Flash 2KX14b, EEPROM 128X8b, SRAM 128X8b
// Author:
//Company:
//Version:
//   Date:
//===========================================================
//===========================================================


/*
//

// tat ca deu k co 833
	Smart
    k cos tinh nawng sao chia cua the bao hanh
    = su dung the chu khi sao chia thuong
    // co tinh nang sao the bao hanh
    Asimo
    3-5s-> keu coi, sau 20s-> sao chia
    Asimo Coi(bo cuon day)
    5s-> keu,tuong tu MH35
    ///========
    //** y tuong
    su dung Password de xoa toan bo the da luu bao gom ca the master
    su dung timeOut chinh xac de vao trang thai nhap pw

asimoBz =  Coi su dung cuon day
asimoRl = Su dung coi xe, bat tat bang relay
asimoBzEx = Su dung coi roi, bat tat bang trans truc tiep

define "asimoRl" & "asimoBzEx" => su dung coi roi
define "asimoRl" => su dung relay
*/

#include 	"main.h"

#define maxTag 5
///=============
//#define asimoBz
#define asimoRl
#define asimoBzEx
///=============

unsigned int timeOut , timeTick = 0;
unsigned char  mtState = 0;//
unsigned char keyID[5] = {0, 0, 0, 0, 0};
unsigned char buffTag[25] = {0, 0, 0x11, 0x0b, 0x4f, //master
                             0, 0, 0x81, 0x2f, 0x22,	//subport
                             0, 0, 0x7d, 0x67, 0x05, //tag1
                             0, 0, 0x7e, 0x31, 0xe7, //tag2
                             0, 0, 0x7e, 0x51, 0xe6, //tag3
                            };


//unsigned char const master[5]={0,0,0x11,0x0b,0x4f};

//===========================================================
//Variable definition
//===========================================================
void delay_x10ms(unsigned char t) {
	while (t--)
		__delay_ms(10);
}
void beep(unsigned char delay, unsigned char rep) {
#ifdef asimoBz
	unsigned int t;

	while (rep--) {
		t = 25 * delay;
		while (t--) {
			buzzer = ~buzzer;
			__delay_us(428);

		}
		buzzer = 0;
		delay_x10ms(delay);
	}
#endif
#ifdef asimoRl
	while (rep--) {
		buzzer = 1;
		delay_x10ms(delay);
		buzzer = 0;
		delay_x10ms(20);
	}
#endif
}

void interrupt ISR(void)
{
//	unsigned char tmp=0;
//=============
//
	/*
		if(PAIE && PAIF){

			tmp = PORTA;		//
			PAIF = 0;          //clear flag
			return;
		}
	 */
//====================
	/*
		if(INTE&&INTF)
			{
				INTF = 0;

	            Suon xuong -> luu EEPROM



	            return;
			}*/

//====================
/*
	if (T0IE && T0IF)
	{
		T0IF = 0;
#ifdef  asimoBz
		TMR0 = buzFre;//
		buzzer = ~buzzer;
#endif
#ifdef  asimoRl
		buzzer = 0;
#endif
		return;
	}
	*/
//====================
//====================
// Timer1 Interrup
	/*
		if(TMR1IE&&TMR1IF){

	        TMR1IF = 0;
			return;
	  	}
	    */
//====================
// Timer2 ->> buzzer
	/*
	if(TMR2IE&&TMR2IF)
		{
			TMR2IF = 0;
	           return;

		}
	   */
}


void setState(unsigned char stt, unsigned int _tOut) {

	mtState = stt;
	timeTick = 0;
	timeOut = _tOut;
}

unsigned char id_search(unsigned char *id_input, unsigned char *buff) {
	unsigned char i;
	for (i = 0; i < 21; i += 5) {
		if (comArr(id_input, buff + i, 5, 5))
			return i / 5 + 1;
	}
	return 255;
}
void id_replate(unsigned char id, unsigned char *Cont, unsigned char *buff ) {
	id = (id - 1) * 5;
	{
		{
			*(buff + id)  = *Cont;
			*(buff + 1 + id)  = *(Cont + 1);
			*(buff + 2 + id)  = *(Cont + 2);
			*(buff + 3 + id)  = *(Cont + 3);
			*(buff + 4 + id)  = *(Cont + 4);
		}
	}

	eepromWriteBlock(__memBegin, buffTag, 25);
}
void id_clear(unsigned char idMin, unsigned char idMax) {
	unsigned char  tmp[5] = {0xff, 0xff, 0xff, 0xff, 0xff};
	for (idMin; idMin <= idMax; idMin++)
		id_replate(idMin, tmp, buffTag);
}

void beep2(unsigned char sel, unsigned char rep) {
	while (rep--) {
		buzzer = 1; if (sel)swMainOut = 1;
		delay_x10ms(20);
		buzzer = 0; if (sel)swMainOut = 0;
		delay_x10ms(20);
	}
}

void buzDelay(unsigned char type) {
	unsigned int t;
	if (!type) t = 1600; //2000
	else t = 2666;//3000

	while (t--) {
		buzzer = ~buzzer;
		if (!type) {__delay_us(480);} //250us
		else {__delay_us(290);}//150us
	}

}

void main(void)
{

	unsigned char idop, tmp, idState = 0; // tag RFID code
    unsigned int t;
    unsigned char buzFre = 0;
    unsigned char t1;
	CLRWDT();

	sys_init();
	gpio_init();

	timer_init();
	int_init();

// init EEPROM
//...
//Write twice at an arbitrary address that is not used 0xAA
// If the program has read and write EEPROM, this operation must be performed
	eepromWriteByte(0xFF, 0xAA);
	eepromWriteByte(0xFF, 0xAA);
//them delay giua read delay write

	TRISC &= 0xfe;

	SET_EPWM_ON();

	//Power On
	//beep(2);
	__delay_ms(20);
//eepromReadBlock(__memBegin,buffTag,25);

//<<< su dung WDT>>>

	if (eepromReadByte(__memBegin) != 0) {
		//setState(_firstProg,tOut_firstProg);// fist prog
		// tmp=0;
		//write master tag
		eepromWriteByte(__memBegin, 0); //0= master xuong
		eepromWriteByte(__memBegin + 1, 0); //0
		eepromWriteByte(__memBegin + 2, 0x87); //87
		eepromWriteByte(__memBegin + 3, 0x3a); //3a
		eepromWriteByte(__memBegin + 4, 0xf8); //f8

	}
	eepromReadBlock(__memBegin, buffTag, maxTag * 5);

	setState(_PwOn, tOut_PwOn);

///////

	tmp = 0;

	while (1) {
		//GIE = 0;
		idop =    get_RFID();
		//GIE = 1;
		if (idop) {
			idop = id_search(keyID, buffTag);
			switch (mtState) {
			case _PwOn:
			case _Alert:
				if ((idop > 1) && (idop < 6))
				{
					setState(_Open, tOut_Open);
					//beep(10,1);
				}
				else if (idop == 1)
				{
					//clear subTag
					id_clear(2, 5);
					setState(_subTagProg, 0); //
					tmp = 1; //start tag2
#ifdef  asimoBz
					beep(10, 3);
#endif
#ifdef  asimoRl
					beep2(0, 3);
#endif
				}

				break;

			case _Open:

				break;

			case _rProg:
				if (idop == 1 && idState == 0) {	// masterTag
					//clear subTag
					id_clear(2, maxTag);
					setState(_subTagProg, 0); //setState(_subTagProg,80);
					tmp = 1; //start tag2
#ifdef  asimoBz
					beep(10, 3);
#endif
#ifdef  asimoRl
					beep2(0, 3);
#endif
				}
				else if (idop == 2 && idState == 0) { // subTag
					//clear norTag
					id_clear(3, maxTag);
					setState(_norTagProg, 0); //setState(_norTagProg,80);
					tmp = 2; //start tag3
#ifdef  asimoBz
					beep(10, 2);
#endif
#ifdef  asimoRl
					beep2(1, 2);
#endif
				}
				break;
			case _subTagProg:
				//must be difiren marter tag
				if (idState == 0) {
					/*
					if(idop !=1){
						id_replate(2,keyID,buffTag);
						timeTick=0;
						beep(10,1);
					    */
					if ( idop != 1) {
						tmp++;
						//if(tmp==5) tmp =3;
						if (tmp <= maxTag) {
							id_replate(tmp, keyID, buffTag);
							timeTick = 0;
#ifdef  asimoBz
							beep(10, 1);
#endif
#ifdef  asimoRl
							beep2(1, 2);
#endif
						}
					} else {
						//beep(10,5);
					}
				} else {

#ifdef  asimoBz
					beep(10, 1);
#endif
#ifdef  asimoRl
					beep2(0, 1);
#endif
				}
				break;
			case _norTagProg:
				//must be difiren sub tag and marter tag
				if (idState == 0) {
					if ( idop > 2) {
						tmp++;
						//if(tmp==5) tmp =3;
						if (tmp <= maxTag) {
							id_replate(tmp, keyID, buffTag);
							timeTick = 0;

#ifdef  asimoBz
							beep(10, 1);
#endif
#ifdef  asimoRl
							beep2(1, 2);
#endif
						}
					} else {
						//beep(10,5);
					}
				} else {
#ifdef  asimoBz
					beep(10, 1);
#endif
#ifdef  asimoRl
					beep2(0, 1);
#endif
				}
				break;

			}

			idState = 1;
			__delay_ms(61);
		}
		else {
			idState = 0;
			__delay_ms(150);
		}

//========================== time out

		if ((timeOut != 0) && ( timeTick > timeOut)) {

			switch (mtState) {

			case _PwOn:
				setState(_Alert, tOut_Alert); // time out Asimo 20s, MH35 5s
				//buzFre=0x6a;
				break;
			case _Alert:
				setState(_rProg, tOut_rProg);
				break;
			case _rProg:
				setState(_Alert, 0);
				//buzFre=0x6a;

				break;

			}
		}

//============Set
		if (mtState == _Open) swMainOut = 1;
		else swMainOut = 0;

		// __delay_ms(100);

		//77 85  58 6c 69 [6a] 75 70

//==========
#ifdef asimoRl
#ifdef asimoBzEx
	if (mtState == _Alert) {

			buzzer = 1;
		} else {
			buzzer = 0;
		};
#else
		if (mtState == _Alert) {


			if (timeTick % 3 == 0) {

				buzzer = ~buzzer;

			}
		} else buzzer = 0;
#endif
        
#endif

#ifdef asimoBz
		if (mtState == _Alert) {

			//buzDelay(buzFre);

			if (buzFre) t = 1600; //2000
			else t = 2666;//3000

			while (t--) {
				buzzer = ~buzzer;
				if (buzFre) {__delay_us(480);} //250us
				else {__delay_us(290);}//150us
			}
			buzFre = ~buzFre;

		}
		else {__delay_ms(800);}//=400ms
		
#endif
//=============

		timeTick++;

	}

}
//===========================================================
