//Inclui as bibliotecas do SPI e do RC522
#include <SPI.h>
#include <MFRC522.h>

//Definição dos pinos de conexão do projeto 
#define PINO_SS 10
#define PINO_RST 9

//Cria o item para configurar o módulo RC522
MFRC522 mfrc522(PINO_SS, PINO_RST); 

void setup() 
{
  // Inicializa a serial
  Serial.begin(9600);
  // Inicializa a comunicação SPI
  SPI.begin();
  // Inicializa o módulo MFRC522
  mfrc522.PCD_Init(); 
  
  // Printa mensagem na serial
  Serial.println("Sistema Inicializado: Aproxime o token");
}

void loop() 
{
  // Aguarda a aproximação do token
  if (!mfrc522.PICC_IsNewCardPresent()) return;
  // Seleciona qual token vai ser utilizado 
  if (!mfrc522.PICC_ReadCardSerial()) return;
  
  // Mostra UID do token na serial
  Serial.print("UID da tag:");

  //Cria uma variável vazia, do tipo string
  String conteudo= "";

  //Cria uma variável do tipo byte
  byte letra;
  
  for (byte i = 0; i < mfrc522.uid.size; i++) 
  {
     if(mfrc522.uid.uidByte[i] < 0x10){
        Serial.print(" 0");
     }
     else{
        Serial.print(" ");
     }
     // Printa a mensagem convertida em hexadecimal
     Serial.print(mfrc522.uid.uidByte[i], HEX);


     if(mfrc522.uid.uidByte[i] < 0x10){
        conteudo.concat(String(" 0"));
     }
     else{
        conteudo.concat(String(" "));
     }
     // Concatena a string convertida em hexadecimal
     conteudo.concat(String(mfrc522.uid.uidByte[i], HEX));
  }
  
  Serial.println();
  Serial.print(" Mensagem : ");
  
  //Coloca todas as letras da string em maiúscula
  conteudo.toUpperCase();
  
  // Verifica se o conteúdo do cartão coincide
  if (conteudo.substring(1) == "01:B9:95:1C")
  {
    digitalWrite(13, HIGH);
    Serial.println("Acesso Permitido!");
    
  }
  delay(1000);
}
