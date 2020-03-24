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
		LJUMP 	407H 			//0009 	3C07
		LJUMP 	374H 			//000A 	3B74
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
		LCALL 	2E3H 			//0012 	32E3

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
		LCALL 	2E3H 			//001A 	32E3

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
		LCALL 	2E3H 			//0032 	32E3

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
		LCALL 	2E3H 			//0050 	32E3

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
		LCALL 	2E3H 			//0071 	32E3

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
		LCALL 	33FH 			//008B 	333F
		ORG		008CH
		STR 	4DH 			//008C 	01CD

		//;rfid125.c: 94: timeOutVal=timerOut(flag_RFID_last,150);
		LCALL 	150H 			//008D 	3150
		LCALL 	2E3H 			//008E 	32E3

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
		LCALL 	2E3H 			//00AC 	32E3

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
		LCALL 	2E3H 			//00D1 	32E3

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
		LCALL 	3EFH 			//0157 	33EF

		//;MAIN.C: 219: gpio_init();
		LCALL 	3BCH 			//0158 	33BC

		//;MAIN.C: 221: timer_init();
		LCALL 	40EH 			//0159 	340E

		//;MAIN.C: 222: int_init();
		LCALL 	3D9H 			//015A 	33D9

		//;MAIN.C: 228: eepromWriteByte(0xFF, 0xAA);
		LDWI 	AAH 			//015B 	2AAA
		ORG		015CH
		STR 	72H 			//015C 	01F2
		LDWI 	FFH 			//015D 	2AFF
		LCALL 	284H 			//015E 	3284

		//;MAIN.C: 229: eepromWriteByte(0xFF, 0xAA);
		LDWI 	AAH 			//015F 	2AAA
		STR 	72H 			//0160 	01F2
		LDWI 	FFH 			//0161 	2AFF
		LCALL 	284H 			//0162 	3284

		//;MAIN.C: 232: TRISC &= 0xfe;
		BSR 	STATUS,5 		//0163 	1A83
		ORG		0164H
		BCR 	7H,0 			//0164 	1007

		//;MAIN.C: 234: SET_EPWM_ON();
		LCALL 	2C4H 			//0165 	32C4

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
		LCALL 	3F7H 			//0171 	33F7
		XORWI 	0H 			//0172 	2600
		BTSC 	STATUS,2 		//0173 	1503
		ORG		0174H
		LJUMP 	187H 			//0174 	3987
		LDWI 	6H 			//0175 	2A06

		//;MAIN.C: 247: eepromWriteByte(0x06, 0);
		CLRR 	72H 			//0176 	0172
		LCALL 	284H 			//0177 	3284
		LDWI 	7H 			//0178 	2A07

		//;MAIN.C: 248: eepromWriteByte(0x06 + 1, 0);
		CLRR 	72H 			//0179 	0172
		LCALL 	284H 			//017A 	3284

		//;MAIN.C: 249: eepromWriteByte(0x06 + 2, 0x87);
		LDWI 	87H 			//017B 	2A87
		ORG		017CH
		STR 	72H 			//017C 	01F2
		LDWI 	8H 			//017D 	2A08
		LCALL 	284H 			//017E 	3284

		//;MAIN.C: 250: eepromWriteByte(0x06 + 3, 0x3a);
		LDWI 	3AH 			//017F 	2A3A
		STR 	72H 			//0180 	01F2
		LDWI 	9H 			//0181 	2A09
		LCALL 	284H 			//0182 	3284

		//;MAIN.C: 251: eepromWriteByte(0x06 + 4, 0xf8);
		LDWI 	F8H 			//0183 	2AF8
		ORG		0184H
		STR 	72H 			//0184 	01F2
		LDWI 	AH 			//0185 	2A0A
		LCALL 	284H 			//0186 	3284

		//;MAIN.C: 253: }
		//;MAIN.C: 254: eepromReadBlock(0x06, buffTag, 5 * 5);
		LDWI 	25H 			//0187 	2A25
		STR 	74H 			//0188 	01F4
		LDWI 	19H 			//0189 	2A19
		STR 	75H 			//018A 	01F5
		LDWI 	6H 			//018B 	2A06
		ORG		018CH
		LCALL 	39CH 			//018C 	339C

		//;MAIN.C: 256: setState(1, 12);
		LDWI 	CH 			//018D 	2A0C
		STR 	72H 			//018E 	01F2
		LDWI 	1H 			//018F 	2A01
		CLRR 	73H 			//0190 	0173
		LCALL 	3E5H 			//0191 	33E5

		//;MAIN.C: 260: tmp = 0;
		CLRR 	56H 			//0192 	0156

		//;MAIN.C: 264: idop = get_RFID();
		LCALL 	BH 			//0193 	300B
		ORG		0194H
		STR 	57H 			//0194 	01D7

		//;MAIN.C: 266: if (idop) {
		LDR 	57H,0 			//0195 	0857
		BTSC 	STATUS,2 		//0196 	1503
		LJUMP 	208H 			//0197 	3A08

		//;MAIN.C: 267: idop = id_search(keyID, buffTag);
		LDWI 	25H 			//0198 	2A25
		STR 	7AH 			//0199 	01FA
		LDWI 	5DH 			//019A 	2A5D
		LCALL 	35AH 			//019B 	335A
		ORG		019CH
		STR 	57H 			//019C 	01D7

		//;MAIN.C: 268: switch (mtState) {
		LJUMP 	1F1H 			//019D 	39F1

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
		LCALL 	3E5H 			//01A9 	33E5

		//;MAIN.C: 275: }
		LJUMP 	1FCH 			//01AA 	39FC

		//;MAIN.C: 276: else if (idop == 1)
		DECRSZ 	57H,0 		//01AB 	0E57
		ORG		01ACH
		LJUMP 	1FCH 			//01AC 	39FC

		//;MAIN.C: 277: {
		//;MAIN.C: 279: id_clear(2, 5);
		LDWI 	5H 			//01AD 	2A05
		STR 	42H 			//01AE 	01C2
		LDWI 	2H 			//01AF 	2A02
		LCALL 	2A5H 			//01B0 	32A5
		LDWI 	3H 			//01B1 	2A03

		//;MAIN.C: 280: setState(3, 0);
		CLRR 	72H 			//01B2 	0172
		CLRR 	73H 			//01B3 	0173
		ORG		01B4H
		LCALL 	3E5H 			//01B4 	33E5

		//;MAIN.C: 281: tmp = 1;
		CLRR 	56H 			//01B5 	0156
		INCR	56H,1 			//01B6 	09D6
		LJUMP 	1FCH 			//01B7 	39FC

		//;MAIN.C: 297: if (idop == 1 && idState == 0) {
		DECRSZ 	57H,0 		//01B8 	0E57
		LJUMP 	1BDH 			//01B9 	39BD
		LDR 	55H,1 			//01BA 	08D5
		BTSC 	STATUS,2 		//01BB 	1503
		ORG		01BCH
		LJUMP 	1ADH 			//01BC 	39AD

		//;MAIN.C: 300: setState(3, 0);
		//;MAIN.C: 299: id_clear(2, 5);
		//;MAIN.C: 309: else if (idop == 2 && idState == 0) {
		LDR 	57H,0 			//01BD 	0857
		XORWI 	2H 			//01BE 	2602
		BTSS 	STATUS,2 		//01BF 	1D03
		LJUMP 	1FCH 			//01C0 	39FC
		LDR 	55H,1 			//01C1 	08D5
		BTSS 	STATUS,2 		//01C2 	1D03
		LJUMP 	1FCH 			//01C3 	39FC
		ORG		01C4H

		//;MAIN.C: 311: id_clear(3, 5);
		LDWI 	5H 			//01C4 	2A05
		STR 	42H 			//01C5 	01C2
		LDWI 	3H 			//01C6 	2A03
		LCALL 	2A5H 			//01C7 	32A5
		LDWI 	5H 			//01C8 	2A05

		//;MAIN.C: 312: setState(5, 0);
		CLRR 	72H 			//01C9 	0172
		CLRR 	73H 			//01CA 	0173
		LCALL 	3E5H 			//01CB 	33E5
		ORG		01CCH

		//;MAIN.C: 313: tmp = 2;
		LDWI 	2H 			//01CC 	2A02
		STR 	56H 			//01CD 	01D6
		LJUMP 	1FCH 			//01CE 	39FC

		//;MAIN.C: 324: if (idState == 0) {
		LDR 	55H,1 			//01CF 	08D5
		BTSS 	STATUS,2 		//01D0 	1D03
		LJUMP 	1FCH 			//01D1 	39FC

		//;MAIN.C: 331: if ( idop != 1) {
		DECR 	57H,0 			//01D2 	0D57
		BTSC 	STATUS,2 		//01D3 	1503
		ORG		01D4H
		LJUMP 	1FCH 			//01D4 	39FC
		LDWI 	6H 			//01D5 	2A06

		//;MAIN.C: 332: tmp++;
		INCR	56H,1 			//01D6 	09D6

		//;MAIN.C: 334: if (tmp <= 5) {
		SUBWR 	56H,0 			//01D7 	0C56
		BTSC 	STATUS,0 		//01D8 	1403
		LJUMP 	1FCH 			//01D9 	39FC

		//;MAIN.C: 335: id_replate(tmp, keyID, buffTag);
		LDWI 	5DH 			//01DA 	2A5D
		STR 	3EH 			//01DB 	01BE
		ORG		01DCH
		LDWI 	25H 			//01DC 	2A25
		STR 	3FH 			//01DD 	01BF
		LDR 	56H,0 			//01DE 	0856
		LCALL 	249H 			//01DF 	3249

		//;MAIN.C: 336: timeTick = 0;
		BCR 	STATUS,5 		//01E0 	1283
		CLRR 	5AH 			//01E1 	015A
		CLRR 	5BH 			//01E2 	015B
		LJUMP 	1FCH 			//01E3 	39FC
		ORG		01E4H

		//;MAIN.C: 359: if (idState == 0) {
		LDR 	55H,1 			//01E4 	08D5
		BTSS 	STATUS,2 		//01E5 	1D03
		LJUMP 	1FCH 			//01E6 	39FC

		//;MAIN.C: 360: if ( idop > 2) {
		LDWI 	3H 			//01E7 	2A03
		SUBWR 	57H,0 			//01E8 	0C57
		BTSS 	STATUS,0 		//01E9 	1C03
		LJUMP 	1FCH 			//01EA 	39FC
		LDWI 	6H 			//01EB 	2A06
		ORG		01ECH

		//;MAIN.C: 361: tmp++;
		INCR	56H,1 			//01EC 	09D6

		//;MAIN.C: 363: if (tmp <= 5) {
		SUBWR 	56H,0 			//01ED 	0C56
		BTSC 	STATUS,0 		//01EE 	1403
		LJUMP 	1FCH 			//01EF 	39FC
		LJUMP 	1DAH 			//01F0 	39DA

		//;MAIN.C: 364: id_replate(tmp, keyID, buffTag);
		LDR 	5CH,0 			//01F1 	085C
		STR 	FSR 			//01F2 	0184
		LDWI 	7H 			//01F3 	2A07
		ORG		01F4H
		SUBWR 	FSR,0 			//01F4 	0C04
		BTSC 	STATUS,0 		//01F5 	1403
		LJUMP 	1FCH 			//01F6 	39FC
		LDWI 	4H 			//01F7 	2A04
		STR 	PCLATH 			//01F8 	018A
		LDWI 	0H 			//01F9 	2A00
		ADDWR 	FSR,0 			//01FA 	0B04
		STR 	PCL 			//01FB 	0182
		ORG		01FCH
		LDWI 	9FH 			//01FC 	2A9F

		//;MAIN.C: 389: idState = 1;
		CLRR 	55H 			//01FD 	0155
		INCR	55H,1 			//01FE 	09D5

		//;MAIN.C: 390: _delay((unsigned long)((61)*(8000000/4000.0)));
		STR 	53H 			//01FF 	01D3
		LDWI 	6FH 			//0200 	2A6F
		STR 	52H 			//0201 	01D2
		DECRSZ 	52H,1 		//0202 	0ED2
		LJUMP 	202H 			//0203 	3A02
		ORG		0204H
		DECRSZ 	53H,1 		//0204 	0ED3
		LJUMP 	202H 			//0205 	3A02
		LJUMP 	207H 			//0206 	3A07

		//;MAIN.C: 391: }
		LJUMP 	215H 			//0207 	3A15
		LDWI 	2H 			//0208 	2A02

		//;MAIN.C: 392: else {
		//;MAIN.C: 393: idState = 0;
		CLRR 	55H 			//0209 	0155

		//;MAIN.C: 394: _delay((unsigned long)((150)*(8000000/4000.0)));
		STR 	54H 			//020A 	01D4
		LDWI 	86H 			//020B 	2A86
		ORG		020CH
		STR 	53H 			//020C 	01D3
		LDWI 	99H 			//020D 	2A99
		STR 	52H 			//020E 	01D2
		DECRSZ 	52H,1 		//020F 	0ED2
		LJUMP 	20FH 			//0210 	3A0F
		DECRSZ 	53H,1 		//0211 	0ED3
		LJUMP 	20FH 			//0212 	3A0F
		DECRSZ 	54H,1 		//0213 	0ED4
		ORG		0214H
		LJUMP 	20FH 			//0214 	3A0F

		//;MAIN.C: 395: }
		//;MAIN.C: 399: if ((timeOut != 0) && ( timeTick > timeOut)) {
		BCR 	STATUS,5 		//0215 	1283
		LDR 	59H,0 			//0216 	0859
		IORWR 	58H,0 			//0217 	0358
		BTSC 	STATUS,2 		//0218 	1503
		LJUMP 	23FH 			//0219 	3A3F
		LDR 	5BH,0 			//021A 	085B
		SUBWR 	59H,0 			//021B 	0C59
		ORG		021CH
		BTSS 	STATUS,2 		//021C 	1D03
		LJUMP 	220H 			//021D 	3A20
		LDR 	5AH,0 			//021E 	085A
		SUBWR 	58H,0 			//021F 	0C58
		BTSS 	STATUS,0 		//0220 	1C03
		LJUMP 	234H 			//0221 	3A34
		LJUMP 	23FH 			//0222 	3A3F

		//;MAIN.C: 404: setState(2, 60);
		LDWI 	3CH 			//0223 	2A3C
		ORG		0224H
		STR 	72H 			//0224 	01F2
		LDWI 	2H 			//0225 	2A02
		CLRR 	73H 			//0226 	0173
		LCALL 	3E5H 			//0227 	33E5

		//;MAIN.C: 406: break;
		LJUMP 	23FH 			//0228 	3A3F

		//;MAIN.C: 408: setState(6, 7);
		LDWI 	7H 			//0229 	2A07
		STR 	72H 			//022A 	01F2
		LDWI 	6H 			//022B 	2A06
		ORG		022CH
		CLRR 	73H 			//022C 	0173
		LCALL 	3E5H 			//022D 	33E5

		//;MAIN.C: 409: break;
		LJUMP 	23FH 			//022E 	3A3F
		LDWI 	2H 			//022F 	2A02

		//;MAIN.C: 411: setState(2, 0);
		CLRR 	72H 			//0230 	0172
		CLRR 	73H 			//0231 	0173
		LCALL 	3E5H 			//0232 	33E5

		//;MAIN.C: 414: break;
		LJUMP 	23FH 			//0233 	3A3F
		ORG		0234H
		LDR 	5CH,0 			//0234 	085C
		XORWI 	1H 			//0235 	2601
		BTSC 	STATUS,2 		//0236 	1503
		LJUMP 	223H 			//0237 	3A23
		XORWI 	3H 			//0238 	2603
		BTSC 	STATUS,2 		//0239 	1503
		LJUMP 	229H 			//023A 	3A29
		XORWI 	4H 			//023B 	2604
		ORG		023CH
		BTSC 	STATUS,2 		//023C 	1503
		LJUMP 	22FH 			//023D 	3A2F
		LJUMP 	23FH 			//023E 	3A3F

		//;MAIN.C: 417: }
		//;MAIN.C: 420: if (mtState == 0) RA3 = 1;
		LDR 	5CH,1 			//023F 	08DC
		BTSS 	STATUS,2 		//0240 	1D03
		LJUMP 	244H 			//0241 	3A44
		BSR 	5H,3 			//0242 	1985
		LJUMP 	245H 			//0243 	3A45
		ORG		0244H

		//;MAIN.C: 421: else RA3 = 0;
		BCR 	5H,3 			//0244 	1185

		//;MAIN.C: 471: timeTick++;
		INCR	5AH,1 			//0245 	09DA
		BTSC 	STATUS,2 		//0246 	1503
		INCR	5BH,1 			//0247 	09DB
		LJUMP 	193H 			//0248 	3993
		STR 	7BH 			//0249 	01FB

		//;MAIN.C: 168: id = (id - 1) * 5;
		LDWI 	5H 			//024A 	2A05
		STR 	72H 			//024B 	01F2
		ORG		024CH
		LDR 	7BH,0 			//024C 	087B
		ADDWI 	FFH 			//024D 	27FF
		LCALL 	3CBH 			//024E 	33CB
		STR 	7BH 			//024F 	01FB

		//;MAIN.C: 169: {
		//;MAIN.C: 170: {
		//;MAIN.C: 171: *(buff + id) = *Cont;
		LDR 	3EH,0 			//0250 	083E
		STR 	FSR 			//0251 	0184
		BCR 	STATUS,7 		//0252 	1383
		LDR 	INDF,0 			//0253 	0800
		ORG		0254H
		STR 	40H 			//0254 	01C0
		LDR 	7BH,0 			//0255 	087B
		ADDWR 	3FH,0 			//0256 	0B3F
		STR 	41H 			//0257 	01C1
		STR 	FSR 			//0258 	0184
		LDR 	40H,0 			//0259 	0840
		STR 	INDF 			//025A 	0180

		//;MAIN.C: 172: *(buff + 1 + id) = *(Cont + 1);
		LDR 	3EH,0 			//025B 	083E
		ORG		025CH
		ADDWI 	1H 			//025C 	2701
		LCALL 	27DH 			//025D 	327D
		ADDWI 	1H 			//025E 	2701
		STR 	FSR 			//025F 	0184
		LDR 	40H,0 			//0260 	0840
		STR 	INDF 			//0261 	0180

		//;MAIN.C: 173: *(buff + 2 + id) = *(Cont + 2);
		LDR 	3EH,0 			//0262 	083E
		ADDWI 	2H 			//0263 	2702
		ORG		0264H
		LCALL 	27DH 			//0264 	327D
		ADDWI 	2H 			//0265 	2702
		STR 	FSR 			//0266 	0184
		LDR 	40H,0 			//0267 	0840
		STR 	INDF 			//0268 	0180

		//;MAIN.C: 174: *(buff + 3 + id) = *(Cont + 3);
		LDR 	3EH,0 			//0269 	083E
		ADDWI 	3H 			//026A 	2703
		LCALL 	27DH 			//026B 	327D
		ORG		026CH
		ADDWI 	3H 			//026C 	2703
		STR 	FSR 			//026D 	0184
		LDR 	40H,0 			//026E 	0840
		STR 	INDF 			//026F 	0180

		//;MAIN.C: 175: *(buff + 4 + id) = *(Cont + 4);
		LDR 	3EH,0 			//0270 	083E
		ADDWI 	4H 			//0271 	2704
		LCALL 	27DH 			//0272 	327D
		ADDWI 	4H 			//0273 	2704
		ORG		0274H
		STR 	FSR 			//0274 	0184
		LDR 	40H,0 			//0275 	0840
		STR 	INDF 			//0276 	0180

		//;MAIN.C: 176: }
		//;MAIN.C: 177: }
		//;MAIN.C: 179: eepromWriteBlock(0x06, buffTag, 25);
		LDWI 	25H 			//0277 	2A25
		STR 	76H 			//0278 	01F6
		LDWI 	19H 			//0279 	2A19
		STR 	77H 			//027A 	01F7
		LDWI 	6H 			//027B 	2A06
		ORG		027CH
		LJUMP 	38AH 			//027C 	3B8A
		STR 	FSR 			//027D 	0184
		LDR 	INDF,0 			//027E 	0800
		STR 	40H 			//027F 	01C0
		LDR 	7BH,0 			//0280 	087B
		ADDWR 	3FH,0 			//0281 	0B3F
		STR 	41H 			//0282 	01C1
		RET		 					//0283 	0004
		ORG		0284H
		STR 	75H 			//0284 	01F5

		//;ms82_eeprom.c: 27: GIE = 0;
		BCR 	INTCON,7 		//0285 	138B

		//;ms82_eeprom.c: 29: {
		//;ms82_eeprom.c: 30: while(GIE) asm("clrwdt");
		BTSS 	INTCON,7 		//0286 	1F8B
		LJUMP 	28AH 			//0287 	3A8A
		CLRWDT	 			//0288 	0001
		LJUMP 	286H 			//0289 	3A86

		//;ms82_eeprom.c: 31: EEADR = EEAddr;
		LDR 	75H,0 			//028A 	0875
		BSR 	STATUS,5 		//028B 	1A83
		ORG		028CH
		STR 	1BH 			//028C 	019B

		//;ms82_eeprom.c: 32: EEDAT = EEData;
		LDR 	72H,0 			//028D 	0872
		STR 	1AH 			//028E 	019A
		LDWI 	34H 			//028F 	2A34

		//;ms82_eeprom.c: 33: EEIF = 0;
		BCR 	STATUS,5 		//0290 	1283
		BCR 	CH,7 			//0291 	138C

		//;ms82_eeprom.c: 34: EECON1 = 0x34;
		BSR 	STATUS,5 		//0292 	1A83
		STR 	1CH 			//0293 	019C
		ORG		0294H

		//;ms82_eeprom.c: 35: WR = 1;
		BSR 	1DH,0 			//0294 	181D

		//;ms82_eeprom.c: 36: while(WR) asm("clrwdt");
		BSR 	STATUS,5 		//0295 	1A83
		BTSS 	1DH,0 			//0296 	1C1D
		LJUMP 	29AH 			//0297 	3A9A
		CLRWDT	 			//0298 	0001
		LJUMP 	295H 			//0299 	3A95

		//;ms82_eeprom.c: 37: _delay((unsigned long)((2)*(8000000/4000.0)));
		LDWI 	6H 			//029A 	2A06
		STR 	74H 			//029B 	01F4
		ORG		029CH
		LDWI 	30H 			//029C 	2A30
		STR 	73H 			//029D 	01F3
		DECRSZ 	73H,1 		//029E 	0EF3
		LJUMP 	29EH 			//029F 	3A9E
		DECRSZ 	74H,1 		//02A0 	0EF4
		LJUMP 	29EH 			//02A1 	3A9E
		CLRWDT	 			//02A2 	0001

		//;ms82_eeprom.c: 38: }
		//;ms82_eeprom.c: 39: GIE = 1;
		BSR 	INTCON,7 		//02A3 	1B8B
		ORG		02A4H
		RET		 					//02A4 	0004
		STR 	48H 			//02A5 	01C8

		//;MAIN.C: 182: unsigned char tmp[5] = {0xff, 0xff, 0xff, 0xff, 0xff};
		LDWI 	43H 			//02A6 	2A43
		STR 	FSR 			//02A7 	0184
		LDR 	20H,0 			//02A8 	0820
		BCR 	STATUS,7 		//02A9 	1383
		STR 	INDF 			//02AA 	0180
		INCR	FSR,1 			//02AB 	0984
		ORG		02ACH
		LDR 	21H,0 			//02AC 	0821
		STR 	INDF 			//02AD 	0180
		INCR	FSR,1 			//02AE 	0984
		LDR 	22H,0 			//02AF 	0822
		STR 	INDF 			//02B0 	0180
		INCR	FSR,1 			//02B1 	0984
		LDR 	23H,0 			//02B2 	0823
		STR 	INDF 			//02B3 	0180
		ORG		02B4H
		INCR	FSR,1 			//02B4 	0984
		LDR 	24H,0 			//02B5 	0824
		STR 	INDF 			//02B6 	0180
		LDR 	48H,0 			//02B7 	0848
		SUBWR 	42H,0 			//02B8 	0C42
		BTSS 	STATUS,0 		//02B9 	1C03
		RET		 					//02BA 	0004

		//;MAIN.C: 184: id_replate(idMin, tmp, buffTag);
		LDWI 	43H 			//02BB 	2A43
		ORG		02BCH
		STR 	3EH 			//02BC 	01BE
		LDWI 	25H 			//02BD 	2A25
		STR 	3FH 			//02BE 	01BF
		LDR 	48H,0 			//02BF 	0848
		LCALL 	249H 			//02C0 	3249
		BCR 	STATUS,5 		//02C1 	1283
		INCR	48H,1 			//02C2 	09C8
		LJUMP 	2B7H 			//02C3 	3AB7
		ORG		02C4H

		//;ms82_pwm.c: 12: TRISC |= 0B00100000;
		BSR 	7H,5 			//02C4 	1A87

		//;ms82_pwm.c: 13: T2CON0 = 0B00000001;
		LDWI 	1H 			//02C5 	2A01
		BCR 	STATUS,5 		//02C6 	1283
		STR 	12H 			//02C7 	0192

		//;ms82_pwm.c: 14: T2CON1 = 0B00000000;
		BSR 	STATUS,5 		//02C8 	1A83
		CLRR 	1EH 			//02C9 	011E

		//;ms82_pwm.c: 15: PR2H = 0;
		CLRR 	12H 			//02CA 	0112

		//;ms82_pwm.c: 16: PR2L = 7;
		LDWI 	7H 			//02CB 	2A07
		ORG		02CCH
		STR 	11H 			//02CC 	0191

		//;ms82_pwm.c: 17: P1ADTH = 0;
		BCR 	STATUS,5 		//02CD 	1283
		CLRR 	14H 			//02CE 	0114

		//;ms82_pwm.c: 18: P1ADTL = 4;
		LDWI 	4H 			//02CF 	2A04
		STR 	EH 			//02D0 	018E

		//;ms82_pwm.c: 20: P1OE = 0B00000001;
		LDWI 	1H 			//02D1 	2A01
		BSR 	STATUS,5 		//02D2 	1A83
		STR 	10H 			//02D3 	0190
		ORG		02D4H

		//;ms82_pwm.c: 21: P1POL = 0B00000000;
		CLRR 	19H 			//02D4 	0119

		//;ms82_pwm.c: 22: P1CON = 0B00000000;
		BCR 	STATUS,5 		//02D5 	1283
		CLRR 	16H 			//02D6 	0116

		//;ms82_pwm.c: 24: TMR2H = 0;
		CLRR 	13H 			//02D7 	0113

		//;ms82_pwm.c: 25: TMR2L = 0;
		CLRR 	11H 			//02D8 	0111

		//;ms82_pwm.c: 26: TMR2IF = 0;
		BCR 	CH,1 			//02D9 	108C

		//;ms82_pwm.c: 27: TMR2ON = 1;
		BSR 	12H,2 			//02DA 	1912

		//;ms82_pwm.c: 28: while(TMR2IF==0) asm("clrwdt");
		BCR 	STATUS,5 		//02DB 	1283
		ORG		02DCH
		BTSC 	CH,1 			//02DC 	148C
		LJUMP 	2E0H 			//02DD 	3AE0
		CLRWDT	 			//02DE 	0001
		LJUMP 	2DBH 			//02DF 	3ADB

		//;ms82_pwm.c: 29: TRISC &= 0B11011111;
		BSR 	STATUS,5 		//02E0 	1A83
		BCR 	7H,5 			//02E1 	1287
		RET		 					//02E2 	0004
		STR 	74H 			//02E3 	01F4
		ORG		02E4H

		//;rfid125.c: 7: unsigned int CurTimer;
		//;rfid125.c: 8: T0ON = 0;
		BCR 	1FH,3 			//02E4 	119F

		//;rfid125.c: 9: TMR0 = 0;
		CLRR 	1H 			//02E5 	0101

		//;rfid125.c: 10: T0IF = 0;
		BCR 	INTCON,2 		//02E6 	110B

		//;rfid125.c: 11: T0ON = 1;
		BSR 	1FH,3 			//02E7 	199F

		//;rfid125.c: 12: while(RA5==Logic){
		LDWI 	0H 			//02E8 	2A00
		BTSC 	5H,5 			//02E9 	1685
		LDWI 	1H 			//02EA 	2A01
		XORWR 	74H,0 			//02EB 	0474
		ORG		02ECH
		BTSS 	STATUS,2 		//02EC 	1D03
		LJUMP 	2FDH 			//02ED 	3AFD

		//;rfid125.c: 13: CurTimer= (0 <<8 )| TMR0;
		CLRR 	75H 			//02EE 	0175
		CLRR 	76H 			//02EF 	0176
		LDR 	1H,0 			//02F0 	0801
		IORWR 	75H,1 			//02F1 	03F5

		//;rfid125.c: 14: if(CurTimer>time)
		LDR 	76H,0 			//02F2 	0876
		SUBWR 	73H,0 			//02F3 	0C73
		ORG		02F4H
		BTSS 	STATUS,2 		//02F4 	1D03
		LJUMP 	2F8H 			//02F5 	3AF8
		LDR 	75H,0 			//02F6 	0875
		SUBWR 	72H,0 			//02F7 	0C72
		BTSC 	STATUS,0 		//02F8 	1403
		LJUMP 	2E8H 			//02F9 	3AE8

		//;rfid125.c: 15: return 0;
		CLRR 	72H 			//02FA 	0172
		CLRR 	73H 			//02FB 	0173
		ORG		02FCH
		RET		 					//02FC 	0004

		//;rfid125.c: 16: }
		//;rfid125.c: 17: return CurTimer;
		LDR 	76H,0 			//02FD 	0876
		STR 	73H 			//02FE 	01F3
		LDR 	75H,0 			//02FF 	0875
		STR 	72H 			//0300 	01F2
		RET		 					//0301 	0004
		STR 	78H 			//0302 	01F8

		//;ms82_eeprom.c: 53: unsigned char i;
		//;ms82_eeprom.c: 55: if(len1!=len2)
		LDR 	73H,0 			//0303 	0873
		ORG		0304H
		XORWR 	74H,0 			//0304 	0474
		BTSS 	STATUS,2 		//0305 	1D03

		//;ms82_eeprom.c: 56: return 0;
		RETW 	0H 			//0306 	2100

		//;ms82_eeprom.c: 57: else{
		//;ms82_eeprom.c: 58: for(i=0;i<len1;i++){
		CLRR 	79H 			//0307 	0179
		LDR 	73H,0 			//0308 	0873
		SUBWR 	79H,0 			//0309 	0C79

		//;ms82_eeprom.c: 59: if(*(arr1+i) != *(arr2+i)){
		LDR 	79H,0 			//030A 	0879
		BTSC 	STATUS,0 		//030B 	1403
		ORG		030CH
		LJUMP 	31DH 			//030C 	3B1D
		ADDWR 	72H,0 			//030D 	0B72
		STR 	75H 			//030E 	01F5
		STR 	FSR 			//030F 	0184
		BCR 	STATUS,7 		//0310 	1383
		LDR 	INDF,0 			//0311 	0800
		STR 	76H 			//0312 	01F6
		LDR 	79H,0 			//0313 	0879
		ORG		0314H
		ADDWR 	78H,0 			//0314 	0B78
		STR 	77H 			//0315 	01F7
		STR 	FSR 			//0316 	0184
		LDR 	INDF,0 			//0317 	0800
		XORWR 	76H,0 			//0318 	0476
		BTSS 	STATUS,2 		//0319 	1D03
		RETW 	0H 			//031A 	2100
		INCR	79H,1 			//031B 	09F9
		ORG		031CH
		LJUMP 	308H 			//031C 	3B08

		//;ms82_eeprom.c: 61: }
		//;ms82_eeprom.c: 62: }
		//;ms82_eeprom.c: 63: if(i==len1)
		XORWR 	73H,0 			//031D 	0473
		BTSC 	STATUS,2 		//031E 	1503

		//;ms82_eeprom.c: 64: return 1;
		RETW 	1H 			//031F 	2101
		RETW 	0H 			//0320 	2100
		RETW 	FFH 			//0321 	21FF
		RETW 	FFH 			//0322 	21FF
		RETW 	FFH 			//0323 	21FF
		ORG		0324H
		RETW 	FFH 			//0324 	21FF
		RETW 	FFH 			//0325 	21FF
		RETW 	0H 			//0326 	2100
		RETW 	0H 			//0327 	2100
		RETW 	11H 			//0328 	2111
		RETW 	BH 			//0329 	210B
		RETW 	4FH 			//032A 	214F
		RETW 	0H 			//032B 	2100
		ORG		032CH
		RETW 	0H 			//032C 	2100
		RETW 	81H 			//032D 	2181
		RETW 	2FH 			//032E 	212F
		RETW 	22H 			//032F 	2122
		RETW 	0H 			//0330 	2100
		RETW 	0H 			//0331 	2100
		RETW 	7DH 			//0332 	217D
		RETW 	67H 			//0333 	2167
		ORG		0334H
		RETW 	5H 			//0334 	2105
		RETW 	0H 			//0335 	2100
		RETW 	0H 			//0336 	2100
		RETW 	7EH 			//0337 	217E
		RETW 	31H 			//0338 	2131
		RETW 	E7H 			//0339 	21E7
		RETW 	0H 			//033A 	2100
		RETW 	0H 			//033B 	2100
		ORG		033CH
		RETW 	7EH 			//033C 	217E
		RETW 	51H 			//033D 	2151
		RETW 	E6H 			//033E 	21E6
		STR 	73H 			//033F 	01F3
		CLRR 	75H 			//0340 	0175
		LDR 	72H,0 			//0341 	0872
		BTSC 	STATUS,2 		//0342 	1503
		LJUMP 	358H 			//0343 	3B58
		ORG		0344H
		CLRR 	74H 			//0344 	0174
		INCR	74H,1 			//0345 	09F4
		BTSC 	72H,7 			//0346 	17F2
		LJUMP 	34BH 			//0347 	3B4B
		BCR 	STATUS,0 		//0348 	1003
		RLR 	72H,1 			//0349 	05F2
		LJUMP 	345H 			//034A 	3B45
		BCR 	STATUS,0 		//034B 	1003
		ORG		034CH
		RLR 	75H,1 			//034C 	05F5
		LDR 	72H,0 			//034D 	0872
		SUBWR 	73H,0 			//034E 	0C73
		BTSS 	STATUS,0 		//034F 	1C03
		LJUMP 	355H 			//0350 	3B55
		LDR 	72H,0 			//0351 	0872
		SUBWR 	73H,1 			//0352 	0CF3
		BSR 	75H,0 			//0353 	1875
		ORG		0354H
		BCR 	STATUS,0 		//0354 	1003
		RRR	72H,1 			//0355 	06F2
		DECRSZ 	74H,1 		//0356 	0EF4
		LJUMP 	34BH 			//0357 	3B4B
		LDR 	75H,0 			//0358 	0875
		RET		 					//0359 	0004
		STR 	3EH 			//035A 	01BE

		//;MAIN.C: 160: unsigned char i;
		//;MAIN.C: 161: for (i = 0; i < 21; i += 5) {
		CLRR 	3FH 			//035B 	013F
		ORG		035CH

		//;MAIN.C: 162: if (comArr(id_input, buff + i, 5, 5))
		LDR 	3FH,0 			//035C 	083F
		ADDWR 	7AH,0 			//035D 	0B7A
		STR 	72H 			//035E 	01F2
		LDWI 	5H 			//035F 	2A05
		STR 	73H 			//0360 	01F3
		STR 	74H 			//0361 	01F4
		LDR 	3EH,0 			//0362 	083E
		LCALL 	302H 			//0363 	3302
		ORG		0364H
		XORWI 	0H 			//0364 	2600

		//;MAIN.C: 163: return i / 5 + 1;
		LDWI 	5H 			//0365 	2A05
		BTSC 	STATUS,2 		//0366 	1503
		LJUMP 	36EH 			//0367 	3B6E
		STR 	72H 			//0368 	01F2
		LDR 	3FH,0 			//0369 	083F
		LCALL 	33FH 			//036A 	333F
		STR 	7BH 			//036B 	01FB
		ORG		036CH
		INCR	7BH,0 			//036C 	097B
		RET		 					//036D 	0004
		ADDWR 	3FH,1 			//036E 	0BBF
		LDWI 	15H 			//036F 	2A15
		SUBWR 	3FH,0 			//0370 	0C3F
		BTSC 	STATUS,0 		//0371 	1403

		//;MAIN.C: 164: }
		//;MAIN.C: 165: return 255;
		RETW 	FFH 			//0372 	21FF
		LJUMP 	35CH 			//0373 	3B5C
		ORG		0374H
		LDWI 	3EH 			//0374 	2A3E
		CLRR 	58H 			//0375 	0158
		CLRR 	59H 			//0376 	0159
		CLRR 	5AH 			//0377 	015A
		CLRR 	5BH 			//0378 	015B
		CLRR 	5CH 			//0379 	015C
		CLRR 	5DH 			//037A 	015D
		CLRR 	5EH 			//037B 	015E
		ORG		037CH
		CLRR 	5FH 			//037C 	015F
		CLRR 	60H 			//037D 	0160
		CLRR 	61H 			//037E 	0161
		BCR 	STATUS,7 		//037F 	1383
		STR 	7DH 			//0380 	01FD
		LDWI 	3H 			//0381 	2A03
		STR 	7EH 			//0382 	01FE
		LDWI 	21H 			//0383 	2A21
		ORG		0384H
		STR 	7FH 			//0384 	01FF
		LDWI 	20H 			//0385 	2A20
		STR 	FSR 			//0386 	0184
		LCALL 	3B1H 			//0387 	33B1
		CLRR 	STATUS 			//0388 	0103
		LJUMP 	155H 			//0389 	3955
		STR 	79H 			//038A 	01F9

		//;ms82_eeprom.c: 44: unsigned char i;
		//;ms82_eeprom.c: 45: for(i=0;i<len;i++){
		CLRR 	7AH 			//038B 	017A
		ORG		038CH
		LDR 	77H,0 			//038C 	0877
		SUBWR 	7AH,0 			//038D 	0C7A
		BTSC 	STATUS,0 		//038E 	1403
		RET		 					//038F 	0004

		//;ms82_eeprom.c: 46: eepromWriteByte(addStart+i,buff[i]);
		LDR 	7AH,0 			//0390 	087A
		ADDWR 	76H,0 			//0391 	0B76
		STR 	78H 			//0392 	01F8
		STR 	FSR 			//0393 	0184
		ORG		0394H
		BCR 	STATUS,7 		//0394 	1383
		LDR 	INDF,0 			//0395 	0800
		STR 	72H 			//0396 	01F2
		LDR 	7AH,0 			//0397 	087A
		ADDWR 	79H,0 			//0398 	0B79
		LCALL 	284H 			//0399 	3284
		INCR	7AH,1 			//039A 	09FA
		LJUMP 	38CH 			//039B 	3B8C
		ORG		039CH
		STR 	77H 			//039C 	01F7

		//;ms82_eeprom.c: 19: unsigned char i;
		//;ms82_eeprom.c: 20: for(i=0;i<len;i++){
		CLRR 	78H 			//039D 	0178
		LDR 	75H,0 			//039E 	0875
		SUBWR 	78H,0 			//039F 	0C78
		BTSC 	STATUS,0 		//03A0 	1403
		RET		 					//03A1 	0004

		//;ms82_eeprom.c: 21: buff[i] = eepromReadByte(addStart+i);
		LDR 	78H,0 			//03A2 	0878
		ADDWR 	74H,0 			//03A3 	0B74
		ORG		03A4H
		STR 	76H 			//03A4 	01F6
		STR 	FSR 			//03A5 	0184
		LDR 	78H,0 			//03A6 	0878
		ADDWR 	77H,0 			//03A7 	0B77
		LCALL 	3F7H 			//03A8 	33F7
		BCR 	STATUS,7 		//03A9 	1383
		STR 	INDF 			//03AA 	0180
		INCR	78H,1 			//03AB 	09F8
		ORG		03ACH
		LJUMP 	39EH 			//03AC 	3B9E
		LDR 	7EH,0 			//03AD 	087E
		STR 	PCLATH 			//03AE 	018A
		LDR 	7FH,0 			//03AF 	087F
		STR 	PCL 			//03B0 	0182
		LCALL 	3ADH 			//03B1 	33AD
		STR 	INDF 			//03B2 	0180
		INCR	FSR,1 			//03B3 	0984
		ORG		03B4H
		LDR 	FSR,0 			//03B4 	0804
		XORWR 	7DH,0 			//03B5 	047D
		BTSC 	STATUS,2 		//03B6 	1503
		RETW 	0H 			//03B7 	2100
		INCR	7FH,1 			//03B8 	09FF
		BTSC 	STATUS,2 		//03B9 	1503
		INCR	7EH,1 			//03BA 	09FE
		LJUMP 	3B1H 			//03BB 	3BB1
		ORG		03BCH

		//;sysinit.c: 34: PORTA = 0B00000000;
		BCR 	STATUS,5 		//03BC 	1283
		CLRR 	5H 			//03BD 	0105

		//;sysinit.c: 35: TRISA = 0B01110011;
		LDWI 	73H 			//03BE 	2A73
		BSR 	STATUS,5 		//03BF 	1A83
		STR 	5H 			//03C0 	0185

		//;sysinit.c: 36: WPUA = 0B10000000;
		LDWI 	80H 			//03C1 	2A80
		STR 	15H 			//03C2 	0195

		//;sysinit.c: 37: PORTC = 0B00000010;
		LDWI 	2H 			//03C3 	2A02
		ORG		03C4H
		BCR 	STATUS,5 		//03C4 	1283
		STR 	7H 			//03C5 	0187

		//;sysinit.c: 38: TRISC = 0B11111110;
		LDWI 	FEH 			//03C6 	2AFE
		BSR 	STATUS,5 		//03C7 	1A83
		STR 	7H 			//03C8 	0187

		//;sysinit.c: 39: WPUC = 0B00000000;
		CLRR 	13H 			//03C9 	0113
		RET		 					//03CA 	0004
		STR 	74H 			//03CB 	01F4
		ORG		03CCH
		CLRR 	73H 			//03CC 	0173
		LDR 	72H,0 			//03CD 	0872
		BTSC 	74H,0 			//03CE 	1474
		ADDWR 	73H,1 			//03CF 	0BF3
		BCR 	STATUS,0 		//03D0 	1003
		RLR 	72H,1 			//03D1 	05F2
		BCR 	STATUS,0 		//03D2 	1003
		RRR	74H,1 			//03D3 	06F4
		ORG		03D4H
		LDR 	74H,1 			//03D4 	08F4
		BTSS 	STATUS,2 		//03D5 	1D03
		LJUMP 	3CDH 			//03D6 	3BCD
		LDR 	73H,0 			//03D7 	0873
		RET		 					//03D8 	0004

		//;sysinit.c: 72: INTCON = 0B00000000;
		CLRR 	INTCON 			//03D9 	010B

		//;sysinit.c: 73: PIE1 = 0B00000000;
		CLRR 	CH 			//03DA 	010C

		//;sysinit.c: 74: PIR1 = 0B00000000;
		BCR 	STATUS,5 		//03DB 	1283
		ORG		03DCH
		CLRR 	CH 			//03DC 	010C

		//;sysinit.c: 87: T0IF = 0;
		BCR 	INTCON,2 		//03DD 	110B

		//;sysinit.c: 88: T0IE = 0;
		BCR 	INTCON,5 		//03DE 	128B

		//;sysinit.c: 92: TMR2IF = 0;
		BCR 	CH,1 			//03DF 	108C

		//;sysinit.c: 93: TMR2IE = 1;
		BSR 	STATUS,5 		//03E0 	1A83
		BSR 	CH,1 			//03E1 	188C

		//;sysinit.c: 99: PEIE = 0;
		BCR 	INTCON,6 		//03E2 	130B

		//;sysinit.c: 101: GIE = 1;
		BSR 	INTCON,7 		//03E3 	1B8B
		ORG		03E4H
		RET		 					//03E4 	0004
		STR 	74H 			//03E5 	01F4

		//;MAIN.C: 154: mtState = stt;
		BCR 	STATUS,5 		//03E6 	1283
		STR 	5CH 			//03E7 	01DC

		//;MAIN.C: 155: timeTick = 0;
		CLRR 	5AH 			//03E8 	015A
		CLRR 	5BH 			//03E9 	015B

		//;MAIN.C: 156: timeOut = _tOut;
		LDR 	73H,0 			//03EA 	0873
		STR 	59H 			//03EB 	01D9
		ORG		03ECH
		LDR 	72H,0 			//03EC 	0872
		STR 	58H 			//03ED 	01D8
		RET		 					//03EE 	0004

		//;sysinit.c: 21: OSCCON = 0B01100001;
		LDWI 	61H 			//03EF 	2A61
		BSR 	STATUS,5 		//03F0 	1A83
		STR 	FH 			//03F1 	018F

		//;sysinit.c: 22: _nop();
		NOP		 					//03F2 	0000

		//;sysinit.c: 28: while(HTS==0);
		BSR 	STATUS,5 		//03F3 	1A83
		ORG		03F4H
		BTSC 	FH,2 			//03F4 	150F
		RET		 					//03F5 	0004
		LJUMP 	3F3H 			//03F6 	3BF3
		STR 	72H 			//03F7 	01F2

		//;ms82_eeprom.c: 8: unsigned char ReEepromData;
		//;ms82_eeprom.c: 10: EEADR = EEAddr;
		BSR 	STATUS,5 		//03F8 	1A83
		STR 	1BH 			//03F9 	019B

		//;ms82_eeprom.c: 11: RD = 1;
		BSR 	1CH,0 			//03FA 	181C

		//;ms82_eeprom.c: 12: ReEepromData = EEDAT;
		LDR 	1AH,0 			//03FB 	081A
		ORG		03FCH
		STR 	73H 			//03FC 	01F3

		//;ms82_eeprom.c: 13: RD = 0;
		BCR 	1CH,0 			//03FD 	101C

		//;ms82_eeprom.c: 14: return ReEepromData;
		RET		 					//03FE 	0004
		ORG		0400H
		LJUMP 	1FCH 			//0400 	39FC
		LJUMP 	19EH 			//0401 	399E
		LJUMP 	19EH 			//0402 	399E
		LJUMP 	1CFH 			//0403 	39CF
		LJUMP 	1FCH 			//0404 	39FC
		LJUMP 	1E4H 			//0405 	39E4
		LJUMP 	1B8H 			//0406 	39B8
		LDR 	71H,0 			//0407 	0871
		ORG		0408H
		STR 	PCLATH 			//0408 	018A
		SWAPR 	70H,0 			//0409 	0770
		STR 	STATUS 			//040A 	0183
		SWAPR 	7EH,1 			//040B 	07FE
		SWAPR 	7EH,0 			//040C 	077E
		RETI		 			//040D 	0009

		//;sysinit.c: 46: OPTION = 0B00000011;
		LDWI 	3H 			//040E 	2A03
		STR 	1H 			//040F 	0181
		ORG		0410H
		RET		 					//0410 	0004
			END
