;/* This is auto-generated ASM code from LDmicro. Do not edit this file!
;   Go back to the LDmicro ladder diagram source for changes in the ladder logic. */
; PIC16F887 is the LDmicro target processor.
	LIST    p=PIC16F887
#include P16F887.inc
	__CONFIG 0x2007, 0x23E2
	__CONFIG 0x2008, 0x600
	radix dec
	org 0
;TABSIZE = 8
;	CODE
    ; Reset vector
i_000000: clrf	 0x03            	  ; (OP_CLRF, REG_STATUS)
i_000001: clrf	 0x0A            	  ; (OP_CLRF, REG_PCLATH)
          nop	 		 	  ; (OP_NOP_, 0, 0)
    ; GOTO progStart
i_000003: goto	 l_000008	 	  ; (OP_GOTO, progStart)
    ; Interrupt Vector
i_000004: retfie	 	 	  ; (OP_RETFIE, 0, 0)
          nop	 		 	  ; (OP_NOP_, 0, 0)
          nop	 		 	  ; (OP_NOP_, 0, 0)
          nop	 		 	  ; (OP_NOP_, 0, 0)
    ; Program Start
    ; Configure Timer1
l_000008: clrwdt	 	 	  ; (OP_CLRWDT)
          movlw	 0x88             	  ; (REG_CCPR1L, (BYTE)(plcTmr.tmr & 0xff)) ; 0x88
          movwf	 0x15            	  ; (REG_CCPR1L, (BYTE)(plcTmr.tmr & 0xff)) ; 0x15
          movlw	 0x13             	  ; (REG_CCPR1H, (BYTE)(plcTmr.tmr >> 8)) ; 0x13
          movwf	 0x16            	  ; (REG_CCPR1H, (BYTE)(plcTmr.tmr >> 8)) ; 0x16
          movlw	 0x00             	  ; (REG_TMR1L, 0) ; 0x0
          movwf	 0x0E            	  ; (REG_TMR1L, 0) ; 0xE
          movlw	 0x00             	  ; (REG_TMR1H, 0) ; 0x0
          movwf	 0x0F            	  ; (REG_TMR1H, 0) ; 0xF
          movlw	 0x31             	  ; (REG_T1CON, plcTmr.PS) ; 0x31
          movwf	 0x10            	  ; (REG_T1CON, plcTmr.PS) ; 0x10
          movlw	 0x0B             	  ; (REG_CCP1CON, ccp1con) ; 0xB
          movwf	 0x17            	  ; (REG_CCP1CON, ccp1con) ; 0x17
    ; Now zero out the RAM
          movlw	 0x5F             	  ; (OP_MOVLW, Prog.mcu()->ram[i].len - 1)
          movwf	 0x20            	  ; (OP_MOVWF, Prog.mcu()->ram[i].start & ~BankMask())
          movlw	 0x21             	  ; (OP_MOVLW, (Prog.mcu()->ram[i].start + 1) & ~BankMask())
          movwf	 0x04            	  ; (OP_MOVWF, REG_FSR)
