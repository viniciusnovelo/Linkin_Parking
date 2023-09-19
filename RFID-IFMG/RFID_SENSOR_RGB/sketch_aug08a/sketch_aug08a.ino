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

#include <Servo.h>
Servno myservo1;  // Cria um objeto baseado na biblioteca Servo
Servo myservo2;  // Cria um objeto baseado na biblioteca Servo


void setup() {
  //RGB 1
  pinMode(22, OUTPUT);//R#
  pinMode(24, OUTPUT);//G#
  pinMode(26, OUTPUT);//B#
  pinMode(45, INPUT);//sensor 1 
  //RGB 2
  pinMode(28, OUTPUT);//R#
  pinMode(30, OUTPUT);//G#
  pinMode(32, OUTPUT);//B#
  pinMode(47, INPUT);//sensor 2
  //RGB 3
  pinMode(36, OUTPUT);//R#
  pinMode(38, OUTPUT);//G#
  pinMode(40, OUTPUT);//B#
  pinMode(49, INPUT);//sensor 3
  //RGB 4
  pinMode(23, OUTPUT);//R#
  pinMode(25, OUTPUT);//G
  pinMode(27, OUTPUT);//B
  pinMode(44, INPUT);//sensor 4
  //RGB 5
  pinMode(29, OUTPUT);//R# 
  pinMode(31, OUTPUT);//G#
  pinMode(33, OUTPUT);//B#
  pinMode(46, INPUT);//sensor 5
  //RGB 6
  pinMode(37, OUTPUT);//R#
  pinMode(39, OUTPUT);//G#
  pinMode(41, OUTPUT);//B#
  pinMode(48, INPUT);//sensor6
  
  pinMode(33, OUTPUT);
  Serial.begin(9600);
  /* Enable the SPI interface */
  SPI.begin(); 
  /* Initialise the RFID reader */
  RC522.init();
  
  myservo1.attach(10);  //M1
  myservo2.attach(7); //M2
}


void loop() {
  /* Has a card been detected? */
  if(digitalRead(45)== 1){
      analogWrite(22, 0);//R
      analogWrite(24, 255);//G
      analogWrite(26, 0);//B
  }else{
      analogWrite(22, 255);//R
      analogWrite(24, 0);//G
      analogWrite(26, 0);//B
  }
  if(digitalRead(47)== 1){
      analogWrite(28, 0);//R
      analogWrite(30, 255);//G
      analogWrite(32, 0);//B
  }else{
      analogWrite(28,255);//R
      analogWrite(30, 0);//G
      analogWrite(32, 0);//B
  }
  if(digitalRead(49)== 1){
      analogWrite(36, 0);//R
      analogWrite(38,255);//G
      analogWrite(40, 0);//B
  }else{
      analogWrite(36, 255);//R
      analogWrite(38, 0);//G
      analogWrite(40, 0);//B
  }
  if(digitalRead(44)== 1){
      analogWrite(23, 0);//R
      analogWrite(25,  255);//G
      analogWrite(27, 0);//B
  }else{
      analogWrite(23, 255);//R
      analogWrite(25, 0);//G
      analogWrite(27, 0);//B
  }
  if(digitalRead(46)== 1){
      analogWrite(29, 0);//R
      analogWrite(31, 0);//G
      analogWrite(33, 255);//B
  }else{
      analogWrite(29, 255);//R
      analogWrite(31, 0);//G
      analogWrite(33, 0);//B
  }
   if(digitalRead(48)== 1){
      analogWrite(37, 0);//R
      analogWrite(39, 0);//G
      analogWrite(41, 255);//B
  }else{
      analogWrite(37, 255);//R
      analogWrite(39, 0);//G
      analogWrite(41, 0);//B
  }
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
    if (conteudo.substring(1) == "01 B9 95 1C" || conteudo.substring(1) == "08 DE AC 02" || conteudo.substring(1) == "01 6F 01 26" || conteudo.substring(1) == "08 23 9C CF"){
      
      myservo1.write(106);
      delay(3000);
      myservo1.write(7);
        
    }else{
      for(int i = 0 ; i< 10; i++){
        myservo1.write(20);
      delay(250);
      myservo1.write(7);
      delay(250);

        
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
  
}
