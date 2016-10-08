// =======================================================
// ENGG1000 - Computing Technical Stream
// Monitor
// Written by Michael Schofield August 2015
// Uses IR to measure reflectivity 
// ======================================================= 

// -------------------------------------------------------
// Global Variables
// -------------------------------------------------------
int LEDPin = 3;    
int PhotoTransistorPin = 2;  

// -------------------------------------------------------
// Subroutine: Initialize Pins
// -------------------------------------------------------
void initializePins(){
  
  // Configuration the pins
  pinMode(LEDPin, OUTPUT);
  pinMode(PhotoTransistorPin, INPUT);

  // Print the pin configuration for wiring
  Serial.print("LED Pin = ");
  Serial.println(LEDPin);
  Serial.print("IR PhotoTransistor Pin = ");
  Serial.println(PhotoTransistorPin);

}

// -------------------------------------------------------
// Subroutine: Read Sensor
// -------------------------------------------------------
void readSensor(int dataLog[], int index, bool LEDon){
  
  int sensorValue;

  // set the LED on or off
  if (LEDon == true) {
    digitalWrite(LEDPin, HIGH);
  } else {
    digitalWrite(LEDPin, LOW);
  }
    
  // Wait for the sensor to stabilise
  delay(10); 
  
  // Read the sensor value

  sensorValue = analogRead(PhotoTransistorPin);
  

  // Record the value in the data log
  //while (Serial.available() > 0) {
    
  dataLog[index] = sensorValue;
    //increase the index
    //index++; 
  
}
  
// -------------------------------------------------------
// Subroutine: Print Statistic
// -------------------------------------------------------
void printStatistics(int dataLog[]){
  
  float sum = 0;
  float sum2 = 0;
  float count = 0;
  float mean = 0;
  float stdDev = 0;
  
  // Read the values in the data log
  for (int i = 0; i < 20; i++) {
    sum = sum + (float)dataLog[i];
    sum2 = sum2 + (float)dataLog[i] * (float)dataLog[i];
    count = count + 1;
  }

  // Calculate the statistics
  // Don't forget the error checking when you implement this
  mean = sum / count;
  stdDev = sqrt((sum2 / count) - (mean * mean));
  
  // Print the statistics
  Serial.print("Sample Size = ");
  Serial.println(count);
  Serial.print("Sample Mean = ");
  Serial.println(mean);
  Serial.print("Sample StdDev = ");
  Serial.println(stdDev);
  Serial.println("");
  
}

// -------------------------------------------------------
// Subroutine: Take Sample
// -------------------------------------------------------
void takeSample(){
  
  int baseLine[20];
  int reading[20];
  int differential[20];
  
  // Take readings
  for (int i = 0; i < 20; i++) {
    // Take a base line observation
    readSensor(baseLine, i, false); 
    // Take a reading
    readSensor(reading, i, true);  
    // Calculate the differential
    differential[i] = reading[i] - baseLine[i];
  }

  // Print the statistics
  Serial.println("Base Line");
  printStatistics(baseLine);
  Serial.println("Readings");
  printStatistics(reading);
  Serial.println("Differential");
  printStatistics(differential);
  
}

// -------------------------------------------------------
// The setup() method runs once, when the sketch starts
// -------------------------------------------------------
void setup(){ 
 
  // Initialize the serial communications
  Serial.begin(9600);

  // Print the program details
  Serial.println("-------------------------------------");
  Serial.println("Program: IRSensor"); 
  Serial.println("Initializing ...");
  
  // Call a subroutine to initialize the motor pins
  initializePins();

  // Initialization completed successfully
  Serial.println("Initialization complete");
  Serial.println("");
  
}

// -------------------------------------------------------
// The loop() method runs over and over again
// -------------------------------------------------------
void loop(){
  
  // Take a sample and print the statistics
  takeSample();

  // Terminate the program
  Serial.println("exit");
  while(true);
  
}