l_000019: clrf	 0x00            	  ; (OP_CLRF, REG_INDF)
          incf	 0x04            , 1	  ; (OP_INCF, REG_FSR, DEST_F)
          decfsz 0x20            , 1	  ; (OP_DECFSZ, Prog.mcu()->ram[i].start & ~BankMask(), DEST_F)
          goto	 l_000019	 	  ; (OP_GOTO, zeroMem)
          bsf	 0x03            , 5	  ;  BS(0x00,0x188) ; (OP_BSF, REG_STATUS, STATUS_RP0)
          bsf	 0x03            , 6	  ;  BS(0x00,0x188) ; (OP_BSF, REG_STATUS, STATUS_RP1)
    ; Set up the ANSELx registers. 1-analog input, 0-digital I/O.
          clrf	 0x08            	  ; (OP_CLRF, REG_ANSEL)
          clrf	 0x09            	  ; (OP_CLRF, REG_ANSELH)
          bcf	 0x03            , 5	  ;  BS(0x180,0x05) ; (OP_BCF, REG_STATUS, STATUS_RP0)
          bcf	 0x03            , 6	  ;  BS(0x180,0x05) ; (OP_BCF, REG_STATUS, STATUS_RP1)
    ; Set up the TRISx registers (direction). 1-tri-stated (input), 0-output and drive the outputs low to start
          movlw	 0x00             	  ; (Prog.mcu()->outputRegs[i], 0x00) ; 0x0
          movwf	 0x05            	  ; (Prog.mcu()->outputRegs[i], 0x00) ; 0x5
          movlw	 0x00             	  ; (Prog.mcu()->outputRegs[i], 0x00) ; 0x0
          movwf	 0x06            	  ; (Prog.mcu()->outputRegs[i], 0x00) ; 0x6
          movlw	 0x00             	  ; (Prog.mcu()->outputRegs[i], 0x00) ; 0x0
          movwf	 0x07            	  ; (Prog.mcu()->outputRegs[i], 0x00) ; 0x7
          movlw	 0x00             	  ; (Prog.mcu()->outputRegs[i], 0x00) ; 0x0
          movwf	 0x08            	  ; (Prog.mcu()->outputRegs[i], 0x00) ; 0x8
          movlw	 0x00             	  ; (Prog.mcu()->outputRegs[i], 0x00) ; 0x0
          movwf	 0x09            	  ; (Prog.mcu()->outputRegs[i], 0x00) ; 0x9
          bsf	 0x03            , 5	  ;  BS(0x00,0x85) ; (OP_BSF, REG_STATUS, STATUS_RP0)
          movlw	 0xDF             	  ; (Prog.mcu()->dirRegs[i], ~isOutput[i]) ; 0xDF
          movwf	 0x05            	  ; (Prog.mcu()->dirRegs[i], ~isOutput[i]) ; 0x85
          movlw	 0xFF             	  ; (Prog.mcu()->dirRegs[i], ~isOutput[i]) ; 0xFF
          movwf	 0x06            	  ; (Prog.mcu()->dirRegs[i], ~isOutput[i]) ; 0x86
          movlw	 0xFF             	  ; (Prog.mcu()->dirRegs[i], ~isOutput[i]) ; 0xFF
          movwf	 0x07            	  ; (Prog.mcu()->dirRegs[i], ~isOutput[i]) ; 0x87
          movlw	 0xFF             	  ; (Prog.mcu()->dirRegs[i], ~isOutput[i]) ; 0xFF
          movwf	 0x08            	  ; (Prog.mcu()->dirRegs[i], ~isOutput[i]) ; 0x88
          movlw	 0xFF             	  ; (Prog.mcu()->dirRegs[i], ~isOutput[i]) ; 0xFF
          movwf	 0x09            	  ; (Prog.mcu()->dirRegs[i], ~isOutput[i]) ; 0x89
l_000038: bcf	 0x03            , 5	  ;  BS(0x80,0x0C) ; (OP_BCF, REG_STATUS, STATUS_RP0)
    ; Begin Of PLC Cycle
          btfsc	 0x0C            , 2	  ; (OP_BTFSC, addrSrc, bitSrc, nameSrc)
          bsf	 0x20            , 3	  ; (OP_BSF, addrDest, bitDest, nameDest) ; $Y_INTCON_T0IF
          btfss	 0x0C            , 2	  ; (OP_BTFSS, addrSrc, bitSrc, nameSrc)
          bcf	 0x20            , 3	  ; (OP_BCF, addrDest, bitDest, nameDest) ; $Y_INTCON_T0IF
