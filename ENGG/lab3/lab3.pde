int sensorPin = 0;
void setup() {  
  
  // Set the reference voltage for analog input to 5 volts
  analogReference(DEFAULT);

  // initialize the serial communications
  Serial.begin(9600); 
  
}

void loop() {
  int sensorValue;
  int rawData[100];
  
  // Read 100 input values and store in an array
  for (int i = 0; i < 100; i++) {
    sensorValue = analogRead(sensorPin);    // Read the value from the sensor
    rawData[i] = sensorValue;  // Store the values in an array
    delay(10);  // Wait for 10 msec   
  }
  
  rawData[i] = 0;
  
  // Print the data array
  if (rawData[i] != 0) {
    Serial.println("Data Log");
    Serial.println("---------------")
    for (int i = 0; i < 100; i++) {
      Serial.print("%d", i);
      Serial.println(rawData[i], DEC);  // Print the data to the Serial Monitor
    }
  }

}
