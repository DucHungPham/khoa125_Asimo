//Deviec:MS82Fxx02
//-----------------------Variable---------------------------------
		_buzFre		EQU		25H
		_timeOut		EQU		59H
		_timeTick		EQU		5BH
		_mtState		EQU		5DH
		_keyID		EQU		5EH
		_buffTag		EQU		26H
//-----------------------Variable END---------------------------------
		ORG		0000H
		LJUMP 	0AH 			//0000 	380A
		ORG		0004H
		STR 	7EH 			//0004 	01FE
		SWAPR 	STATUS,0 		//0005 	0703
		STR 	70H 			//0006 	01F0
		LDR 	PCLATH,0 		//0007 	080A
		STR 	71H 			//0008 	01F1
		LJUMP 	42BH 			//0009 	3C2B
		LJUMP 	3E0H 			//000A 	3BE0
		LDWI 	10H 			//000B 	2A10
		ORG		000CH

		//;rfid125.c: 23: unsigned char RF_serial_55bits[11];
		//;rfid125.c: 24: unsigned int timeOutVal;
		//;rfid125.c: 25: unsigned char i,ii,j;
		//;rfid125.c: 26: unsigned char flag_RFID_syn, flag_RFID_last;
		//;rfid125.c: 27: unsigned char even_row, even_col;
		//;rfid125.c: 30: flag_RFID_syn = 0;
		CLRR 	4AH 			//000C 	014A

		//;rfid125.c: 33: i=16;
		STR 	4EH 			//000D 	01CE

		//;rfid125.c: 35: {
		//;rfid125.c: 36: timeOutVal=timerOut(1,600);
		LDWI 	58H 			//000E 	2A58
		STR 	72H 			//000F 	01F2
		LDWI 	2H 			//0010 	2A02
		STR 	73H 			//0011 	01F3
		LDWI 	1H 			//0012 	2A01
		LCALL 	2FAH 			//0013 	32FA
		ORG		0014H

		//;rfid125.c: 37: if(timeOutVal==0) return 0;
		LCALL 	141H 			//0014 	3141
		BTSC 	STATUS,2 		//0015 	1503
		RETW 	0H 			//0016 	2100

		//;rfid125.c: 39: timeOutVal=timerOut(0,600);
		LDWI 	58H 			//0017 	2A58
		LCALL 	154H 			//0018 	3154
		LCALL 	2FAH 			//0019 	32FA

		//;rfid125.c: 40: if(timeOutVal==0) return 0;
		LCALL 	141H 			//001A 	3141
		BTSC 	STATUS,2 		//001B 	1503
		ORG		001CH
		RETW 	0H 			//001C 	2100
		LDWI 	1H 			//001D 	2A01

		//;rfid125.c: 42: i--;
		DECR 	4EH,1 			//001E 	0DCE

		//;rfid125.c: 43: }
		//;rfid125.c: 44: while(timeOutVal<290 && i>0);
		SUBWR 	51H,0 			//001F 	0C51
		LDWI 	22H 			//0020 	2A22
		BTSC 	STATUS,2 		//0021 	1503
		SUBWR 	50H,0 			//0022 	0C50
		BTSC 	STATUS,0 		//0023 	1403
		ORG		0024H
		LJUMP 	28H 			//0024 	3828
		LDR 	4EH,1 			//0025 	08CE
		BTSS 	STATUS,2 		//0026 	1D03
		LJUMP 	0EH 			//0027 	380E

		//;rfid125.c: 45: flag_RFID_last = 1;
		CLRR 	4FH 			//0028 	014F
		INCR	4FH,1 			//0029 	09CF

		//;rfid125.c: 46: i = 0;
		CLRR 	4EH 			//002A 	014E

		//;rfid125.c: 47: while(i<64)
		LDWI 	40H 			//002B 	2A40
		ORG		002CH
		SUBWR 	4EH,0 			//002C 	0C4E
		BTSC 	STATUS,0 		//002D 	1403
		LJUMP 	84H 			//002E 	3884

		//;rfid125.c: 48: {
		//;rfid125.c: 49: for(ii=0;ii<9;ii++)
		CLRR 	52H 			//002F 	0152

		//;rfid125.c: 50: {
		//;rfid125.c: 51: timeOutVal=timerOut(flag_RFID_last,600);
		LCALL 	14EH 			//0030 	314E
		LCALL 	2FAH 			//0031 	32FA

		//;rfid125.c: 52: if(timeOutVal==0) return 0;
		LCALL 	141H 			//0032 	3141
		BTSC 	STATUS,2 		//0033 	1503
		ORG		0034H
		RETW 	0H 			//0034 	2100

		//;rfid125.c: 54: if(0==flag_RFID_last && timeOutVal<=290 ||
		//;rfid125.c: 55: 1==flag_RFID_last && timeOutVal>290)
		LDR 	4FH,1 			//0035 	08CF
		BTSS 	STATUS,2 		//0036 	1D03
		LJUMP 	3FH 			//0037 	383F
		LDWI 	1H 			//0038 	2A01
		SUBWR 	51H,0 			//0039 	0C51
		LDWI 	23H 			//003A 	2A23
		BTSC 	STATUS,2 		//003B 	1503
		ORG		003CH
		SUBWR 	50H,0 			//003C 	0C50
		BTSS 	STATUS,0 		//003D 	1C03
		LJUMP 	48H 			//003E 	3848
		DECRSZ 	4FH,0 		//003F 	0E4F
		LJUMP 	56H 			//0040 	3856
		LDWI 	1H 			//0041 	2A01
		SUBWR 	51H,0 			//0042 	0C51
		LDWI 	23H 			//0043 	2A23
		ORG		0044H
		BTSC 	STATUS,2 		//0044 	1503
		SUBWR 	50H,0 			//0045 	0C50
		BTSS 	STATUS,0 		//0046 	1C03
		LJUMP 	56H 			//0047 	3856

		//;rfid125.c: 56: {
		//;rfid125.c: 57: if(!flag_RFID_last)
		LDR 	4FH,1 			//0048 	08CF
		BTSS 	STATUS,2 		//0049 	1D03
		LJUMP 	53H 			//004A 	3853

		//;rfid125.c: 58: {
		//;rfid125.c: 59: timeOutVal=timerOut(1,290);
		LDWI 	22H 			//004B 	2A22
		ORG		004CH
		STR 	72H 			//004C 	01F2
		LDWI 	1H 			//004D 	2A01
		STR 	73H 			//004E 	01F3
		LCALL 	2FAH 			//004F 	32FA

		//;rfid125.c: 60: if(timeOutVal==0) return 0;
		LCALL 	141H 			//0050 	3141
		BTSC 	STATUS,2 		//0051 	1503
		RETW 	0H 			//0052 	2100

		//;rfid125.c: 61: }
		//;rfid125.c: 62: flag_RFID_last = 0;
		CLRR 	4FH 			//0053 	014F
		ORG		0054H

		//;rfid125.c: 63: i++;
		INCR	4EH,1 			//0054 	09CE

		//;rfid125.c: 64: }
		LJUMP 	79H 			//0055 	3879

		//;rfid125.c: 65: else
		//;rfid125.c: 66: if(0==flag_RFID_last && timeOutVal>290 ||
		//;rfid125.c: 67: 1==flag_RFID_last && timeOutVal<=290)
		LDR 	4FH,1 			//0056 	08CF
		BTSS 	STATUS,2 		//0057 	1D03
		LJUMP 	60H 			//0058 	3860
		LDWI 	1H 			//0059 	2A01
		SUBWR 	51H,0 			//005A 	0C51
		LDWI 	23H 			//005B 	2A23
		ORG		005CH
		BTSC 	STATUS,2 		//005C 	1503
		SUBWR 	50H,0 			//005D 	0C50
		BTSC 	STATUS,0 		//005E 	1403
		LJUMP 	69H 			//005F 	3869
		DECRSZ 	4FH,0 		//0060 	0E4F
		LJUMP 	79H 			//0061 	3879
		LDWI 	1H 			//0062 	2A01
		SUBWR 	51H,0 			//0063 	0C51
		ORG		0064H
		LDWI 	23H 			//0064 	2A23
		BTSC 	STATUS,2 		//0065 	1503
		SUBWR 	50H,0 			//0066 	0C50
		BTSC 	STATUS,0 		//0067 	1403
		LJUMP 	79H 			//0068 	3879

		//;rfid125.c: 68: {
		//;rfid125.c: 69: if(flag_RFID_last)
		LDR 	4FH,0 			//0069 	084F
		BTSC 	STATUS,2 		//006A 	1503
		LJUMP 	75H 			//006B 	3875
		ORG		006CH

		//;rfid125.c: 70: {
		//;rfid125.c: 71: timeOutVal=timerOut(0,290);
		LDWI 	22H 			//006C 	2A22
		STR 	72H 			//006D 	01F2
		LDWI 	1H 			//006E 	2A01
		STR 	73H 			//006F 	01F3
		LDWI 	0H 			//0070 	2A00
		LCALL 	2FAH 			//0071 	32FA

		//;rfid125.c: 72: if(timeOutVal==0) return 0;
		LCALL 	141H 			//0072 	3141
		BTSC 	STATUS,2 		//0073 	1503
		ORG		0074H
		RETW 	0H 			//0074 	2100

		//;rfid125.c: 73: }
		//;rfid125.c: 74: flag_RFID_last = 1;
		CLRR 	4FH 			//0075 	014F
		INCR	4FH,1 			//0076 	09CF

		//;rfid125.c: 75: i++;
		INCR	4EH,1 			//0077 	09CE

		//;rfid125.c: 77: break;
		LJUMP 	7EH 			//0078 	387E
		LDWI 	9H 			//0079 	2A09
		INCR	52H,1 			//007A 	09D2
		SUBWR 	52H,0 			//007B 	0C52
		ORG		007CH
		BTSS 	STATUS,0 		//007C 	1C03
		LJUMP 	30H 			//007D 	3830

		//;rfid125.c: 78: }
		//;rfid125.c: 80: }
		//;rfid125.c: 81: if(9==ii)
		LDR 	52H,0 			//007E 	0852
		XORWI 	9H 			//007F 	2609
		BTSS 	STATUS,2 		//0080 	1D03
		LJUMP 	2BH 			//0081 	382B

		//;rfid125.c: 82: {
		//;rfid125.c: 83: flag_RFID_syn = 1;
		CLRR 	4AH 			//0082 	014A
		INCR	4AH,1 			//0083 	09CA
		ORG		0084H

		//;rfid125.c: 84: break;
		//;rfid125.c: 85: }
		//;rfid125.c: 86: }
		//;rfid125.c: 88: if(!flag_RFID_syn)
		LDR 	4AH,1 			//0084 	08CA
		BTSC 	STATUS,2 		//0085 	1503
		RETW 	0H 			//0086 	2100

		//;rfid125.c: 91: }
		//;rfid125.c: 92: for(ii=0;ii<55;ii++)
		CLRR 	52H 			//0087 	0152

		//;rfid125.c: 93: {
		//;rfid125.c: 94: i = ii/5;
		LDWI 	5H 			//0088 	2A05
		STR 	72H 			//0089 	01F2
		LDR 	52H,0 			//008A 	0852
		LCALL 	379H 			//008B 	3379
		ORG		008CH
		STR 	4EH 			//008C 	01CE

		//;rfid125.c: 95: timeOutVal=timerOut(flag_RFID_last,600);
		LCALL 	14EH 			//008D 	314E
		LCALL 	2FAH 			//008E 	32FA

		//;rfid125.c: 96: if(timeOutVal==0) return 0;
		LCALL 	141H 			//008F 	3141
		BTSC 	STATUS,2 		//0090 	1503
		RETW 	0H 			//0091 	2100

		//;rfid125.c: 98: if(0==flag_RFID_last && timeOutVal<=290 ||
		//;rfid125.c: 99: 1==flag_RFID_last && timeOutVal>290)
		LDR 	4FH,1 			//0092 	08CF
		BTSS 	STATUS,2 		//0093 	1D03
		ORG		0094H
		LJUMP 	9CH 			//0094 	389C
		LDWI 	1H 			//0095 	2A01
		SUBWR 	51H,0 			//0096 	0C51
		LDWI 	23H 			//0097 	2A23
		BTSC 	STATUS,2 		//0098 	1503
		SUBWR 	50H,0 			//0099 	0C50
		BTSS 	STATUS,0 		//009A 	1C03
		LJUMP 	A5H 			//009B 	38A5
		ORG		009CH
		DECRSZ 	4FH,0 		//009C 	0E4F
		LJUMP 	B7H 			//009D 	38B7
		LDWI 	1H 			//009E 	2A01
		SUBWR 	51H,0 			//009F 	0C51
		LDWI 	23H 			//00A0 	2A23
		BTSC 	STATUS,2 		//00A1 	1503
		SUBWR 	50H,0 			//00A2 	0C50
		BTSS 	STATUS,0 		//00A3 	1C03
		ORG		00A4H
		LJUMP 	B7H 			//00A4 	38B7

		//;rfid125.c: 100: {
		//;rfid125.c: 101: if(!flag_RFID_last)
		LDR 	4FH,1 			//00A5 	08CF
		BTSS 	STATUS,2 		//00A6 	1D03
		LJUMP 	B0H 			//00A7 	38B0

		//;rfid125.c: 102: {
		//;rfid125.c: 103: timeOutVal=timerOut(1,290);
		LDWI 	22H 			//00A8 	2A22
		STR 	72H 			//00A9 	01F2
		LDWI 	1H 			//00AA 	2A01
		STR 	73H 			//00AB 	01F3
		ORG		00ACH
		LCALL 	2FAH 			//00AC 	32FA

		//;rfid125.c: 104: if(timeOutVal==0) return 0;
		LCALL 	141H 			//00AD 	3141
		BTSC 	STATUS,2 		//00AE 	1503
		RETW 	0H 			//00AF 	2100

		//;rfid125.c: 105: }
		//;rfid125.c: 106: flag_RFID_last = 0;
		CLRR 	4FH 			//00B0 	014F

		//;rfid125.c: 107: RF_serial_55bits[i] <<= 1;
		LCALL 	147H 			//00B1 	3147

		//;rfid125.c: 108: RF_serial_55bits[i] |= 0x01;
		LDR 	4EH,0 			//00B2 	084E
		ADDWI 	3FH 			//00B3 	273F
		ORG		00B4H
		STR 	FSR 			//00B4 	0184
		BSR 	INDF,0 			//00B5 	1800

		//;rfid125.c: 109: }
		LJUMP 	D6H 			//00B6 	38D6

		//;rfid125.c: 110: else
		//;rfid125.c: 111: if(0==flag_RFID_last && timeOutVal>290 ||
		//;rfid125.c: 112: 1==flag_RFID_last && timeOutVal<=290)
		LDR 	4FH,1 			//00B7 	08CF
		BTSS 	STATUS,2 		//00B8 	1D03
		LJUMP 	C1H 			//00B9 	38C1
		LDWI 	1H 			//00BA 	2A01
		SUBWR 	51H,0 			//00BB 	0C51
		ORG		00BCH
		LDWI 	23H 			//00BC 	2A23
		BTSC 	STATUS,2 		//00BD 	1503
		SUBWR 	50H,0 			//00BE 	0C50
		BTSC 	STATUS,0 		//00BF 	1403
		LJUMP 	CAH 			//00C0 	38CA
		DECRSZ 	4FH,0 		//00C1 	0E4F
		LJUMP 	D6H 			//00C2 	38D6
		LDWI 	1H 			//00C3 	2A01
		ORG		00C4H
		SUBWR 	51H,0 			//00C4 	0C51
		LDWI 	23H 			//00C5 	2A23
		BTSC 	STATUS,2 		//00C6 	1503
		SUBWR 	50H,0 			//00C7 	0C50
		BTSC 	STATUS,0 		//00C8 	1403
		LJUMP 	D6H 			//00C9 	38D6

		//;rfid125.c: 113: {
		//;rfid125.c: 114: if(flag_RFID_last)
		LDR 	4FH,0 			//00CA 	084F
		BTSC 	STATUS,2 		//00CB 	1503
		ORG		00CCH
		LJUMP 	D3H 			//00CC 	38D3

		//;rfid125.c: 115: {
		//;rfid125.c: 116: timeOutVal=timerOut(0,600);
		LDWI 	58H 			//00CD 	2A58
		LCALL 	154H 			//00CE 	3154
		LCALL 	2FAH 			//00CF 	32FA

		//;rfid125.c: 117: if(timeOutVal==0) return 0;
		LCALL 	141H 			//00D0 	3141
		BTSC 	STATUS,2 		//00D1 	1503
		RETW 	0H 			//00D2 	2100

		//;rfid125.c: 118: }
		//;rfid125.c: 119: flag_RFID_last = 1;
		CLRR 	4FH 			//00D3 	014F
		ORG		00D4H
		INCR	4FH,1 			//00D4 	09CF

		//;rfid125.c: 120: RF_serial_55bits[i] <<= 1;
		LCALL 	147H 			//00D5 	3147
		LDWI 	37H 			//00D6 	2A37
		INCR	52H,1 			//00D7 	09D2
		SUBWR 	52H,0 			//00D8 	0C52
		BTSS 	STATUS,0 		//00D9 	1C03
		LJUMP 	88H 			//00DA 	3888

		//;rfid125.c: 121: }
		//;rfid125.c: 122: }
		//;rfid125.c: 123: if(55==ii)
		LDR 	52H,0 			//00DB 	0852
		ORG		00DCH
		XORWI 	37H 			//00DC 	2637
		BTSS 	STATUS,2 		//00DD 	1D03
		RETW 	0H 			//00DE 	2100

		//;rfid125.c: 124: {
		//;rfid125.c: 125: even_col = 0;
		CLRR 	4BH 			//00DF 	014B

		//;rfid125.c: 126: for(ii=0;ii<10;ii++)
		CLRR 	52H 			//00E0 	0152

		//;rfid125.c: 127: {
		//;rfid125.c: 128: even_row = (RF_serial_55bits[ii] & 0x01);
		LDR 	52H,0 			//00E1 	0852
		ADDWI 	3FH 			//00E2 	273F
		STR 	FSR 			//00E3 	0184
		ORG		00E4H
		BCR 	STATUS,7 		//00E4 	1383
		LDR 	INDF,0 			//00E5 	0800
		STR 	4CH 			//00E6 	01CC
		LDWI 	1H 			//00E7 	2A01
		ANDWR 	4CH,1 			//00E8 	02CC

		//;rfid125.c: 129: for(j=1;j<5;j++)
		CLRR 	4DH 			//00E9 	014D
		INCR	4DH,1 			//00EA 	09CD

		//;rfid125.c: 130: {
		//;rfid125.c: 131: even_row = even_row ^ ((RF_serial_55bits[ii]>>j) & 0x01);
		LDR 	52H,0 			//00EB 	0852
		ORG		00ECH
		ADDWI 	3FH 			//00EC 	273F
		STR 	FSR 			//00ED 	0184
		LDR 	INDF,0 			//00EE 	0800
		STR 	77H 			//00EF 	01F7
		INCR	4DH,0 			//00F0 	094D
		LJUMP 	F4H 			//00F1 	38F4
		BCR 	STATUS,0 		//00F2 	1003
		RRR	77H,1 			//00F3 	06F7
		ORG		00F4H
		ADDWI 	FFH 			//00F4 	27FF
		BTSS 	STATUS,2 		//00F5 	1D03
		LJUMP 	F2H 			//00F6 	38F2
		LDR 	77H,0 			//00F7 	0877
		ANDWI 	1H 			//00F8 	2401
		XORWR 	4CH,1 			//00F9 	04CC
		LDWI 	5H 			//00FA 	2A05
		INCR	4DH,1 			//00FB 	09CD
		ORG		00FCH
		SUBWR 	4DH,0 			//00FC 	0C4D
		BTSS 	STATUS,0 		//00FD 	1C03
		LJUMP 	EBH 			//00FE 	38EB

		//;rfid125.c: 132: }
		//;rfid125.c: 133: if(even_row & 0x01)
		BTSC 	4CH,0 			//00FF 	144C
		RETW 	0H 			//0100 	2100

		//;rfid125.c: 136: }
		//;rfid125.c: 138: RF_serial_55bits[ii] <<= 3;
		LDR 	52H,0 			//0101 	0852
		ADDWI 	3FH 			//0102 	273F
		STR 	FSR 			//0103 	0184
		ORG		0104H
		RLR 	INDF,1 			//0104 	0580
		RLR 	INDF,1 			//0105 	0580
		RLR 	INDF,0 			//0106 	0500
		ANDWI 	F8H 			//0107 	24F8
		STR 	INDF 			//0108 	0180

		//;rfid125.c: 140: i = RF_serial_55bits[ii];
		LDR 	52H,0 			//0109 	0852
		ADDWI 	3FH 			//010A 	273F
		STR 	FSR 			//010B 	0184
		ORG		010CH
		LDR 	INDF,0 			//010C 	0800
		STR 	4EH 			//010D 	01CE

		//;rfid125.c: 141: if( 0==ii%2 )
		BTSC 	52H,0 			//010E 	1452
		LJUMP 	11DH 			//010F 	391D

		//;rfid125.c: 142: {
		//;rfid125.c: 143: keyID[ii/2] = (i & 0xF0);
		BCR 	STATUS,0 		//0110 	1003
		RRR	52H,0 			//0111 	0652
		ADDWI 	5EH 			//0112 	275E
		STR 	FSR 			//0113 	0184
		ORG		0114H
		LDR 	4EH,0 			//0114 	084E
		STR 	INDF 			//0115 	0180
		BCR 	STATUS,0 		//0116 	1003
		RRR	52H,0 			//0117 	0652
		ADDWI 	5EH 			//0118 	275E
		STR 	FSR 			//0119 	0184
		LDWI 	F0H 			//011A 	2AF0
		ANDWR 	INDF,1 		//011B 	0280
		ORG		011CH

		//;rfid125.c: 144: }
		LJUMP 	127H 			//011C 	3927
		LDWI 	FH 			//011D 	2A0F

		//;rfid125.c: 145: else
		//;rfid125.c: 146: {
		//;rfid125.c: 147: i >>=4;
		SWAPR 	4EH,1 			//011E 	07CE
		ANDWR 	4EH,1 			//011F 	02CE

		//;rfid125.c: 148: keyID[ii/2] |= (i & 0x0F);
		BCR 	STATUS,0 		//0120 	1003
		RRR	52H,0 			//0121 	0652
		ADDWI 	5EH 			//0122 	275E
		STR 	FSR 			//0123 	0184
		ORG		0124H
		LDR 	4EH,0 			//0124 	084E
		ANDWI 	FH 			//0125 	240F
		IORWR 	INDF,1 		//0126 	0380

		//;rfid125.c: 149: }
		//;rfid125.c: 150: even_col ^= RF_serial_55bits[ii];
		LDR 	52H,0 			//0127 	0852
		ADDWI 	3FH 			//0128 	273F
		STR 	FSR 			//0129 	0184
		LDR 	INDF,0 			//012A 	0800
		XORWR 	4BH,1 			//012B 	04CB
		ORG		012CH
		LDWI 	AH 			//012C 	2A0A
		INCR	52H,1 			//012D 	09D2
		SUBWR 	52H,0 			//012E 	0C52
		BTSS 	STATUS,0 		//012F 	1C03
		LJUMP 	E1H 			//0130 	38E1

		//;rfid125.c: 151: }
		//;rfid125.c: 152: RF_serial_55bits[10] <<= 3;
		RLR 	49H,1 			//0131 	05C9
		RLR 	49H,1 			//0132 	05C9
		RLR 	49H,0 			//0133 	0549
		ORG		0134H
		ANDWI 	F8H 			//0134 	24F8
		STR 	49H 			//0135 	01C9
		LDWI 	F0H 			//0136 	2AF0

		//;rfid125.c: 153: keyID[0] =0x00;
		CLRR 	5EH 			//0137 	015E

		//;rfid125.c: 154: if(((RF_serial_55bits[10] & 0xf0)==(even_col & 0xf0)) && (0==(RF_serial
		//+                          _55bits[10]&0x08)))
		ANDWR 	4BH,0 			//0138 	024B
		STR 	77H 			//0139 	01F7
		LDR 	49H,0 			//013A 	0849
		ANDWI 	F0H 			//013B 	24F0
		ORG		013CH
		XORWR 	77H,0 			//013C 	0477
		BTSC 	STATUS,2 		//013D 	1503
		BTSC 	49H,3 			//013E 	15C9
		RETW 	0H 			//013F 	2100

		//;rfid125.c: 155: {
		//;rfid125.c: 157: return 1;
		RETW 	1H 			//0140 	2101
		LDR 	73H,0 			//0141 	0873
		STR 	51H 			//0142 	01D1
		LDR 	72H,0 			//0143 	0872
		ORG		0144H
		STR 	50H 			//0144 	01D0
		IORWR 	51H,0 			//0145 	0351
		RET		 					//0146 	0004
		LDR 	4EH,0 			//0147 	084E
		ADDWI 	3FH 			//0148 	273F
		STR 	FSR 			//0149 	0184
		BCR 	STATUS,7 		//014A 	1383
		BCR 	STATUS,0 		//014B 	1003
		ORG		014CH
		RLR 	INDF,1 			//014C 	0580
		RET		 					//014D 	0004
		LDWI 	58H 			//014E 	2A58
		STR 	72H 			//014F 	01F2
		LDWI 	2H 			//0150 	2A02
		STR 	73H 			//0151 	01F3
		LDR 	4FH,0 			//0152 	084F
		RET		 					//0153 	0004
		ORG		0154H
		STR 	72H 			//0154 	01F2
		LDWI 	2H 			//0155 	2A02
		STR 	73H 			//0156 	01F3
		RETW 	0H 			//0157 	2100
		LDWI 	7H 			//0158 	2A07
		STR 	19H 			//0159 	0199

		//;MAIN.C: 200: unsigned char idop,tmp,idState=0;
		BCR 	STATUS,5 		//015A 	1283
		BCR 	STATUS,6 		//015B 	1303
		ORG		015CH
		CLRR 	56H 			//015C 	0156
		CLRWDT	 			//015D 	0001

		//;MAIN.C: 203: sys_init();
		LCALL 	483H 			//015E 	3483

		//;MAIN.C: 204: gpio_init();
		LCALL 	45BH 			//015F 	345B

		//;MAIN.C: 206: timer_init();
		LCALL 	48DH 			//0160 	348D

		//;MAIN.C: 207: int_init();
		LCALL 	408H 			//0161 	3408

		//;MAIN.C: 213: eepromWriteByte(0x7F,0xAA);
		LDWI 	AAH 			//0162 	2AAA
		STR 	72H 			//0163 	01F2
		ORG		0164H
		LDWI 	7FH 			//0164 	2A7F
		LCALL 	2D7H 			//0165 	32D7

		//;MAIN.C: 214: eepromWriteByte(0x7F,0xAA);
		LDWI 	AAH 			//0166 	2AAA
		STR 	72H 			//0167 	01F2
		LDWI 	7FH 			//0168 	2A7F
		LCALL 	2D7H 			//0169 	32D7

		//;MAIN.C: 217: TRISC &=0xfe;
		BSR 	STATUS,5 		//016A 	1A83
		BCR 	STATUS,6 		//016B 	1303
		ORG		016CH
		BCR 	7H,0 			//016C 	1007

		//;MAIN.C: 219: SET_EPWM_ON();
		LCALL 	3C8H 			//016D 	33C8

		//;MAIN.C: 223: _delay((unsigned long)((20)*(8000000/4000.0)));
		LDWI 	34H 			//016E 	2A34
		BCR 	STATUS,5 		//016F 	1283
		STR 	54H 			//0170 	01D4
		LDWI 	F1H 			//0171 	2AF1
		STR 	53H 			//0172 	01D3
		DECRSZ 	53H,1 		//0173 	0ED3
		ORG		0174H
		LJUMP 	173H 			//0174 	3973
		DECRSZ 	54H,1 		//0175 	0ED4
		LJUMP 	173H 			//0176 	3973
		LJUMP 	178H 			//0177 	3978

		//;MAIN.C: 228: if(eepromReadByte(0x06)!=0){
		LDWI 	6H 			//0178 	2A06
		LCALL 	497H 			//0179 	3497
		XORWI 	0H 			//017A 	2600
		BTSC 	STATUS,2 		//017B 	1503
		ORG		017CH
		LJUMP 	18FH 			//017C 	398F
		LDWI 	6H 			//017D 	2A06

		//;MAIN.C: 232: eepromWriteByte(0x06,0);
		CLRR 	72H 			//017E 	0172
		LCALL 	2D7H 			//017F 	32D7
		LDWI 	7H 			//0180 	2A07

		//;MAIN.C: 233: eepromWriteByte(0x06+1,0);
		CLRR 	72H 			//0181 	0172
		LCALL 	2D7H 			//0182 	32D7

		//;MAIN.C: 234: eepromWriteByte(0x06+2,0xc7);
		LDWI 	C7H 			//0183 	2AC7
		ORG		0184H
		STR 	72H 			//0184 	01F2
		LDWI 	8H 			//0185 	2A08
		LCALL 	2D7H 			//0186 	32D7

		//;MAIN.C: 235: eepromWriteByte(0x06+3,0xee);
		LDWI 	EEH 			//0187 	2AEE
		STR 	72H 			//0188 	01F2
		LDWI 	9H 			//0189 	2A09
		LCALL 	2D7H 			//018A 	32D7

		//;MAIN.C: 236: eepromWriteByte(0x06+4,0xc7);
		LDWI 	C7H 			//018B 	2AC7
		ORG		018CH
		STR 	72H 			//018C 	01F2
		LDWI 	AH 			//018D 	2A0A
		LCALL 	2D7H 			//018E 	32D7

		//;MAIN.C: 238: }
		//;MAIN.C: 239: eepromReadBlock(0x06,buffTag,5*5);
		LDWI 	26H 			//018F 	2A26
		STR 	74H 			//0190 	01F4
		LDWI 	19H 			//0191 	2A19
		STR 	75H 			//0192 	01F5
		LDWI 	6H 			//0193 	2A06
		ORG		0194H
		LCALL 	41AH 			//0194 	341A

		//;MAIN.C: 241: setState(1,45);
		LDWI 	2DH 			//0195 	2A2D
		STR 	72H 			//0196 	01F2
		LDWI 	1H 			//0197 	2A01
		CLRR 	73H 			//0198 	0173
		LCALL 	478H 			//0199 	3478

		//;MAIN.C: 245: tmp=0;
		CLRR 	57H 			//019A 	0157

		//;MAIN.C: 249: idop = get_RFID();
		LCALL 	BH 			//019B 	300B
		ORG		019CH
		STR 	58H 			//019C 	01D8

		//;MAIN.C: 251: if(idop){
		LDR 	58H,0 			//019D 	0858
		BTSC 	STATUS,2 		//019E 	1503
		LJUMP 	245H 			//019F 	3A45

		//;MAIN.C: 252: idop = id_search(keyID,buffTag);
		LDWI 	26H 			//01A0 	2A26
		STR 	7AH 			//01A1 	01FA
		LDWI 	5EH 			//01A2 	2A5E
		LCALL 	3AEH 			//01A3 	33AE
		ORG		01A4H
		STR 	58H 			//01A4 	01D8

		//;MAIN.C: 253: switch (mtState){
		LJUMP 	22CH 			//01A5 	3A2C

		//;MAIN.C: 255: case 2:
		//;MAIN.C: 256: if((idop>1) && (idop <6))
		LDWI 	2H 			//01A6 	2A02
		SUBWR 	58H,0 			//01A7 	0C58
		BTSS 	STATUS,0 		//01A8 	1C03
		LJUMP 	1B3H 			//01A9 	39B3
		LDWI 	6H 			//01AA 	2A06
		SUBWR 	58H,0 			//01AB 	0C58
		ORG		01ACH
		BTSC 	STATUS,0 		//01AC 	1403
		LJUMP 	1B3H 			//01AD 	39B3
		LDWI 	0H 			//01AE 	2A00

		//;MAIN.C: 257: {
		//;MAIN.C: 258: setState(0,0);
		CLRR 	72H 			//01AF 	0172
		CLRR 	73H 			//01B0 	0173
		LCALL 	478H 			//01B1 	3478

		//;MAIN.C: 260: }
		LJUMP 	237H 			//01B2 	3A37

		//;MAIN.C: 261: else if(idop==1)
		DECRSZ 	58H,0 		//01B3 	0E58
		ORG		01B4H
		LJUMP 	237H 			//01B4 	3A37

		//;MAIN.C: 262: {
		//;MAIN.C: 264: id_clear(2,5);
		LDWI 	5H 			//01B5 	2A05
		STR 	43H 			//01B6 	01C3
		LDWI 	2H 			//01B7 	2A02
		LCALL 	31BH 			//01B8 	331B
		LDWI 	3H 			//01B9 	2A03

		//;MAIN.C: 265: setState(3,0);
		CLRR 	72H 			//01BA 	0172
		CLRR 	73H 			//01BB 	0173
		ORG		01BCH
		LCALL 	478H 			//01BC 	3478
		LDWI 	3H 			//01BD 	2A03

		//;MAIN.C: 266: tmp=1;
		CLRR 	57H 			//01BE 	0157
		INCR	57H,1 			//01BF 	09D7

		//;MAIN.C: 268: beep(10,3);
		STR 	75H 			//01C0 	01F5
		LDWI 	AH 			//01C1 	2A0A
		LCALL 	394H 			//01C2 	3394
		LJUMP 	237H 			//01C3 	3A37
		ORG		01C4H

		//;MAIN.C: 282: if(idop==1 && idState == 0){
		DECRSZ 	58H,0 		//01C4 	0E58
		LJUMP 	1D8H 			//01C5 	39D8
		LDR 	56H,1 			//01C6 	08D6
		BTSS 	STATUS,2 		//01C7 	1D03
		LJUMP 	1D8H 			//01C8 	39D8

		//;MAIN.C: 284: id_clear(2,5);
		LDWI 	5H 			//01C9 	2A05
		STR 	43H 			//01CA 	01C3
		LDWI 	2H 			//01CB 	2A02
		ORG		01CCH
		LCALL 	31BH 			//01CC 	331B
		LDWI 	3H 			//01CD 	2A03

		//;MAIN.C: 285: setState(3,0);
		CLRR 	72H 			//01CE 	0172
		CLRR 	73H 			//01CF 	0173
		LCALL 	478H 			//01D0 	3478
		LDWI 	3H 			//01D1 	2A03

		//;MAIN.C: 286: tmp=1;
		CLRR 	57H 			//01D2 	0157
		INCR	57H,1 			//01D3 	09D7
		ORG		01D4H

		//;MAIN.C: 288: beep(10,3);
		STR 	75H 			//01D4 	01F5
		LDWI 	AH 			//01D5 	2A0A
		LCALL 	394H 			//01D6 	3394

		//;MAIN.C: 293: }
		LJUMP 	237H 			//01D7 	3A37

		//;MAIN.C: 294: else if(idop==2 && idState == 0){
		LDR 	58H,0 			//01D8 	0858
		XORWI 	2H 			//01D9 	2602
		BTSS 	STATUS,2 		//01DA 	1D03
		LJUMP 	237H 			//01DB 	3A37
		ORG		01DCH
		LDR 	56H,1 			//01DC 	08D6
		BTSS 	STATUS,2 		//01DD 	1D03
		LJUMP 	237H 			//01DE 	3A37

		//;MAIN.C: 296: id_clear(3,5);
		LDWI 	5H 			//01DF 	2A05
		STR 	43H 			//01E0 	01C3
		LDWI 	3H 			//01E1 	2A03
		LCALL 	31BH 			//01E2 	331B
		LDWI 	5H 			//01E3 	2A05
		ORG		01E4H

		//;MAIN.C: 297: setState(5,0);
		CLRR 	72H 			//01E4 	0172
		CLRR 	73H 			//01E5 	0173
		LCALL 	478H 			//01E6 	3478

		//;MAIN.C: 298: tmp=2;
		LDWI 	2H 			//01E7 	2A02
		STR 	57H 			//01E8 	01D7

		//;MAIN.C: 300: beep(10,2);
		STR 	75H 			//01E9 	01F5
		LDWI 	AH 			//01EA 	2A0A
		LCALL 	394H 			//01EB 	3394
		ORG		01ECH
		LJUMP 	237H 			//01EC 	3A37

		//;MAIN.C: 309: if (idState == 0){
		LDR 	56H,1 			//01ED 	08D6
		BTSS 	STATUS,2 		//01EE 	1D03
		LJUMP 	207H 			//01EF 	3A07

		//;MAIN.C: 316: if( idop !=1){
		DECR 	58H,0 			//01F0 	0D58
		BTSC 	STATUS,2 		//01F1 	1503
		LJUMP 	237H 			//01F2 	3A37
		LDWI 	6H 			//01F3 	2A06
		ORG		01F4H

		//;MAIN.C: 317: tmp++;
		INCR	57H,1 			//01F4 	09D7

		//;MAIN.C: 319: if(tmp <=5){
		SUBWR 	57H,0 			//01F5 	0C57
		BTSC 	STATUS,0 		//01F6 	1403
		LJUMP 	237H 			//01F7 	3A37

		//;MAIN.C: 320: id_replate(tmp,keyID,buffTag);
		LDWI 	5EH 			//01F8 	2A5E
		STR 	3FH 			//01F9 	01BF
		LDWI 	26H 			//01FA 	2A26
		STR 	40H 			//01FB 	01C0
		ORG		01FCH
		LDR 	57H,0 			//01FC 	0857
		LCALL 	29CH 			//01FD 	329C
		LDWI 	AH 			//01FE 	2A0A

		//;MAIN.C: 321: timeTick=0;
		BCR 	STATUS,5 		//01FF 	1283
		BCR 	STATUS,6 		//0200 	1303
		CLRR 	5BH 			//0201 	015B
		CLRR 	5CH 			//0202 	015C
		CLRR 	75H 			//0203 	0175
		ORG		0204H
		INCR	75H,1 			//0204 	09F5
		LCALL 	394H 			//0205 	3394
		LJUMP 	237H 			//0206 	3A37
		LDWI 	AH 			//0207 	2A0A

		//;MAIN.C: 335: beep(10,1);
		CLRR 	75H 			//0208 	0175
		INCR	75H,1 			//0209 	09F5
		LCALL 	394H 			//020A 	3394
		LJUMP 	237H 			//020B 	3A37
		ORG		020CH

		//;MAIN.C: 344: if(idState == 0){
		LDR 	56H,1 			//020C 	08D6
		BTSS 	STATUS,2 		//020D 	1D03
		LJUMP 	227H 			//020E 	3A27

		//;MAIN.C: 345: if( idop >2){
		LDWI 	3H 			//020F 	2A03
		SUBWR 	58H,0 			//0210 	0C58
		BTSS 	STATUS,0 		//0211 	1C03
		LJUMP 	237H 			//0212 	3A37
		LDWI 	6H 			//0213 	2A06
		ORG		0214H

		//;MAIN.C: 346: tmp++;
		INCR	57H,1 			//0214 	09D7

		//;MAIN.C: 348: if(tmp <=5){
		SUBWR 	57H,0 			//0215 	0C57
		BTSC 	STATUS,0 		//0216 	1403
		LJUMP 	237H 			//0217 	3A37

		//;MAIN.C: 349: id_replate(tmp,keyID,buffTag);
		LDWI 	5EH 			//0218 	2A5E
		STR 	3FH 			//0219 	01BF
		LDWI 	26H 			//021A 	2A26
		STR 	40H 			//021B 	01C0
		ORG		021CH
		LDR 	57H,0 			//021C 	0857
		LCALL 	29CH 			//021D 	329C
		LDWI 	AH 			//021E 	2A0A

		//;MAIN.C: 350: timeTick=0;
		BCR 	STATUS,5 		//021F 	1283
		BCR 	STATUS,6 		//0220 	1303
		CLRR 	5BH 			//0221 	015B
		CLRR 	5CH 			//0222 	015C
		CLRR 	75H 			//0223 	0175
		ORG		0224H
		INCR	75H,1 			//0224 	09F5
		LCALL 	394H 			//0225 	3394
		LJUMP 	237H 			//0226 	3A37
		LDWI 	AH 			//0227 	2A0A

		//;MAIN.C: 364: beep(10,1);
		CLRR 	75H 			//0228 	0175
		INCR	75H,1 			//0229 	09F5
		LCALL 	394H 			//022A 	3394
		LJUMP 	237H 			//022B 	3A37
		ORG		022CH
		LDR 	5DH,0 			//022C 	085D
		STR 	FSR 			//022D 	0184
		LDWI 	7H 			//022E 	2A07
		SUBWR 	FSR,0 			//022F 	0C04
		BTSC 	STATUS,0 		//0230 	1403
		LJUMP 	237H 			//0231 	3A37
		LDWI 	4H 			//0232 	2A04
		STR 	PCLATH 			//0233 	018A
		ORG		0234H
		LDWI 	A0H 			//0234 	2AA0
		ADDWR 	FSR,0 			//0235 	0B04
		STR 	PCL 			//0236 	0182
		LDWI 	9FH 			//0237 	2A9F

		//;MAIN.C: 374: idState = 1;
		BCR 	STATUS,5 		//0238 	1283
		BCR 	STATUS,6 		//0239 	1303
		CLRR 	56H 			//023A 	0156
		INCR	56H,1 			//023B 	09D6
		ORG		023CH

		//;MAIN.C: 375: _delay((unsigned long)((61)*(8000000/4000.0)));
		STR 	54H 			//023C 	01D4
		LDWI 	6FH 			//023D 	2A6F
		STR 	53H 			//023E 	01D3
		DECRSZ 	53H,1 		//023F 	0ED3
		LJUMP 	23FH 			//0240 	3A3F
		DECRSZ 	54H,1 		//0241 	0ED4
		LJUMP 	23FH 			//0242 	3A3F
		LJUMP 	244H 			//0243 	3A44
		ORG		0244H

		//;MAIN.C: 376: }
		LJUMP 	252H 			//0244 	3A52
		LDWI 	2H 			//0245 	2A02

		//;MAIN.C: 377: else{
		//;MAIN.C: 378: idState =0;
		CLRR 	56H 			//0246 	0156

		//;MAIN.C: 379: _delay((unsigned long)((150)*(8000000/4000.0)));
		STR 	55H 			//0247 	01D5
		LDWI 	86H 			//0248 	2A86
		STR 	54H 			//0249 	01D4
		LDWI 	99H 			//024A 	2A99
		STR 	53H 			//024B 	01D3
		ORG		024CH
		DECRSZ 	53H,1 		//024C 	0ED3
		LJUMP 	24CH 			//024D 	3A4C
		DECRSZ 	54H,1 		//024E 	0ED4
		LJUMP 	24CH 			//024F 	3A4C
		DECRSZ 	55H,1 		//0250 	0ED5
		LJUMP 	24CH 			//0251 	3A4C

		//;MAIN.C: 380: }
		//;MAIN.C: 384: if((timeOut!=0)&&( timeTick > timeOut)){
		BCR 	STATUS,5 		//0252 	1283
		BCR 	STATUS,6 		//0253 	1303
		ORG		0254H
		LDR 	5AH,0 			//0254 	085A
		IORWR 	59H,0 			//0255 	0359
		BTSC 	STATUS,2 		//0256 	1503
		LJUMP 	27DH 			//0257 	3A7D
		LDR 	5CH,0 			//0258 	085C
		SUBWR 	5AH,0 			//0259 	0C5A
		BTSS 	STATUS,2 		//025A 	1D03
		LJUMP 	25EH 			//025B 	3A5E
		ORG		025CH
		LDR 	5BH,0 			//025C 	085B
		SUBWR 	59H,0 			//025D 	0C59
		BTSS 	STATUS,0 		//025E 	1C03
		LJUMP 	272H 			//025F 	3A72
		LJUMP 	27DH 			//0260 	3A7D

		//;MAIN.C: 389: setState(2,220);
		LDWI 	DCH 			//0261 	2ADC
		STR 	72H 			//0262 	01F2
		LDWI 	2H 			//0263 	2A02
		ORG		0264H
		CLRR 	73H 			//0264 	0173
		LCALL 	478H 			//0265 	3478

		//;MAIN.C: 391: break;
		LJUMP 	27DH 			//0266 	3A7D

		//;MAIN.C: 393: setState(6,35);
		LDWI 	23H 			//0267 	2A23
		STR 	72H 			//0268 	01F2
		LDWI 	6H 			//0269 	2A06
		CLRR 	73H 			//026A 	0173
		LCALL 	478H 			//026B 	3478
		ORG		026CH

		//;MAIN.C: 394: break;
		LJUMP 	27DH 			//026C 	3A7D
		LDWI 	2H 			//026D 	2A02

		//;MAIN.C: 396: setState(2,0);
		CLRR 	72H 			//026E 	0172
		CLRR 	73H 			//026F 	0173
		LCALL 	478H 			//0270 	3478

		//;MAIN.C: 399: break;
		LJUMP 	27DH 			//0271 	3A7D
		LDR 	5DH,0 			//0272 	085D
		XORWI 	1H 			//0273 	2601
		ORG		0274H
		BTSC 	STATUS,2 		//0274 	1503
		LJUMP 	261H 			//0275 	3A61
		XORWI 	3H 			//0276 	2603
		BTSC 	STATUS,2 		//0277 	1503
		LJUMP 	267H 			//0278 	3A67
		XORWI 	4H 			//0279 	2604
		BTSC 	STATUS,2 		//027A 	1503
		LJUMP 	26DH 			//027B 	3A6D
		ORG		027CH
		LJUMP 	27DH 			//027C 	3A7D

		//;MAIN.C: 402: }
		//;MAIN.C: 405: if(mtState==0) RA3 = 1;
		LDR 	5DH,1 			//027D 	08DD
		BTSS 	STATUS,2 		//027E 	1D03
		LJUMP 	282H 			//027F 	3A82
		BSR 	5H,3 			//0280 	1985
		LJUMP 	283H 			//0281 	3A83

		//;MAIN.C: 406: else RA3 =0;
		BCR 	5H,3 			//0282 	1185

		//;MAIN.C: 435: if (mtState == 2) {
		LDR 	5DH,0 			//0283 	085D
		ORG		0284H
		XORWI 	2H 			//0284 	2602
		BTSS 	STATUS,2 		//0285 	1D03
		LJUMP 	296H 			//0286 	3A96

		//;MAIN.C: 437: TMR1ON = 1; T0IE = 1;
		BSR 	10H,0 			//0287 	1810
		BSR 	INTCON,5 		//0288 	1A8B

		//;MAIN.C: 438: if (timeTick % 4 == 0) {
		LDR 	5BH,0 			//0289 	085B
		ANDWI 	3H 			//028A 	2403
		BTSS 	STATUS,2 		//028B 	1D03
		ORG		028CH
		LJUMP 	298H 			//028C 	3A98

		//;MAIN.C: 440: if (buzFre == 0x6a) {
		LDR 	25H,0 			//028D 	0825
		XORWI 	6AH 			//028E 	266A
		BTSS 	STATUS,2 		//028F 	1D03
		LJUMP 	293H 			//0290 	3A93

		//;MAIN.C: 441: buzFre = 12;
		LDWI 	CH 			//0291 	2A0C
		LJUMP 	294H 			//0292 	3A94

		//;MAIN.C: 442: } else {
		//;MAIN.C: 443: buzFre = 0x6a;
		LDWI 	6AH 			//0293 	2A6A
		ORG		0294H
		STR 	25H 			//0294 	01A5
		LJUMP 	298H 			//0295 	3A98
		BCR 	10H,0 			//0296 	1010
		BCR 	INTCON,5 		//0297 	128B

		//;MAIN.C: 451: timeTick++;
		INCR	5BH,1 			//0298 	09DB
		BTSC 	STATUS,2 		//0299 	1503
		INCR	5CH,1 			//029A 	09DC
		LJUMP 	19BH 			//029B 	399B
		ORG		029CH
		STR 	7BH 			//029C 	01FB

		//;MAIN.C: 164: id=(id-1)*5;
		LDWI 	5H 			//029D 	2A05
		STR 	72H 			//029E 	01F2
		LDR 	7BH,0 			//029F 	087B
		ADDWI 	FFH 			//02A0 	27FF
		LCALL 	46AH 			//02A1 	346A
		STR 	7BH 			//02A2 	01FB

		//;MAIN.C: 165: {
		//;MAIN.C: 166: {
		//;MAIN.C: 167: *(buff+id) = *Cont;
		LDR 	3FH,0 			//02A3 	083F
		ORG		02A4H
		STR 	FSR 			//02A4 	0184
		BCR 	STATUS,7 		//02A5 	1383
		LDR 	INDF,0 			//02A6 	0800
		STR 	41H 			//02A7 	01C1
		LDR 	7BH,0 			//02A8 	087B
		ADDWR 	40H,0 			//02A9 	0B40
		STR 	42H 			//02AA 	01C2
		STR 	FSR 			//02AB 	0184
		ORG		02ACH
		LDR 	41H,0 			//02AC 	0841
		STR 	INDF 			//02AD 	0180

		//;MAIN.C: 168: *(buff+1+id) = *(Cont+1);
		LDR 	3FH,0 			//02AE 	083F
		ADDWI 	1H 			//02AF 	2701
		LCALL 	2D0H 			//02B0 	32D0
		ADDWI 	1H 			//02B1 	2701
		STR 	FSR 			//02B2 	0184
		LDR 	41H,0 			//02B3 	0841
		ORG		02B4H
		STR 	INDF 			//02B4 	0180

		//;MAIN.C: 169: *(buff+2+id) = *(Cont+2);
		LDR 	3FH,0 			//02B5 	083F
		ADDWI 	2H 			//02B6 	2702
		LCALL 	2D0H 			//02B7 	32D0
		ADDWI 	2H 			//02B8 	2702
		STR 	FSR 			//02B9 	0184
		LDR 	41H,0 			//02BA 	0841
		STR 	INDF 			//02BB 	0180
		ORG		02BCH

		//;MAIN.C: 170: *(buff+3+id) = *(Cont+3);
		LDR 	3FH,0 			//02BC 	083F
		ADDWI 	3H 			//02BD 	2703
		LCALL 	2D0H 			//02BE 	32D0
		ADDWI 	3H 			//02BF 	2703
		STR 	FSR 			//02C0 	0184
		LDR 	41H,0 			//02C1 	0841
		STR 	INDF 			//02C2 	0180

		//;MAIN.C: 171: *(buff+4+id) = *(Cont+4);
		LDR 	3FH,0 			//02C3 	083F
		ORG		02C4H
		ADDWI 	4H 			//02C4 	2704
		LCALL 	2D0H 			//02C5 	32D0
		ADDWI 	4H 			//02C6 	2704
		STR 	FSR 			//02C7 	0184
		LDR 	41H,0 			//02C8 	0841
		STR 	INDF 			//02C9 	0180

		//;MAIN.C: 172: }
		//;MAIN.C: 173: }
		//;MAIN.C: 175: eepromWriteBlock(0x06,buffTag,25);
		LDWI 	26H 			//02CA 	2A26
		STR 	76H 			//02CB 	01F6
		ORG		02CCH
		LDWI 	19H 			//02CC 	2A19
		STR 	77H 			//02CD 	01F7
		LDWI 	6H 			//02CE 	2A06
		LJUMP 	3F6H 			//02CF 	3BF6
		STR 	FSR 			//02D0 	0184
		LDR 	INDF,0 			//02D1 	0800
		STR 	41H 			//02D2 	01C1
		LDR 	7BH,0 			//02D3 	087B
		ORG		02D4H
		ADDWR 	40H,0 			//02D4 	0B40
		STR 	42H 			//02D5 	01C2
		RET		 					//02D6 	0004
		STR 	75H 			//02D7 	01F5

		//;ms82_eeprom.c: 27: GIE = 0;
		BCR 	INTCON,7 		//02D8 	138B

		//;ms82_eeprom.c: 29: {
		//;ms82_eeprom.c: 30: while(GIE) asm("clrwdt");
		BTSS 	INTCON,7 		//02D9 	1F8B
		LJUMP 	2DDH 			//02DA 	3ADD
		CLRWDT	 			//02DB 	0001
		ORG		02DCH
		LJUMP 	2D9H 			//02DC 	3AD9

		//;ms82_eeprom.c: 31: EEADR = EEAddr;
		LDR 	75H,0 			//02DD 	0875
		BSR 	STATUS,5 		//02DE 	1A83
		BCR 	STATUS,6 		//02DF 	1303
		STR 	1BH 			//02E0 	019B

		//;ms82_eeprom.c: 32: EEDAT = EEData;
		LDR 	72H,0 			//02E1 	0872
		STR 	1AH 			//02E2 	019A
		LDWI 	34H 			//02E3 	2A34
		ORG		02E4H

		//;ms82_eeprom.c: 33: EEIF = 0;
		BCR 	STATUS,5 		//02E4 	1283
		BCR 	CH,7 			//02E5 	138C

		//;ms82_eeprom.c: 34: EECON1 = 0x34;
		BSR 	STATUS,5 		//02E6 	1A83
		STR 	1CH 			//02E7 	019C

		//;ms82_eeprom.c: 35: WR = 1;
		BSR 	1DH,0 			//02E8 	181D

		//;ms82_eeprom.c: 36: while(WR) asm("clrwdt");
		BSR 	STATUS,5 		//02E9 	1A83
		BCR 	STATUS,6 		//02EA 	1303
		BTSS 	1DH,0 			//02EB 	1C1D
		ORG		02ECH
		LJUMP 	2EFH 			//02EC 	3AEF
		CLRWDT	 			//02ED 	0001
		LJUMP 	2E9H 			//02EE 	3AE9

		//;ms82_eeprom.c: 37: _delay((unsigned long)((2)*(8000000/4000.0)));
		LDWI 	6H 			//02EF 	2A06
		STR 	74H 			//02F0 	01F4
		LDWI 	30H 			//02F1 	2A30
		STR 	73H 			//02F2 	01F3
		DECRSZ 	73H,1 		//02F3 	0EF3
		ORG		02F4H
		LJUMP 	2F3H 			//02F4 	3AF3
		DECRSZ 	74H,1 		//02F5 	0EF4
		LJUMP 	2F3H 			//02F6 	3AF3
		CLRWDT	 			//02F7 	0001

		//;ms82_eeprom.c: 38: }
		//;ms82_eeprom.c: 39: GIE = 1;
		BSR 	INTCON,7 		//02F8 	1B8B
		RET		 					//02F9 	0004
		STR 	74H 			//02FA 	01F4

		//;rfid125.c: 7: unsigned int CurTimer;
		//;rfid125.c: 8: TMR1ON = 0;
		BCR 	10H,0 			//02FB 	1010
		ORG		02FCH

		//;rfid125.c: 9: TMR1H = 0;
		CLRR 	FH 			//02FC 	010F

		//;rfid125.c: 10: TMR1L = 0;
		CLRR 	EH 			//02FD 	010E

		//;rfid125.c: 11: TMR1IF = 0;
		BCR 	CH,0 			//02FE 	100C

		//;rfid125.c: 12: TMR1ON = 1;
		BSR 	10H,0 			//02FF 	1810

		//;rfid125.c: 13: while(RA4==Logic){
		LDWI 	0H 			//0300 	2A00
		BTSC 	5H,4 			//0301 	1605
		LDWI 	1H 			//0302 	2A01
		XORWR 	74H,0 			//0303 	0474
		ORG		0304H
		BTSS 	STATUS,2 		//0304 	1D03
		LJUMP 	316H 			//0305 	3B16

		//;rfid125.c: 14: CurTimer= (TMR1H <<8 )| TMR1L;
		LDR 	FH,0 			//0306 	080F
		STR 	76H 			//0307 	01F6
		CLRR 	75H 			//0308 	0175
		LDR 	EH,0 			//0309 	080E
		IORWR 	75H,1 			//030A 	03F5

		//;rfid125.c: 15: if(CurTimer>time)
		LDR 	76H,0 			//030B 	0876
		ORG		030CH
		SUBWR 	73H,0 			//030C 	0C73
		BTSS 	STATUS,2 		//030D 	1D03
		LJUMP 	311H 			//030E 	3B11
		LDR 	75H,0 			//030F 	0875
		SUBWR 	72H,0 			//0310 	0C72
		BTSC 	STATUS,0 		//0311 	1403
		LJUMP 	300H 			//0312 	3B00

		//;rfid125.c: 16: return 0;
		CLRR 	72H 			//0313 	0172
		ORG		0314H
		CLRR 	73H 			//0314 	0173
		RET		 					//0315 	0004

		//;rfid125.c: 17: }
		//;rfid125.c: 18: return CurTimer;
		LDR 	76H,0 			//0316 	0876
		STR 	73H 			//0317 	01F3
		LDR 	75H,0 			//0318 	0875
		STR 	72H 			//0319 	01F2
		RET		 					//031A 	0004
		STR 	49H 			//031B 	01C9
		ORG		031CH

		//;MAIN.C: 178: unsigned char tmp[5]={0xff,0xff,0xff,0xff,0xff};
		LDWI 	44H 			//031C 	2A44
		STR 	FSR 			//031D 	0184
		LDR 	20H,0 			//031E 	0820
		BCR 	STATUS,7 		//031F 	1383
		STR 	INDF 			//0320 	0180
		INCR	FSR,1 			//0321 	0984
		LDR 	21H,0 			//0322 	0821
		STR 	INDF 			//0323 	0180
		ORG		0324H
		INCR	FSR,1 			//0324 	0984
		LDR 	22H,0 			//0325 	0822
		STR 	INDF 			//0326 	0180
		INCR	FSR,1 			//0327 	0984
		LDR 	23H,0 			//0328 	0823
		STR 	INDF 			//0329 	0180
		INCR	FSR,1 			//032A 	0984
		LDR 	24H,0 			//032B 	0824
		ORG		032CH
		STR 	INDF 			//032C 	0180
		LDR 	49H,0 			//032D 	0849
		SUBWR 	43H,0 			//032E 	0C43
		BTSS 	STATUS,0 		//032F 	1C03
		RET		 					//0330 	0004

		//;MAIN.C: 180: id_replate(idMin,tmp,buffTag);
		LDWI 	44H 			//0331 	2A44
		STR 	3FH 			//0332 	01BF
		LDWI 	26H 			//0333 	2A26
		ORG		0334H
		STR 	40H 			//0334 	01C0
		LDR 	49H,0 			//0335 	0849
		LCALL 	29CH 			//0336 	329C
		BCR 	STATUS,5 		//0337 	1283
		BCR 	STATUS,6 		//0338 	1303
		INCR	49H,1 			//0339 	09C9
		LJUMP 	32DH 			//033A 	3B2D
		RETW 	FFH 			//033B 	21FF
		ORG		033CH
		RETW 	FFH 			//033C 	21FF
		RETW 	FFH 			//033D 	21FF
		RETW 	FFH 			//033E 	21FF
		RETW 	FFH 			//033F 	21FF
		RETW 	CH 			//0340 	210C
		RETW 	0H 			//0341 	2100
		RETW 	0H 			//0342 	2100
		RETW 	11H 			//0343 	2111
		ORG		0344H
		RETW 	BH 			//0344 	210B
		RETW 	4FH 			//0345 	214F
		RETW 	0H 			//0346 	2100
		RETW 	0H 			//0347 	2100
		RETW 	81H 			//0348 	2181
		RETW 	2FH 			//0349 	212F
		RETW 	22H 			//034A 	2122
		RETW 	0H 			//034B 	2100
		ORG		034CH
		RETW 	0H 			//034C 	2100
		RETW 	7DH 			//034D 	217D
		RETW 	67H 			//034E 	2167
		RETW 	5H 			//034F 	2105
		RETW 	0H 			//0350 	2100
		RETW 	0H 			//0351 	2100
		RETW 	7EH 			//0352 	217E
		RETW 	31H 			//0353 	2131
		ORG		0354H
		RETW 	E7H 			//0354 	21E7
		RETW 	0H 			//0355 	2100
		RETW 	0H 			//0356 	2100
		RETW 	7EH 			//0357 	217E
		RETW 	51H 			//0358 	2151
		RETW 	E6H 			//0359 	21E6
		STR 	78H 			//035A 	01F8

		//;ms82_eeprom.c: 53: unsigned char i;
		//;ms82_eeprom.c: 55: if(len1!=len2)
		LDR 	73H,0 			//035B 	0873
		ORG		035CH
		XORWR 	74H,0 			//035C 	0474
		BTSS 	STATUS,2 		//035D 	1D03

		//;ms82_eeprom.c: 56: return 0;
		RETW 	0H 			//035E 	2100

		//;ms82_eeprom.c: 57: else{
		//;ms82_eeprom.c: 58: for(i=0;i<len1;i++){
		CLRR 	79H 			//035F 	0179
		LDR 	73H,0 			//0360 	0873
		SUBWR 	79H,0 			//0361 	0C79

		//;ms82_eeprom.c: 59: if(*(arr1+i) != *(arr2+i)){
		LDR 	79H,0 			//0362 	0879
		BTSC 	STATUS,0 		//0363 	1403
		ORG		0364H
		LJUMP 	375H 			//0364 	3B75
		ADDWR 	72H,0 			//0365 	0B72
		STR 	75H 			//0366 	01F5
		STR 	FSR 			//0367 	0184
		BCR 	STATUS,7 		//0368 	1383
		LDR 	INDF,0 			//0369 	0800
		STR 	76H 			//036A 	01F6
		LDR 	79H,0 			//036B 	0879
		ORG		036CH
		ADDWR 	78H,0 			//036C 	0B78
		STR 	77H 			//036D 	01F7
		STR 	FSR 			//036E 	0184
		LDR 	INDF,0 			//036F 	0800
		XORWR 	76H,0 			//0370 	0476
		BTSS 	STATUS,2 		//0371 	1D03
		RETW 	0H 			//0372 	2100
		INCR	79H,1 			//0373 	09F9
		ORG		0374H
		LJUMP 	360H 			//0374 	3B60

		//;ms82_eeprom.c: 61: }
		//;ms82_eeprom.c: 62: }
		//;ms82_eeprom.c: 63: if(i==len1)
		XORWR 	73H,0 			//0375 	0473
		BTSC 	STATUS,2 		//0376 	1503

		//;ms82_eeprom.c: 64: return 1;
		RETW 	1H 			//0377 	2101
		RETW 	0H 			//0378 	2100
		STR 	73H 			//0379 	01F3
		CLRR 	75H 			//037A 	0175
		LDR 	72H,0 			//037B 	0872
		ORG		037CH
		BTSC 	STATUS,2 		//037C 	1503
		LJUMP 	392H 			//037D 	3B92
		CLRR 	74H 			//037E 	0174
		INCR	74H,1 			//037F 	09F4
		BTSC 	72H,7 			//0380 	17F2
		LJUMP 	385H 			//0381 	3B85
		BCR 	STATUS,0 		//0382 	1003
		RLR 	72H,1 			//0383 	05F2
		ORG		0384H
		LJUMP 	37FH 			//0384 	3B7F
		BCR 	STATUS,0 		//0385 	1003
		RLR 	75H,1 			//0386 	05F5
		LDR 	72H,0 			//0387 	0872
		SUBWR 	73H,0 			//0388 	0C73
		BTSS 	STATUS,0 		//0389 	1C03
		LJUMP 	38FH 			//038A 	3B8F
		LDR 	72H,0 			//038B 	0872
		ORG		038CH
		SUBWR 	73H,1 			//038C 	0CF3
		BSR 	75H,0 			//038D 	1875
		BCR 	STATUS,0 		//038E 	1003
		RRR	72H,1 			//038F 	06F2
		DECRSZ 	74H,1 		//0390 	0EF4
		LJUMP 	385H 			//0391 	3B85
		LDR 	75H,0 			//0392 	0875
		RET		 					//0393 	0004
		ORG		0394H
		STR 	76H 			//0394 	01F6

		//;MAIN.C: 63: TMR1ON = 1;T0IE = 1;
		BSR 	10H,0 			//0395 	1810
		BSR 	INTCON,5 		//0396 	1A8B

		//;MAIN.C: 65: while(rep--){
		DECR 	75H,1 			//0397 	0DF5
		LDR 	75H,0 			//0398 	0875
		XORWI 	FFH 			//0399 	26FF
		BTSC 	STATUS,2 		//039A 	1503
		LJUMP 	3ACH 			//039B 	3BAC
		ORG		039CH
		LDWI 	2AH 			//039C 	2A2A

		//;MAIN.C: 66: TMR1ON = 1;T0IE = 1;
		BCR 	STATUS,5 		//039D 	1283
		BCR 	STATUS,6 		//039E 	1303
		BSR 	10H,0 			//039F 	1810
		BSR 	INTCON,5 		//03A0 	1A8B

		//;MAIN.C: 67: buzFre=42;
		STR 	25H 			//03A1 	01A5

		//;MAIN.C: 68: delay_x10ms(delay);
		LDR 	76H,0 			//03A2 	0876
		LCALL 	43CH 			//03A3 	343C
		ORG		03A4H
		LDWI 	14H 			//03A4 	2A14

		//;MAIN.C: 69: T0IE = 0;
		BCR 	INTCON,5 		//03A5 	128B

		//;MAIN.C: 70: TMR1ON = 0;RC0 =0;
		BCR 	STATUS,5 		//03A6 	1283
		BCR 	STATUS,6 		//03A7 	1303
		BCR 	10H,0 			//03A8 	1010
		BCR 	7H,0 			//03A9 	1007

		//;MAIN.C: 71: delay_x10ms(20);
		LCALL 	43CH 			//03AA 	343C
		LJUMP 	397H 			//03AB 	3B97
		ORG		03ACH

		//;MAIN.C: 72: }
		//;MAIN.C: 74: T0IE = 0;
		BCR 	INTCON,5 		//03AC 	128B
		RET		 					//03AD 	0004
		STR 	3FH 			//03AE 	01BF

		//;MAIN.C: 156: unsigned char i;
		//;MAIN.C: 157: for(i=0;i<21;i+=5){
		CLRR 	40H 			//03AF 	0140

		//;MAIN.C: 158: if(comArr(id_input,buff+i,5,5))
		LDR 	40H,0 			//03B0 	0840
		ADDWR 	7AH,0 			//03B1 	0B7A
		STR 	72H 			//03B2 	01F2
		LDWI 	5H 			//03B3 	2A05
		ORG		03B4H
		STR 	73H 			//03B4 	01F3
		STR 	74H 			//03B5 	01F4
		LDR 	3FH,0 			//03B6 	083F
		LCALL 	35AH 			//03B7 	335A
		XORWI 	0H 			//03B8 	2600

		//;MAIN.C: 159: return i/5 +1;
		LDWI 	5H 			//03B9 	2A05
		BTSC 	STATUS,2 		//03BA 	1503
		LJUMP 	3C2H 			//03BB 	3BC2
		ORG		03BCH
		STR 	72H 			//03BC 	01F2
		LDR 	40H,0 			//03BD 	0840
		LCALL 	379H 			//03BE 	3379
		STR 	7BH 			//03BF 	01FB
		INCR	7BH,0 			//03C0 	097B
		RET		 					//03C1 	0004
		ADDWR 	40H,1 			//03C2 	0BC0
		LDWI 	15H 			//03C3 	2A15
		ORG		03C4H
		SUBWR 	40H,0 			//03C4 	0C40
		BTSC 	STATUS,0 		//03C5 	1403

		//;MAIN.C: 160: }
		//;MAIN.C: 161: return 255;
		RETW 	FFH 			//03C6 	21FF
		LJUMP 	3B0H 			//03C7 	3BB0

		//;ms82_pwm.c: 12: TRISC |= 0b00000100;
		BSR 	7H,2 			//03C8 	1907

		//;ms82_pwm.c: 13: PR2 = 15;
		LDWI 	FH 			//03C9 	2A0F
		STR 	12H 			//03CA 	0192

		//;ms82_pwm.c: 14: EPWMR1L =0;
		BCR 	STATUS,5 		//03CB 	1283
		ORG		03CCH
		CLRR 	13H 			//03CC 	0113

		//;ms82_pwm.c: 15: EPWM1CON = 0b10011100;
		LDWI 	9CH 			//03CD 	2A9C
		STR 	15H 			//03CE 	0195

		//;ms82_pwm.c: 16: TMR2 = 0;
		CLRR 	11H 			//03CF 	0111
		LDWI 	4H 			//03D0 	2A04

		//;ms82_pwm.c: 17: TMR2IF = 0;
		BCR 	CH,1 			//03D1 	108C

		//;ms82_pwm.c: 18: T2CON = 0B00000100;
		STR 	12H 			//03D2 	0192

		//;ms82_pwm.c: 19: while(TMR2IF==1) asm("clrwdt");
		BCR 	STATUS,5 		//03D3 	1283
		ORG		03D4H
		BCR 	STATUS,6 		//03D4 	1303
		BTSS 	CH,1 			//03D5 	1C8C
		LJUMP 	3D9H 			//03D6 	3BD9
		CLRWDT	 			//03D7 	0001
		LJUMP 	3D3H 			//03D8 	3BD3

		//;ms82_pwm.c: 20: PWM1CON = 0b00010000;
		LDWI 	10H 			//03D9 	2A10
		STR 	16H 			//03DA 	0196

		//;ms82_pwm.c: 21: EPWM1AUX = 0b10001000;
		LDWI 	88H 			//03DB 	2A88
		ORG		03DCH
		BSR 	STATUS,5 		//03DC 	1A83
		STR 	10H 			//03DD 	0190

		//;ms82_pwm.c: 22: TRISC &= 0b11111011;
		BCR 	7H,2 			//03DE 	1107
		RET		 					//03DF 	0004
		LDWI 	3FH 			//03E0 	2A3F
		CLRR 	59H 			//03E1 	0159
		CLRR 	5AH 			//03E2 	015A
		CLRR 	5BH 			//03E3 	015B
		ORG		03E4H
		CLRR 	5CH 			//03E4 	015C
		CLRR 	5DH 			//03E5 	015D
		CLRR 	5EH 			//03E6 	015E
		CLRR 	5FH 			//03E7 	015F
		CLRR 	60H 			//03E8 	0160
		CLRR 	61H 			//03E9 	0161
		CLRR 	62H 			//03EA 	0162
		BCR 	STATUS,7 		//03EB 	1383
		ORG		03ECH
		STR 	7DH 			//03EC 	01FD
		LDWI 	3H 			//03ED 	2A03
		STR 	7EH 			//03EE 	01FE
		LDWI 	3BH 			//03EF 	2A3B
		STR 	7FH 			//03F0 	01FF
		LDWI 	20H 			//03F1 	2A20
		STR 	FSR 			//03F2 	0184
		LCALL 	450H 			//03F3 	3450
		ORG		03F4H
		CLRR 	STATUS 			//03F4 	0103
		LJUMP 	158H 			//03F5 	3958
		STR 	79H 			//03F6 	01F9

		//;ms82_eeprom.c: 44: unsigned char i;
		//;ms82_eeprom.c: 45: for(i=0;i<len;i++){
		CLRR 	7AH 			//03F7 	017A
		LDR 	77H,0 			//03F8 	0877
		SUBWR 	7AH,0 			//03F9 	0C7A
		BTSC 	STATUS,0 		//03FA 	1403
		RET		 					//03FB 	0004
		ORG		03FCH

		//;ms82_eeprom.c: 46: eepromWriteByte(addStart+i,buff[i]);
		LDR 	7AH,0 			//03FC 	087A
		ADDWR 	76H,0 			//03FD 	0B76
		STR 	78H 			//03FE 	01F8
		STR 	FSR 			//03FF 	0184
		BCR 	STATUS,7 		//0400 	1383
		LDR 	INDF,0 			//0401 	0800
		STR 	72H 			//0402 	01F2
		LDR 	7AH,0 			//0403 	087A
		ORG		0404H
		ADDWR 	79H,0 			//0404 	0B79
		LCALL 	2D7H 			//0405 	32D7
		INCR	7AH,1 			//0406 	09FA
		LJUMP 	3F8H 			//0407 	3BF8

		//;sysinit.c: 71: INTCON = 0B00000000;
		CLRR 	INTCON 			//0408 	010B

		//;sysinit.c: 72: PIE1 = 0B00000000;
		BSR 	STATUS,5 		//0409 	1A83
		CLRR 	CH 			//040A 	010C

		//;sysinit.c: 73: PIR1 = 0B00000000;
		BCR 	STATUS,5 		//040B 	1283
		ORG		040CH
		CLRR 	CH 			//040C 	010C

		//;sysinit.c: 85: T0IF = 0;
		BCR 	INTCON,2 		//040D 	110B

		//;sysinit.c: 86: T0IE = 0;
		BCR 	INTCON,5 		//040E 	128B

		//;sysinit.c: 87: TMR1ON = 0;
		BCR 	10H,0 			//040F 	1010

		//;sysinit.c: 89: TMR2IF = 0;
		BCR 	CH,1 			//0410 	108C

		//;sysinit.c: 90: TMR2IE = 0;
		BSR 	STATUS,5 		//0411 	1A83
		BCR 	CH,1 			//0412 	108C

		//;sysinit.c: 93: TMR1IF = 0;
		BCR 	STATUS,5 		//0413 	1283
		ORG		0414H
		BCR 	CH,0 			//0414 	100C

		//;sysinit.c: 94: TMR1IE = 0;
		BSR 	STATUS,5 		//0415 	1A83
		BCR 	CH,0 			//0416 	100C

		//;sysinit.c: 96: PEIE = 0;
		BCR 	INTCON,6 		//0417 	130B

		//;sysinit.c: 98: GIE = 1;
		BSR 	INTCON,7 		//0418 	1B8B
		RET		 					//0419 	0004
		STR 	77H 			//041A 	01F7

		//;ms82_eeprom.c: 19: unsigned char i;
		//;ms82_eeprom.c: 20: for(i=0;i<len;i++){
		CLRR 	78H 			//041B 	0178
		ORG		041CH
		LDR 	75H,0 			//041C 	0875
		SUBWR 	78H,0 			//041D 	0C78
		BTSC 	STATUS,0 		//041E 	1403
		RET		 					//041F 	0004

		//;ms82_eeprom.c: 21: buff[i] = eepromReadByte(addStart+i);
		LDR 	78H,0 			//0420 	0878
		ADDWR 	74H,0 			//0421 	0B74
		STR 	76H 			//0422 	01F6
		STR 	FSR 			//0423 	0184
		ORG		0424H
		LDR 	78H,0 			//0424 	0878
		ADDWR 	77H,0 			//0425 	0B77
		LCALL 	497H 			//0426 	3497
		BCR 	STATUS,7 		//0427 	1383
		STR 	INDF 			//0428 	0180
		INCR	78H,1 			//0429 	09F8
		LJUMP 	41CH 			//042A 	3C1C

		//;MAIN.C: 113: if(T0IE&&T0IF)
		BTSC 	INTCON,5 		//042B 	168B
		ORG		042CH
		BTSS 	INTCON,2 		//042C 	1D0B
		LJUMP 	435H 			//042D 	3C35

		//;MAIN.C: 114: {
		//;MAIN.C: 115: T0IF = 0;
		BCR 	INTCON,2 		//042E 	110B

		//;MAIN.C: 117: TMR0 = buzFre;
		BCR 	STATUS,5 		//042F 	1283
		BCR 	STATUS,6 		//0430 	1303
		LDR 	25H,0 			//0431 	0825
		STR 	1H 			//0432 	0181

		//;MAIN.C: 118: RC0 = ~RC0;
		LDWI 	1H 			//0433 	2A01
		ORG		0434H
		XORWR 	7H,1 			//0434 	0487
		LDR 	71H,0 			//0435 	0871
		STR 	PCLATH 			//0436 	018A
		SWAPR 	70H,0 			//0437 	0770
		STR 	STATUS 			//0438 	0183
		SWAPR 	7EH,1 			//0439 	07FE
		SWAPR 	7EH,0 			//043A 	077E
		RETI		 			//043B 	0009
		ORG		043CH
		STR 	74H 			//043C 	01F4

		//;MAIN.C: 58: while(t--)
		DECR 	74H,1 			//043D 	0DF4
		LDR 	74H,0 			//043E 	0874
		XORWI 	FFH 			//043F 	26FF
		BTSC 	STATUS,2 		//0440 	1503
		RET		 					//0441 	0004

		//;MAIN.C: 59: _delay((unsigned long)((10)*(8000000/4000.0)));
		LDWI 	1AH 			//0442 	2A1A
		STR 	73H 			//0443 	01F3
		ORG		0444H
		LDWI 	F8H 			//0444 	2AF8
		STR 	72H 			//0445 	01F2
		DECRSZ 	72H,1 		//0446 	0EF2
		LJUMP 	446H 			//0447 	3C46
		DECRSZ 	73H,1 		//0448 	0EF3
		LJUMP 	446H 			//0449 	3C46
		CLRWDT	 			//044A 	0001
		LJUMP 	43DH 			//044B 	3C3D
		ORG		044CH
		LDR 	7EH,0 			//044C 	087E
		STR 	PCLATH 			//044D 	018A
		LDR 	7FH,0 			//044E 	087F
		STR 	PCL 			//044F 	0182
		LCALL 	44CH 			//0450 	344C
		STR 	INDF 			//0451 	0180
		INCR	FSR,1 			//0452 	0984
		LDR 	FSR,0 			//0453 	0804
		ORG		0454H
		XORWR 	7DH,0 			//0454 	047D
		BTSC 	STATUS,2 		//0455 	1503
		RETW 	0H 			//0456 	2100
		INCR	7FH,1 			//0457 	09FF
		BTSC 	STATUS,2 		//0458 	1503
		INCR	7EH,1 			//0459 	09FE
		LJUMP 	450H 			//045A 	3C50

		//;sysinit.c: 34: PORTA = 0B00000000;
		BCR 	STATUS,5 		//045B 	1283
		ORG		045CH
		CLRR 	5H 			//045C 	0105

		//;sysinit.c: 35: TRISA = 0B01110111;
		LDWI 	77H 			//045D 	2A77
		BSR 	STATUS,5 		//045E 	1A83
		STR 	5H 			//045F 	0185

		//;sysinit.c: 36: WPUA = 0B10010000;
		LDWI 	90H 			//0460 	2A90
		STR 	15H 			//0461 	0195

		//;sysinit.c: 37: PORTC = 0B00000010;
		LDWI 	2H 			//0462 	2A02
		BCR 	STATUS,5 		//0463 	1283
		ORG		0464H
		STR 	7H 			//0464 	0187

		//;sysinit.c: 38: TRISC = 0B11111110;
		LDWI 	FEH 			//0465 	2AFE
		BSR 	STATUS,5 		//0466 	1A83
		STR 	7H 			//0467 	0187

		//;sysinit.c: 39: WPUC = 0B00000000;
		CLRR 	8H 			//0468 	0108
		RET		 					//0469 	0004
		STR 	74H 			//046A 	01F4
		CLRR 	73H 			//046B 	0173
		ORG		046CH
		LDR 	72H,0 			//046C 	0872
		BTSC 	74H,0 			//046D 	1474
		ADDWR 	73H,1 			//046E 	0BF3
		BCR 	STATUS,0 		//046F 	1003
		RLR 	72H,1 			//0470 	05F2
		BCR 	STATUS,0 		//0471 	1003
		RRR	74H,1 			//0472 	06F4
		LDR 	74H,1 			//0473 	08F4
		ORG		0474H
		BTSS 	STATUS,2 		//0474 	1D03
		LJUMP 	46CH 			//0475 	3C6C
		LDR 	73H,0 			//0476 	0873
		RET		 					//0477 	0004
		STR 	74H 			//0478 	01F4

		//;MAIN.C: 150: mtState = stt;
		BCR 	STATUS,5 		//0479 	1283
		BCR 	STATUS,6 		//047A 	1303
		STR 	5DH 			//047B 	01DD
		ORG		047CH

		//;MAIN.C: 151: timeTick =0;
		CLRR 	5BH 			//047C 	015B
		CLRR 	5CH 			//047D 	015C

		//;MAIN.C: 152: timeOut = _tOut;
		LDR 	73H,0 			//047E 	0873
		STR 	5AH 			//047F 	01DA
		LDR 	72H,0 			//0480 	0872
		STR 	59H 			//0481 	01D9
		RET		 					//0482 	0004

		//;sysinit.c: 21: OSCCON = 0B01100001;
		LDWI 	61H 			//0483 	2A61
		ORG		0484H
		BSR 	STATUS,5 		//0484 	1A83
		BCR 	STATUS,6 		//0485 	1303
		STR 	FH 			//0486 	018F

		//;sysinit.c: 22: _nop();
		NOP		 					//0487 	0000

		//;sysinit.c: 28: while(HTS==0);
		BSR 	STATUS,5 		//0488 	1A83
		BCR 	STATUS,6 		//0489 	1303
		BTSC 	FH,2 			//048A 	150F
		RET		 					//048B 	0004
		ORG		048CH
		LJUMP 	488H 			//048C 	3C88

		//;sysinit.c: 46: OPTION = 0B00000001;
		LDWI 	1H 			//048D 	2A01
		STR 	1H 			//048E 	0181

		//;sysinit.c: 59: TMR1H = -5000>>8;
		LDWI 	ECH 			//048F 	2AEC
		BCR 	STATUS,5 		//0490 	1283
		STR 	FH 			//0491 	018F

		//;sysinit.c: 60: TMR1L = -5000;
		LDWI 	78H 			//0492 	2A78
		STR 	EH 			//0493 	018E
		ORG		0494H

		//;sysinit.c: 61: T1CON = 0B00100001;
		LDWI 	21H 			//0494 	2A21
		STR 	10H 			//0495 	0190
		RET		 					//0496 	0004
		STR 	72H 			//0497 	01F2

		//;ms82_eeprom.c: 8: unsigned char ReEepromData;
		//;ms82_eeprom.c: 10: EEADR = EEAddr;
		BSR 	STATUS,5 		//0498 	1A83
		BCR 	STATUS,6 		//0499 	1303
		STR 	1BH 			//049A 	019B

		//;ms82_eeprom.c: 11: RD = 1;
		BSR 	1CH,0 			//049B 	181C
		ORG		049CH

		//;ms82_eeprom.c: 12: ReEepromData = EEDAT;
		LDR 	1AH,0 			//049C 	081A
		STR 	73H 			//049D 	01F3

		//;ms82_eeprom.c: 13: RD = 0;
		BCR 	1CH,0 			//049E 	101C

		//;ms82_eeprom.c: 14: return ReEepromData;
		RET		 					//049F 	0004
		LJUMP 	237H 			//04A0 	3A37
		LJUMP 	1A6H 			//04A1 	39A6
		LJUMP 	1A6H 			//04A2 	39A6
		LJUMP 	1EDH 			//04A3 	39ED
		ORG		04A4H
		LJUMP 	237H 			//04A4 	3A37
		LJUMP 	20CH 			//04A5 	3A0C
		LJUMP 	1C4H 			//04A6 	39C4
			END
