/*
PINOUT (RFID_1):
RC522 MODULE    MEGA
SDA             D9
SCK             D52
MOSI            D51
MISO            D50
IRQ             N/A
GND             GND
RST             D8
3.3V            3.3V
*/

/*
PINOUT (RFID_2):
RC522 MODULE    MEGA
SDA             D7
SCK             D52
MOSI            D51
MISO            D50
IRQ             N/A
GND             GND
RST             D6
3.3V            3.3V
*/
#include <SPI.h>
#include <RFID.h>

#include <Servo.h>

RFID RC522_1(9, 8); 
RFID RC522_2(7, 6); 

//RFID RC522_1(7, 6); 
//RFID RC522_2(9, 8);

Servo myservo1;  
Servo myservo2; 

void setup() {
  //RGB 1
  pinMode(22, OUTPUT);//R
  pinMode(24, OUTPUT);//G
  pinMode(26, OUTPUT);//B
  pinMode(45, INPUT);//sensor 1 
  //RGB 2
  pinMode(28, OUTPUT);//R
  pinMode(30, OUTPUT);//G
  pinMode(32, OUTPUT);//B
  pinMode(47, INPUT);//sensor 2
  //RGB 3
  pinMode(36, OUTPUT);//R
  pinMode(38, OUTPUT);//G
  pinMode(40, OUTPUT);//B
  pinMode(49, INPUT);//sensor 3
  //RGB 4
  pinMode(23, OUTPUT);//R
  pinMode(25, OUTPUT);//G
  pinMode(27, OUTPUT);//B
  pinMode(44, INPUT);//sensor 4
  //RGB 5
  pinMode(29, OUTPUT);//R 
  pinMode(31, OUTPUT);//G
  pinMode(33, OUTPUT);//B
  pinMode(46, INPUT);//sensor 5
  //RGB 6
  pinMode(37, OUTPUT);//R
  pinMode(39, OUTPUT);//G
  pinMode(41, OUTPUT);//B
  pinMode(48, INPUT);//sensor6
  
  pinMode(33, OUTPUT);
  Serial.begin(9600);
  /* Enable the SPI interface */
  SPI.begin(); 
  /* Initialise the RFID reader */
  RC522_1.init();
  RC522_2.init();
  
  myservo1.attach(2);  //M1
  myservo2.attach(3); //M2
}


void loop() {
  //INICIO_RGB'S
  //RGB 1
  if(digitalRead(45)== 1){
      analogWrite(22, 0);//R
      analogWrite(24, 255);//G
      analogWrite(26, 0);//B
  }else{
      analogWrite(22, 255);//R
      analogWrite(24, 0);//G
      analogWrite(26, 0);//B
  }

  //RGB 2
  if(digitalRead(47)== 1){
      analogWrite(28, 0);//R
      analogWrite(30, 255);//G
      analogWrite(32, 0);//B
  }else{
      analogWrite(28,255);//R
      analogWrite(30, 0);//G
      analogWrite(32, 0);//B
  }

  //RGB 3
  if(digitalRead(49)== 1){
      analogWrite(36, 0);//R
      analogWrite(38,255);//G
      analogWrite(40, 0);//B
  }else{
      analogWrite(36, 255);//R
      analogWrite(38, 0);//G
      analogWrite(40, 0);//B
  }

  //RGB 4
  if(digitalRead(44)== 1){
      analogWrite(23, 0);//R
      analogWrite(25,  255);//G
      analogWrite(27, 0);//B
  }else{
      analogWrite(23, 255);//R
      analogWrite(25, 0);//G
      analogWrite(27, 0);//B
  }

  //RGB 5
  if(digitalRead(46)== 1){
      analogWrite(29, 0);//R
      analogWrite(31, 0);//G
      analogWrite(33, 255);//B
  }else{
      analogWrite(29, 255);//R
      analogWrite(31, 0);//G
      analogWrite(33, 0);//B
  }

  //RGB 6
   if(digitalRead(48)== 1){
      analogWrite(37, 0);//R
      analogWrite(39, 0);//G
      analogWrite(41, 255);//B
  }else{
      analogWrite(37, 255);//R
      analogWrite(39, 0);//G
      analogWrite(41, 0);//B
  }
  //FIM_RGB'S

  //INICIO_RFID 1
  if (RC522_1.isCard())
  {
    RC522_1.readCardSerial();
    Serial.println("Card detected:");
    Serial.print("UID da tag :");
    String conteudo= "";
    for (byte i = 0; i < 4; i++) 
    {
       Serial.print(RC522_1.serNum[i] < 0x10 ? " 0" : " ");
       Serial.print(RC522_1.serNum[i], HEX);
       conteudo.concat(String(RC522_1.serNum[i] < 0x10 ? " 0" : " "));
       conteudo.concat(String(RC522_1.serNum[i], HEX));
    }
    conteudo.toUpperCase();
    if (conteudo.substring(1) == "01 B9 95 1C" || conteudo.substring(1) == "08 DE AC 02" || conteudo.substring(1) == "01 6F 01 26" || conteudo.substring(1) == "08 23 9C CF"){
      
      myservo1.write(158);
      delay(3000);
      myservo1.write(85);
        
    }else{
      for(int i = 0 ; i< 6; i++){
      myservo1.write(96);
      delay(250);
      myservo1.write(85);
      delay(250);
      }
    }
    Serial.println();
    Serial.println();
  }
  //FIM_RFID 1

  //INICIO_RFID 2
  if (RC522_2.isCard())
    {
      RC522_2.readCardSerial();
      Serial.println("Card detected:");
      Serial.print("UID da tag :");
      String conteudo= "";
      for (byte i = 0; i < 4; i++) 
      {
         Serial.print(RC522_2.serNum[i] < 0x10 ? " 0" : " ");
         Serial.print(RC522_2.serNum[i], HEX);
         conteudo.concat(String(RC522_2.serNum[i] < 0x10 ? " 0" : " "));
         conteudo.concat(String(RC522_2.serNum[i], HEX));
      }
      conteudo.toUpperCase();
      if (conteudo.substring(1) == "01 B9 95 1C" || conteudo.substring(1) == "08 DE AC 02" || conteudo.substring(1) == "01 6F 01 26" || conteudo.substring(1) == "08 23 9C CF"){
        
        myservo2.write(147);
        delay(3000);
        myservo2.write(55);
          
      }else{
        for(int i = 0 ; i< 6; i++){
          myservo2.write(68);
          delay(250);
          myservo2.write(55);
          delay(250);
        }
      }
    }
    //FIM_RFID 2
  }
  

      
