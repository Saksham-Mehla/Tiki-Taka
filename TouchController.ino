void setup() {
  pinMode(2, INPUT);
  pinMode(4, INPUT);
  pinMode(6, INPUT);
  pinMode(8, INPUT);
  pinMode(10, OUTPUT);
  pinMode(12, OUTPUT);
  Serial.begin(9600);
}
void loop() {
  if (digitalRead(2)== HIGH){
    char (Serial.write("1"));
    digitalWrite(10, HIGH);
  }
  else if (digitalRead(2)== LOW){
    char (Serial.write("0"));
    digitalWrite(10, LOW);
  }
  if (digitalRead(4)== HIGH){
    char (Serial.write("3"));
    digitalWrite(10, HIGH);
  }
  else if (digitalRead(4)== LOW){
    char (Serial.write("2"));
    digitalWrite(10, LOW);
  }
  if (digitalRead(6)== HIGH){
    char (Serial.write("5"));
    digitalWrite(12, HIGH);
  }
  else if (digitalRead(6)== LOW){
    char (Serial.write("4"));
    digitalWrite(12, LOW);
  }
  if (digitalRead(8)== HIGH){
    char (Serial.write("7"));
    digitalWrite(12, HIGH);
  }
  else if (digitalRead(8)== LOW){
    char (Serial.write("6"));
    digitalWrite(12, LOW);
  }
   
  
 delay(100);
}
