LDmicro0.2
MICRO=Microchip PIC16F887 40-PDIP
CYCLE=5000 us at Timer1, YPlcCycleDuty:0, ConfigurationWord(s):0x38A082CB00003F72
CRYSTAL=16000000 Hz
BAUD=9600 Hz, RATE=0 Hz, SPEED=0 Hz
COMPILED=G:\PCB CHINA JLCPCB\Mini PLC\Analog x2 Mini PLC.hex
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
    1 bytes #PORTE
    1 bytes #TRISB 	Now not used !!!
    1 bytes #TRISC 	Now not used !!!
    1 bytes #TRISD
    1 bytes #TRISE
    1 bytes #TRISe 	Now not used !!!
    2 bytes 489 	Now not used !!!
    1 bytes 50 	Now not used !!!
    2 bytes 500 	Now not used !!!
    2 bytes 511
    2 bytes 512
    2 bytes Buffer0 	Now not used !!!
    2 bytes Buffer1 	Now not used !!!
    1 bytes C0 	Now not used !!!
    2 bytes CCO 	Now not used !!!
    1 bytes CO 	Now not used !!!
    2 bytes Cnew 	Now not used !!!
    2 bytes Dezena
    2 bytes PORTC 	Now not used !!!
    1 bytes T0 	Now not used !!!
    1 bytes T1 	Now not used !!!
    2 bytes T1s
    1 bytes T5m
    2 bytes Temp 	Now not used !!!
    2 bytes Tnew 	Now not used !!!
    2 bytes Unidade
    2 bytes Valor
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
    Yc0 at 15 0 0
    Yd7 at 30 0 0
    Ye0 at 8 0 0
    Ye1 at 9 0 0
    AAN0 at 2 0 0
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
  TCY T1s 3000000 0
  PARALLEL
    READ_ADC AAN0 0
    COIL R3s 0 0 0 0
  END
END
RUNG 4
  PIECEWISE_LINEAR Valor AAN0 3 0 0 511 25 1023 50 Lin
END
RUNG 5
  DIV Dezena Valor 10
END
RUNG 6
  MOD Unidade Valor 10
END
RUNG 7
  CONTACTS RDigito 1 0
  7SEGMENTS #PORTD Dezena A
  PARALLEL
    COIL Ye0 1 0 0 0
    COIL Yd7 1 0 0 0
    COIL Ye0 0 0 0 0
  END
END
RUNG 8
  CONTACTS RDigito 0 0
  7SEGMENTS #PORTD Unidade A
  PARALLEL
    COIL Ye1 1 0 0 0
    COIL Ye1 0 0 0 0
  END
END
RUNG 9
  UART_RECV_AVAIL
  PARALLEL
    UART_RECV char 1 0
    FORMATTED_STRING var value:\x20\\3\\r\\n
  END
END
RUNG 10
  CONTACTS R3s 0 0
  PARALLEL
    SERIES
      LEQ Valor 9
      FORMATTED_STRING Valor n0.val=\\1\\xff\\xff\\xff
    END
    SERIES
      GEQ Valor 10
      FORMATTED_STRING Valor n0.val=\\2\\xff\\xff\\xff
    END
  END
END
RUNG 11
  EQU char '0'
  COIL Yc0 0 1 0 0
END
RUNG 12
  EQU char '1'
  COIL Yc0 0 0 1 0
END
