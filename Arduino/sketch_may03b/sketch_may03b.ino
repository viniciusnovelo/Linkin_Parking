// Projeto 13 - Servo motor controlado por Arduino

#include <Servo.h>

Servo servo1; // Cria um objeto servo
Servo servo2; // Cria um objeto servo


// VariÃ¡vel para armazenar a posiÃ§Ã£o do servo1
int pos = 0;
int pos1 = 0;

void setup()
{
// Agrega o objeto servo1 ao pino digital 11
servo1.attach(11);
servo2.attach(10);
}


void loop()
{
for(pos = 0; pos <= 120; pos += 1) // Vai de 0 grau a 180 em passo de 1 grau
{
// Chama o servo1 para ir para a posiÃ§Ã£o da variavel "pos"
servo1.write(pos);
delay(5); // Agurade 50ms para para o servo1 atingir a posiÃ§Ã£o
}
for(pos = 120; pos>=0; pos-=1) // Vai de 180 graus ate 0
{
// Chama o servo1 para ir para a posiÃ§Ã£o da variavel "pos"
servo1.write(pos);
delay(5); // Aguarda 10ms para o servo1 atingir a posiÃ§Ã£o
}

for(pos1 = 0; pos1 <= 120; pos1 += 1) // Vai de 0 grau a 180 em passo de 1 grau
{
// Chama o servo1 para ir para a posiÃ§Ã£o da variavel "pos"
servo2.write(pos1);
delay(5); // Agurade 50ms para para o servo1 atingir a posiÃ§Ã£o
}
for(pos1 = 120; pos1>=0; pos1-=1) // Vai de 180 graus ate 0
{
// Chama o servo1 para ir para a posiÃ§Ã£o da variavel "pos"
servo2.write(pos1);
delay(5); // Aguarda 10ms para o servo1 atingir a posiÃ§Ã£o
}

}
