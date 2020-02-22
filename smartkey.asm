//Deviec:MS86Fxx02
//-----------------------Variable---------------------------------
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
		LJUMP 	464H 			//0009 	3C64
		LJUMP 	3ADH 			//000A 	3BAD
		LDWI 	10H 			//000B 	2A10
		ORG		000CH

		//;rfid125.c: 22: unsigned char RF_serial_55bits[11];
		//;rfid125.c: 23: unsigned int timeOutVal;
		//;rfid125.c: 24: unsigned char i,ii,j;
		//;rfid125.c: 25: unsigned char flag_RFID_syn, flag_RFID_last;
		//;rfid125.c: 26: unsigned char even_row, even_col;
		//;rfid125.c: 29: flag_RFID_syn = 0;
		CLRR 	49H 			//000C 	0149

		//;rfid125.c: 32: i=16;
		STR 	4DH 			//000D 	01CD

		//;rfid125.c: 34: {
		//;rfid125.c: 35: timeOutVal=timerOut(1,150);
		LDWI 	96H 			//000E 	2A96
		STR 	72H 			//000F 	01F2
		LDWI 	1H 			//0010 	2A01
		CLRR 	73H 			//0011 	0173
		LCALL 	31CH 			//0012 	331C

		//;rfid125.c: 36: if(timeOutVal==0) return 0;
		LCALL 	143H 			//0013 	3143
		ORG		0014H
		BTSC 	STATUS,2 		//0014 	1503
		RETW 	0H 			//0015 	2100

		//;rfid125.c: 38: timeOutVal=timerOut(0,150);
		LDWI 	96H 			//0016 	2A96
		STR 	72H 			//0017 	01F2
		LDWI 	0H 			//0018 	2A00
		CLRR 	73H 			//0019 	0173
		LCALL 	31CH 			//001A 	331C

		//;rfid125.c: 39: if(timeOutVal==0) return 0;
		LCALL 	143H 			//001B 	3143
		ORG		001CH
		BTSC 	STATUS,2 		//001C 	1503
		RETW 	0H 			//001D 	2100
		LDWI 	0H 			//001E 	2A00

		//;rfid125.c: 41: i--;
		DECR 	4DH,1 			//001F 	0DCD

		//;rfid125.c: 42: }
		//;rfid125.c: 43: while(timeOutVal<72 && i>0);
		SUBWR 	50H,0 			//0020 	0C50
		LDWI 	48H 			//0021 	2A48
		BTSC 	STATUS,2 		//0022 	1503
		SUBWR 	4FH,0 			//0023 	0C4F
		ORG		0024H
		BTSC 	STATUS,0 		//0024 	1403
		LJUMP 	29H 			//0025 	3829
		LDR 	4DH,1 			//0026 	08CD
		BTSS 	STATUS,2 		//0027 	1D03
		LJUMP 	0EH 			//0028 	380E

		//;rfid125.c: 44: flag_RFID_last = 1;
		CLRR 	4EH 			//0029 	014E
		INCR	4EH,1 			//002A 	09CE

		//;rfid125.c: 45: i = 0;
		CLRR 	4DH 			//002B 	014D
		ORG		002CH

		//;rfid125.c: 46: while(i<64)
		LDWI 	40H 			//002C 	2A40
		SUBWR 	4DH,0 			//002D 	0C4D
		BTSC 	STATUS,0 		//002E 	1403
		LJUMP 	84H 			//002F 	3884

		//;rfid125.c: 47: {
		//;rfid125.c: 48: for(ii=0;ii<9;ii++)
		CLRR 	51H 			//0030 	0151

		//;rfid125.c: 49: {
		//;rfid125.c: 50: timeOutVal=timerOut(flag_RFID_last,150);
		LCALL 	150H 			//0031 	3150
		LCALL 	31CH 			//0032 	331C

		//;rfid125.c: 51: if(timeOutVal==0) return 0;
		LCALL 	143H 			//0033 	3143
		ORG		0034H
		BTSC 	STATUS,2 		//0034 	1503
		RETW 	0H 			//0035 	2100

		//;rfid125.c: 53: if(0==flag_RFID_last && timeOutVal<=72 ||
		//;rfid125.c: 54: 1==flag_RFID_last && timeOutVal>72)
		LDR 	4EH,1 			//0036 	08CE
		BTSS 	STATUS,2 		//0037 	1D03
		LJUMP 	40H 			//0038 	3840
		LDWI 	0H 			//0039 	2A00
		SUBWR 	50H,0 			//003A 	0C50
		LDWI 	49H 			//003B 	2A49
		ORG		003CH
		BTSC 	STATUS,2 		//003C 	1503
		SUBWR 	4FH,0 			//003D 	0C4F
		BTSS 	STATUS,0 		//003E 	1C03
		LJUMP 	49H 			//003F 	3849
		DECRSZ 	4EH,0 		//0040 	0E4E
		LJUMP 	57H 			//0041 	3857
		LDWI 	0H 			//0042 	2A00
		SUBWR 	50H,0 			//0043 	0C50
		ORG		0044H
		LDWI 	49H 			//0044 	2A49
		BTSC 	STATUS,2 		//0045 	1503
		SUBWR 	4FH,0 			//0046 	0C4F
		BTSS 	STATUS,0 		//0047 	1C03
		LJUMP 	57H 			//0048 	3857

		//;rfid125.c: 55: {
		//;rfid125.c: 56: if(!flag_RFID_last)
		LDR 	4EH,1 			//0049 	08CE
		BTSS 	STATUS,2 		//004A 	1D03
		LJUMP 	54H 			//004B 	3854
		ORG		004CH

		//;rfid125.c: 57: {
		//;rfid125.c: 58: timeOutVal=timerOut(1,72);
		LDWI 	48H 			//004C 	2A48
		STR 	72H 			//004D 	01F2
		LDWI 	1H 			//004E 	2A01
		CLRR 	73H 			//004F 	0173
		LCALL 	31CH 			//0050 	331C

		//;rfid125.c: 59: if(timeOutVal==0) return 0;
		LCALL 	143H 			//0051 	3143
		BTSC 	STATUS,2 		//0052 	1503
		RETW 	0H 			//0053 	2100
		ORG		0054H

		//;rfid125.c: 60: }
		//;rfid125.c: 61: flag_RFID_last = 0;
		CLRR 	4EH 			//0054 	014E

		//;rfid125.c: 62: i++;
		INCR	4DH,1 			//0055 	09CD

		//;rfid125.c: 63: }
		LJUMP 	79H 			//0056 	3879

		//;rfid125.c: 64: else
		//;rfid125.c: 65: if(0==flag_RFID_last && timeOutVal>72 ||
		//;rfid125.c: 66: 1==flag_RFID_last && timeOutVal<=72)
		LDR 	4EH,1 			//0057 	08CE
		BTSS 	STATUS,2 		//0058 	1D03
		LJUMP 	61H 			//0059 	3861
		LDWI 	0H 			//005A 	2A00
		SUBWR 	50H,0 			//005B 	0C50
		ORG		005CH
		LDWI 	49H 			//005C 	2A49
		BTSC 	STATUS,2 		//005D 	1503
		SUBWR 	4FH,0 			//005E 	0C4F
		BTSC 	STATUS,0 		//005F 	1403
		LJUMP 	6AH 			//0060 	386A
		DECRSZ 	4EH,0 		//0061 	0E4E
		LJUMP 	79H 			//0062 	3879
		LDWI 	0H 			//0063 	2A00
		ORG		0064H
		SUBWR 	50H,0 			//0064 	0C50
		LDWI 	49H 			//0065 	2A49
		BTSC 	STATUS,2 		//0066 	1503
		SUBWR 	4FH,0 			//0067 	0C4F
		BTSC 	STATUS,0 		//0068 	1403
		LJUMP 	79H 			//0069 	3879

		//;rfid125.c: 67: {
		//;rfid125.c: 68: if(flag_RFID_last)
		LDR 	4EH,0 			//006A 	084E
		BTSC 	STATUS,2 		//006B 	1503
		ORG		006CH
		LJUMP 	75H 			//006C 	3875

		//;rfid125.c: 69: {
		//;rfid125.c: 70: timeOutVal=timerOut(0,72);
		LDWI 	48H 			//006D 	2A48
		STR 	72H 			//006E 	01F2
		LDWI 	0H 			//006F 	2A00
		CLRR 	73H 			//0070 	0173
		LCALL 	31CH 			//0071 	331C

		//;rfid125.c: 71: if(timeOutVal==0) return 0;
		LCALL 	143H 			//0072 	3143
		BTSC 	STATUS,2 		//0073 	1503
		ORG		0074H
		RETW 	0H 			//0074 	2100

		//;rfid125.c: 72: }
		//;rfid125.c: 73: flag_RFID_last = 1;
		CLRR 	4EH 			//0075 	014E
		INCR	4EH,1 			//0076 	09CE

		//;rfid125.c: 74: i++;
		INCR	4DH,1 			//0077 	09CD

		//;rfid125.c: 76: break;
		LJUMP 	7EH 			//0078 	387E
		LDWI 	9H 			//0079 	2A09
		INCR	51H,1 			//007A 	09D1
		SUBWR 	51H,0 			//007B 	0C51
		ORG		007CH
		BTSS 	STATUS,0 		//007C 	1C03
		LJUMP 	31H 			//007D 	3831

		//;rfid125.c: 77: }
		//;rfid125.c: 79: }
		//;rfid125.c: 80: if(9==ii)
		LDR 	51H,0 			//007E 	0851
		XORWI 	9H 			//007F 	2609
		BTSS 	STATUS,2 		//0080 	1D03
		LJUMP 	2CH 			//0081 	382C

		//;rfid125.c: 81: {
		//;rfid125.c: 82: flag_RFID_syn = 1;
		CLRR 	49H 			//0082 	0149
		INCR	49H,1 			//0083 	09C9
		ORG		0084H

		//;rfid125.c: 83: break;
		//;rfid125.c: 84: }
		//;rfid125.c: 85: }
		//;rfid125.c: 87: if(!flag_RFID_syn)
		LDR 	49H,1 			//0084 	08C9
		BTSC 	STATUS,2 		//0085 	1503
		RETW 	0H 			//0086 	2100

		//;rfid125.c: 90: }
		//;rfid125.c: 91: for(ii=0;ii<55;ii++)
		CLRR 	51H 			//0087 	0151

		//;rfid125.c: 92: {
		//;rfid125.c: 93: i = ii/5;
		LDWI 	5H 			//0088 	2A05
		STR 	72H 			//0089 	01F2
		LDR 	51H,0 			//008A 	0851
		LCALL 	378H 			//008B 	3378
		ORG		008CH
		STR 	4DH 			//008C 	01CD

		//;rfid125.c: 94: timeOutVal=timerOut(flag_RFID_last,150);
		LCALL 	150H 			//008D 	3150
		LCALL 	31CH 			//008E 	331C

		//;rfid125.c: 95: if(timeOutVal==0) return 0;
		LCALL 	143H 			//008F 	3143
		BTSC 	STATUS,2 		//0090 	1503
		RETW 	0H 			//0091 	2100

		//;rfid125.c: 97: if(0==flag_RFID_last && timeOutVal<=72 ||
		//;rfid125.c: 98: 1==flag_RFID_last && timeOutVal>72)
		LDR 	4EH,1 			//0092 	08CE
		BTSS 	STATUS,2 		//0093 	1D03
		ORG		0094H
		LJUMP 	9CH 			//0094 	389C
		LDWI 	0H 			//0095 	2A00
		SUBWR 	50H,0 			//0096 	0C50
		LDWI 	49H 			//0097 	2A49
		BTSC 	STATUS,2 		//0098 	1503
		SUBWR 	4FH,0 			//0099 	0C4F
		BTSS 	STATUS,0 		//009A 	1C03
		LJUMP 	A5H 			//009B 	38A5
		ORG		009CH
		DECRSZ 	4EH,0 		//009C 	0E4E
		LJUMP 	B7H 			//009D 	38B7
		LDWI 	0H 			//009E 	2A00
		SUBWR 	50H,0 			//009F 	0C50
		LDWI 	49H 			//00A0 	2A49
		BTSC 	STATUS,2 		//00A1 	1503
		SUBWR 	4FH,0 			//00A2 	0C4F
		BTSS 	STATUS,0 		//00A3 	1C03
		ORG		00A4H
		LJUMP 	B7H 			//00A4 	38B7

		//;rfid125.c: 99: {
		//;rfid125.c: 100: if(!flag_RFID_last)
		LDR 	4EH,1 			//00A5 	08CE
		BTSS 	STATUS,2 		//00A6 	1D03
		LJUMP 	B0H 			//00A7 	38B0

		//;rfid125.c: 101: {
		//;rfid125.c: 102: timeOutVal=timerOut(1,72);
		LDWI 	48H 			//00A8 	2A48
		STR 	72H 			//00A9 	01F2
		LDWI 	1H 			//00AA 	2A01
		CLRR 	73H 			//00AB 	0173
		ORG		00ACH
		LCALL 	31CH 			//00AC 	331C

		//;rfid125.c: 103: if(timeOutVal==0) return 0;
		LCALL 	143H 			//00AD 	3143
		BTSC 	STATUS,2 		//00AE 	1503
		RETW 	0H 			//00AF 	2100

		//;rfid125.c: 104: }
		//;rfid125.c: 105: flag_RFID_last = 0;
		CLRR 	4EH 			//00B0 	014E

		//;rfid125.c: 106: RF_serial_55bits[i] <<= 1;
		LCALL 	149H 			//00B1 	3149

		//;rfid125.c: 107: RF_serial_55bits[i] |= 0x01;
		LDR 	4DH,0 			//00B2 	084D
		ADDWI 	3EH 			//00B3 	273E
		ORG		00B4H
		STR 	FSR 			//00B4 	0184
		BSR 	INDF,0 			//00B5 	1800

		//;rfid125.c: 108: }
		LJUMP 	D8H 			//00B6 	38D8

		//;rfid125.c: 109: else
		//;rfid125.c: 110: if(0==flag_RFID_last && timeOutVal>72 ||
		//;rfid125.c: 111: 1==flag_RFID_last && timeOutVal<=72)
		LDR 	4EH,1 			//00B7 	08CE
		BTSS 	STATUS,2 		//00B8 	1D03
		LJUMP 	C1H 			//00B9 	38C1
		LDWI 	0H 			//00BA 	2A00
		SUBWR 	50H,0 			//00BB 	0C50
		ORG		00BCH
		LDWI 	49H 			//00BC 	2A49
		BTSC 	STATUS,2 		//00BD 	1503
		SUBWR 	4FH,0 			//00BE 	0C4F
		BTSC 	STATUS,0 		//00BF 	1403
		LJUMP 	CAH 			//00C0 	38CA
		DECRSZ 	4EH,0 		//00C1 	0E4E
		LJUMP 	D8H 			//00C2 	38D8
		LDWI 	0H 			//00C3 	2A00
		ORG		00C4H
		SUBWR 	50H,0 			//00C4 	0C50
		LDWI 	49H 			//00C5 	2A49
		BTSC 	STATUS,2 		//00C6 	1503
		SUBWR 	4FH,0 			//00C7 	0C4F
		BTSC 	STATUS,0 		//00C8 	1403
		LJUMP 	D8H 			//00C9 	38D8

		//;rfid125.c: 112: {
		//;rfid125.c: 113: if(flag_RFID_last)
		LDR 	4EH,0 			//00CA 	084E
		BTSC 	STATUS,2 		//00CB 	1503
		ORG		00CCH
		LJUMP 	D5H 			//00CC 	38D5

		//;rfid125.c: 114: {
		//;rfid125.c: 115: timeOutVal=timerOut(0,150);
		LDWI 	96H 			//00CD 	2A96
		STR 	72H 			//00CE 	01F2
		LDWI 	0H 			//00CF 	2A00
		CLRR 	73H 			//00D0 	0173
		LCALL 	31CH 			//00D1 	331C

		//;rfid125.c: 116: if(timeOutVal==0) return 0;
		LCALL 	143H 			//00D2 	3143
		BTSC 	STATUS,2 		//00D3 	1503
		ORG		00D4H
		RETW 	0H 			//00D4 	2100

		//;rfid125.c: 117: }
		//;rfid125.c: 118: flag_RFID_last = 1;
		CLRR 	4EH 			//00D5 	014E
		INCR	4EH,1 			//00D6 	09CE

		//;rfid125.c: 119: RF_serial_55bits[i] <<= 1;
		LCALL 	149H 			//00D7 	3149
		LDWI 	37H 			//00D8 	2A37
		INCR	51H,1 			//00D9 	09D1
		SUBWR 	51H,0 			//00DA 	0C51
		BTSS 	STATUS,0 		//00DB 	1C03
		ORG		00DCH
		LJUMP 	88H 			//00DC 	3888

		//;rfid125.c: 120: }
		//;rfid125.c: 121: }
		//;rfid125.c: 122: if(55==ii)
		LDR 	51H,0 			//00DD 	0851
		XORWI 	37H 			//00DE 	2637
		BTSS 	STATUS,2 		//00DF 	1D03
		RETW 	0H 			//00E0 	2100

		//;rfid125.c: 123: {
		//;rfid125.c: 124: even_col = 0;
		CLRR 	4AH 			//00E1 	014A

		//;rfid125.c: 125: for(ii=0;ii<10;ii++)
		CLRR 	51H 			//00E2 	0151

		//;rfid125.c: 126: {
		//;rfid125.c: 127: even_row = (RF_serial_55bits[ii] & 0x01);
		LDR 	51H,0 			//00E3 	0851
		ORG		00E4H
		ADDWI 	3EH 			//00E4 	273E
		STR 	FSR 			//00E5 	0184
		BCR 	STATUS,7 		//00E6 	1383
		LDR 	INDF,0 			//00E7 	0800
		STR 	4BH 			//00E8 	01CB
		LDWI 	1H 			//00E9 	2A01
		ANDWR 	4BH,1 			//00EA 	02CB

		//;rfid125.c: 128: for(j=1;j<5;j++)
		CLRR 	4CH 			//00EB 	014C
		ORG		00ECH
		INCR	4CH,1 			//00EC 	09CC

		//;rfid125.c: 129: {
		//;rfid125.c: 130: even_row = even_row ^ ((RF_serial_55bits[ii]>>j) & 0x01);
		LDR 	51H,0 			//00ED 	0851
		ADDWI 	3EH 			//00EE 	273E
		STR 	FSR 			//00EF 	0184
		LDR 	INDF,0 			//00F0 	0800
		STR 	77H 			//00F1 	01F7
		INCR	4CH,0 			//00F2 	094C
		LJUMP 	F6H 			//00F3 	38F6
		ORG		00F4H
		BCR 	STATUS,0 		//00F4 	1003
		RRR	77H,1 			//00F5 	06F7
		ADDWI 	FFH 			//00F6 	27FF
		BTSS 	STATUS,2 		//00F7 	1D03
		LJUMP 	F4H 			//00F8 	38F4
		LDR 	77H,0 			//00F9 	0877
		ANDWI 	1H 			//00FA 	2401
		XORWR 	4BH,1 			//00FB 	04CB
		ORG		00FCH
		LDWI 	5H 			//00FC 	2A05
		INCR	4CH,1 			//00FD 	09CC
		SUBWR 	4CH,0 			//00FE 	0C4C
		BTSS 	STATUS,0 		//00FF 	1C03
		LJUMP 	EDH 			//0100 	38ED

		//;rfid125.c: 131: }
		//;rfid125.c: 132: if(even_row & 0x01)
		BTSC 	4BH,0 			//0101 	144B
		RETW 	0H 			//0102 	2100

		//;rfid125.c: 135: }
		//;rfid125.c: 137: RF_serial_55bits[ii] <<= 3;
		LDR 	51H,0 			//0103 	0851
		ORG		0104H
		ADDWI 	3EH 			//0104 	273E
		STR 	FSR 			//0105 	0184
		RLR 	INDF,1 			//0106 	0580
		RLR 	INDF,1 			//0107 	0580
		RLR 	INDF,0 			//0108 	0500
		ANDWI 	F8H 			//0109 	24F8
		STR 	INDF 			//010A 	0180

		//;rfid125.c: 139: i = RF_serial_55bits[ii];
		LDR 	51H,0 			//010B 	0851
		ORG		010CH
		ADDWI 	3EH 			//010C 	273E
		STR 	FSR 			//010D 	0184
		LDR 	INDF,0 			//010E 	0800
		STR 	4DH 			//010F 	01CD

		//;rfid125.c: 140: if( 0==ii%2 )
		BTSC 	51H,0 			//0110 	1451
		LJUMP 	11FH 			//0111 	391F

		//;rfid125.c: 141: {
		//;rfid125.c: 142: keyID[ii/2] = (i & 0xF0);
		BCR 	STATUS,0 		//0112 	1003
		RRR	51H,0 			//0113 	0651
		ORG		0114H
		ADDWI 	5DH 			//0114 	275D
		STR 	FSR 			//0115 	0184
		LDR 	4DH,0 			//0116 	084D
		STR 	INDF 			//0117 	0180
		BCR 	STATUS,0 		//0118 	1003
		RRR	51H,0 			//0119 	0651
		ADDWI 	5DH 			//011A 	275D
		STR 	FSR 			//011B 	0184
		ORG		011CH
		LDWI 	F0H 			//011C 	2AF0
		ANDWR 	INDF,1 		//011D 	0280

		//;rfid125.c: 143: }
		LJUMP 	129H 			//011E 	3929
		LDWI 	FH 			//011F 	2A0F

		//;rfid125.c: 144: else
		//;rfid125.c: 145: {
		//;rfid125.c: 146: i >>=4;
		SWAPR 	4DH,1 			//0120 	07CD
		ANDWR 	4DH,1 			//0121 	02CD

		//;rfid125.c: 147: keyID[ii/2] |= (i & 0x0F);
		BCR 	STATUS,0 		//0122 	1003
		RRR	51H,0 			//0123 	0651
		ORG		0124H
		ADDWI 	5DH 			//0124 	275D
		STR 	FSR 			//0125 	0184
		LDR 	4DH,0 			//0126 	084D
		ANDWI 	FH 			//0127 	240F
		IORWR 	INDF,1 		//0128 	0380

		//;rfid125.c: 148: }
		//;rfid125.c: 149: even_col ^= RF_serial_55bits[ii];
		LDR 	51H,0 			//0129 	0851
		ADDWI 	3EH 			//012A 	273E
		STR 	FSR 			//012B 	0184
		ORG		012CH
		LDR 	INDF,0 			//012C 	0800
		XORWR 	4AH,1 			//012D 	04CA
		LDWI 	AH 			//012E 	2A0A
		INCR	51H,1 			//012F 	09D1
		SUBWR 	51H,0 			//0130 	0C51
		BTSS 	STATUS,0 		//0131 	1C03
		LJUMP 	E3H 			//0132 	38E3

		//;rfid125.c: 150: }
		//;rfid125.c: 151: RF_serial_55bits[10] <<= 3;
		RLR 	48H,1 			//0133 	05C8
		ORG		0134H
		RLR 	48H,1 			//0134 	05C8
		RLR 	48H,0 			//0135 	0548
		ANDWI 	F8H 			//0136 	24F8
		STR 	48H 			//0137 	01C8
		LDWI 	F0H 			//0138 	2AF0

		//;rfid125.c: 152: keyID[0] =0x00;
		CLRR 	5DH 			//0139 	015D

		//;rfid125.c: 153: if(((RF_serial_55bits[10] & 0xf0)==(even_col & 0xf0)) && (0==(RF_serial
		//+                          _55bits[10]&0x08)))
		ANDWR 	4AH,0 			//013A 	024A
		STR 	77H 			//013B 	01F7
		ORG		013CH
		LDR 	48H,0 			//013C 	0848
		ANDWI 	F0H 			//013D 	24F0
		XORWR 	77H,0 			//013E 	0477
		BTSC 	STATUS,2 		//013F 	1503
		BTSC 	48H,3 			//0140 	15C8
		RETW 	0H 			//0141 	2100

		//;rfid125.c: 154: {
		//;rfid125.c: 156: return 1;
		RETW 	1H 			//0142 	2101
		LDR 	73H,0 			//0143 	0873
		ORG		0144H
		STR 	50H 			//0144 	01D0
		LDR 	72H,0 			//0145 	0872
		STR 	4FH 			//0146 	01CF
		IORWR 	50H,0 			//0147 	0350
		RET		 					//0148 	0004
		LDR 	4DH,0 			//0149 	084D
		ADDWI 	3EH 			//014A 	273E
		STR 	FSR 			//014B 	0184
		ORG		014CH
		BCR 	STATUS,7 		//014C 	1383
		BCR 	STATUS,0 		//014D 	1003
		RLR 	INDF,1 			//014E 	0580
		RET		 					//014F 	0004
		LDWI 	96H 			//0150 	2A96
		STR 	72H 			//0151 	01F2
		CLRR 	73H 			//0152 	0173
		LDR 	4EH,0 			//0153 	084E
		ORG		0154H
		RET		 					//0154 	0004

		//;MAIN.C: 213: unsigned int t;
		//;MAIN.C: 214: unsigned char buzFre = 0;
		CLRR 	55H 			//0155 	0155
		CLRWDT	 			//0156 	0001

		//;MAIN.C: 218: sys_init();
		LCALL 	44DH 			//0157 	344D

		//;MAIN.C: 219: gpio_init();
		LCALL 	41AH 			//0158 	341A

		//;MAIN.C: 221: timer_init();
		LCALL 	46BH 			//0159 	346B

		//;MAIN.C: 222: int_init();
		LCALL 	437H 			//015A 	3437

		//;MAIN.C: 228: eepromWriteByte(0xFF, 0xAA);
		LDWI 	AAH 			//015B 	2AAA
		ORG		015CH
		STR 	72H 			//015C 	01F2
		LDWI 	FFH 			//015D 	2AFF
		LCALL 	2BDH 			//015E 	32BD

		//;MAIN.C: 229: eepromWriteByte(0xFF, 0xAA);
		LDWI 	AAH 			//015F 	2AAA
		STR 	72H 			//0160 	01F2
		LDWI 	FFH 			//0161 	2AFF
		LCALL 	2BDH 			//0162 	32BD

		//;MAIN.C: 232: TRISC &= 0xfe;
		BSR 	STATUS,5 		//0163 	1A83
		ORG		0164H
		BCR 	7H,0 			//0164 	1007

		//;MAIN.C: 234: SET_EPWM_ON();
		LCALL 	2FDH 			//0165 	32FD

		//;MAIN.C: 238: _delay((unsigned long)((20)*(8000000/4000.0)));
		LDWI 	34H 			//0166 	2A34
		BCR 	STATUS,5 		//0167 	1283
		STR 	53H 			//0168 	01D3
		LDWI 	F1H 			//0169 	2AF1
		STR 	52H 			//016A 	01D2
		DECRSZ 	52H,1 		//016B 	0ED2
		ORG		016CH
		LJUMP 	16BH 			//016C 	396B
		DECRSZ 	53H,1 		//016D 	0ED3
		LJUMP 	16BH 			//016E 	396B
		LJUMP 	170H 			//016F 	3970

		//;MAIN.C: 243: if (eepromReadByte(0x06) != 0) {
		LDWI 	6H 			//0170 	2A06
		LCALL 	455H 			//0171 	3455
		XORWI 	0H 			//0172 	2600
		BTSC 	STATUS,2 		//0173 	1503
		ORG		0174H
		LJUMP 	187H 			//0174 	3987
		LDWI 	6H 			//0175 	2A06

		//;MAIN.C: 247: eepromWriteByte(0x06, 0);
		CLRR 	72H 			//0176 	0172
		LCALL 	2BDH 			//0177 	32BD
		LDWI 	7H 			//0178 	2A07

		//;MAIN.C: 248: eepromWriteByte(0x06 + 1, 0);
		CLRR 	72H 			//0179 	0172
		LCALL 	2BDH 			//017A 	32BD

		//;MAIN.C: 249: eepromWriteByte(0x06 + 2, 0x87);
		LDWI 	87H 			//017B 	2A87
		ORG		017CH
		STR 	72H 			//017C 	01F2
		LDWI 	8H 			//017D 	2A08
		LCALL 	2BDH 			//017E 	32BD

		//;MAIN.C: 250: eepromWriteByte(0x06 + 3, 0x3e);
		LDWI 	3EH 			//017F 	2A3E
		STR 	72H 			//0180 	01F2
		LDWI 	9H 			//0181 	2A09
		LCALL 	2BDH 			//0182 	32BD

		//;MAIN.C: 251: eepromWriteByte(0x06 + 4, 0xf8);
		LDWI 	F8H 			//0183 	2AF8
		ORG		0184H
		STR 	72H 			//0184 	01F2
		LDWI 	AH 			//0185 	2A0A
		LCALL 	2BDH 			//0186 	32BD

		//;MAIN.C: 253: }
		//;MAIN.C: 254: eepromReadBlock(0x06, buffTag, 5 * 5);
		LDWI 	25H 			//0187 	2A25
		STR 	74H 			//0188 	01F4
		LDWI 	19H 			//0189 	2A19
		STR 	75H 			//018A 	01F5
		LDWI 	6H 			//018B 	2A06
		ORG		018CH
		LCALL 	3EAH 			//018C 	33EA

		//;MAIN.C: 256: setState(1, 12);
		LDWI 	CH 			//018D 	2A0C
		STR 	72H 			//018E 	01F2
		LDWI 	1H 			//018F 	2A01
		CLRR 	73H 			//0190 	0173
		LCALL 	443H 			//0191 	3443

		//;MAIN.C: 260: tmp = 0;
		CLRR 	56H 			//0192 	0156

		//;MAIN.C: 264: idop = get_RFID();
		LCALL 	BH 			//0193 	300B
		ORG		0194H
		STR 	57H 			//0194 	01D7

		//;MAIN.C: 266: if (idop) {
		LDR 	57H,0 			//0195 	0857
		BTSC 	STATUS,2 		//0196 	1503
		LJUMP 	23AH 			//0197 	3A3A

		//;MAIN.C: 267: idop = id_search(keyID, buffTag);
		LDWI 	25H 			//0198 	2A25
		STR 	7AH 			//0199 	01FA
		LDWI 	5DH 			//019A 	2A5D
		LCALL 	393H 			//019B 	3393
		ORG		019CH
		STR 	57H 			//019C 	01D7

		//;MAIN.C: 268: switch (mtState) {
		LJUMP 	222H 			//019D 	3A22

		//;MAIN.C: 270: case 2:
		//;MAIN.C: 271: if ((idop > 1) && (idop < 6))
		LDWI 	2H 			//019E 	2A02
		SUBWR 	57H,0 			//019F 	0C57
		BTSS 	STATUS,0 		//01A0 	1C03
		LJUMP 	1ABH 			//01A1 	39AB
		LDWI 	6H 			//01A2 	2A06
		SUBWR 	57H,0 			//01A3 	0C57
		ORG		01A4H
		BTSC 	STATUS,0 		//01A4 	1403
		LJUMP 	1ABH 			//01A5 	39AB
		LDWI 	0H 			//01A6 	2A00

		//;MAIN.C: 272: {
		//;MAIN.C: 273: setState(0, 0);
		CLRR 	72H 			//01A7 	0172
		CLRR 	73H 			//01A8 	0173
		LCALL 	443H 			//01A9 	3443

		//;MAIN.C: 275: }
		LJUMP 	22DH 			//01AA 	3A2D

		//;MAIN.C: 276: else if (idop == 1)
		DECRSZ 	57H,0 		//01AB 	0E57
		ORG		01ACH
		LJUMP 	22DH 			//01AC 	3A2D

		//;MAIN.C: 277: {
		//;MAIN.C: 279: id_clear(2, 5);
		LDWI 	5H 			//01AD 	2A05
		STR 	42H 			//01AE 	01C2
		LDWI 	2H 			//01AF 	2A02
		LCALL 	2DEH 			//01B0 	32DE
		LDWI 	3H 			//01B1 	2A03

		//;MAIN.C: 280: setState(3, 0);
		CLRR 	72H 			//01B2 	0172
		CLRR 	73H 			//01B3 	0173
		ORG		01B4H
		LCALL 	443H 			//01B4 	3443
		LDWI 	3H 			//01B5 	2A03

		//;MAIN.C: 281: tmp = 1;
		CLRR 	56H 			//01B6 	0156
		INCR	56H,1 			//01B7 	09D6

		//;MAIN.C: 286: beep2(0, 3);
		STR 	75H 			//01B8 	01F5
		LDWI 	0H 			//01B9 	2A00
		LCALL 	3C3H 			//01BA 	33C3
		LJUMP 	22DH 			//01BB 	3A2D
		ORG		01BCH

		//;MAIN.C: 297: if (idop == 1 && idState == 0) {
		DECRSZ 	57H,0 		//01BC 	0E57
		LJUMP 	1D0H 			//01BD 	39D0
		LDR 	55H,1 			//01BE 	08D5
		BTSS 	STATUS,2 		//01BF 	1D03
		LJUMP 	1D0H 			//01C0 	39D0

		//;MAIN.C: 299: id_clear(2, 5);
		LDWI 	5H 			//01C1 	2A05
		STR 	42H 			//01C2 	01C2
		LDWI 	2H 			//01C3 	2A02
		ORG		01C4H
		LCALL 	2DEH 			//01C4 	32DE
		LDWI 	3H 			//01C5 	2A03

		//;MAIN.C: 300: setState(3, 0);
		CLRR 	72H 			//01C6 	0172
		CLRR 	73H 			//01C7 	0173
		LCALL 	443H 			//01C8 	3443
		LDWI 	3H 			//01C9 	2A03

		//;MAIN.C: 301: tmp = 1;
		CLRR 	56H 			//01CA 	0156
		INCR	56H,1 			//01CB 	09D6
		ORG		01CCH

		//;MAIN.C: 306: beep2(0, 3);
		STR 	75H 			//01CC 	01F5
		LDWI 	0H 			//01CD 	2A00
		LCALL 	3C3H 			//01CE 	33C3

		//;MAIN.C: 308: }
		LJUMP 	22DH 			//01CF 	3A2D

		//;MAIN.C: 309: else if (idop == 2 && idState == 0) {
		LDR 	57H,0 			//01D0 	0857
		XORWI 	2H 			//01D1 	2602
		BTSS 	STATUS,2 		//01D2 	1D03
		LJUMP 	22DH 			//01D3 	3A2D
		ORG		01D4H
		LDR 	55H,1 			//01D4 	08D5
		BTSS 	STATUS,2 		//01D5 	1D03
		LJUMP 	22DH 			//01D6 	3A2D

		//;MAIN.C: 311: id_clear(3, 5);
		LDWI 	5H 			//01D7 	2A05
		STR 	42H 			//01D8 	01C2
		LDWI 	3H 			//01D9 	2A03
		LCALL 	2DEH 			//01DA 	32DE
		LDWI 	5H 			//01DB 	2A05
		ORG		01DCH

		//;MAIN.C: 312: setState(5, 0);
		CLRR 	72H 			//01DC 	0172
		CLRR 	73H 			//01DD 	0173
		LCALL 	443H 			//01DE 	3443

		//;MAIN.C: 313: tmp = 2;
		LDWI 	2H 			//01DF 	2A02
		STR 	56H 			//01E0 	01D6

		//;MAIN.C: 318: beep2(1, 2);
		STR 	75H 			//01E1 	01F5
		LDWI 	1H 			//01E2 	2A01
		LCALL 	3C3H 			//01E3 	33C3
		ORG		01E4H
		LJUMP 	22DH 			//01E4 	3A2D

		//;MAIN.C: 324: if (idState == 0) {
		LDR 	55H,1 			//01E5 	08D5
		BTSS 	STATUS,2 		//01E6 	1D03
		LJUMP 	1FEH 			//01E7 	39FE

		//;MAIN.C: 331: if ( idop != 1) {
		DECR 	57H,0 			//01E8 	0D57
		BTSC 	STATUS,2 		//01E9 	1503
		LJUMP 	22DH 			//01EA 	3A2D
		LDWI 	6H 			//01EB 	2A06
		ORG		01ECH

		//;MAIN.C: 332: tmp++;
		INCR	56H,1 			//01EC 	09D6

		//;MAIN.C: 334: if (tmp <= 5) {
		SUBWR 	56H,0 			//01ED 	0C56
		BTSC 	STATUS,0 		//01EE 	1403
		LJUMP 	22DH 			//01EF 	3A2D

		//;MAIN.C: 335: id_replate(tmp, keyID, buffTag);
		LDWI 	5DH 			//01F0 	2A5D
		STR 	3EH 			//01F1 	01BE
		LDWI 	25H 			//01F2 	2A25
		STR 	3FH 			//01F3 	01BF
		ORG		01F4H
		LDR 	56H,0 			//01F4 	0856
		LCALL 	282H 			//01F5 	3282
		LDWI 	2H 			//01F6 	2A02

		//;MAIN.C: 336: timeTick = 0;
		BCR 	STATUS,5 		//01F7 	1283
		CLRR 	5AH 			//01F8 	015A
		CLRR 	5BH 			//01F9 	015B

		//;MAIN.C: 341: beep2(1, 2);
		STR 	75H 			//01FA 	01F5
		LDWI 	1H 			//01FB 	2A01
		ORG		01FCH
		LCALL 	3C3H 			//01FC 	33C3
		LJUMP 	22DH 			//01FD 	3A2D
		LDWI 	0H 			//01FE 	2A00

		//;MAIN.C: 353: beep2(0, 1);
		CLRR 	75H 			//01FF 	0175
		INCR	75H,1 			//0200 	09F5
		LCALL 	3C3H 			//0201 	33C3
		LJUMP 	22DH 			//0202 	3A2D

		//;MAIN.C: 359: if (idState == 0) {
		LDR 	55H,1 			//0203 	08D5
		ORG		0204H
		BTSS 	STATUS,2 		//0204 	1D03
		LJUMP 	21DH 			//0205 	3A1D

		//;MAIN.C: 360: if ( idop > 2) {
		LDWI 	3H 			//0206 	2A03
		SUBWR 	57H,0 			//0207 	0C57
		BTSS 	STATUS,0 		//0208 	1C03
		LJUMP 	22DH 			//0209 	3A2D
		LDWI 	6H 			//020A 	2A06

		//;MAIN.C: 361: tmp++;
		INCR	56H,1 			//020B 	09D6
		ORG		020CH

		//;MAIN.C: 363: if (tmp <= 5) {
		SUBWR 	56H,0 			//020C 	0C56
		BTSC 	STATUS,0 		//020D 	1403
		LJUMP 	22DH 			//020E 	3A2D

		//;MAIN.C: 364: id_replate(tmp, keyID, buffTag);
		LDWI 	5DH 			//020F 	2A5D
		STR 	3EH 			//0210 	01BE
		LDWI 	25H 			//0211 	2A25
		STR 	3FH 			//0212 	01BF
		LDR 	56H,0 			//0213 	0856
		ORG		0214H
		LCALL 	282H 			//0214 	3282
		LDWI 	2H 			//0215 	2A02

		//;MAIN.C: 365: timeTick = 0;
		BCR 	STATUS,5 		//0216 	1283
		CLRR 	5AH 			//0217 	015A
		CLRR 	5BH 			//0218 	015B

		//;MAIN.C: 371: beep2(1, 2);
		STR 	75H 			//0219 	01F5
		LDWI 	1H 			//021A 	2A01
		LCALL 	3C3H 			//021B 	33C3
		ORG		021CH
		LJUMP 	22DH 			//021C 	3A2D
		LDWI 	0H 			//021D 	2A00

		//;MAIN.C: 382: beep2(0, 1);
		CLRR 	75H 			//021E 	0175
		INCR	75H,1 			//021F 	09F5
		LCALL 	3C3H 			//0220 	33C3
		LJUMP 	22DH 			//0221 	3A2D
		LDR 	5CH,0 			//0222 	085C
		STR 	FSR 			//0223 	0184
		ORG		0224H
		LDWI 	7H 			//0224 	2A07
		SUBWR 	FSR,0 			//0225 	0C04
		BTSC 	STATUS,0 		//0226 	1403
		LJUMP 	22DH 			//0227 	3A2D
		LDWI 	4H 			//0228 	2A04
		STR 	PCLATH 			//0229 	018A
		LDWI 	5DH 			//022A 	2A5D
		ADDWR 	FSR,0 			//022B 	0B04
		ORG		022CH
		STR 	PCL 			//022C 	0182
		LDWI 	9FH 			//022D 	2A9F

		//;MAIN.C: 389: idState = 1;
		BCR 	STATUS,5 		//022E 	1283
		CLRR 	55H 			//022F 	0155
		INCR	55H,1 			//0230 	09D5

		//;MAIN.C: 390: _delay((unsigned long)((61)*(8000000/4000.0)));
		STR 	53H 			//0231 	01D3
		LDWI 	6FH 			//0232 	2A6F
		STR 	52H 			//0233 	01D2
		ORG		0234H
		DECRSZ 	52H,1 		//0234 	0ED2
		LJUMP 	234H 			//0235 	3A34
		DECRSZ 	53H,1 		//0236 	0ED3
		LJUMP 	234H 			//0237 	3A34
		LJUMP 	239H 			//0238 	3A39

		//;MAIN.C: 391: }
		LJUMP 	247H 			//0239 	3A47
		LDWI 	2H 			//023A 	2A02

		//;MAIN.C: 392: else {
		//;MAIN.C: 393: idState = 0;
		CLRR 	55H 			//023B 	0155
		ORG		023CH

		//;MAIN.C: 394: _delay((unsigned long)((150)*(8000000/4000.0)));
		STR 	54H 			//023C 	01D4
		LDWI 	86H 			//023D 	2A86
		STR 	53H 			//023E 	01D3
		LDWI 	99H 			//023F 	2A99
		STR 	52H 			//0240 	01D2
		DECRSZ 	52H,1 		//0241 	0ED2
		LJUMP 	241H 			//0242 	3A41
		DECRSZ 	53H,1 		//0243 	0ED3
		ORG		0244H
		LJUMP 	241H 			//0244 	3A41
		DECRSZ 	54H,1 		//0245 	0ED4
		LJUMP 	241H 			//0246 	3A41

		//;MAIN.C: 395: }
		//;MAIN.C: 399: if ((timeOut != 0) && ( timeTick > timeOut)) {
		BCR 	STATUS,5 		//0247 	1283
		LDR 	59H,0 			//0248 	0859
		IORWR 	58H,0 			//0249 	0358
		BTSC 	STATUS,2 		//024A 	1503
		LJUMP 	271H 			//024B 	3A71
		ORG		024CH
		LDR 	5BH,0 			//024C 	085B
		SUBWR 	59H,0 			//024D 	0C59
		BTSS 	STATUS,2 		//024E 	1D03
		LJUMP 	252H 			//024F 	3A52
		LDR 	5AH,0 			//0250 	085A
		SUBWR 	58H,0 			//0251 	0C58
		BTSS 	STATUS,0 		//0252 	1C03
		LJUMP 	266H 			//0253 	3A66
		ORG		0254H
		LJUMP 	271H 			//0254 	3A71

		//;MAIN.C: 404: setState(2, 42);
		LDWI 	2AH 			//0255 	2A2A
		STR 	72H 			//0256 	01F2
		LDWI 	2H 			//0257 	2A02
		CLRR 	73H 			//0258 	0173
		LCALL 	443H 			//0259 	3443

		//;MAIN.C: 406: break;
		LJUMP 	271H 			//025A 	3A71

		//;MAIN.C: 408: setState(6, 7);
		LDWI 	7H 			//025B 	2A07
		ORG		025CH
		STR 	72H 			//025C 	01F2
		LDWI 	6H 			//025D 	2A06
		CLRR 	73H 			//025E 	0173
		LCALL 	443H 			//025F 	3443

		//;MAIN.C: 409: break;
		LJUMP 	271H 			//0260 	3A71
		LDWI 	2H 			//0261 	2A02

		//;MAIN.C: 411: setState(2, 0);
		CLRR 	72H 			//0262 	0172
		CLRR 	73H 			//0263 	0173
		ORG		0264H
		LCALL 	443H 			//0264 	3443

		//;MAIN.C: 414: break;
		LJUMP 	271H 			//0265 	3A71
		LDR 	5CH,0 			//0266 	085C
		XORWI 	1H 			//0267 	2601
		BTSC 	STATUS,2 		//0268 	1503
		LJUMP 	255H 			//0269 	3A55
		XORWI 	3H 			//026A 	2603
		BTSC 	STATUS,2 		//026B 	1503
		ORG		026CH
		LJUMP 	25BH 			//026C 	3A5B
		XORWI 	4H 			//026D 	2604
		BTSC 	STATUS,2 		//026E 	1503
		LJUMP 	261H 			//026F 	3A61
		LJUMP 	271H 			//0270 	3A71

		//;MAIN.C: 417: }
		//;MAIN.C: 420: if (mtState == 0) RA3 = 1;
		LDR 	5CH,1 			//0271 	08DC
		BTSS 	STATUS,2 		//0272 	1D03
		LJUMP 	276H 			//0273 	3A76
		ORG		0274H
		BSR 	5H,3 			//0274 	1985
		LJUMP 	277H 			//0275 	3A77

		//;MAIN.C: 421: else RA3 = 0;
		BCR 	5H,3 			//0276 	1185

		//;MAIN.C: 430: if (mtState == 2) {
		LDR 	5CH,0 			//0277 	085C
		XORWI 	2H 			//0278 	2602
		BTSS 	STATUS,2 		//0279 	1D03
		LJUMP 	27DH 			//027A 	3A7D

		//;MAIN.C: 432: RC0 = 1;
		BSR 	7H,0 			//027B 	1807
		ORG		027CH

		//;MAIN.C: 433: } else {
		LJUMP 	27EH 			//027C 	3A7E

		//;MAIN.C: 434: RC0 = 0;
		BCR 	7H,0 			//027D 	1007

		//;MAIN.C: 435: };
		//;MAIN.C: 471: timeTick++;
		INCR	5AH,1 			//027E 	09DA
		BTSC 	STATUS,2 		//027F 	1503
		INCR	5BH,1 			//0280 	09DB
		LJUMP 	193H 			//0281 	3993
		STR 	7BH 			//0282 	01FB

		//;MAIN.C: 168: id = (id - 1) * 5;
		LDWI 	5H 			//0283 	2A05
		ORG		0284H
		STR 	72H 			//0284 	01F2
		LDR 	7BH,0 			//0285 	087B
		ADDWI 	FFH 			//0286 	27FF
		LCALL 	429H 			//0287 	3429
		STR 	7BH 			//0288 	01FB

		//;MAIN.C: 169: {
		//;MAIN.C: 170: {
		//;MAIN.C: 171: *(buff + id) = *Cont;
		LDR 	3EH,0 			//0289 	083E
		STR 	FSR 			//028A 	0184
		BCR 	STATUS,7 		//028B 	1383
		ORG		028CH
		LDR 	INDF,0 			//028C 	0800
		STR 	40H 			//028D 	01C0
		LDR 	7BH,0 			//028E 	087B
		ADDWR 	3FH,0 			//028F 	0B3F
		STR 	41H 			//0290 	01C1
		STR 	FSR 			//0291 	0184
		LDR 	40H,0 			//0292 	0840
		STR 	INDF 			//0293 	0180
		ORG		0294H

		//;MAIN.C: 172: *(buff + 1 + id) = *(Cont + 1);
		LDR 	3EH,0 			//0294 	083E
		ADDWI 	1H 			//0295 	2701
		LCALL 	2B6H 			//0296 	32B6
		ADDWI 	1H 			//0297 	2701
		STR 	FSR 			//0298 	0184
		LDR 	40H,0 			//0299 	0840
		STR 	INDF 			//029A 	0180

		//;MAIN.C: 173: *(buff + 2 + id) = *(Cont + 2);
		LDR 	3EH,0 			//029B 	083E
		ORG		029CH
		ADDWI 	2H 			//029C 	2702
		LCALL 	2B6H 			//029D 	32B6
		ADDWI 	2H 			//029E 	2702
		STR 	FSR 			//029F 	0184
		LDR 	40H,0 			//02A0 	0840
		STR 	INDF 			//02A1 	0180

		//;MAIN.C: 174: *(buff + 3 + id) = *(Cont + 3);
		LDR 	3EH,0 			//02A2 	083E
		ADDWI 	3H 			//02A3 	2703
		ORG		02A4H
		LCALL 	2B6H 			//02A4 	32B6
		ADDWI 	3H 			//02A5 	2703
		STR 	FSR 			//02A6 	0184
		LDR 	40H,0 			//02A7 	0840
		STR 	INDF 			//02A8 	0180

		//;MAIN.C: 175: *(buff + 4 + id) = *(Cont + 4);
		LDR 	3EH,0 			//02A9 	083E
		ADDWI 	4H 			//02AA 	2704
		LCALL 	2B6H 			//02AB 	32B6
		ORG		02ACH
		ADDWI 	4H 			//02AC 	2704
		STR 	FSR 			//02AD 	0184
		LDR 	40H,0 			//02AE 	0840
		STR 	INDF 			//02AF 	0180

		//;MAIN.C: 176: }
		//;MAIN.C: 177: }
		//;MAIN.C: 179: eepromWriteBlock(0x06, buffTag, 25);
		LDWI 	25H 			//02B0 	2A25
		STR 	76H 			//02B1 	01F6
		LDWI 	19H 			//02B2 	2A19
		STR 	77H 			//02B3 	01F7
		ORG		02B4H
		LDWI 	6H 			//02B4 	2A06
		LJUMP 	3D8H 			//02B5 	3BD8
		STR 	FSR 			//02B6 	0184
		LDR 	INDF,0 			//02B7 	0800
		STR 	40H 			//02B8 	01C0
		LDR 	7BH,0 			//02B9 	087B
		ADDWR 	3FH,0 			//02BA 	0B3F
		STR 	41H 			//02BB 	01C1
		ORG		02BCH
		RET		 					//02BC 	0004
		STR 	75H 			//02BD 	01F5

		//;ms82_eeprom.c: 27: GIE = 0;
		BCR 	INTCON,7 		//02BE 	138B

		//;ms82_eeprom.c: 29: {
		//;ms82_eeprom.c: 30: while(GIE) asm("clrwdt");
		BTSS 	INTCON,7 		//02BF 	1F8B
		LJUMP 	2C3H 			//02C0 	3AC3
		CLRWDT	 			//02C1 	0001
		LJUMP 	2BFH 			//02C2 	3ABF

		//;ms82_eeprom.c: 31: EEADR = EEAddr;
		LDR 	75H,0 			//02C3 	0875
		ORG		02C4H
		BSR 	STATUS,5 		//02C4 	1A83
		STR 	1BH 			//02C5 	019B

		//;ms82_eeprom.c: 32: EEDAT = EEData;
		LDR 	72H,0 			//02C6 	0872
		STR 	1AH 			//02C7 	019A
		LDWI 	34H 			//02C8 	2A34

		//;ms82_eeprom.c: 33: EEIF = 0;
		BCR 	STATUS,5 		//02C9 	1283
		BCR 	CH,7 			//02CA 	138C

		//;ms82_eeprom.c: 34: EECON1 = 0x34;
		BSR 	STATUS,5 		//02CB 	1A83
		ORG		02CCH
		STR 	1CH 			//02CC 	019C

		//;ms82_eeprom.c: 35: WR = 1;
		BSR 	1DH,0 			//02CD 	181D

		//;ms82_eeprom.c: 36: while(WR) asm("clrwdt");
		BSR 	STATUS,5 		//02CE 	1A83
		BTSS 	1DH,0 			//02CF 	1C1D
		LJUMP 	2D3H 			//02D0 	3AD3
		CLRWDT	 			//02D1 	0001
		LJUMP 	2CEH 			//02D2 	3ACE

		//;ms82_eeprom.c: 37: _delay((unsigned long)((2)*(8000000/4000.0)));
		LDWI 	6H 			//02D3 	2A06
		ORG		02D4H
		STR 	74H 			//02D4 	01F4
		LDWI 	30H 			//02D5 	2A30
		STR 	73H 			//02D6 	01F3
		DECRSZ 	73H,1 		//02D7 	0EF3
		LJUMP 	2D7H 			//02D8 	3AD7
		DECRSZ 	74H,1 		//02D9 	0EF4
		LJUMP 	2D7H 			//02DA 	3AD7
		CLRWDT	 			//02DB 	0001
		ORG		02DCH

		//;ms82_eeprom.c: 38: }
		//;ms82_eeprom.c: 39: GIE = 1;
		BSR 	INTCON,7 		//02DC 	1B8B
		RET		 					//02DD 	0004
		STR 	48H 			//02DE 	01C8

		//;MAIN.C: 182: unsigned char tmp[5] = {0xff, 0xff, 0xff, 0xff, 0xff};
		LDWI 	43H 			//02DF 	2A43
		STR 	FSR 			//02E0 	0184
		LDR 	20H,0 			//02E1 	0820
		BCR 	STATUS,7 		//02E2 	1383
		STR 	INDF 			//02E3 	0180
		ORG		02E4H
		INCR	FSR,1 			//02E4 	0984
		LDR 	21H,0 			//02E5 	0821
		STR 	INDF 			//02E6 	0180
		INCR	FSR,1 			//02E7 	0984
		LDR 	22H,0 			//02E8 	0822
		STR 	INDF 			//02E9 	0180
		INCR	FSR,1 			//02EA 	0984
		LDR 	23H,0 			//02EB 	0823
		ORG		02ECH
		STR 	INDF 			//02EC 	0180
		INCR	FSR,1 			//02ED 	0984
		LDR 	24H,0 			//02EE 	0824
		STR 	INDF 			//02EF 	0180
		LDR 	48H,0 			//02F0 	0848
		SUBWR 	42H,0 			//02F1 	0C42
		BTSS 	STATUS,0 		//02F2 	1C03
		RET		 					//02F3 	0004
		ORG		02F4H

		//;MAIN.C: 184: id_replate(idMin, tmp, buffTag);
		LDWI 	43H 			//02F4 	2A43
		STR 	3EH 			//02F5 	01BE
		LDWI 	25H 			//02F6 	2A25
		STR 	3FH 			//02F7 	01BF
		LDR 	48H,0 			//02F8 	0848
		LCALL 	282H 			//02F9 	3282
		BCR 	STATUS,5 		//02FA 	1283
		INCR	48H,1 			//02FB 	09C8
		ORG		02FCH
		LJUMP 	2F0H 			//02FC 	3AF0

		//;ms82_pwm.c: 12: TRISC |= 0B00100000;
		BSR 	7H,5 			//02FD 	1A87

		//;ms82_pwm.c: 13: T2CON0 = 0B00000001;
		LDWI 	1H 			//02FE 	2A01
		BCR 	STATUS,5 		//02FF 	1283
		STR 	12H 			//0300 	0192

		//;ms82_pwm.c: 14: T2CON1 = 0B00000000;
		BSR 	STATUS,5 		//0301 	1A83
		CLRR 	1EH 			//0302 	011E

		//;ms82_pwm.c: 15: PR2H = 0;
		CLRR 	12H 			//0303 	0112
		ORG		0304H

		//;ms82_pwm.c: 16: PR2L = 7;
		LDWI 	7H 			//0304 	2A07
		STR 	11H 			//0305 	0191

		//;ms82_pwm.c: 17: P1ADTH = 0;
		BCR 	STATUS,5 		//0306 	1283
		CLRR 	14H 			//0307 	0114

		//;ms82_pwm.c: 18: P1ADTL = 4;
		LDWI 	4H 			//0308 	2A04
		STR 	EH 			//0309 	018E

		//;ms82_pwm.c: 20: P1OE = 0B00000001;
		LDWI 	1H 			//030A 	2A01
		BSR 	STATUS,5 		//030B 	1A83
		ORG		030CH
		STR 	10H 			//030C 	0190

		//;ms82_pwm.c: 21: P1POL = 0B00000000;
		CLRR 	19H 			//030D 	0119

		//;ms82_pwm.c: 22: P1CON = 0B00000000;
		BCR 	STATUS,5 		//030E 	1283
		CLRR 	16H 			//030F 	0116

		//;ms82_pwm.c: 24: TMR2H = 0;
		CLRR 	13H 			//0310 	0113

		//;ms82_pwm.c: 25: TMR2L = 0;
		CLRR 	11H 			//0311 	0111

		//;ms82_pwm.c: 26: TMR2IF = 0;
		BCR 	CH,1 			//0312 	108C

		//;ms82_pwm.c: 27: TMR2ON = 1;
		BSR 	12H,2 			//0313 	1912
		ORG		0314H

		//;ms82_pwm.c: 28: while(TMR2IF==0) asm("clrwdt");
		BCR 	STATUS,5 		//0314 	1283
		BTSC 	CH,1 			//0315 	148C
		LJUMP 	319H 			//0316 	3B19
		CLRWDT	 			//0317 	0001
		LJUMP 	314H 			//0318 	3B14

		//;ms82_pwm.c: 29: TRISC &= 0B11011111;
		BSR 	STATUS,5 		//0319 	1A83
		BCR 	7H,5 			//031A 	1287
		RET		 					//031B 	0004
		ORG		031CH
		STR 	74H 			//031C 	01F4

		//;rfid125.c: 7: unsigned int CurTimer;
		//;rfid125.c: 8: T0ON = 0;
		BCR 	1FH,3 			//031D 	119F

		//;rfid125.c: 9: TMR0 = 0;
		CLRR 	1H 			//031E 	0101

		//;rfid125.c: 10: T0IF = 0;
		BCR 	INTCON,2 		//031F 	110B

		//;rfid125.c: 11: T0ON = 1;
		BSR 	1FH,3 			//0320 	199F

		//;rfid125.c: 12: while(RA5==Logic){
		LDWI 	0H 			//0321 	2A00
		BTSC 	5H,5 			//0322 	1685
		LDWI 	1H 			//0323 	2A01
		ORG		0324H
		XORWR 	74H,0 			//0324 	0474
		BTSS 	STATUS,2 		//0325 	1D03
		LJUMP 	336H 			//0326 	3B36

		//;rfid125.c: 13: CurTimer= (0 <<8 )| TMR0;
		CLRR 	75H 			//0327 	0175
		CLRR 	76H 			//0328 	0176
		LDR 	1H,0 			//0329 	0801
		IORWR 	75H,1 			//032A 	03F5

		//;rfid125.c: 14: if(CurTimer>time)
		LDR 	76H,0 			//032B 	0876
		ORG		032CH
		SUBWR 	73H,0 			//032C 	0C73
		BTSS 	STATUS,2 		//032D 	1D03
		LJUMP 	331H 			//032E 	3B31
		LDR 	75H,0 			//032F 	0875
		SUBWR 	72H,0 			//0330 	0C72
		BTSC 	STATUS,0 		//0331 	1403
		LJUMP 	321H 			//0332 	3B21

		//;rfid125.c: 15: return 0;
		CLRR 	72H 			//0333 	0172
		ORG		0334H
		CLRR 	73H 			//0334 	0173
		RET		 					//0335 	0004

		//;rfid125.c: 16: }
		//;rfid125.c: 17: return CurTimer;
		LDR 	76H,0 			//0336 	0876
		STR 	73H 			//0337 	01F3
		LDR 	75H,0 			//0338 	0875
		STR 	72H 			//0339 	01F2
		RET		 					//033A 	0004
		STR 	78H 			//033B 	01F8
		ORG		033CH

		//;ms82_eeprom.c: 53: unsigned char i;
		//;ms82_eeprom.c: 55: if(len1!=len2)
		LDR 	73H,0 			//033C 	0873
		XORWR 	74H,0 			//033D 	0474
		BTSS 	STATUS,2 		//033E 	1D03

		//;ms82_eeprom.c: 56: return 0;
		RETW 	0H 			//033F 	2100

		//;ms82_eeprom.c: 57: else{
		//;ms82_eeprom.c: 58: for(i=0;i<len1;i++){
		CLRR 	79H 			//0340 	0179
		LDR 	73H,0 			//0341 	0873
		SUBWR 	79H,0 			//0342 	0C79

		//;ms82_eeprom.c: 59: if(*(arr1+i) != *(arr2+i)){
		LDR 	79H,0 			//0343 	0879
		ORG		0344H
		BTSC 	STATUS,0 		//0344 	1403
		LJUMP 	356H 			//0345 	3B56
		ADDWR 	72H,0 			//0346 	0B72
		STR 	75H 			//0347 	01F5
		STR 	FSR 			//0348 	0184
		BCR 	STATUS,7 		//0349 	1383
		LDR 	INDF,0 			//034A 	0800
		STR 	76H 			//034B 	01F6
		ORG		034CH
		LDR 	79H,0 			//034C 	0879
		ADDWR 	78H,0 			//034D 	0B78
		STR 	77H 			//034E 	01F7
		STR 	FSR 			//034F 	0184
		LDR 	INDF,0 			//0350 	0800
		XORWR 	76H,0 			//0351 	0476
		BTSS 	STATUS,2 		//0352 	1D03
		RETW 	0H 			//0353 	2100
		ORG		0354H
		INCR	79H,1 			//0354 	09F9
		LJUMP 	341H 			//0355 	3B41

		//;ms82_eeprom.c: 61: }
		//;ms82_eeprom.c: 62: }
		//;ms82_eeprom.c: 63: if(i==len1)
		XORWR 	73H,0 			//0356 	0473
		BTSC 	STATUS,2 		//0357 	1503

		//;ms82_eeprom.c: 64: return 1;
		RETW 	1H 			//0358 	2101
		RETW 	0H 			//0359 	2100
		RETW 	FFH 			//035A 	21FF
		RETW 	FFH 			//035B 	21FF
		ORG		035CH
		RETW 	FFH 			//035C 	21FF
		RETW 	FFH 			//035D 	21FF
		RETW 	FFH 			//035E 	21FF
		RETW 	0H 			//035F 	2100
		RETW 	0H 			//0360 	2100
		RETW 	11H 			//0361 	2111
		RETW 	BH 			//0362 	210B
		RETW 	4FH 			//0363 	214F
		ORG		0364H
		RETW 	0H 			//0364 	2100
		RETW 	0H 			//0365 	2100
		RETW 	81H 			//0366 	2181
		RETW 	2FH 			//0367 	212F
		RETW 	22H 			//0368 	2122
		RETW 	0H 			//0369 	2100
		RETW 	0H 			//036A 	2100
		RETW 	7DH 			//036B 	217D
		ORG		036CH
		RETW 	67H 			//036C 	2167
		RETW 	5H 			//036D 	2105
		RETW 	0H 			//036E 	2100
		RETW 	0H 			//036F 	2100
		RETW 	7EH 			//0370 	217E
		RETW 	31H 			//0371 	2131
		RETW 	E7H 			//0372 	21E7
		RETW 	0H 			//0373 	2100
		ORG		0374H
		RETW 	0H 			//0374 	2100
		RETW 	7EH 			//0375 	217E
		RETW 	51H 			//0376 	2151
		RETW 	E6H 			//0377 	21E6
		STR 	73H 			//0378 	01F3
		CLRR 	75H 			//0379 	0175
		LDR 	72H,0 			//037A 	0872
		BTSC 	STATUS,2 		//037B 	1503
		ORG		037CH
		LJUMP 	391H 			//037C 	3B91
		CLRR 	74H 			//037D 	0174
		INCR	74H,1 			//037E 	09F4
		BTSC 	72H,7 			//037F 	17F2
		LJUMP 	384H 			//0380 	3B84
		BCR 	STATUS,0 		//0381 	1003
		RLR 	72H,1 			//0382 	05F2
		LJUMP 	37EH 			//0383 	3B7E
		ORG		0384H
		BCR 	STATUS,0 		//0384 	1003
		RLR 	75H,1 			//0385 	05F5
		LDR 	72H,0 			//0386 	0872
		SUBWR 	73H,0 			//0387 	0C73
		BTSS 	STATUS,0 		//0388 	1C03
		LJUMP 	38EH 			//0389 	3B8E
		LDR 	72H,0 			//038A 	0872
		SUBWR 	73H,1 			//038B 	0CF3
		ORG		038CH
		BSR 	75H,0 			//038C 	1875
		BCR 	STATUS,0 		//038D 	1003
		RRR	72H,1 			//038E 	06F2
		DECRSZ 	74H,1 		//038F 	0EF4
		LJUMP 	384H 			//0390 	3B84
		LDR 	75H,0 			//0391 	0875
		RET		 					//0392 	0004
		STR 	3EH 			//0393 	01BE
		ORG		0394H

		//;MAIN.C: 160: unsigned char i;
		//;MAIN.C: 161: for (i = 0; i < 21; i += 5) {
		CLRR 	3FH 			//0394 	013F

		//;MAIN.C: 162: if (comArr(id_input, buff + i, 5, 5))
		LDR 	3FH,0 			//0395 	083F
		ADDWR 	7AH,0 			//0396 	0B7A
		STR 	72H 			//0397 	01F2
		LDWI 	5H 			//0398 	2A05
		STR 	73H 			//0399 	01F3
		STR 	74H 			//039A 	01F4
		LDR 	3EH,0 			//039B 	083E
		ORG		039CH
		LCALL 	33BH 			//039C 	333B
		XORWI 	0H 			//039D 	2600

		//;MAIN.C: 163: return i / 5 + 1;
		LDWI 	5H 			//039E 	2A05
		BTSC 	STATUS,2 		//039F 	1503
		LJUMP 	3A7H 			//03A0 	3BA7
		STR 	72H 			//03A1 	01F2
		LDR 	3FH,0 			//03A2 	083F
		LCALL 	378H 			//03A3 	3378
		ORG		03A4H
		STR 	7BH 			//03A4 	01FB
		INCR	7BH,0 			//03A5 	097B
		RET		 					//03A6 	0004
		ADDWR 	3FH,1 			//03A7 	0BBF
		LDWI 	15H 			//03A8 	2A15
		SUBWR 	3FH,0 			//03A9 	0C3F
		BTSC 	STATUS,0 		//03AA 	1403

		//;MAIN.C: 164: }
		//;MAIN.C: 165: return 255;
		RETW 	FFH 			//03AB 	21FF
		ORG		03ACH
		LJUMP 	395H 			//03AC 	3B95
		LDWI 	3EH 			//03AD 	2A3E
		CLRR 	58H 			//03AE 	0158
		CLRR 	59H 			//03AF 	0159
		CLRR 	5AH 			//03B0 	015A
		CLRR 	5BH 			//03B1 	015B
		CLRR 	5CH 			//03B2 	015C
		CLRR 	5DH 			//03B3 	015D
		ORG		03B4H
		CLRR 	5EH 			//03B4 	015E
		CLRR 	5FH 			//03B5 	015F
		CLRR 	60H 			//03B6 	0160
		CLRR 	61H 			//03B7 	0161
		BCR 	STATUS,7 		//03B8 	1383
		STR 	7DH 			//03B9 	01FD
		LDWI 	3H 			//03BA 	2A03
		STR 	7EH 			//03BB 	01FE
		ORG		03BCH
		LDWI 	5AH 			//03BC 	2A5A
		STR 	7FH 			//03BD 	01FF
		LDWI 	20H 			//03BE 	2A20
		STR 	FSR 			//03BF 	0184
		LCALL 	40FH 			//03C0 	340F
		CLRR 	STATUS 			//03C1 	0103
		LJUMP 	155H 			//03C2 	3955
		STR 	76H 			//03C3 	01F6
		ORG		03C4H

		//;MAIN.C: 188: while (rep--) {
		DECR 	75H,1 			//03C4 	0DF5
		LDR 	75H,0 			//03C5 	0875
		XORWI 	FFH 			//03C6 	26FF
		BTSC 	STATUS,2 		//03C7 	1503
		RET		 					//03C8 	0004

		//;MAIN.C: 189: RC0 = 1; if (sel)RA3 = 1;
		BCR 	STATUS,5 		//03C9 	1283
		BSR 	7H,0 			//03CA 	1807
		LDR 	76H,0 			//03CB 	0876
		ORG		03CCH
		BTSS 	STATUS,2 		//03CC 	1D03
		BSR 	5H,3 			//03CD 	1985

		//;MAIN.C: 190: delay_x10ms(20);
		LDWI 	14H 			//03CE 	2A14
		LCALL 	3FBH 			//03CF 	33FB

		//;MAIN.C: 191: RC0 = 0; if (sel)RA3 = 0;
		BCR 	STATUS,5 		//03D0 	1283
		BCR 	7H,0 			//03D1 	1007
		LDR 	76H,0 			//03D2 	0876
		BTSS 	STATUS,2 		//03D3 	1D03
		ORG		03D4H
		BCR 	5H,3 			//03D4 	1185

		//;MAIN.C: 192: delay_x10ms(20);
		LDWI 	14H 			//03D5 	2A14
		LCALL 	3FBH 			//03D6 	33FB
		LJUMP 	3C4H 			//03D7 	3BC4
		STR 	79H 			//03D8 	01F9

		//;ms82_eeprom.c: 44: unsigned char i;
		//;ms82_eeprom.c: 45: for(i=0;i<len;i++){
		CLRR 	7AH 			//03D9 	017A
		LDR 	77H,0 			//03DA 	0877
		SUBWR 	7AH,0 			//03DB 	0C7A
		ORG		03DCH
		BTSC 	STATUS,0 		//03DC 	1403
		RET		 					//03DD 	0004

		//;ms82_eeprom.c: 46: eepromWriteByte(addStart+i,buff[i]);
		LDR 	7AH,0 			//03DE 	087A
		ADDWR 	76H,0 			//03DF 	0B76
		STR 	78H 			//03E0 	01F8
		STR 	FSR 			//03E1 	0184
		BCR 	STATUS,7 		//03E2 	1383
		LDR 	INDF,0 			//03E3 	0800
		ORG		03E4H
		STR 	72H 			//03E4 	01F2
		LDR 	7AH,0 			//03E5 	087A
		ADDWR 	79H,0 			//03E6 	0B79
		LCALL 	2BDH 			//03E7 	32BD
		INCR	7AH,1 			//03E8 	09FA
		LJUMP 	3DAH 			//03E9 	3BDA
		STR 	77H 			//03EA 	01F7

		//;ms82_eeprom.c: 19: unsigned char i;
		//;ms82_eeprom.c: 20: for(i=0;i<len;i++){
		CLRR 	78H 			//03EB 	0178
		ORG		03ECH
		LDR 	75H,0 			//03EC 	0875
		SUBWR 	78H,0 			//03ED 	0C78
		BTSC 	STATUS,0 		//03EE 	1403
		RET		 					//03EF 	0004

		//;ms82_eeprom.c: 21: buff[i] = eepromReadByte(addStart+i);
		LDR 	78H,0 			//03F0 	0878
		ADDWR 	74H,0 			//03F1 	0B74
		STR 	76H 			//03F2 	01F6
		STR 	FSR 			//03F3 	0184
		ORG		03F4H
		LDR 	78H,0 			//03F4 	0878
		ADDWR 	77H,0 			//03F5 	0B77
		LCALL 	455H 			//03F6 	3455
		BCR 	STATUS,7 		//03F7 	1383
		STR 	INDF 			//03F8 	0180
		INCR	78H,1 			//03F9 	09F8
		LJUMP 	3ECH 			//03FA 	3BEC
		STR 	74H 			//03FB 	01F4
		ORG		03FCH

		//;MAIN.C: 60: while (t--)
		DECR 	74H,1 			//03FC 	0DF4
		LDR 	74H,0 			//03FD 	0874
		XORWI 	FFH 			//03FE 	26FF
		BTSC 	STATUS,2 		//03FF 	1503
		RET		 					//0400 	0004

		//;MAIN.C: 61: _delay((unsigned long)((10)*(8000000/4000.0)));
		LDWI 	1AH 			//0401 	2A1A
		STR 	73H 			//0402 	01F3
		LDWI 	F8H 			//0403 	2AF8
		ORG		0404H
		STR 	72H 			//0404 	01F2
		DECRSZ 	72H,1 		//0405 	0EF2
		LJUMP 	405H 			//0406 	3C05
		DECRSZ 	73H,1 		//0407 	0EF3
		LJUMP 	405H 			//0408 	3C05
		CLRWDT	 			//0409 	0001
		LJUMP 	3FCH 			//040A 	3BFC
		LDR 	7EH,0 			//040B 	087E
		ORG		040CH
		STR 	PCLATH 			//040C 	018A
		LDR 	7FH,0 			//040D 	087F
		STR 	PCL 			//040E 	0182
		LCALL 	40BH 			//040F 	340B
		STR 	INDF 			//0410 	0180
		INCR	FSR,1 			//0411 	0984
		LDR 	FSR,0 			//0412 	0804
		XORWR 	7DH,0 			//0413 	047D
		ORG		0414H
		BTSC 	STATUS,2 		//0414 	1503
		RETW 	0H 			//0415 	2100
		INCR	7FH,1 			//0416 	09FF
		BTSC 	STATUS,2 		//0417 	1503
		INCR	7EH,1 			//0418 	09FE
		LJUMP 	40FH 			//0419 	3C0F

		//;sysinit.c: 34: PORTA = 0B00000000;
		BCR 	STATUS,5 		//041A 	1283
		CLRR 	5H 			//041B 	0105
		ORG		041CH

		//;sysinit.c: 35: TRISA = 0B01110011;
		LDWI 	73H 			//041C 	2A73
		BSR 	STATUS,5 		//041D 	1A83
		STR 	5H 			//041E 	0185

		//;sysinit.c: 36: WPUA = 0B10000000;
		LDWI 	80H 			//041F 	2A80
		STR 	15H 			//0420 	0195

		//;sysinit.c: 37: PORTC = 0B00000010;
		LDWI 	2H 			//0421 	2A02
		BCR 	STATUS,5 		//0422 	1283
		STR 	7H 			//0423 	0187
		ORG		0424H

		//;sysinit.c: 38: TRISC = 0B11111110;
		LDWI 	FEH 			//0424 	2AFE
		BSR 	STATUS,5 		//0425 	1A83
		STR 	7H 			//0426 	0187

		//;sysinit.c: 39: WPUC = 0B00000000;
		CLRR 	13H 			//0427 	0113
		RET		 					//0428 	0004
		STR 	74H 			//0429 	01F4
		CLRR 	73H 			//042A 	0173
		LDR 	72H,0 			//042B 	0872
		ORG		042CH
		BTSC 	74H,0 			//042C 	1474
		ADDWR 	73H,1 			//042D 	0BF3
		BCR 	STATUS,0 		//042E 	1003
		RLR 	72H,1 			//042F 	05F2
		BCR 	STATUS,0 		//0430 	1003
		RRR	74H,1 			//0431 	06F4
		LDR 	74H,1 			//0432 	08F4
		BTSS 	STATUS,2 		//0433 	1D03
		ORG		0434H
		LJUMP 	42BH 			//0434 	3C2B
		LDR 	73H,0 			//0435 	0873
		RET		 					//0436 	0004

		//;sysinit.c: 72: INTCON = 0B00000000;
		CLRR 	INTCON 			//0437 	010B

		//;sysinit.c: 73: PIE1 = 0B00000000;
		CLRR 	CH 			//0438 	010C

		//;sysinit.c: 74: PIR1 = 0B00000000;
		BCR 	STATUS,5 		//0439 	1283
		CLRR 	CH 			//043A 	010C

		//;sysinit.c: 87: T0IF = 0;
		BCR 	INTCON,2 		//043B 	110B
		ORG		043CH

		//;sysinit.c: 88: T0IE = 0;
		BCR 	INTCON,5 		//043C 	128B

		//;sysinit.c: 92: TMR2IF = 0;
		BCR 	CH,1 			//043D 	108C

		//;sysinit.c: 93: TMR2IE = 1;
		BSR 	STATUS,5 		//043E 	1A83
		BSR 	CH,1 			//043F 	188C

		//;sysinit.c: 99: PEIE = 0;
		BCR 	INTCON,6 		//0440 	130B

		//;sysinit.c: 101: GIE = 1;
		BSR 	INTCON,7 		//0441 	1B8B
		RET		 					//0442 	0004
		STR 	74H 			//0443 	01F4
		ORG		0444H

		//;MAIN.C: 154: mtState = stt;
		BCR 	STATUS,5 		//0444 	1283
		STR 	5CH 			//0445 	01DC

		//;MAIN.C: 155: timeTick = 0;
		CLRR 	5AH 			//0446 	015A
		CLRR 	5BH 			//0447 	015B

		//;MAIN.C: 156: timeOut = _tOut;
		LDR 	73H,0 			//0448 	0873
		STR 	59H 			//0449 	01D9
		LDR 	72H,0 			//044A 	0872
		STR 	58H 			//044B 	01D8
		ORG		044CH
		RET		 					//044C 	0004

		//;sysinit.c: 21: OSCCON = 0B01100001;
		LDWI 	61H 			//044D 	2A61
		BSR 	STATUS,5 		//044E 	1A83
		STR 	FH 			//044F 	018F

		//;sysinit.c: 22: _nop();
		NOP		 					//0450 	0000

		//;sysinit.c: 28: while(HTS==0);
		BSR 	STATUS,5 		//0451 	1A83
		BTSC 	FH,2 			//0452 	150F
		RET		 					//0453 	0004
		ORG		0454H
		LJUMP 	451H 			//0454 	3C51
		STR 	72H 			//0455 	01F2

		//;ms82_eeprom.c: 8: unsigned char ReEepromData;
		//;ms82_eeprom.c: 10: EEADR = EEAddr;
		BSR 	STATUS,5 		//0456 	1A83
		STR 	1BH 			//0457 	019B

		//;ms82_eeprom.c: 11: RD = 1;
		BSR 	1CH,0 			//0458 	181C

		//;ms82_eeprom.c: 12: ReEepromData = EEDAT;
		LDR 	1AH,0 			//0459 	081A
		STR 	73H 			//045A 	01F3

		//;ms82_eeprom.c: 13: RD = 0;
		BCR 	1CH,0 			//045B 	101C
		ORG		045CH

		//;ms82_eeprom.c: 14: return ReEepromData;
		RET		 					//045C 	0004
		LJUMP 	22DH 			//045D 	3A2D
		LJUMP 	19EH 			//045E 	399E
		LJUMP 	19EH 			//045F 	399E
		LJUMP 	1E5H 			//0460 	39E5
		LJUMP 	22DH 			//0461 	3A2D
		LJUMP 	203H 			//0462 	3A03
		LJUMP 	1BCH 			//0463 	39BC
		ORG		0464H
		LDR 	71H,0 			//0464 	0871
		STR 	PCLATH 			//0465 	018A
		SWAPR 	70H,0 			//0466 	0770
		STR 	STATUS 			//0467 	0183
		SWAPR 	7EH,1 			//0468 	07FE
		SWAPR 	7EH,0 			//0469 	077E
		RETI		 			//046A 	0009

		//;sysinit.c: 46: OPTION = 0B00000011;
		LDWI 	3H 			//046B 	2A03
		ORG		046CH
		STR 	1H 			//046C 	0181
		RET		 					//046D 	0004
			END
