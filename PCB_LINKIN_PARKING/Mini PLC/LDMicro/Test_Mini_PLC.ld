LDmicro0.2
MICRO=Microchip PIC16F887 40-PDIP
CYCLE=2000 us at Timer1, YPlcCycleDuty:0, ConfigurationWord(s):0x609B6D71060023E2
CRYSTAL=16000000 Hz
BAUD=9600 Hz, RATE=1000000 Hz, SPEED=100000 Hz
COMPILED=G:\PCB CHINA JLCPCB\Mini PLC\Test_Mini_PLC.hex
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
    1 bytes T10m 	Now not used !!!
    2 bytes T1s
    2 bytes T1sa
    1 bytes T20m 	Now not used !!!
    1 bytes T2m
    1 bytes T5m 	Now not used !!!
    2 bytes Tnew 	Now not used !!!
  129 bytes char7seg
    1 bytes char7seg[0]
    2 bytes dest 	Now not used !!!
    2 bytes dez
    2 bytes src 	Now not used !!!
    2 bytes uni
END

IO LIST
    Xb0 at 33 0 0
    Xb1 at 34 0 0
    Ya5 at 7 0 0
    Yc0 at 15 0 0
    Yc1 at 16 0 0
    Yc2 at 17 0 0
    Yd0 at 19 0 0
    Yd1 at 20 0 0
    Yd2 at 21 0 0
    Yd3 at 22 0 0
    Yd4 at 27 0 0
    Yd5 at 28 0 0
    Yd6 at 29 0 0
    Yd7 at 30 0 0
    Ye0 at 8 0 0
    Ye1 at 9 0 0
END

PROGRAM
RUNG 1
  TCY T1s 1000000 0
  OPEN
  PARALLEL
    COIL Yc0 0 0 0 0
    COIL Yc2 0 0 0 0
    COIL Ya5 0 0 0 0
    COIL Ya5 0 0 0 0
    COIL Yc1 0 0 0 0
  END
END
RUNG 2
  TCY T1sa 1000000 0
  OPEN
  PARALLEL
    COIL Yd0 0 0 0 0
    COIL Yd1 0 0 0 0
    COIL Yd2 0 0 0 0
    COIL Yd3 0 0 0 0
    COIL Yd4 0 0 0 0
    COIL Yd5 0 0 0 0
    COIL Yd6 0 0 0 0
    COIL Yd7 0 0 0 0
  END
END
RUNG 3
  PARALLEL
    SERIES
      OPEN
      COIL Ye0 0 0 0 0
    END
    SERIES
      OPEN
      COIL Ye1 0 0 0 0
    END
  END
END
RUNG 4
  MOVE uni 4
END
RUNG 5
  MOVE dez 5
END
RUNG 6
  MOVE #TRISD 0x00
END
RUNG 7
  CONTACTS R20m 1 0
  7SEGMENTS #PORTD uni A
  PARALLEL
    COIL Ye0 0 0 0 0
    COIL Ye0 1 0 0 0
  END
END
RUNG 8
  CONTACTS R20m 0 0
  7SEGMENTS #PORTD dez A
  PARALLEL
    COIL Ye1 0 0 0 0
    COIL Ye1 1 0 0 0
  END
END
RUNG 9
  TCY T2m 10000 0
  COIL R20m 0 0 0 0
END
RUNG 10
  PARALLEL
    CONTACTS Xb1 0 0
    CONTACTS Ya5 0 0
  END
  CONTACTS Xb0 1 0
  COIL Ya5 0 0 0 0
END
