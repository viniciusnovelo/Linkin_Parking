LDmicro0.2
MICRO=Microchip PIC16F887 40-PDIP
CYCLE=10000 us at Timer1, YPlcCycleDuty:0, ConfigurationWord(s):0x22300BD060023E2
CRYSTAL=16000000 Hz
BAUD=9600 Hz, RATE=1000000 Hz, SPEED=100000 Hz
COMPILED=K:\PCB CHINA JLCPCB\Mini PLC\LDMicro\b3.hex
COMPILER=IHEX

PULL-UP LIST
    RA: 0xFF 
    RB: 0x0 
    RC: 0xFF 
    RD: 0xFF 
    RE: 0xFF 
END

VAR LIST
    1 bytes 50 	Now not used !!!
    2 bytes 511 	Now not used !!!
    2 bytes 512 	Now not used !!!
    2 bytes AAN0 	Now not used !!!
    1 bytes T1 	Now not used !!!
    2 bytes Temp 	Now not used !!!
    2 bytes Tnew 	Now not used !!!
    2 bytes dest 	Now not used !!!
    2 bytes var 	Now not used !!!
    2 bytes xvar 	Now not used !!!
    2 bytes yvar 	Now not used !!!
END

IO LIST
    Xb0 at 33 0 0
    Xb3 at 36 0 0
    Yc0 at 15 0 0
    Ye2 at 10 0 0
END

PROGRAM
RUNG 1
  CONTACTS Xb3 0 0
  PARALLEL
    COIL Yc0 0 1 0 0
    COIL Ye2 0 0 1 0
  END
END
RUNG 2
  CONTACTS Xb0 0 0
  PARALLEL
    COIL Yc0 0 0 1 0
    COIL Ye2 0 1 0 0
  END
END
