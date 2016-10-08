char input[20];
int i;

void setup() {
  Serial.begin(9600);
}

void loop() {
  while (Serial.available() > 0) {
    input[i] = Serial.read(); //Reading
    //Serial.println(input[i]);
    Serial.print(input[i]);
    i++; //Increment
    delay(10);
  }
  if () {
    Serial.println(".");
  }
}

  

