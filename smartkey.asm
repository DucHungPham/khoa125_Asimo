//Deviec:MS82Fxx02
//-----------------------Variable---------------------------------
		_buzFre		EQU		7BH
		_timeOut		EQU		58H
		_timeTick		EQU		5AH
		_mtState		EQU		5CH
		_keyID		EQU		5DH
		_buffTag		EQU		25H
//-----------------------Variable END---------------------------------
		ORG		0000H
		LJUMP 	0AH 			//0000 	380A
		ORG		0004H
		STR 	7EH 			//0004 	01FE
		SWAPR 	STATUS,0 		//0005 	0703
		STR 	70H 			//0006 	01F0
		LDR 	PCLATH,0 		//0007 	080A
		STR 	71H 			//0008 	01F1
		LJUMP 	41BH 			//0009 	3C1B
		LJUMP 	39FH 			//000A 	3B9F
		LDWI 	10H 			//000B 	2A10
		ORG		000CH

		//;rfid125.c: 23: unsigned char RF_serial_55bits[11];
		//;rfid125.c: 24: unsigned int timeOutVal;
		//;rfid125.c: 25: unsigned char i,ii,j;
		//;rfid125.c: 26: unsigned char flag_RFID_syn, flag_RFID_last;
		//;rfid125.c: 27: unsigned char even_row, even_col;
		//;rfid125.c: 30: flag_RFID_syn = 0;
		CLRR 	49H 			//000C 	0149

		//;rfid125.c: 33: i=16;
		STR 	4DH 			//000D 	01CD

		//;rfid125.c: 35: {
		//;rfid125.c: 36: timeOutVal=timerOut(1,600);
		LDWI 	58H 			//000E 	2A58
		STR 	72H 			//000F 	01F2
		LDWI 	2H 			//0010 	2A02
		STR 	73H 			//0011 	01F3
		LDWI 	1H 			//0012 	2A01
		LCALL 	2ECH 			//0013 	32EC
		ORG		0014H

		//;rfid125.c: 37: if(timeOutVal==0) return 0;
		LCALL 	141H 			//0014 	3141
		BTSC 	STATUS,2 		//0015 	1503
		RETW 	0H 			//0016 	2100

		//;rfid125.c: 39: timeOutVal=timerOut(0,600);
		LDWI 	58H 			//0017 	2A58
		LCALL 	154H 			//0018 	3154
		LCALL 	2ECH 			//0019 	32EC

		//;rfid125.c: 40: if(timeOutVal==0) return 0;
		LCALL 	141H 			//001A 	3141
		BTSC 	STATUS,2 		//001B 	1503
		ORG		001CH
		RETW 	0H 			//001C 	2100
		LDWI 	1H 			//001D 	2A01

		//;rfid125.c: 42: i--;
		DECR 	4DH,1 			//001E 	0DCD

		//;rfid125.c: 43: }
		//;rfid125.c: 44: while(timeOutVal<290 && i>0);
		SUBWR 	50H,0 			//001F 	0C50
		LDWI 	22H 			//0020 	2A22
		BTSC 	STATUS,2 		//0021 	1503
		SUBWR 	4FH,0 			//0022 	0C4F
		BTSC 	STATUS,0 		//0023 	1403
		ORG		0024H
		LJUMP 	28H 			//0024 	3828
		LDR 	4DH,1 			//0025 	08CD
		BTSS 	STATUS,2 		//0026 	1D03
		LJUMP 	0EH 			//0027 	380E

		//;rfid125.c: 45: flag_RFID_last = 1;
		CLRR 	4EH 			//0028 	014E
		INCR	4EH,1 			//0029 	09CE

		//;rfid125.c: 46: i = 0;
		CLRR 	4DH 			//002A 	014D

		//;rfid125.c: 47: while(i<64)
		LDWI 	40H 			//002B 	2A40
		ORG		002CH
		SUBWR 	4DH,0 			//002C 	0C4D
		BTSC 	STATUS,0 		//002D 	1403
		LJUMP 	84H 			//002E 	3884

		//;rfid125.c: 48: {
		//;rfid125.c: 49: for(ii=0;ii<9;ii++)
		CLRR 	51H 			//002F 	0151

		//;rfid125.c: 50: {
		//;rfid125.c: 51: timeOutVal=timerOut(flag_RFID_last,600);
		LCALL 	14EH 			//0030 	314E
		LCALL 	2ECH 			//0031 	32EC

		//;rfid125.c: 52: if(timeOutVal==0) return 0;
		LCALL 	141H 			//0032 	3141
		BTSC 	STATUS,2 		//0033 	1503
		ORG		0034H
		RETW 	0H 			//0034 	2100

		//;rfid125.c: 54: if(0==flag_RFID_last && timeOutVal<=290 ||
		//;rfid125.c: 55: 1==flag_RFID_last && timeOutVal>290)
		LDR 	4EH,1 			//0035 	08CE
		BTSS 	STATUS,2 		//0036 	1D03
		LJUMP 	3FH 			//0037 	383F
		LDWI 	1H 			//0038 	2A01
		SUBWR 	50H,0 			//0039 	0C50
		LDWI 	23H 			//003A 	2A23
		BTSC 	STATUS,2 		//003B 	1503
		ORG		003CH
		SUBWR 	4FH,0 			//003C 	0C4F
		BTSS 	STATUS,0 		//003D 	1C03
		LJUMP 	48H 			//003E 	3848
		DECRSZ 	4EH,0 		//003F 	0E4E
		LJUMP 	56H 			//0040 	3856
		LDWI 	1H 			//0041 	2A01
		SUBWR 	50H,0 			//0042 	0C50
		LDWI 	23H 			//0043 	2A23
		ORG		0044H
		BTSC 	STATUS,2 		//0044 	1503
		SUBWR 	4FH,0 			//0045 	0C4F
		BTSS 	STATUS,0 		//0046 	1C03
		LJUMP 	56H 			//0047 	3856

		//;rfid125.c: 56: {
		//;rfid125.c: 57: if(!flag_RFID_last)
		LDR 	4EH,1 			//0048 	08CE
		BTSS 	STATUS,2 		//0049 	1D03
		LJUMP 	53H 			//004A 	3853

		//;rfid125.c: 58: {
		//;rfid125.c: 59: timeOutVal=timerOut(1,290);
		LDWI 	22H 			//004B 	2A22
		ORG		004CH
		STR 	72H 			//004C 	01F2
		LDWI 	1H 			//004D 	2A01
		STR 	73H 			//004E 	01F3
		LCALL 	2ECH 			//004F 	32EC

		//;rfid125.c: 60: if(timeOutVal==0) return 0;
		LCALL 	141H 			//0050 	3141
		BTSC 	STATUS,2 		//0051 	1503
		RETW 	0H 			//0052 	2100

		//;rfid125.c: 61: }
		//;rfid125.c: 62: flag_RFID_last = 0;
		CLRR 	4EH 			//0053 	014E
		ORG		0054H

		//;rfid125.c: 63: i++;
		INCR	4DH,1 			//0054 	09CD

		//;rfid125.c: 64: }
		LJUMP 	79H 			//0055 	3879

		//;rfid125.c: 65: else
		//;rfid125.c: 66: if(0==flag_RFID_last && timeOutVal>290 ||
		//;rfid125.c: 67: 1==flag_RFID_last && timeOutVal<=290)
		LDR 	4EH,1 			//0056 	08CE
		BTSS 	STATUS,2 		//0057 	1D03
		LJUMP 	60H 			//0058 	3860
		LDWI 	1H 			//0059 	2A01
		SUBWR 	50H,0 			//005A 	0C50
		LDWI 	23H 			//005B 	2A23
		ORG		005CH
		BTSC 	STATUS,2 		//005C 	1503
		SUBWR 	4FH,0 			//005D 	0C4F
		BTSC 	STATUS,0 		//005E 	1403
		LJUMP 	69H 			//005F 	3869
		DECRSZ 	4EH,0 		//0060 	0E4E
		LJUMP 	79H 			//0061 	3879
		LDWI 	1H 			//0062 	2A01
		SUBWR 	50H,0 			//0063 	0C50
		ORG		0064H
		LDWI 	23H 			//0064 	2A23
		BTSC 	STATUS,2 		//0065 	1503
		SUBWR 	4FH,0 			//0066 	0C4F
		BTSC 	STATUS,0 		//0067 	1403
		LJUMP 	79H 			//0068 	3879

		//;rfid125.c: 68: {
		//;rfid125.c: 69: if(flag_RFID_last)
		LDR 	4EH,0 			//0069 	084E
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
		LCALL 	2ECH 			//0071 	32EC

		//;rfid125.c: 72: if(timeOutVal==0) return 0;
		LCALL 	141H 			//0072 	3141
		BTSC 	STATUS,2 		//0073 	1503
		ORG		0074H
		RETW 	0H 			//0074 	2100

		//;rfid125.c: 73: }
		//;rfid125.c: 74: flag_RFID_last = 1;
		CLRR 	4EH 			//0075 	014E
		INCR	4EH,1 			//0076 	09CE

		//;rfid125.c: 75: i++;
		INCR	4DH,1 			//0077 	09CD

		//;rfid125.c: 77: break;
		LJUMP 	7EH 			//0078 	387E
		LDWI 	9H 			//0079 	2A09
		INCR	51H,1 			//007A 	09D1
		SUBWR 	51H,0 			//007B 	0C51
		ORG		007CH
		BTSS 	STATUS,0 		//007C 	1C03
		LJUMP 	30H 			//007D 	3830

		//;rfid125.c: 78: }
		//;rfid125.c: 80: }
		//;rfid125.c: 81: if(9==ii)
		LDR 	51H,0 			//007E 	0851
		XORWI 	9H 			//007F 	2609
		BTSS 	STATUS,2 		//0080 	1D03
		LJUMP 	2BH 			//0081 	382B

		//;rfid125.c: 82: {
		//;rfid125.c: 83: flag_RFID_syn = 1;
		CLRR 	49H 			//0082 	0149
		INCR	49H,1 			//0083 	09C9
		ORG		0084H

		//;rfid125.c: 84: break;
		//;rfid125.c: 85: }
		//;rfid125.c: 86: }
		//;rfid125.c: 88: if(!flag_RFID_syn)
		LDR 	49H,1 			//0084 	08C9
		BTSC 	STATUS,2 		//0085 	1503
		RETW 	0H 			//0086 	2100

		//;rfid125.c: 91: }
		//;rfid125.c: 92: for(ii=0;ii<55;ii++)
		CLRR 	51H 			//0087 	0151

		//;rfid125.c: 93: {
		//;rfid125.c: 94: i = ii/5;
		LDWI 	5H 			//0088 	2A05
		STR 	72H 			//0089 	01F2
		LDR 	51H,0 			//008A 	0851
		LCALL 	36AH 			//008B 	336A
		ORG		008CH
		STR 	4DH 			//008C 	01CD

		//;rfid125.c: 95: timeOutVal=timerOut(flag_RFID_last,600);
		LCALL 	14EH 			//008D 	314E
		LCALL 	2ECH 			//008E 	32EC

		//;rfid125.c: 96: if(timeOutVal==0) return 0;
		LCALL 	141H 			//008F 	3141
		BTSC 	STATUS,2 		//0090 	1503
		RETW 	0H 			//0091 	2100

		//;rfid125.c: 98: if(0==flag_RFID_last && timeOutVal<=290 ||
		//;rfid125.c: 99: 1==flag_RFID_last && timeOutVal>290)
		LDR 	4EH,1 			//0092 	08CE
		BTSS 	STATUS,2 		//0093 	1D03
		ORG		0094H
		LJUMP 	9CH 			//0094 	389C
		LDWI 	1H 			//0095 	2A01
		SUBWR 	50H,0 			//0096 	0C50
		LDWI 	23H 			//0097 	2A23
		BTSC 	STATUS,2 		//0098 	1503
		SUBWR 	4FH,0 			//0099 	0C4F
		BTSS 	STATUS,0 		//009A 	1C03
		LJUMP 	A5H 			//009B 	38A5
		ORG		009CH
		DECRSZ 	4EH,0 		//009C 	0E4E
		LJUMP 	B7H 			//009D 	38B7
		LDWI 	1H 			//009E 	2A01
		SUBWR 	50H,0 			//009F 	0C50
		LDWI 	23H 			//00A0 	2A23
		BTSC 	STATUS,2 		//00A1 	1503
		SUBWR 	4FH,0 			//00A2 	0C4F
		BTSS 	STATUS,0 		//00A3 	1C03
		ORG		00A4H
		LJUMP 	B7H 			//00A4 	38B7

		//;rfid125.c: 100: {
		//;rfid125.c: 101: if(!flag_RFID_last)
		LDR 	4EH,1 			//00A5 	08CE
		BTSS 	STATUS,2 		//00A6 	1D03
		LJUMP 	B0H 			//00A7 	38B0

		//;rfid125.c: 102: {
		//;rfid125.c: 103: timeOutVal=timerOut(1,290);
		LDWI 	22H 			//00A8 	2A22
		STR 	72H 			//00A9 	01F2
		LDWI 	1H 			//00AA 	2A01
		STR 	73H 			//00AB 	01F3
		ORG		00ACH
		LCALL 	2ECH 			//00AC 	32EC

		//;rfid125.c: 104: if(timeOutVal==0) return 0;
		LCALL 	141H 			//00AD 	3141
		BTSC 	STATUS,2 		//00AE 	1503
		RETW 	0H 			//00AF 	2100

		//;rfid125.c: 105: }
		//;rfid125.c: 106: flag_RFID_last = 0;
		CLRR 	4EH 			//00B0 	014E

		//;rfid125.c: 107: RF_serial_55bits[i] <<= 1;
		LCALL 	147H 			//00B1 	3147

		//;rfid125.c: 108: RF_serial_55bits[i] |= 0x01;
		LDR 	4DH,0 			//00B2 	084D
		ADDWI 	3EH 			//00B3 	273E
		ORG		00B4H
		STR 	FSR 			//00B4 	0184
		BSR 	INDF,0 			//00B5 	1800

		//;rfid125.c: 109: }
		LJUMP 	D6H 			//00B6 	38D6

		//;rfid125.c: 110: else
		//;rfid125.c: 111: if(0==flag_RFID_last && timeOutVal>290 ||
		//;rfid125.c: 112: 1==flag_RFID_last && timeOutVal<=290)
		LDR 	4EH,1 			//00B7 	08CE
		BTSS 	STATUS,2 		//00B8 	1D03
		LJUMP 	C1H 			//00B9 	38C1
		LDWI 	1H 			//00BA 	2A01
		SUBWR 	50H,0 			//00BB 	0C50
		ORG		00BCH
		LDWI 	23H 			//00BC 	2A23
		BTSC 	STATUS,2 		//00BD 	1503
		SUBWR 	4FH,0 			//00BE 	0C4F
		BTSC 	STATUS,0 		//00BF 	1403
		LJUMP 	CAH 			//00C0 	38CA
		DECRSZ 	4EH,0 		//00C1 	0E4E
		LJUMP 	D6H 			//00C2 	38D6
		LDWI 	1H 			//00C3 	2A01
		ORG		00C4H
		SUBWR 	50H,0 			//00C4 	0C50
		LDWI 	23H 			//00C5 	2A23
		BTSC 	STATUS,2 		//00C6 	1503
		SUBWR 	4FH,0 			//00C7 	0C4F
		BTSC 	STATUS,0 		//00C8 	1403
		LJUMP 	D6H 			//00C9 	38D6

		//;rfid125.c: 113: {
		//;rfid125.c: 114: if(flag_RFID_last)
		LDR 	4EH,0 			//00CA 	084E
		BTSC 	STATUS,2 		//00CB 	1503
		ORG		00CCH
		LJUMP 	D3H 			//00CC 	38D3

		//;rfid125.c: 115: {
		//;rfid125.c: 116: timeOutVal=timerOut(0,600);
		LDWI 	58H 			//00CD 	2A58
		LCALL 	154H 			//00CE 	3154
		LCALL 	2ECH 			//00CF 	32EC

		//;rfid125.c: 117: if(timeOutVal==0) return 0;
		LCALL 	141H 			//00D0 	3141
		BTSC 	STATUS,2 		//00D1 	1503
		RETW 	0H 			//00D2 	2100

		//;rfid125.c: 118: }
		//;rfid125.c: 119: flag_RFID_last = 1;
		CLRR 	4EH 			//00D3 	014E
		ORG		00D4H
		INCR	4EH,1 			//00D4 	09CE

		//;rfid125.c: 120: RF_serial_55bits[i] <<= 1;
		LCALL 	147H 			//00D5 	3147
		LDWI 	37H 			//00D6 	2A37
		INCR	51H,1 			//00D7 	09D1
		SUBWR 	51H,0 			//00D8 	0C51
		BTSS 	STATUS,0 		//00D9 	1C03
		LJUMP 	88H 			//00DA 	3888

		//;rfid125.c: 121: }
		//;rfid125.c: 122: }
		//;rfid125.c: 123: if(55==ii)
		LDR 	51H,0 			//00DB 	0851
		ORG		00DCH
		XORWI 	37H 			//00DC 	2637
		BTSS 	STATUS,2 		//00DD 	1D03
		RETW 	0H 			//00DE 	2100

		//;rfid125.c: 124: {
		//;rfid125.c: 125: even_col = 0;
		CLRR 	4AH 			//00DF 	014A

		//;rfid125.c: 126: for(ii=0;ii<10;ii++)
		CLRR 	51H 			//00E0 	0151

		//;rfid125.c: 127: {
		//;rfid125.c: 128: even_row = (RF_serial_55bits[ii] & 0x01);
		LDR 	51H,0 			//00E1 	0851
		ADDWI 	3EH 			//00E2 	273E
		STR 	FSR 			//00E3 	0184
		ORG		00E4H
		BCR 	STATUS,7 		//00E4 	1383
		LDR 	INDF,0 			//00E5 	0800
		STR 	4BH 			//00E6 	01CB
		LDWI 	1H 			//00E7 	2A01
		ANDWR 	4BH,1 			//00E8 	02CB

		//;rfid125.c: 129: for(j=1;j<5;j++)
		CLRR 	4CH 			//00E9 	014C
		INCR	4CH,1 			//00EA 	09CC

		//;rfid125.c: 130: {
		//;rfid125.c: 131: even_row = even_row ^ ((RF_serial_55bits[ii]>>j) & 0x01);
		LDR 	51H,0 			//00EB 	0851
		ORG		00ECH
		ADDWI 	3EH 			//00EC 	273E
		STR 	FSR 			//00ED 	0184
		LDR 	INDF,0 			//00EE 	0800
		STR 	77H 			//00EF 	01F7
		INCR	4CH,0 			//00F0 	094C
		LJUMP 	F4H 			//00F1 	38F4
		BCR 	STATUS,0 		//00F2 	1003
		RRR	77H,1 			//00F3 	06F7
		ORG		00F4H
		ADDWI 	FFH 			//00F4 	27FF
		BTSS 	STATUS,2 		//00F5 	1D03
		LJUMP 	F2H 			//00F6 	38F2
		LDR 	77H,0 			//00F7 	0877
		ANDWI 	1H 			//00F8 	2401
		XORWR 	4BH,1 			//00F9 	04CB
		LDWI 	5H 			//00FA 	2A05
		INCR	4CH,1 			//00FB 	09CC
		ORG		00FCH
		SUBWR 	4CH,0 			//00FC 	0C4C
		BTSS 	STATUS,0 		//00FD 	1C03
		LJUMP 	EBH 			//00FE 	38EB

		//;rfid125.c: 132: }
		//;rfid125.c: 133: if(even_row & 0x01)
		BTSC 	4BH,0 			//00FF 	144B
		RETW 	0H 			//0100 	2100

		//;rfid125.c: 136: }
		//;rfid125.c: 138: RF_serial_55bits[ii] <<= 3;
		LDR 	51H,0 			//0101 	0851
		ADDWI 	3EH 			//0102 	273E
		STR 	FSR 			//0103 	0184
		ORG		0104H
		RLR 	INDF,1 			//0104 	0580
		RLR 	INDF,1 			//0105 	0580
		RLR 	INDF,0 			//0106 	0500
		ANDWI 	F8H 			//0107 	24F8
		STR 	INDF 			//0108 	0180

		//;rfid125.c: 140: i = RF_serial_55bits[ii];
		LDR 	51H,0 			//0109 	0851
		ADDWI 	3EH 			//010A 	273E
		STR 	FSR 			//010B 	0184
		ORG		010CH
		LDR 	INDF,0 			//010C 	0800
		STR 	4DH 			//010D 	01CD

		//;rfid125.c: 141: if( 0==ii%2 )
		BTSC 	51H,0 			//010E 	1451
		LJUMP 	11DH 			//010F 	391D

		//;rfid125.c: 142: {
		//;rfid125.c: 143: keyID[ii/2] = (i & 0xF0);
		BCR 	STATUS,0 		//0110 	1003
		RRR	51H,0 			//0111 	0651
		ADDWI 	5DH 			//0112 	275D
		STR 	FSR 			//0113 	0184
		ORG		0114H
		LDR 	4DH,0 			//0114 	084D
		STR 	INDF 			//0115 	0180
		BCR 	STATUS,0 		//0116 	1003
		RRR	51H,0 			//0117 	0651
		ADDWI 	5DH 			//0118 	275D
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
		SWAPR 	4DH,1 			//011E 	07CD
		ANDWR 	4DH,1 			//011F 	02CD

		//;rfid125.c: 148: keyID[ii/2] |= (i & 0x0F);
		BCR 	STATUS,0 		//0120 	1003
		RRR	51H,0 			//0121 	0651
		ADDWI 	5DH 			//0122 	275D
		STR 	FSR 			//0123 	0184
		ORG		0124H
		LDR 	4DH,0 			//0124 	084D
		ANDWI 	FH 			//0125 	240F
		IORWR 	INDF,1 		//0126 	0380

		//;rfid125.c: 149: }
		//;rfid125.c: 150: even_col ^= RF_serial_55bits[ii];
		LDR 	51H,0 			//0127 	0851
		ADDWI 	3EH 			//0128 	273E
		STR 	FSR 			//0129 	0184
		LDR 	INDF,0 			//012A 	0800
		XORWR 	4AH,1 			//012B 	04CA
		ORG		012CH
		LDWI 	AH 			//012C 	2A0A
		INCR	51H,1 			//012D 	09D1
		SUBWR 	51H,0 			//012E 	0C51
		BTSS 	STATUS,0 		//012F 	1C03
		LJUMP 	E1H 			//0130 	38E1

		//;rfid125.c: 151: }
		//;rfid125.c: 152: RF_serial_55bits[10] <<= 3;
		RLR 	48H,1 			//0131 	05C8
		RLR 	48H,1 			//0132 	05C8
		RLR 	48H,0 			//0133 	0548
		ORG		0134H
		ANDWI 	F8H 			//0134 	24F8
		STR 	48H 			//0135 	01C8
		LDWI 	F0H 			//0136 	2AF0

		//;rfid125.c: 153: keyID[0] =0x00;
		CLRR 	5DH 			//0137 	015D

		//;rfid125.c: 154: if(((RF_serial_55bits[10] & 0xf0)==(even_col & 0xf0)) && (0==(RF_serial
		//+                          _55bits[10]&0x08)))
		ANDWR 	4AH,0 			//0138 	024A
		STR 	77H 			//0139 	01F7
		LDR 	48H,0 			//013A 	0848
		ANDWI 	F0H 			//013B 	24F0
		ORG		013CH
		XORWR 	77H,0 			//013C 	0477
		BTSC 	STATUS,2 		//013D 	1503
		BTSC 	48H,3 			//013E 	15C8
		RETW 	0H 			//013F 	2100

		//;rfid125.c: 155: {
		//;rfid125.c: 157: return 1;
		RETW 	1H 			//0140 	2101
		LDR 	73H,0 			//0141 	0873
		STR 	50H 			//0142 	01D0
		LDR 	72H,0 			//0143 	0872
		ORG		0144H
		STR 	4FH 			//0144 	01CF
		IORWR 	50H,0 			//0145 	0350
		RET		 					//0146 	0004
		LDR 	4DH,0 			//0147 	084D
		ADDWI 	3EH 			//0148 	273E
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
		LDR 	4EH,0 			//0152 	084E
		RET		 					//0153 	0004
		ORG		0154H
		STR 	72H 			//0154 	01F2
		LDWI 	2H 			//0155 	2A02
		STR 	73H 			//0156 	01F3
		RETW 	0H 			//0157 	2100
		LDWI 	7H 			//0158 	2A07
		STR 	19H 			//0159 	0199

		//;MAIN.C: 197: unsigned char idop,tmp,idState=0;
		BCR 	STATUS,5 		//015A 	1283
		BCR 	STATUS,6 		//015B 	1303
		ORG		015CH
		CLRR 	55H 			//015C 	0155
		CLRWDT	 			//015D 	0001

		//;MAIN.C: 200: sys_init();
		LCALL 	473H 			//015E 	3473

		//;MAIN.C: 201: gpio_init();
		LCALL 	44BH 			//015F 	344B

		//;MAIN.C: 203: timer_init();
		LCALL 	47DH 			//0160 	347D

		//;MAIN.C: 204: int_init();
		LCALL 	3F8H 			//0161 	33F8

		//;MAIN.C: 210: eepromWriteByte(0x7F,0xAA);
		LDWI 	AAH 			//0162 	2AAA
		STR 	72H 			//0163 	01F2
		ORG		0164H
		LDWI 	7FH 			//0164 	2A7F
		LCALL 	2C9H 			//0165 	32C9

		//;MAIN.C: 211: eepromWriteByte(0x7F,0xAA);
		LDWI 	AAH 			//0166 	2AAA
		STR 	72H 			//0167 	01F2
		LDWI 	7FH 			//0168 	2A7F
		LCALL 	2C9H 			//0169 	32C9

		//;MAIN.C: 214: TRISC &=0xfe;
		BSR 	STATUS,5 		//016A 	1A83
		BCR 	STATUS,6 		//016B 	1303
		ORG		016CH
		BCR 	7H,0 			//016C 	1007

		//;MAIN.C: 216: SET_EPWM_ON();
		LCALL 	3B7H 			//016D 	33B7

		//;MAIN.C: 220: _delay((unsigned long)((20)*(8000000/4000.0)));
		LDWI 	34H 			//016E 	2A34
		BCR 	STATUS,5 		//016F 	1283
		STR 	53H 			//0170 	01D3
		LDWI 	F1H 			//0171 	2AF1
		STR 	52H 			//0172 	01D2
		DECRSZ 	52H,1 		//0173 	0ED2
		ORG		0174H
		LJUMP 	173H 			//0174 	3973
		DECRSZ 	53H,1 		//0175 	0ED3
		LJUMP 	173H 			//0176 	3973
		LJUMP 	178H 			//0177 	3978

		//;MAIN.C: 225: if(eepromReadByte(0x06)!=0){
		LDWI 	6H 			//0178 	2A06
		LCALL 	487H 			//0179 	3487
		XORWI 	0H 			//017A 	2600
		BTSC 	STATUS,2 		//017B 	1503
		ORG		017CH
		LJUMP 	18FH 			//017C 	398F
		LDWI 	6H 			//017D 	2A06

		//;MAIN.C: 229: eepromWriteByte(0x06,0);
		CLRR 	72H 			//017E 	0172
		LCALL 	2C9H 			//017F 	32C9
		LDWI 	7H 			//0180 	2A07

		//;MAIN.C: 230: eepromWriteByte(0x06+1,0);
		CLRR 	72H 			//0181 	0172
		LCALL 	2C9H 			//0182 	32C9

		//;MAIN.C: 231: eepromWriteByte(0x06+2,0x87);
		LDWI 	87H 			//0183 	2A87
		ORG		0184H
		STR 	72H 			//0184 	01F2
		LDWI 	8H 			//0185 	2A08
		LCALL 	2C9H 			//0186 	32C9

		//;MAIN.C: 232: eepromWriteByte(0x06+3,0x3a);
		LDWI 	3AH 			//0187 	2A3A
		STR 	72H 			//0188 	01F2
		LDWI 	9H 			//0189 	2A09
		LCALL 	2C9H 			//018A 	32C9

		//;MAIN.C: 233: eepromWriteByte(0x06+4,0xf8);
		LDWI 	F8H 			//018B 	2AF8
		ORG		018CH
		STR 	72H 			//018C 	01F2
		LDWI 	AH 			//018D 	2A0A
		LCALL 	2C9H 			//018E 	32C9

		//;MAIN.C: 235: }
		//;MAIN.C: 236: eepromReadBlock(0x06,buffTag,5*5);
		LDWI 	25H 			//018F 	2A25
		STR 	74H 			//0190 	01F4
		LDWI 	19H 			//0191 	2A19
		STR 	75H 			//0192 	01F5
		LDWI 	6H 			//0193 	2A06
		ORG		0194H
		LCALL 	40AH 			//0194 	340A

		//;MAIN.C: 238: setState(1,45);
		LDWI 	2DH 			//0195 	2A2D
		STR 	72H 			//0196 	01F2
		LDWI 	1H 			//0197 	2A01
		CLRR 	73H 			//0198 	0173
		LCALL 	468H 			//0199 	3468

		//;MAIN.C: 242: tmp=0;
		CLRR 	56H 			//019A 	0156

		//;MAIN.C: 246: idop = get_RFID();
		LCALL 	BH 			//019B 	300B
		ORG		019CH
		STR 	57H 			//019C 	01D7

		//;MAIN.C: 248: if(idop){
		LDR 	57H,0 			//019D 	0857
		BTSC 	STATUS,2 		//019E 	1503
		LJUMP 	245H 			//019F 	3A45

		//;MAIN.C: 249: idop = id_search(keyID,buffTag);
		LDWI 	25H 			//01A0 	2A25
		STR 	7AH 			//01A1 	01FA
		LDWI 	5DH 			//01A2 	2A5D
		LCALL 	385H 			//01A3 	3385
		ORG		01A4H
		STR 	57H 			//01A4 	01D7

		//;MAIN.C: 250: switch (mtState){
		LJUMP 	22CH 			//01A5 	3A2C

		//;MAIN.C: 252: case 2:
		//;MAIN.C: 253: if((idop>1) && (idop <6))
		LDWI 	2H 			//01A6 	2A02
		SUBWR 	57H,0 			//01A7 	0C57
		BTSS 	STATUS,0 		//01A8 	1C03
		LJUMP 	1B3H 			//01A9 	39B3
		LDWI 	6H 			//01AA 	2A06
		SUBWR 	57H,0 			//01AB 	0C57
		ORG		01ACH
		BTSC 	STATUS,0 		//01AC 	1403
		LJUMP 	1B3H 			//01AD 	39B3
		LDWI 	0H 			//01AE 	2A00

		//;MAIN.C: 254: {
		//;MAIN.C: 255: setState(0,0);
		CLRR 	72H 			//01AF 	0172
		CLRR 	73H 			//01B0 	0173
		LCALL 	468H 			//01B1 	3468

		//;MAIN.C: 257: }
		LJUMP 	237H 			//01B2 	3A37

		//;MAIN.C: 258: else if(idop==1)
		DECRSZ 	57H,0 		//01B3 	0E57
		ORG		01B4H
		LJUMP 	237H 			//01B4 	3A37

		//;MAIN.C: 259: {
		//;MAIN.C: 261: id_clear(2,5);
		LDWI 	5H 			//01B5 	2A05
		STR 	43H 			//01B6 	01C3
		LDWI 	2H 			//01B7 	2A02
		LCALL 	30DH 			//01B8 	330D
		LDWI 	3H 			//01B9 	2A03

		//;MAIN.C: 262: setState(3,0);
		CLRR 	72H 			//01BA 	0172
		CLRR 	73H 			//01BB 	0173
		ORG		01BCH
		LCALL 	468H 			//01BC 	3468
		LDWI 	3H 			//01BD 	2A03

		//;MAIN.C: 263: tmp=1;
		CLRR 	56H 			//01BE 	0156
		INCR	56H,1 			//01BF 	09D6

		//;MAIN.C: 265: beep2(0,3);
		STR 	75H 			//01C0 	01F5
		LDWI 	0H 			//01C1 	2A00
		LCALL 	3CFH 			//01C2 	33CF
		LJUMP 	237H 			//01C3 	3A37
		ORG		01C4H

		//;MAIN.C: 276: if(idop==1 && idState == 0){
		DECRSZ 	57H,0 		//01C4 	0E57
		LJUMP 	1D8H 			//01C5 	39D8
		LDR 	55H,1 			//01C6 	08D5
		BTSS 	STATUS,2 		//01C7 	1D03
		LJUMP 	1D8H 			//01C8 	39D8

		//;MAIN.C: 278: id_clear(2,5);
		LDWI 	5H 			//01C9 	2A05
		STR 	43H 			//01CA 	01C3
		LDWI 	2H 			//01CB 	2A02
		ORG		01CCH
		LCALL 	30DH 			//01CC 	330D
		LDWI 	3H 			//01CD 	2A03

		//;MAIN.C: 279: setState(3,0);
		CLRR 	72H 			//01CE 	0172
		CLRR 	73H 			//01CF 	0173
		LCALL 	468H 			//01D0 	3468
		LDWI 	3H 			//01D1 	2A03

		//;MAIN.C: 280: tmp=1;
		CLRR 	56H 			//01D2 	0156
		INCR	56H,1 			//01D3 	09D6
		ORG		01D4H

		//;MAIN.C: 282: beep2(0,3);
		STR 	75H 			//01D4 	01F5
		LDWI 	0H 			//01D5 	2A00
		LCALL 	3CFH 			//01D6 	33CF

		//;MAIN.C: 283: }
		LJUMP 	237H 			//01D7 	3A37

		//;MAIN.C: 284: else if(idop==2 && idState == 0){
		LDR 	57H,0 			//01D8 	0857
		XORWI 	2H 			//01D9 	2602
		BTSS 	STATUS,2 		//01DA 	1D03
		LJUMP 	237H 			//01DB 	3A37
		ORG		01DCH
		LDR 	55H,1 			//01DC 	08D5
		BTSS 	STATUS,2 		//01DD 	1D03
		LJUMP 	237H 			//01DE 	3A37

		//;MAIN.C: 286: id_clear(3,5);
		LDWI 	5H 			//01DF 	2A05
		STR 	43H 			//01E0 	01C3
		LDWI 	3H 			//01E1 	2A03
		LCALL 	30DH 			//01E2 	330D
		LDWI 	5H 			//01E3 	2A05
		ORG		01E4H

		//;MAIN.C: 287: setState(5,0);
		CLRR 	72H 			//01E4 	0172
		CLRR 	73H 			//01E5 	0173
		LCALL 	468H 			//01E6 	3468

		//;MAIN.C: 288: tmp=2;
		LDWI 	2H 			//01E7 	2A02
		STR 	56H 			//01E8 	01D6

		//;MAIN.C: 290: beep2(1,2);
		STR 	75H 			//01E9 	01F5
		LDWI 	1H 			//01EA 	2A01
		LCALL 	3CFH 			//01EB 	33CF
		ORG		01ECH
		LJUMP 	237H 			//01EC 	3A37

		//;MAIN.C: 295: if (idState == 0){
		LDR 	55H,1 			//01ED 	08D5
		BTSS 	STATUS,2 		//01EE 	1D03
		LJUMP 	207H 			//01EF 	3A07

		//;MAIN.C: 302: if( idop !=1){
		DECR 	57H,0 			//01F0 	0D57
		BTSC 	STATUS,2 		//01F1 	1503
		LJUMP 	237H 			//01F2 	3A37
		LDWI 	6H 			//01F3 	2A06
		ORG		01F4H

		//;MAIN.C: 303: tmp++;
		INCR	56H,1 			//01F4 	09D6

		//;MAIN.C: 305: if(tmp <=5){
		SUBWR 	56H,0 			//01F5 	0C56
		BTSC 	STATUS,0 		//01F6 	1403
		LJUMP 	237H 			//01F7 	3A37

		//;MAIN.C: 306: id_replate(tmp,keyID,buffTag);
		LDWI 	5DH 			//01F8 	2A5D
		STR 	3EH 			//01F9 	01BE
		LDWI 	25H 			//01FA 	2A25
		STR 	3FH 			//01FB 	01BF
		ORG		01FCH
		LDR 	56H,0 			//01FC 	0856
		LCALL 	28EH 			//01FD 	328E
		LDWI 	2H 			//01FE 	2A02

		//;MAIN.C: 307: timeTick=0;
		BCR 	STATUS,5 		//01FF 	1283
		BCR 	STATUS,6 		//0200 	1303
		CLRR 	5AH 			//0201 	015A
		CLRR 	5BH 			//0202 	015B

		//;MAIN.C: 309: beep2(1,2);
		STR 	75H 			//0203 	01F5
		ORG		0204H
		LDWI 	1H 			//0204 	2A01
		LCALL 	3CFH 			//0205 	33CF
		LJUMP 	237H 			//0206 	3A37
		LDWI 	0H 			//0207 	2A00

		//;MAIN.C: 316: beep2(0,1);
		CLRR 	75H 			//0208 	0175
		INCR	75H,1 			//0209 	09F5
		LCALL 	3CFH 			//020A 	33CF
		LJUMP 	237H 			//020B 	3A37
		ORG		020CH

		//;MAIN.C: 321: if(idState == 0){
		LDR 	55H,1 			//020C 	08D5
		BTSS 	STATUS,2 		//020D 	1D03
		LJUMP 	227H 			//020E 	3A27

		//;MAIN.C: 322: if( idop >2){
		LDWI 	3H 			//020F 	2A03
		SUBWR 	57H,0 			//0210 	0C57
		BTSS 	STATUS,0 		//0211 	1C03
		LJUMP 	237H 			//0212 	3A37
		LDWI 	6H 			//0213 	2A06
		ORG		0214H

		//;MAIN.C: 323: tmp++;
		INCR	56H,1 			//0214 	09D6

		//;MAIN.C: 325: if(tmp <=5){
		SUBWR 	56H,0 			//0215 	0C56
		BTSC 	STATUS,0 		//0216 	1403
		LJUMP 	237H 			//0217 	3A37

		//;MAIN.C: 326: id_replate(tmp,keyID,buffTag);
		LDWI 	5DH 			//0218 	2A5D
		STR 	3EH 			//0219 	01BE
		LDWI 	25H 			//021A 	2A25
		STR 	3FH 			//021B 	01BF
		ORG		021CH
		LDR 	56H,0 			//021C 	0856
		LCALL 	28EH 			//021D 	328E
		LDWI 	2H 			//021E 	2A02

		//;MAIN.C: 327: timeTick=0;
		BCR 	STATUS,5 		//021F 	1283
		BCR 	STATUS,6 		//0220 	1303
		CLRR 	5AH 			//0221 	015A
		CLRR 	5BH 			//0222 	015B

		//;MAIN.C: 329: beep2(1,2);
		STR 	75H 			//0223 	01F5
		ORG		0224H
		LDWI 	1H 			//0224 	2A01
		LCALL 	3CFH 			//0225 	33CF
		LJUMP 	237H 			//0226 	3A37
		LDWI 	0H 			//0227 	2A00

		//;MAIN.C: 336: beep2(0,1);
		CLRR 	75H 			//0228 	0175
		INCR	75H,1 			//0229 	09F5
		LCALL 	3CFH 			//022A 	33CF
		LJUMP 	237H 			//022B 	3A37
		ORG		022CH
		LDR 	5CH,0 			//022C 	085C
		STR 	FSR 			//022D 	0184
		LDWI 	7H 			//022E 	2A07
		SUBWR 	FSR,0 			//022F 	0C04
		BTSC 	STATUS,0 		//0230 	1403
		LJUMP 	237H 			//0231 	3A37
		LDWI 	4H 			//0232 	2A04
		STR 	PCLATH 			//0233 	018A
		ORG		0234H
		LDWI 	90H 			//0234 	2A90
		ADDWR 	FSR,0 			//0235 	0B04
		STR 	PCL 			//0236 	0182
		LDWI 	9FH 			//0237 	2A9F

		//;MAIN.C: 342: idState = 1;
		BCR 	STATUS,5 		//0238 	1283
		BCR 	STATUS,6 		//0239 	1303
		CLRR 	55H 			//023A 	0155
		INCR	55H,1 			//023B 	09D5
		ORG		023CH

		//;MAIN.C: 343: _delay((unsigned long)((61)*(8000000/4000.0)));
		STR 	53H 			//023C 	01D3
		LDWI 	6FH 			//023D 	2A6F
		STR 	52H 			//023E 	01D2
		DECRSZ 	52H,1 		//023F 	0ED2
		LJUMP 	23FH 			//0240 	3A3F
		DECRSZ 	53H,1 		//0241 	0ED3
		LJUMP 	23FH 			//0242 	3A3F
		LJUMP 	244H 			//0243 	3A44
		ORG		0244H

		//;MAIN.C: 344: }
		LJUMP 	252H 			//0244 	3A52
		LDWI 	2H 			//0245 	2A02

		//;MAIN.C: 345: else{
		//;MAIN.C: 346: idState =0;
		CLRR 	55H 			//0246 	0155

		//;MAIN.C: 347: _delay((unsigned long)((150)*(8000000/4000.0)));
		STR 	54H 			//0247 	01D4
		LDWI 	86H 			//0248 	2A86
		STR 	53H 			//0249 	01D3
		LDWI 	99H 			//024A 	2A99
		STR 	52H 			//024B 	01D2
		ORG		024CH
		DECRSZ 	52H,1 		//024C 	0ED2
		LJUMP 	24CH 			//024D 	3A4C
		DECRSZ 	53H,1 		//024E 	0ED3
		LJUMP 	24CH 			//024F 	3A4C
		DECRSZ 	54H,1 		//0250 	0ED4
		LJUMP 	24CH 			//0251 	3A4C

		//;MAIN.C: 348: }
		//;MAIN.C: 352: if((timeOut!=0)&&( timeTick > timeOut)){
		BCR 	STATUS,5 		//0252 	1283
		BCR 	STATUS,6 		//0253 	1303
		ORG		0254H
		LDR 	59H,0 			//0254 	0859
		IORWR 	58H,0 			//0255 	0358
		BTSC 	STATUS,2 		//0256 	1503
		LJUMP 	27DH 			//0257 	3A7D
		LDR 	5BH,0 			//0258 	085B
		SUBWR 	59H,0 			//0259 	0C59
		BTSS 	STATUS,2 		//025A 	1D03
		LJUMP 	25EH 			//025B 	3A5E
		ORG		025CH
		LDR 	5AH,0 			//025C 	085A
		SUBWR 	58H,0 			//025D 	0C58
		BTSS 	STATUS,0 		//025E 	1C03
		LJUMP 	272H 			//025F 	3A72
		LJUMP 	27DH 			//0260 	3A7D

		//;MAIN.C: 357: setState(2,220);
		LDWI 	DCH 			//0261 	2ADC
		STR 	72H 			//0262 	01F2
		LDWI 	2H 			//0263 	2A02
		ORG		0264H
		CLRR 	73H 			//0264 	0173
		LCALL 	468H 			//0265 	3468

		//;MAIN.C: 359: break;
		LJUMP 	27DH 			//0266 	3A7D

		//;MAIN.C: 361: setState(6,35);
		LDWI 	23H 			//0267 	2A23
		STR 	72H 			//0268 	01F2
		LDWI 	6H 			//0269 	2A06
		CLRR 	73H 			//026A 	0173
		LCALL 	468H 			//026B 	3468
		ORG		026CH

		//;MAIN.C: 362: break;
		LJUMP 	27DH 			//026C 	3A7D
		LDWI 	2H 			//026D 	2A02

		//;MAIN.C: 364: setState(2,0);
		CLRR 	72H 			//026E 	0172
		CLRR 	73H 			//026F 	0173
		LCALL 	468H 			//0270 	3468

		//;MAIN.C: 367: break;
		LJUMP 	27DH 			//0271 	3A7D
		LDR 	5CH,0 			//0272 	085C
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

		//;MAIN.C: 370: }
		//;MAIN.C: 373: if(mtState==0) RA3 = 1;
		LDR 	5CH,1 			//027D 	08DC
		BTSS 	STATUS,2 		//027E 	1D03
		LJUMP 	282H 			//027F 	3A82
		BSR 	5H,3 			//0280 	1985
		LJUMP 	283H 			//0281 	3A83

		//;MAIN.C: 374: else RA3 =0;
		BCR 	5H,3 			//0282 	1185

		//;MAIN.C: 382: if(mtState == 2) {
		LDR 	5CH,0 			//0283 	085C
		ORG		0284H
		XORWI 	2H 			//0284 	2602
		BTSS 	STATUS,2 		//0285 	1D03
		LJUMP 	289H 			//0286 	3A89

		//;MAIN.C: 384: RC0 =1;
		BSR 	7H,0 			//0287 	1807

		//;MAIN.C: 385: }else{
		LJUMP 	28AH 			//0288 	3A8A

		//;MAIN.C: 386: RC0 =0;
		BCR 	7H,0 			//0289 	1007

		//;MAIN.C: 387: };
		//;MAIN.C: 403: timeTick++;
		INCR	5AH,1 			//028A 	09DA
		BTSC 	STATUS,2 		//028B 	1503
		ORG		028CH
		INCR	5BH,1 			//028C 	09DB
		LJUMP 	19BH 			//028D 	399B
		STR 	42H 			//028E 	01C2

		//;MAIN.C: 161: id=(id-1)*5;
		LDWI 	5H 			//028F 	2A05
		STR 	72H 			//0290 	01F2
		LDR 	42H,0 			//0291 	0842
		ADDWI 	FFH 			//0292 	27FF
		LCALL 	45AH 			//0293 	345A
		ORG		0294H
		STR 	42H 			//0294 	01C2

		//;MAIN.C: 162: {
		//;MAIN.C: 163: {
		//;MAIN.C: 164: *(buff+id) = *Cont;
		LDR 	3EH,0 			//0295 	083E
		STR 	FSR 			//0296 	0184
		BCR 	STATUS,7 		//0297 	1383
		LDR 	INDF,0 			//0298 	0800
		STR 	40H 			//0299 	01C0
		LDR 	42H,0 			//029A 	0842
		ADDWR 	3FH,0 			//029B 	0B3F
		ORG		029CH
		STR 	41H 			//029C 	01C1
		STR 	FSR 			//029D 	0184
		LDR 	40H,0 			//029E 	0840
		STR 	INDF 			//029F 	0180

		//;MAIN.C: 165: *(buff+1+id) = *(Cont+1);
		LDR 	3EH,0 			//02A0 	083E
		ADDWI 	1H 			//02A1 	2701
		LCALL 	2C2H 			//02A2 	32C2
		ADDWI 	1H 			//02A3 	2701
		ORG		02A4H
		STR 	FSR 			//02A4 	0184
		LDR 	40H,0 			//02A5 	0840
		STR 	INDF 			//02A6 	0180

		//;MAIN.C: 166: *(buff+2+id) = *(Cont+2);
		LDR 	3EH,0 			//02A7 	083E
		ADDWI 	2H 			//02A8 	2702
		LCALL 	2C2H 			//02A9 	32C2
		ADDWI 	2H 			//02AA 	2702
		STR 	FSR 			//02AB 	0184
		ORG		02ACH
		LDR 	40H,0 			//02AC 	0840
		STR 	INDF 			//02AD 	0180

		//;MAIN.C: 167: *(buff+3+id) = *(Cont+3);
		LDR 	3EH,0 			//02AE 	083E
		ADDWI 	3H 			//02AF 	2703
		LCALL 	2C2H 			//02B0 	32C2
		ADDWI 	3H 			//02B1 	2703
		STR 	FSR 			//02B2 	0184
		LDR 	40H,0 			//02B3 	0840
		ORG		02B4H
		STR 	INDF 			//02B4 	0180

		//;MAIN.C: 168: *(buff+4+id) = *(Cont+4);
		LDR 	3EH,0 			//02B5 	083E
		ADDWI 	4H 			//02B6 	2704
		LCALL 	2C2H 			//02B7 	32C2
		ADDWI 	4H 			//02B8 	2704
		STR 	FSR 			//02B9 	0184
		LDR 	40H,0 			//02BA 	0840
		STR 	INDF 			//02BB 	0180
		ORG		02BCH

		//;MAIN.C: 169: }
		//;MAIN.C: 170: }
		//;MAIN.C: 172: eepromWriteBlock(0x06,buffTag,25);
		LDWI 	25H 			//02BC 	2A25
		STR 	76H 			//02BD 	01F6
		LDWI 	19H 			//02BE 	2A19
		STR 	77H 			//02BF 	01F7
		LDWI 	6H 			//02C0 	2A06
		LJUMP 	3E6H 			//02C1 	3BE6
		STR 	FSR 			//02C2 	0184
		LDR 	INDF,0 			//02C3 	0800
		ORG		02C4H
		STR 	40H 			//02C4 	01C0
		LDR 	42H,0 			//02C5 	0842
		ADDWR 	3FH,0 			//02C6 	0B3F
		STR 	41H 			//02C7 	01C1
		RET		 					//02C8 	0004
		STR 	75H 			//02C9 	01F5

		//;ms82_eeprom.c: 27: GIE = 0;
		BCR 	INTCON,7 		//02CA 	138B

		//;ms82_eeprom.c: 29: {
		//;ms82_eeprom.c: 30: while(GIE) asm("clrwdt");
		BTSS 	INTCON,7 		//02CB 	1F8B
		ORG		02CCH
		LJUMP 	2CFH 			//02CC 	3ACF
		CLRWDT	 			//02CD 	0001
		LJUMP 	2CBH 			//02CE 	3ACB

		//;ms82_eeprom.c: 31: EEADR = EEAddr;
		LDR 	75H,0 			//02CF 	0875
		BSR 	STATUS,5 		//02D0 	1A83
		BCR 	STATUS,6 		//02D1 	1303
		STR 	1BH 			//02D2 	019B

		//;ms82_eeprom.c: 32: EEDAT = EEData;
		LDR 	72H,0 			//02D3 	0872
		ORG		02D4H
		STR 	1AH 			//02D4 	019A
		LDWI 	34H 			//02D5 	2A34

		//;ms82_eeprom.c: 33: EEIF = 0;
		BCR 	STATUS,5 		//02D6 	1283
		BCR 	CH,7 			//02D7 	138C

		//;ms82_eeprom.c: 34: EECON1 = 0x34;
		BSR 	STATUS,5 		//02D8 	1A83
		STR 	1CH 			//02D9 	019C

		//;ms82_eeprom.c: 35: WR = 1;
		BSR 	1DH,0 			//02DA 	181D

		//;ms82_eeprom.c: 36: while(WR) asm("clrwdt");
		BSR 	STATUS,5 		//02DB 	1A83
		ORG		02DCH
		BCR 	STATUS,6 		//02DC 	1303
		BTSS 	1DH,0 			//02DD 	1C1D
		LJUMP 	2E1H 			//02DE 	3AE1
		CLRWDT	 			//02DF 	0001
		LJUMP 	2DBH 			//02E0 	3ADB

		//;ms82_eeprom.c: 37: _delay((unsigned long)((2)*(8000000/4000.0)));
		LDWI 	6H 			//02E1 	2A06
		STR 	74H 			//02E2 	01F4
		LDWI 	30H 			//02E3 	2A30
		ORG		02E4H
		STR 	73H 			//02E4 	01F3
		DECRSZ 	73H,1 		//02E5 	0EF3
		LJUMP 	2E5H 			//02E6 	3AE5
		DECRSZ 	74H,1 		//02E7 	0EF4
		LJUMP 	2E5H 			//02E8 	3AE5
		CLRWDT	 			//02E9 	0001

		//;ms82_eeprom.c: 38: }
		//;ms82_eeprom.c: 39: GIE = 1;
		BSR 	INTCON,7 		//02EA 	1B8B
		RET		 					//02EB 	0004
		ORG		02ECH
		STR 	74H 			//02EC 	01F4

		//;rfid125.c: 7: unsigned int CurTimer;
		//;rfid125.c: 8: TMR1ON = 0;
		BCR 	10H,0 			//02ED 	1010

		//;rfid125.c: 9: TMR1H = 0;
		CLRR 	FH 			//02EE 	010F

		//;rfid125.c: 10: TMR1L = 0;
		CLRR 	EH 			//02EF 	010E

		//;rfid125.c: 11: TMR1IF = 0;
		BCR 	CH,0 			//02F0 	100C

		//;rfid125.c: 12: TMR1ON = 1;
		BSR 	10H,0 			//02F1 	1810

		//;rfid125.c: 13: while(RA4==Logic){
		LDWI 	0H 			//02F2 	2A00
		BTSC 	5H,4 			//02F3 	1605
		ORG		02F4H
		LDWI 	1H 			//02F4 	2A01
		XORWR 	74H,0 			//02F5 	0474
		BTSS 	STATUS,2 		//02F6 	1D03
		LJUMP 	308H 			//02F7 	3B08

		//;rfid125.c: 14: CurTimer= (TMR1H <<8 )| TMR1L;
		LDR 	FH,0 			//02F8 	080F
		STR 	76H 			//02F9 	01F6
		CLRR 	75H 			//02FA 	0175
		LDR 	EH,0 			//02FB 	080E
		ORG		02FCH
		IORWR 	75H,1 			//02FC 	03F5

		//;rfid125.c: 15: if(CurTimer>time)
		LDR 	76H,0 			//02FD 	0876
		SUBWR 	73H,0 			//02FE 	0C73
		BTSS 	STATUS,2 		//02FF 	1D03
		LJUMP 	303H 			//0300 	3B03
		LDR 	75H,0 			//0301 	0875
		SUBWR 	72H,0 			//0302 	0C72
		BTSC 	STATUS,0 		//0303 	1403
		ORG		0304H
		LJUMP 	2F2H 			//0304 	3AF2

		//;rfid125.c: 16: return 0;
		CLRR 	72H 			//0305 	0172
		CLRR 	73H 			//0306 	0173
		RET		 					//0307 	0004

		//;rfid125.c: 17: }
		//;rfid125.c: 18: return CurTimer;
		LDR 	76H,0 			//0308 	0876
		STR 	73H 			//0309 	01F3
		LDR 	75H,0 			//030A 	0875
		STR 	72H 			//030B 	01F2
		ORG		030CH
		RET		 					//030C 	0004
		STR 	49H 			//030D 	01C9

		//;MAIN.C: 175: unsigned char tmp[5]={0xff,0xff,0xff,0xff,0xff};
		LDWI 	44H 			//030E 	2A44
		STR 	FSR 			//030F 	0184
		LDR 	20H,0 			//0310 	0820
		BCR 	STATUS,7 		//0311 	1383
		STR 	INDF 			//0312 	0180
		INCR	FSR,1 			//0313 	0984
		ORG		0314H
		LDR 	21H,0 			//0314 	0821
		STR 	INDF 			//0315 	0180
		INCR	FSR,1 			//0316 	0984
		LDR 	22H,0 			//0317 	0822
		STR 	INDF 			//0318 	0180
		INCR	FSR,1 			//0319 	0984
		LDR 	23H,0 			//031A 	0823
		STR 	INDF 			//031B 	0180
		ORG		031CH
		INCR	FSR,1 			//031C 	0984
		LDR 	24H,0 			//031D 	0824
		STR 	INDF 			//031E 	0180
		LDR 	49H,0 			//031F 	0849
		SUBWR 	43H,0 			//0320 	0C43
		BTSS 	STATUS,0 		//0321 	1C03
		RET		 					//0322 	0004

		//;MAIN.C: 177: id_replate(idMin,tmp,buffTag);
		LDWI 	44H 			//0323 	2A44
		ORG		0324H
		STR 	3EH 			//0324 	01BE
		LDWI 	25H 			//0325 	2A25
		STR 	3FH 			//0326 	01BF
		LDR 	49H,0 			//0327 	0849
		LCALL 	28EH 			//0328 	328E
		BCR 	STATUS,5 		//0329 	1283
		BCR 	STATUS,6 		//032A 	1303
		INCR	49H,1 			//032B 	09C9
		ORG		032CH
		LJUMP 	31FH 			//032C 	3B1F
		STR 	78H 			//032D 	01F8

		//;ms82_eeprom.c: 53: unsigned char i;
		//;ms82_eeprom.c: 55: if(len1!=len2)
		LDR 	73H,0 			//032E 	0873
		XORWR 	74H,0 			//032F 	0474
		BTSS 	STATUS,2 		//0330 	1D03

		//;ms82_eeprom.c: 56: return 0;
		RETW 	0H 			//0331 	2100

		//;ms82_eeprom.c: 57: else{
		//;ms82_eeprom.c: 58: for(i=0;i<len1;i++){
		CLRR 	79H 			//0332 	0179
		LDR 	73H,0 			//0333 	0873
		ORG		0334H
		SUBWR 	79H,0 			//0334 	0C79

		//;ms82_eeprom.c: 59: if(*(arr1+i) != *(arr2+i)){
		LDR 	79H,0 			//0335 	0879
		BTSC 	STATUS,0 		//0336 	1403
		LJUMP 	348H 			//0337 	3B48
		ADDWR 	72H,0 			//0338 	0B72
		STR 	75H 			//0339 	01F5
		STR 	FSR 			//033A 	0184
		BCR 	STATUS,7 		//033B 	1383
		ORG		033CH
		LDR 	INDF,0 			//033C 	0800
		STR 	76H 			//033D 	01F6
		LDR 	79H,0 			//033E 	0879
		ADDWR 	78H,0 			//033F 	0B78
		STR 	77H 			//0340 	01F7
		STR 	FSR 			//0341 	0184
		LDR 	INDF,0 			//0342 	0800
		XORWR 	76H,0 			//0343 	0476
		ORG		0344H
		BTSS 	STATUS,2 		//0344 	1D03
		RETW 	0H 			//0345 	2100
		INCR	79H,1 			//0346 	09F9
		LJUMP 	333H 			//0347 	3B33

		//;ms82_eeprom.c: 61: }
		//;ms82_eeprom.c: 62: }
		//;ms82_eeprom.c: 63: if(i==len1)
		XORWR 	73H,0 			//0348 	0473
		BTSC 	STATUS,2 		//0349 	1503

		//;ms82_eeprom.c: 64: return 1;
		RETW 	1H 			//034A 	2101
		RETW 	0H 			//034B 	2100
		ORG		034CH
		RETW 	FFH 			//034C 	21FF
		RETW 	FFH 			//034D 	21FF
		RETW 	FFH 			//034E 	21FF
		RETW 	FFH 			//034F 	21FF
		RETW 	FFH 			//0350 	21FF
		RETW 	0H 			//0351 	2100
		RETW 	0H 			//0352 	2100
		RETW 	11H 			//0353 	2111
		ORG		0354H
		RETW 	BH 			//0354 	210B
		RETW 	4FH 			//0355 	214F
		RETW 	0H 			//0356 	2100
		RETW 	0H 			//0357 	2100
		RETW 	81H 			//0358 	2181
		RETW 	2FH 			//0359 	212F
		RETW 	22H 			//035A 	2122
		RETW 	0H 			//035B 	2100
		ORG		035CH
		RETW 	0H 			//035C 	2100
		RETW 	7DH 			//035D 	217D
		RETW 	67H 			//035E 	2167
		RETW 	5H 			//035F 	2105
		RETW 	0H 			//0360 	2100
		RETW 	0H 			//0361 	2100
		RETW 	7EH 			//0362 	217E
		RETW 	31H 			//0363 	2131
		ORG		0364H
		RETW 	E7H 			//0364 	21E7
		RETW 	0H 			//0365 	2100
		RETW 	0H 			//0366 	2100
		RETW 	7EH 			//0367 	217E
		RETW 	51H 			//0368 	2151
		RETW 	E6H 			//0369 	21E6
		STR 	73H 			//036A 	01F3
		CLRR 	75H 			//036B 	0175
		ORG		036CH
		LDR 	72H,0 			//036C 	0872
		BTSC 	STATUS,2 		//036D 	1503
		LJUMP 	383H 			//036E 	3B83
		CLRR 	74H 			//036F 	0174
		INCR	74H,1 			//0370 	09F4
		BTSC 	72H,7 			//0371 	17F2
		LJUMP 	376H 			//0372 	3B76
		BCR 	STATUS,0 		//0373 	1003
		ORG		0374H
		RLR 	72H,1 			//0374 	05F2
		LJUMP 	370H 			//0375 	3B70
		BCR 	STATUS,0 		//0376 	1003
		RLR 	75H,1 			//0377 	05F5
		LDR 	72H,0 			//0378 	0872
		SUBWR 	73H,0 			//0379 	0C73
		BTSS 	STATUS,0 		//037A 	1C03
		LJUMP 	380H 			//037B 	3B80
		ORG		037CH
		LDR 	72H,0 			//037C 	0872
		SUBWR 	73H,1 			//037D 	0CF3
		BSR 	75H,0 			//037E 	1875
		BCR 	STATUS,0 		//037F 	1003
		RRR	72H,1 			//0380 	06F2
		DECRSZ 	74H,1 		//0381 	0EF4
		LJUMP 	376H 			//0382 	3B76
		LDR 	75H,0 			//0383 	0875
		ORG		0384H
		RET		 					//0384 	0004
		STR 	3FH 			//0385 	01BF

		//;MAIN.C: 153: unsigned char i;
		//;MAIN.C: 154: for(i=0;i<21;i+=5){
		CLRR 	40H 			//0386 	0140

		//;MAIN.C: 155: if(comArr(id_input,buff+i,5,5))
		LDR 	40H,0 			//0387 	0840
		ADDWR 	7AH,0 			//0388 	0B7A
		STR 	72H 			//0389 	01F2
		LDWI 	5H 			//038A 	2A05
		STR 	73H 			//038B 	01F3
		ORG		038CH
		STR 	74H 			//038C 	01F4
		LDR 	3FH,0 			//038D 	083F
		LCALL 	32DH 			//038E 	332D
		XORWI 	0H 			//038F 	2600

		//;MAIN.C: 156: return i/5 +1;
		LDWI 	5H 			//0390 	2A05
		BTSC 	STATUS,2 		//0391 	1503
		LJUMP 	399H 			//0392 	3B99
		STR 	72H 			//0393 	01F2
		ORG		0394H
		LDR 	40H,0 			//0394 	0840
		LCALL 	36AH 			//0395 	336A
		STR 	3EH 			//0396 	01BE
		INCR	3EH,0 			//0397 	093E
		RET		 					//0398 	0004
		ADDWR 	40H,1 			//0399 	0BC0
		LDWI 	15H 			//039A 	2A15
		SUBWR 	40H,0 			//039B 	0C40
		ORG		039CH
		BTSC 	STATUS,0 		//039C 	1403

		//;MAIN.C: 157: }
		//;MAIN.C: 158: return 255;
		RETW 	FFH 			//039D 	21FF
		LJUMP 	387H 			//039E 	3B87
		LDWI 	3EH 			//039F 	2A3E
		CLRR 	58H 			//03A0 	0158
		CLRR 	59H 			//03A1 	0159
		CLRR 	5AH 			//03A2 	015A
		CLRR 	5BH 			//03A3 	015B
		ORG		03A4H
		CLRR 	5CH 			//03A4 	015C
		CLRR 	5DH 			//03A5 	015D
		CLRR 	5EH 			//03A6 	015E
		CLRR 	5FH 			//03A7 	015F
		CLRR 	60H 			//03A8 	0160
		CLRR 	61H 			//03A9 	0161
		BCR 	STATUS,7 		//03AA 	1383
		STR 	7DH 			//03AB 	01FD
		ORG		03ACH
		LDWI 	3H 			//03AC 	2A03
		STR 	7EH 			//03AD 	01FE
		LDWI 	4CH 			//03AE 	2A4C
		STR 	7FH 			//03AF 	01FF
		LDWI 	20H 			//03B0 	2A20
		STR 	FSR 			//03B1 	0184
		LCALL 	440H 			//03B2 	3440
		LDWI 	CH 			//03B3 	2A0C
		ORG		03B4H
		STR 	7BH 			//03B4 	01FB
		CLRR 	STATUS 			//03B5 	0103
		LJUMP 	158H 			//03B6 	3958

		//;ms82_pwm.c: 12: TRISC |= 0b00000100;
		BSR 	7H,2 			//03B7 	1907

		//;ms82_pwm.c: 13: PR2 = 15;
		LDWI 	FH 			//03B8 	2A0F
		STR 	12H 			//03B9 	0192

		//;ms82_pwm.c: 14: EPWMR1L =0;
		BCR 	STATUS,5 		//03BA 	1283
		CLRR 	13H 			//03BB 	0113
		ORG		03BCH

		//;ms82_pwm.c: 15: EPWM1CON = 0b10011100;
		LDWI 	9CH 			//03BC 	2A9C
		STR 	15H 			//03BD 	0195

		//;ms82_pwm.c: 16: TMR2 = 0;
		CLRR 	11H 			//03BE 	0111
		LDWI 	4H 			//03BF 	2A04

		//;ms82_pwm.c: 17: TMR2IF = 0;
		BCR 	CH,1 			//03C0 	108C

		//;ms82_pwm.c: 18: T2CON = 0B00000100;
		STR 	12H 			//03C1 	0192

		//;ms82_pwm.c: 19: while(TMR2IF==1) asm("clrwdt");
		BCR 	STATUS,5 		//03C2 	1283
		BCR 	STATUS,6 		//03C3 	1303
		ORG		03C4H
		BTSS 	CH,1 			//03C4 	1C8C
		LJUMP 	3C8H 			//03C5 	3BC8
		CLRWDT	 			//03C6 	0001
		LJUMP 	3C2H 			//03C7 	3BC2

		//;ms82_pwm.c: 20: PWM1CON = 0b00010000;
		LDWI 	10H 			//03C8 	2A10
		STR 	16H 			//03C9 	0196

		//;ms82_pwm.c: 21: EPWM1AUX = 0b10001000;
		LDWI 	88H 			//03CA 	2A88
		BSR 	STATUS,5 		//03CB 	1A83
		ORG		03CCH
		STR 	10H 			//03CC 	0190

		//;ms82_pwm.c: 22: TRISC &= 0b11111011;
		BCR 	7H,2 			//03CD 	1107
		RET		 					//03CE 	0004
		STR 	76H 			//03CF 	01F6

		//;MAIN.C: 181: while(rep--){
		DECR 	75H,1 			//03D0 	0DF5
		LDR 	75H,0 			//03D1 	0875
		XORWI 	FFH 			//03D2 	26FF
		BTSC 	STATUS,2 		//03D3 	1503
		ORG		03D4H
		RET		 					//03D4 	0004

		//;MAIN.C: 182: RC0 =1;if(sel)RA3 = 1;
		BCR 	STATUS,5 		//03D5 	1283
		BCR 	STATUS,6 		//03D6 	1303
		BSR 	7H,0 			//03D7 	1807
		LDR 	76H,0 			//03D8 	0876
		BTSS 	STATUS,2 		//03D9 	1D03
		BSR 	5H,3 			//03DA 	1985

		//;MAIN.C: 183: delay_x10ms(20);
		LDWI 	14H 			//03DB 	2A14
		ORG		03DCH
		LCALL 	42CH 			//03DC 	342C

		//;MAIN.C: 184: RC0 =0;if(sel)RA3 = 0;
		BCR 	STATUS,5 		//03DD 	1283
		BCR 	STATUS,6 		//03DE 	1303
		BCR 	7H,0 			//03DF 	1007
		LDR 	76H,0 			//03E0 	0876
		BTSS 	STATUS,2 		//03E1 	1D03
		BCR 	5H,3 			//03E2 	1185

		//;MAIN.C: 185: delay_x10ms(20);
		LDWI 	14H 			//03E3 	2A14
		ORG		03E4H
		LCALL 	42CH 			//03E4 	342C
		LJUMP 	3D0H 			//03E5 	3BD0
		STR 	79H 			//03E6 	01F9

		//;ms82_eeprom.c: 44: unsigned char i;
		//;ms82_eeprom.c: 45: for(i=0;i<len;i++){
		CLRR 	7AH 			//03E7 	017A
		LDR 	77H,0 			//03E8 	0877
		SUBWR 	7AH,0 			//03E9 	0C7A
		BTSC 	STATUS,0 		//03EA 	1403
		RET		 					//03EB 	0004
		ORG		03ECH

		//;ms82_eeprom.c: 46: eepromWriteByte(addStart+i,buff[i]);
		LDR 	7AH,0 			//03EC 	087A
		ADDWR 	76H,0 			//03ED 	0B76
		STR 	78H 			//03EE 	01F8
		STR 	FSR 			//03EF 	0184
		BCR 	STATUS,7 		//03F0 	1383
		LDR 	INDF,0 			//03F1 	0800
		STR 	72H 			//03F2 	01F2
		LDR 	7AH,0 			//03F3 	087A
		ORG		03F4H
		ADDWR 	79H,0 			//03F4 	0B79
		LCALL 	2C9H 			//03F5 	32C9
		INCR	7AH,1 			//03F6 	09FA
		LJUMP 	3E8H 			//03F7 	3BE8

		//;sysinit.c: 71: INTCON = 0B00000000;
		CLRR 	INTCON 			//03F8 	010B

		//;sysinit.c: 72: PIE1 = 0B00000000;
		BSR 	STATUS,5 		//03F9 	1A83
		CLRR 	CH 			//03FA 	010C

		//;sysinit.c: 73: PIR1 = 0B00000000;
		BCR 	STATUS,5 		//03FB 	1283
		ORG		03FCH
		CLRR 	CH 			//03FC 	010C

		//;sysinit.c: 85: T0IF = 0;
		BCR 	INTCON,2 		//03FD 	110B

		//;sysinit.c: 86: T0IE = 0;
		BCR 	INTCON,5 		//03FE 	128B

		//;sysinit.c: 87: TMR1ON = 0;
		BCR 	10H,0 			//03FF 	1010

		//;sysinit.c: 89: TMR2IF = 0;
		BCR 	CH,1 			//0400 	108C

		//;sysinit.c: 90: TMR2IE = 0;
		BSR 	STATUS,5 		//0401 	1A83
		BCR 	CH,1 			//0402 	108C

		//;sysinit.c: 93: TMR1IF = 0;
		BCR 	STATUS,5 		//0403 	1283
		ORG		0404H
		BCR 	CH,0 			//0404 	100C

		//;sysinit.c: 94: TMR1IE = 0;
		BSR 	STATUS,5 		//0405 	1A83
		BCR 	CH,0 			//0406 	100C

		//;sysinit.c: 96: PEIE = 0;
		BCR 	INTCON,6 		//0407 	130B

		//;sysinit.c: 98: GIE = 1;
		BSR 	INTCON,7 		//0408 	1B8B
		RET		 					//0409 	0004
		STR 	77H 			//040A 	01F7

		//;ms82_eeprom.c: 19: unsigned char i;
		//;ms82_eeprom.c: 20: for(i=0;i<len;i++){
		CLRR 	78H 			//040B 	0178
		ORG		040CH
		LDR 	75H,0 			//040C 	0875
		SUBWR 	78H,0 			//040D 	0C78
		BTSC 	STATUS,0 		//040E 	1403
		RET		 					//040F 	0004

		//;ms82_eeprom.c: 21: buff[i] = eepromReadByte(addStart+i);
		LDR 	78H,0 			//0410 	0878
		ADDWR 	74H,0 			//0411 	0B74
		STR 	76H 			//0412 	01F6
		STR 	FSR 			//0413 	0184
		ORG		0414H
		LDR 	78H,0 			//0414 	0878
		ADDWR 	77H,0 			//0415 	0B77
		LCALL 	487H 			//0416 	3487
		BCR 	STATUS,7 		//0417 	1383
		STR 	INDF 			//0418 	0180
		INCR	78H,1 			//0419 	09F8
		LJUMP 	40CH 			//041A 	3C0C

		//;MAIN.C: 110: if(T0IE&&T0IF)
		BTSC 	INTCON,5 		//041B 	168B
		ORG		041CH
		BTSS 	INTCON,2 		//041C 	1D0B
		LJUMP 	425H 			//041D 	3C25

		//;MAIN.C: 111: {
		//;MAIN.C: 112: T0IF = 0;
		BCR 	INTCON,2 		//041E 	110B

		//;MAIN.C: 114: TMR0 = buzFre;
		LDR 	7BH,0 			//041F 	087B
		BCR 	STATUS,5 		//0420 	1283
		BCR 	STATUS,6 		//0421 	1303
		STR 	1H 			//0422 	0181

		//;MAIN.C: 115: RC0 = ~RC0;
		LDWI 	1H 			//0423 	2A01
		ORG		0424H
		XORWR 	7H,1 			//0424 	0487
		LDR 	71H,0 			//0425 	0871
		STR 	PCLATH 			//0426 	018A
		SWAPR 	70H,0 			//0427 	0770
		STR 	STATUS 			//0428 	0183
		SWAPR 	7EH,1 			//0429 	07FE
		SWAPR 	7EH,0 			//042A 	077E
		RETI		 			//042B 	0009
		ORG		042CH
		STR 	74H 			//042C 	01F4

		//;MAIN.C: 55: while(t--)
		DECR 	74H,1 			//042D 	0DF4
		LDR 	74H,0 			//042E 	0874
		XORWI 	FFH 			//042F 	26FF
		BTSC 	STATUS,2 		//0430 	1503
		RET		 					//0431 	0004

		//;MAIN.C: 56: _delay((unsigned long)((10)*(8000000/4000.0)));
		LDWI 	1AH 			//0432 	2A1A
		STR 	73H 			//0433 	01F3
		ORG		0434H
		LDWI 	F8H 			//0434 	2AF8
		STR 	72H 			//0435 	01F2
		DECRSZ 	72H,1 		//0436 	0EF2
		LJUMP 	436H 			//0437 	3C36
		DECRSZ 	73H,1 		//0438 	0EF3
		LJUMP 	436H 			//0439 	3C36
		CLRWDT	 			//043A 	0001
		LJUMP 	42DH 			//043B 	3C2D
		ORG		043CH
		LDR 	7EH,0 			//043C 	087E
		STR 	PCLATH 			//043D 	018A
		LDR 	7FH,0 			//043E 	087F
		STR 	PCL 			//043F 	0182
		LCALL 	43CH 			//0440 	343C
		STR 	INDF 			//0441 	0180
		INCR	FSR,1 			//0442 	0984
		LDR 	FSR,0 			//0443 	0804
		ORG		0444H
		XORWR 	7DH,0 			//0444 	047D
		BTSC 	STATUS,2 		//0445 	1503
		RETW 	0H 			//0446 	2100
		INCR	7FH,1 			//0447 	09FF
		BTSC 	STATUS,2 		//0448 	1503
		INCR	7EH,1 			//0449 	09FE
		LJUMP 	440H 			//044A 	3C40

		//;sysinit.c: 34: PORTA = 0B00000000;
		BCR 	STATUS,5 		//044B 	1283
		ORG		044CH
		CLRR 	5H 			//044C 	0105

		//;sysinit.c: 35: TRISA = 0B01110111;
		LDWI 	77H 			//044D 	2A77
		BSR 	STATUS,5 		//044E 	1A83
		STR 	5H 			//044F 	0185

		//;sysinit.c: 36: WPUA = 0B10010000;
		LDWI 	90H 			//0450 	2A90
		STR 	15H 			//0451 	0195

		//;sysinit.c: 37: PORTC = 0B00000010;
		LDWI 	2H 			//0452 	2A02
		BCR 	STATUS,5 		//0453 	1283
		ORG		0454H
		STR 	7H 			//0454 	0187

		//;sysinit.c: 38: TRISC = 0B11111110;
		LDWI 	FEH 			//0455 	2AFE
		BSR 	STATUS,5 		//0456 	1A83
		STR 	7H 			//0457 	0187

		//;sysinit.c: 39: WPUC = 0B00000000;
		CLRR 	8H 			//0458 	0108
		RET		 					//0459 	0004
		STR 	74H 			//045A 	01F4
		CLRR 	73H 			//045B 	0173
		ORG		045CH
		LDR 	72H,0 			//045C 	0872
		BTSC 	74H,0 			//045D 	1474
		ADDWR 	73H,1 			//045E 	0BF3
		BCR 	STATUS,0 		//045F 	1003
		RLR 	72H,1 			//0460 	05F2
		BCR 	STATUS,0 		//0461 	1003
		RRR	74H,1 			//0462 	06F4
		LDR 	74H,1 			//0463 	08F4
		ORG		0464H
		BTSS 	STATUS,2 		//0464 	1D03
		LJUMP 	45CH 			//0465 	3C5C
		LDR 	73H,0 			//0466 	0873
		RET		 					//0467 	0004
		STR 	74H 			//0468 	01F4

		//;MAIN.C: 147: mtState = stt;
		BCR 	STATUS,5 		//0469 	1283
		BCR 	STATUS,6 		//046A 	1303
		STR 	5CH 			//046B 	01DC
		ORG		046CH

		//;MAIN.C: 148: timeTick =0;
		CLRR 	5AH 			//046C 	015A
		CLRR 	5BH 			//046D 	015B

		//;MAIN.C: 149: timeOut = _tOut;
		LDR 	73H,0 			//046E 	0873
		STR 	59H 			//046F 	01D9
		LDR 	72H,0 			//0470 	0872
		STR 	58H 			//0471 	01D8
		RET		 					//0472 	0004

		//;sysinit.c: 21: OSCCON = 0B01100001;
		LDWI 	61H 			//0473 	2A61
		ORG		0474H
		BSR 	STATUS,5 		//0474 	1A83
		BCR 	STATUS,6 		//0475 	1303
		STR 	FH 			//0476 	018F

		//;sysinit.c: 22: _nop();
		NOP		 					//0477 	0000

		//;sysinit.c: 28: while(HTS==0);
		BSR 	STATUS,5 		//0478 	1A83
		BCR 	STATUS,6 		//0479 	1303
		BTSC 	FH,2 			//047A 	150F
		RET		 					//047B 	0004
		ORG		047CH
		LJUMP 	478H 			//047C 	3C78

		//;sysinit.c: 46: OPTION = 0B00000001;
		LDWI 	1H 			//047D 	2A01
		STR 	1H 			//047E 	0181

		//;sysinit.c: 59: TMR1H = -5000>>8;
		LDWI 	ECH 			//047F 	2AEC
		BCR 	STATUS,5 		//0480 	1283
		STR 	FH 			//0481 	018F

		//;sysinit.c: 60: TMR1L = -5000;
		LDWI 	78H 			//0482 	2A78
		STR 	EH 			//0483 	018E
		ORG		0484H

		//;sysinit.c: 61: T1CON = 0B00100001;
		LDWI 	21H 			//0484 	2A21
		STR 	10H 			//0485 	0190
		RET		 					//0486 	0004
		STR 	72H 			//0487 	01F2

		//;ms82_eeprom.c: 8: unsigned char ReEepromData;
		//;ms82_eeprom.c: 10: EEADR = EEAddr;
		BSR 	STATUS,5 		//0488 	1A83
		BCR 	STATUS,6 		//0489 	1303
		STR 	1BH 			//048A 	019B

		//;ms82_eeprom.c: 11: RD = 1;
		BSR 	1CH,0 			//048B 	181C
		ORG		048CH

		//;ms82_eeprom.c: 12: ReEepromData = EEDAT;
		LDR 	1AH,0 			//048C 	081A
		STR 	73H 			//048D 	01F3

		//;ms82_eeprom.c: 13: RD = 0;
		BCR 	1CH,0 			//048E 	101C

		//;ms82_eeprom.c: 14: return ReEepromData;
		RET		 					//048F 	0004
		LJUMP 	237H 			//0490 	3A37
		LJUMP 	1A6H 			//0491 	39A6
		LJUMP 	1A6H 			//0492 	39A6
		LJUMP 	1EDH 			//0493 	39ED
		ORG		0494H
		LJUMP 	237H 			//0494 	3A37
		LJUMP 	20CH 			//0495 	3A0C
		LJUMP 	1C4H 			//0496 	39C4
			END