l_00003d: btfss	 0x0C            , 2	  ; (OP_BTFSS, REG_PIR1, CCP1IF)
          goto	 l_00003d	 	  ; (OP_GOTO, PicProgWriteP - 1)
          bcf	 0x0C            , 2	  ; (OP_BCF, REG_PIR1, CCP1IF)
    ; Watchdog reset
          clrwdt	 	 	  ; (OP_CLRWDT)
    ; INIT TABLES
    ; 
    ; ======= START RUNG 1 =======
    ; INT_SET_BIT $rung_top
          bsf	 0x20            , 0	  ; (OP_BSF, addr1, bit1, a->name1) ; $rung_top
    ; start series [
    ; start parallel [
    ; INT_CLEAR_BIT $parOut_0
          bcf	 0x20            , 1	  ; (OP_BCF, addr1, bit1, a->name1) ; $parOut_0
    ; INT_COPY_BIT_TO_BIT $parThis_0:=$rung_top
          btfsc	 0x20            , 0	  ; (OP_BTFSC, addrSrc, bitSrc, nameSrc)
          bsf	 0x20            , 2	  ; (OP_BSF, addrDest, bitDest, nameDest)
          btfss	 0x20            , 0	  ; (OP_BTFSS, addrSrc, bitSrc, nameSrc)
          bcf	 0x20            , 2	  ; (OP_BCF, addrDest, bitDest, nameDest)
    ; ELEM_CONTACTS
    ; INT_IF_BIT_CLEAR Xb1
          btfsc	 0x06            , 1	  ; (OP_BTFSC, addr1, bit1, a->name1) ; Xb1
          goto	 l_00004a	 	  ; (OP_GOTO, condFalse)
    ; INT_CLEAR_BIT $parThis_0
          bcf	 0x20            , 2	  ; (OP_BCF, addr1, bit1, a->name1) ; $parThis_0
    ; INT_IF_BIT_SET $parThis_0
l_00004a: btfss	 0x20            , 2	  ; (OP_BTFSS, addr1, bit1, a->name1) ; $parThis_0
          goto	 l_00004d	 	  ; (OP_GOTO, condFalse)
    ; INT_SET_BIT $parOut_0
          bsf	 0x20            , 1	  ; (OP_BSF, addr1, bit1, a->name1) ; $parOut_0
    ; INT_COPY_BIT_TO_BIT $parThis_0:=$rung_top
l_00004d: btfsc	 0x20            , 0	  ; (OP_BTFSC, addrSrc, bitSrc, nameSrc)
          bsf	 0x20            , 2	  ; (OP_BSF, addrDest, bitDest, nameDest)
          btfss	 0x20            , 0	  ; (OP_BTFSS, addrSrc, bitSrc, nameSrc)
          bcf	 0x20            , 2	  ; (OP_BCF, addrDest, bitDest, nameDest)
    ; ELEM_CONTACTS
    ; INT_IF_BIT_CLEAR Ya5
          btfsc	 0x05            , 5	  ; (OP_BTFSC, addr1, bit1, a->name1) ; Ya5
          goto	 l_000054	 	  ; (OP_GOTO, condFalse)
    ; INT_CLEAR_BIT $parThis_0
          bcf	 0x20            , 2	  ; (OP_BCF, addr1, bit1, a->name1) ; $parThis_0
    ; INT_IF_BIT_SET $parThis_0
l_000054: btfss	 0x20            , 2	  ; (OP_BTFSS, addr1, bit1, a->name1) ; $parThis_0
          goto	 l_000057	 	  ; (OP_GOTO, condFalse)
    ; INT_SET_BIT $parOut_0
          bsf	 0x20            , 1	  ; (OP_BSF, addr1, bit1, a->name1) ; $parOut_0
    ; INT_COPY_BIT_TO_BIT $rung_top:=$parOut_0
l_000057: btfsc	 0x20            , 1	  ; (OP_BTFSC, addrSrc, bitSrc, nameSrc)
          bsf	 0x20            , 0	  ; (OP_BSF, addrDest, bitDest, nameDest)
          btfss	 0x20            , 1	  ; (OP_BTFSS, addrSrc, bitSrc, nameSrc)
          bcf	 0x20            , 0	  ; (OP_BCF, addrDest, bitDest, nameDest)
    ; ] finish parallel
    ; ELEM_CONTACTS
    ; INT_IF_BIT_SET Xb0
          btfss	 0x06            , 0	  ; (OP_BTFSS, addr1, bit1, a->name1) ; Xb0
          goto	 l_00005e	 	  ; (OP_GOTO, condFalse)
    ; INT_CLEAR_BIT $rung_top
          bcf	 0x20            , 0	  ; (OP_BCF, addr1, bit1, a->name1) ; $rung_top
    ; ELEM_COIL
    ; INT_COPY_BIT_TO_BIT Ya5:=$rung_top
l_00005e: bcf	 0x03            , 1	  ; (OP_BCF, 0x03, 1, "STATUS_DC") ; STATUS_DC
          btfsc	 0x20            , 0	  ; (OP_BTFSC, addrSrc, bitSrc, nameSrc)
          bsf	 0x03            , 1	  ; (OP_BSF, 0x03, 1)
          btfsc	 0x03            , 1	  ; (OP_BTFSC, 0x03, 1, "STATUS_DC") ; STATUS_DC
          bsf	 0x05            , 5	  ; (OP_BSF, addrDest, bitDest, nameDest)
          btfss	 0x03            , 1	  ; (OP_BTFSS, 0x03, 1, "STATUS_DC") ; STATUS_DC
          bcf	 0x05            , 5	  ; (OP_BCF, addrDest, bitDest, nameDest)
    ; ] finish series
    ; Latest INT_OP here
    ; GOTO next PLC cycle
i_000065: goto	 l_000038	 	  ; (OP_GOTO, BeginOfPLCCycle)
l_000066: goto	 l_000066	 	  ; (OP_GOTO, PicProgWriteP)
	END

;|  # | Name                                                    | Size      | Address      | Bit # |
;|Variables: 5

;|Internal Relays: 4
;|  0 | $rung_top                                         	|   1 bit   | 0x0020       | 0     |
;|  1 | $parOut_0                                         	|   1 bit   | 0x0020       | 1     |
;|  2 | $parThis_0                                        	|   1 bit   | 0x0020       | 2     |
;|  3 | $Y_INTCON_T0IF                                    	|   1 bit   | 0x0020       | 3     |

