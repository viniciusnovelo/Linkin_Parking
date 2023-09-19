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
Servo myservo;  // Cria um objeto baseado na biblioteca Servo



void setup() {
  pinMode(4, OUTPUT);
  pinMode(3, OUTPUT);
  pinMode(2, OUTPUT);
  pinMode(5, INPUT);
  pinMode(43, OUTPUT);
  pinMode(45, OUTPUT);
  pinMode(47, OUTPUT);
  pinMode(6, INPUT);
   pinMode(22, OUTPUT);
  pinMode(23, OUTPUT);
  pinMode(24, OUTPUT);
  pinMode(11, INPUT);
  pinMode(26, OUTPUT);
  pinMode(27, OUTPUT);
  pinMode(28, OUTPUT);
  pinMode(12, INPUT);
  pinMode(37, OUTPUT);
  pinMode(39, OUTPUT);
  pinMode(41, OUTPUT);
  pinMode(29, INPUT);
   pinMode(37, OUTPUT);
  pinMode(49, OUTPUT);
  //pinMode(, OUTPUT);
  pinMode(31, INPUT);
  pinMode(33, OUTPUT);
  Serial.begin(9600);
  /* Enable the SPI interface */
  SPI.begin(); 
  /* Initialise the RFID reader */
  RC522.init();
  
  myservo.attach(10);  // Diz que o objeto "myservo" estÃƒÂ¡ ligado ao pino 9
}

/*void loop(){
  if(digitalRead(5)== 1){
      analogWrite(4, 0);
      analogWrite(3, 255);
      analogWrite(2, 0);
  }else{
      analogWrite(4, 0);
      analogWrite(3, 0);
      analogWrite(2, 255);
  }
}
*/
void loop() {
  /* Has a card been detected? */
  if(digitalRead(5)== 1){
      analogWrite(4, 255);
      analogWrite(3, 0);
      analogWrite(2, 0);
  }else{
      analogWrite(4, 0);
      analogWrite(3, 0);
      analogWrite(2, 255);
  }
  if(digitalRead(6)== 1){
      analogWrite(43, 0);
      analogWrite(45, 255);
      analogWrite(47, 0);
  }else{
      analogWrite(43, 0);
      analogWrite(45, 0);
      analogWrite(47, 255);
  }
  if(digitalRead(11)== 1){
      analogWrite(22, 0);
      analogWrite(23,0);
      analogWrite(24,  255);
  }else{
      analogWrite(22, 0);
      analogWrite(23, 255);
      analogWrite(24, 0);
  }
  if(digitalRead(12)== 1){
      analogWrite(26, 0);
      analogWrite(27,  255);
      analogWrite(28, 0);
  }else{
      analogWrite(26, 0);
      analogWrite(27, 0);
      analogWrite(28, 255);
  }
  if(digitalRead(29)== 1){
      analogWrite(41, 0);
      analogWrite(39, 0);
      analogWrite(33, 255);
  }else{
      analogWrite(41, 0);
      analogWrite(39, 255);
      analogWrite(33, 0);
  }
   if(digitalRead(31)== 1){
      analogWrite(35, 255);
      analogWrite(49, 0);
      //analogWrite(, 0);
  }else{
      analogWrite(35, 0);
      analogWrite(49, 255);
      //analogWrite(, 0);
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
      /*analogWrite(4, 0);
      analogWrite(3, 255);
      analogWrite(2, 0);*/
      myservo.write(106);
      delay(3000);
      myservo.write(7);
        
    }else{
      for(int i = 0 ; i< 10; i++){
        myservo.write(20);
      delay(250);
      myservo.write(7);
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
