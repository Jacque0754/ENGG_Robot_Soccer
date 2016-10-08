//Created by Huijia WANG
//22/08/2016

char input[20];
int i;

void setup() {
  Serial.begin(9600);
}

void loop() {
  while (Serial.available() > 0) {
    input[i] = Serial.read(); //Reading
    i++; //Increment
    delay(10);
  }

  /*input[i] = 0;

  for(i=0; input[i] != 0; i++) {
    Serial.print(input[i]); //Print character
  }

  Serial.println(".");*/
}
