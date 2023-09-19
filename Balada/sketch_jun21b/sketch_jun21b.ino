void setup() {
  pinMode(4, OUTPUT);
  pinMode(3, OUTPUT);
  pinMode(2, OUTPUT);
  pinMode(5, INPUT);
}

void loop() {
  if(digitalWrite(5) == 0){
  analogWrite(4,255);
  analogWrite(3, 255);
  analogWrite(2, 255);
  }
}
