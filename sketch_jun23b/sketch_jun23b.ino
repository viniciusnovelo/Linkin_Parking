//Autor: Luan Silver - GuiaRobotica.com
// Inclusão da biblioteca Servo
#include <Servo.h>
Servo myservo;  // Cria um objeto baseado na biblioteca Servo
void setup() {
  myservo.attach(9);  // Diz que o objeto "myservo" está ligado ao pino 9
}

void loop() {
  myservo.write(180); // Comando para mandar o servo para posição 180
  delay(500); // Espera de 500 ms
  myservo.write(0); // Comando para mandar o servo para posição 0
  delay(500); // Espera de 500 ms
  myservo.write(90); // Comando para mandar o servo para posição 90
  delay(500);  // Espera de 500 ms
}
 
