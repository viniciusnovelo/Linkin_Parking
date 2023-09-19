LDmicro0.2
MICRO=Microchip PIC16F887 40-PDIP
CYCLE=5000 us at Timer1, YPlcCycleDuty:0, ConfigurationWord(s):0x9B76BACE00003F72
CRYSTAL=16000000 Hz
BAUD=9600 Hz, RATE=0 Hz, SPEED=0 Hz
COMPILED=G:\PCB CHINA JLCPCB\Mini PLC\LDMicro\lm35 Mini PLC control.hex
COMPILER=IHEX

PULL-UP LIST
    RA: 0xFF 
    RB: 0x0 
    RC: 0xFF 
    RD: 0xFF 
    RE: 0xFF 
END

VAR LIST
    1 bytes #PORTB 	Now not used !!!
    1 bytes #PORTC 	Now not used !!!
    1 bytes #PORTD
    1 bytes #PORTE 	Now not used !!!
    1 bytes #TRISB 	Now not used !!!
    1 bytes #TRISC 	Now not used !!!
    1 bytes #TRISD
    1 bytes #TRISE
    1 bytes #TRISe 	Now not used !!!
    2 bytes 140 	Now not used !!!
    2 bytes 150 	Now not used !!!
    2 bytes 153 	Now not used !!!
    2 bytes 154 	Now not used !!!
    2 bytes 165 	Now not used !!!
    2 bytes 180 	Now not used !!!
    2 bytes 185 	Now not used !!!
    2 bytes 190
    2 bytes 195 	Now not used !!!
    2 bytes 489 	Now not used !!!
    1 bytes 50 	Now not used !!!
    2 bytes 500 	Now not used !!!
    2 bytes 511
    2 bytes 512
    2 bytes AANO 	Now not used !!!
    2 bytes AANO_ANALOG 	Now not used !!!
    2 bytes AN2 	Now not used !!!
    2 bytes Buffer0 	Now not used !!!
    2 bytes Buffer1 	Now not used !!!
    1 bytes C0 	Now not used !!!
    2 bytes CCO 	Now not used !!!
    1 bytes CO 	Now not used !!!
    1 bytes Ccount2 	Now not used !!!
    1 bytes Ccount3
    2 bytes Cnew 	Now not used !!!
    2 bytes Control
    2 bytes Dezena
    2 bytes PORTC 	Now not used !!!
    2 bytes Setuo 	Now not used !!!
    2 bytes Setup
    1 bytes T0 	Now not used !!!
    1 bytes T1 	Now not used !!!
    2 bytes T1s
    1 bytes T5m
    2 bytes TEmp 	Now not used !!!
    2 bytes TTon5s
    2 bytes TTon5s1
    2 bytes Temp
    2 bytes Temp-5 	Now not used !!!
    2 bytes Tnew 	Now not used !!!
    2 bytes Ttof5s 	Now not used !!!
    2 bytes Unidade
    2 bytes Valor 	Now not used !!!
    2 bytes Variavel 	Now not used !!!
    2 bytes buf0 	Now not used !!!
    2 bytes buf1 	Now not used !!!
    2 bytes buf2 	Now not used !!!
    2 bytes buf3 	Now not used !!!
    2 bytes buf4 	Now not used !!!
    2 bytes buffer0 	Now not used !!!
    2 bytes buffer1 	Now not used !!!
    2 bytes char
  129 bytes char7seg
    1 bytes char7seg[0]
    2 bytes chr 	Now not used !!!
    2 bytes dest 	Now not used !!!
    2 bytes index 	Now not used !!!
    2 bytes reg0 	Now not used !!!
    2 bytes reg1 	Now not used !!!
    2 bytes reg2 	Now not used !!!
    2 bytes reg3 	Now not used !!!
    2 bytes reg4 	Now not used !!!
    2 bytes reg5 	Now not used !!!
    2 bytes reg6 	Now not used !!!
    2 bytes src 	Now not used !!!
    2 bytes tabName 	Now not used !!!
    2 bytes tabName[0] 	Now not used !!!
    2 bytes xvar 	Now not used !!!
    2 bytes yvar 	Now not used !!!
END

IO LIST
    Xb0 at 33 0 0
    Xb2 at 35 0 0
    Xb4 at 37 0 0
    Yc0 at 15 0 0
    Yc2 at 17 0 0
    Ye0 at 8 0 0
    Ye1 at 9 0 0
    AAN0 at 2 0 0
    AAN2 at 4 0 0
END

PROGRAM
RUNG 1
  PARALLEL
    MOVE #TRISD 0x00
    MOVE #TRISE 0x00
  END
END
RUNG 2
  TCY T5m 5000 0
  COIL RDigito 0 0 0 0
END
RUNG 3
  READ_ADC AAN0 0
END
RUNG 4
  READ_ADC AAN2 0
END
RUNG 5
  TCY T1s 1000000 0
  CTU Ccount3 3 0 /
  PARALLEL
    COIL R3s 0 0 0 0
    RES Ccount3
  END
END
RUNG 6
  PIECEWISE_LINEAR Temp AAN2 3 0 0 190 75 380 150 Lin
END
RUNG 7
  PIECEWISE_LINEAR Setup AAN0 3 0 0 511 50 1023 99 Lin
END
RUNG 8
  CONTACTS R3s 0 0
  CONTACTS Xb4 1 0
  PARALLEL
    DIV Dezena Temp 10
    MOD Unidade Temp 10
  END
END
RUNG 9
  CONTACTS Xb4 0 0
  PARALLEL
    DIV Dezena Setup 10
    MOD Unidade Setup 10
  END
END
RUNG 10
  CONTACTS RDigito 1 0
  7SEGMENTS #PORTD Dezena A
  PARALLEL
    COIL Ye0 1 0 0 0
    COIL Ye0 0 0 0 0
  END
END
RUNG 11
  CONTACTS RDigito 0 0
  7SEGMENTS #PORTD Unidade A
  PARALLEL
    COIL Ye1 1 0 0 0
    COIL Ye1 0 0 0 0
  END
END
RUNG 12
  LES Temp Setup
  TON TTon5s1 2000000 0
  PARALLEL
    COIL Yc0 0 1 0 0
    COIL Yc2 0 1 0 0
  END
END
RUNG 13
  ADD Control Temp 1
END
RUNG 14
  GRT Control Setup
  TON TTon5s 2000000 0
  PARALLEL
    COIL Yc0 0 0 1 0
    COIL Yc2 0 0 1 0
  END
END
RUNG 15
  UART_RECV_AVAIL
  UART_RECV char 1 0
END
RUNG 16
  CONTACTS R3s 0 0
  PARALLEL
    SERIES
      LEQ Temp 9
      FORMATTED_STRING Temp n0.val=\\1\\xff\\xff\\xff
    END
    SERIES
      GEQ Temp 10
      FORMATTED_STRING Temp n0.val=\\2\\xff\\xff\\xff
    END
  END
END
RUNG 17
  EQU char '0'
  COIL Yc0 0 1 0 0
END
RUNG 18
  EQU char '1'
  COIL Yc0 0 0 1 0
END
RUNG 19
  CONTACTS Xb2 0 0
  COIL Yc2 0 1 0 0
END
RUNG 20
  CONTACTS Xb0 0 0
  COIL Yc2 0 0 1 0
END
