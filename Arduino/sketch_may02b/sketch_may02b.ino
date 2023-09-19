// Projeto 13 - Servo motor controlado por Arduino

#include <Servo.h>

Servo servo1; // Cria um objeto servo

// Variável para armazenar a posição do servo1
int pos = 0;

void setup()
{
// Agrega o objeto servo1 ao pino digital 11
servo1.attach(11);
}


void loop()
{
for(pos = 0; pos <= 180; pos += 1) // Vai de 0 grau a 180 em passo de 1 grau
{
// Chama o servo1 para ir para a posição da variavel "pos"
servo1.write(pos);
delay(1); // Agurade 50ms para para o servo1 atingir a posição
}
for(pos = 180; pos>=0; pos-=1) // Vai de 180 graus ate 0
{
// Chama o servo1 para ir para a posição da variavel "pos"
servo1.write(pos);
delay(1); // Aguarda 10ms para o servo1 atingir a posição
}
}
