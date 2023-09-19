/*
PINOUT:
RC522 MODULE    Uno/Nano     MEGA
SDA             D10          D9
SCK             D13          D52
MOSI            D11          D51
MISO            D12          D50
IRQ             N/A          N/A
GND             GND          GND
RST             D9           D8
3.3V            3.3V         3.3V
*/
/* Include the standard Arduino SPI library */
#include <SPI.h>
/* Include the RFID library */
#include <RFID.h>

/* Define the DIO used for the SDA (SS) and RST (reset) pins. */
#define SDA_DIO 9
#define RESET_DIO 8
/* Create an instance of the RFID library */
RFID RC522(SDA_DIO, RESET_DIO); 

void setup()
{ 
  Serial.begin(9600);
  /* Enable the SPI interface */
  SPI.begin(); 
  /* Initialise the RFID reader */
  RC522.init();
  pinMode(4,OUTPUT);
  pinMode(3,OUTPUT);
  pinMode(2,OUTPUT);
  analogWrite(4,0);
  analogWrite(3,0);
  analogWrite(2,0);
}
void loop()
{
  /* Has a card been detected? */
  if (RC522.isCard())
  {
    /* If so then get its serial number */
    RC522.readCardSerial();
    Serial.println("Card detected:");
    /*for(int i=0;i<5;i++)
    {
    //Serial.print(RC522.serNum[i],DEC);
    /*Serial.print(RC522.serNum[i],HEX); //to print card detail in Hexa Decimal format
    
      if(RC522.serNum[0] == 1 && RC522.serNum[1] == 185){
        digitalWrite(13,!digitalRead(13)); 
      }
    }*/
    Serial.print("UID da tag :");
    String conteudo= "";
    for (byte i = 0; i < 4; i++) 
    {
       Serial.print(RC522.serNum[i] < 0x10 ? " 0" : " ");
       Serial.print(RC522.serNum[i], HEX);
       conteudo.concat(String(RC522.serNum[i] < 0x10 ? " 0" : " "));
       conteudo.concat(String(RC522.serNum[i], HEX));
    }
    conteudo.toUpperCase();
    if (conteudo.substring(1) == "01 B9 95 1C"){
      for(int j=0;j<256;j++){
        analogWrite(4,0);
        analogWrite(3,j);
        analogWrite(2,0);
        delay(5);
      }
    }else{
      for(int j=0;j<3;j++){
       analogWrite(4,0);
       analogWrite(3,0);
       analogWrite(2,0);
       delay(200);
       analogWrite(2,255);
       delay(200);
      }
    }
   /* Serial.println();
    for(int i=1;i<=11;i++){
      Serial.print((char)RC522.readMFRC522(i));
    }    
    */
    Serial.println();
    Serial.println();
  }
  delay(1000);
}
