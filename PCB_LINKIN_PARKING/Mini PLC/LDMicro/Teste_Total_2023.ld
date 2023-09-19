LDmicro0.2
MICRO=Microchip PIC16F887 40-PDIP
CYCLE=1000 us at Timer1, YPlcCycleDuty:0, ConfigurationWord(s):0x2E1EF33F060023E2
CRYSTAL=16000000 Hz
BAUD=9600 Hz, RATE=1000000 Hz, SPEED=100000 Hz
COMPILED=K:\PCB CHINA JLCPCB\Mini PLC\LDMicro\Teste_Total_2023.hex
COMPILER=IHEX

PULL-UP LIST
    RA: 0xFF 
    RB: 0x0 
    RC: 0xFF 
    RD: 0xFF 
    RE: 0xFF 
END

VAR LIST
    1 bytes #PORTD
    1 bytes #TRISD
    1 bytes #TRISE
    1 bytes 50 	Now not used !!!
    2 bytes 511 	Now not used !!!
    2 bytes 512 	Now not used !!!
    2 bytes AAN0 	Now not used !!!
    2 bytes NUMER
    2 bytes PORTD 	Now not used !!!
    1 bytes T1 	Now not used !!!
    1 bytes T10m
    2 bytes T1s
    2 bytes Temp 	Now not used !!!
    2 bytes Tnew 	Now not used !!!
  129 bytes char7seg
    1 bytes char7seg[0]
    2 bytes dest 	Now not used !!!
    2 bytes duty_cycle 	Now not used !!!
    2 bytes src 	Now not used !!!
    2 bytes var 	Now not used !!!
    2 bytes xvar 	Now not used !!!
    2 bytes yvar 	Now not used !!!
END

IO LIST
    Xb0 at 33 0 0
    Xb1 at 34 0 0
    Xb2 at 35 0 0
    Xb3 at 36 0 0
    Xb4 at 37 0 0
    Xb5 at 38 0 0
    Yc0 at 15 0 0
    Ye0 at 8 0 0
    Ye1 at 9 0 0
    Ye2 at 10 0 0
END

PROGRAM
RUNG 1
  MOVE #TRISD 0x00
END
RUNG 2
  MOVE #TRISE 0x00
END
RUNG 3
  MOVE NUMER 0x00
END
RUNG 4
  CONTACTS Xb0 0 0
  COIL Ye2 0 0 0 0
END
RUNG 5
  CONTACTS Xb1 0 0
  COIL Ye2 0 0 0 0
END
RUNG 6
  CONTACTS Xb2 0 0
  COIL Ye2 0 0 0 0
END
RUNG 7
  CONTACTS Xb3 0 0
  COIL Ye2 0 0 0 0
END
RUNG 8
  CONTACTS Xb4 0 0
  COIL Ye2 0 0 0 0
END
RUNG 9
  CONTACTS Xb5 0 0
  COIL Ye2 0 0 0 0
END
RUNG 10
  TCY T10m 10000 0
  COIL R10m 0 0 0 0
END
RUNG 11
  CONTACTS R10m 1 0
  7SEGMENTS #PORTD NUMER A
  PARALLEL
    COIL Ye0 1 0 0 0
    COIL Ye0 0 0 0 0
  END
END
RUNG 12
  CONTACTS R10m 0 0
  7SEGMENTS #PORTD NUMER A
  PARALLEL
    COIL Ye1 0 0 0 0
    COIL Ye1 0 0 0 0
  END
END
RUNG 13
  TCY T1s 1000000 0
  COIL Yc0 0 0 0 0
END
