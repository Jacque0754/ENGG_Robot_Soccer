const int rightMotorLogicPin1 = 5;    
const int rightMotorLogicPin2 = 6;  
const int leftMotorLogicPin1 = 9;    
const int leftMotorLogicPin2 = 10;
const int LEDPin = 3;    
const int trigPin = 12;
const int echoPin = 11;

char receiveCommand(){

  char incomingByte = 0;

  // See if there's incoming serial data:
  while (Serial.available() == 0) {
    
    // Wait for a character to arrive
    delay(10);

  }
  
  // Read the oldest byte in the serial buffer:
  incomingByte = Serial.read();
    
  // Return the command  
  return incomingByte;
  
}

// -------------------------------------------------------
// Function: Update Direction
// -------------------------------------------------------
char updateDirection(char command, char currentDirection){
  
    // Is this a direction; 'f' 'b' 'l' 'r' 's'
    if (command == 'f') {
      Serial.println("Forwards");
      return 'f';
    }
    if (command == 'b') {
      Serial.println("Backwards");
      return 'b';
    }
    if (command == 'l') {
      Serial.println("Turn Left");
      return 'l';
    }
    if (command == 'r') {
      Serial.println("Turn Right");
      return 'r';
    }
    if (command == 's') {
      Serial.println("stop");
      return 's';
    }
    
    // The command was not a direction, so return the original value
    return currentDirection;
    
}

// -------------------------------------------------------
// Function: Update Speed
// -------------------------------------------------------
int updateSpeed(int command, int pwmDutyCycle){
  
    // Is this a motor speed 0 - 5
    if (command == 0) {
      //Serial.println("Stop");
      return 0;
    }
    if (command == 1) {
      //Serial.println("Speed = 10%");
      return 26;
    }
    if (command == 2) {
      //Serial.println("Speed = 20%");
      return 51;
    }
    if (command == 3) {
      //Serial.println("Speed = 30%");
      return 77;
    }
    if (command == 4) {
      //Serial.println("Speed = 40%");
      return 102;
    }
    if (command == 5) {
      //Serial.println("Speed = 50%");
      return 128;
    }
    
    // The command was not a speed, so return the original value
    return pwmDutyCycle;
    
}
  
// -------------------------------------------------------
// Subroutine: Set Motor Pins
// -------------------------------------------------------
void setMotorPins(int currentDirection, int pwmDutyCycle){
  
    // Reset all of the pins
    analogWrite(rightMotorLogicPin1, 0);   
    analogWrite(rightMotorLogicPin2, 0);   
    analogWrite(leftMotorLogicPin1, 0);   
    analogWrite(leftMotorLogicPin2, 0);   
    
    // Set the motor pins appropriately
    // Use the motor logic from lectures
    
    // Pin1  Pin2  Motor
    //  0     0    Idle
    //  0     5v   Forward
    //  5v    0    Reverse
    //  5v    5v   Idle
    
    // ReftMotor  RightMotor  Direction
    //    For        For      Forward
    //    For        Rev      Turn Left
    //    Rev        For      Turn Right
    //    Rev        Rev      Backwards

    if ((currentDirection == 'b') || (currentDirection == 'r')) 
      analogWrite(rightMotorLogicPin1, pwmDutyCycle);
    if ((currentDirection == 'f') || (currentDirection == 'l')) 
      analogWrite(rightMotorLogicPin2, pwmDutyCycle);
    if ((currentDirection == 'b') || (currentDirection == 'l')) 
      analogWrite(leftMotorLogicPin2, pwmDutyCycle);
    if ((currentDirection == 'f') || (currentDirection == 'r')) 
      analogWrite(leftMotorLogicPin1, pwmDutyCycle);
    if (currentDirection == 's') {
      analogWrite(rightMotorLogicPin1, 0);
      analogWrite(rightMotorLogicPin2, 0);
      analogWrite(leftMotorLogicPin2, 0);
      analogWrite(leftMotorLogicPin1, 0);
    }
}

int FindDistance() {
  float duration, distance;
  digitalWrite(trigPin, LOW); 
  delayMicroseconds(2);
 
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);
  
  duration = pulseIn(echoPin, HIGH);
  distance = (duration / 2) * 0.0344;
  
  delay(500);
  return distance;
}

void setup(){ 
 
  // Initialize the serial communications
  Serial.begin(9600);

  // Print the program details
  Serial.println("-------------------------------------");
  Serial.println("Program: Motor Controller"); 
  Serial.println("Initializing ...");
  
  // Call a subroutine to initialize the motor pins
  pinMode(5,OUTPUT) ; 	
  pinMode(6,OUTPUT) ;
  pinMode(9,OUTPUT) ; 	
  pinMode(10,OUTPUT) ;
  pinMode(LEDPin, OUTPUT);
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);  

  
  delay(1000);
   
  /*analogWrite(rightMotorLogicPin1, 0); //backwards  
  analogWrite(rightMotorLogicPin2, 120);  //forwards
  analogWrite(leftMotorLogicPin1, 0); //backwards  
  analogWrite(leftMotorLogicPin2, 120); //forwards */

  // Initialization completed successfully
  Serial.println("Initialization complete");
  
}

// -------------------------------------------------------
// The loop() method runs over and over again
// -------------------------------------------------------
void loop(){
  
  int pwmDutyCycle = 0;
  char currentDirection = 'x';
  char command = 0;
  bool keyboardControl = true;
  int distance = FindDistance();
  
  
/*  analogWrite(rightMotorLogicPin1, 0); //b  
  analogWrite(rightMotorLogicPin2, 0);  //f
  analogWrite(leftMotorLogicPin1, 0); //f 
  analogWrite(leftMotorLogicPin2, 0); //b
*/  
  
 // =========forwards 300mm===========
/* 
  if (distance <= 10){
    
    //analogWrite(rightMotorLogicPin2, 50);
    //analogWrite(leftMotorLogicPin1, 50); //forwards
    //pwmDutyCycle = updateSpeed(1, pwmDutyCycle);
    delay(10);
    //pwmDutyCycle = updateSpeed(0, pwmDutyCycle);
    analogWrite(rightMotorLogicPin2, 0);
    analogWrite(leftMotorLogicPin1, 0);
    while(1);
    Serial.print("Distance = ");
    Serial.println("Out of range");
  }
  else {
    //pwmDutyCycle = updateSpeed(3, pwmDutyCycle);
    analogWrite(rightMotorLogicPin2, 150);
    analogWrite(leftMotorLogicPin1, 150);
    Serial.print("Distance = ");
    Serial.print(distance);
    Serial.println(" cm");
    delay(10);
  } 
*/  
  
  //====== turn around =======
  
  // Control the motors from the keyboard
  while (keyboardControl) {
    
    // Wait for a command from the keyboard
    command = receiveCommand(); 
    
    // Update the direction of the robot
    currentDirection = updateDirection(command, currentDirection);
    
    pwmDutyCycle = 200;
    
    //distance = FindDistance();
    
/*    if (distance <= 5){
    
    analogWrite(rightMotorLogicPin2, 50);
    analogWrite(leftMotorLogicPin1, 50); //forwards
    //pwmDutyCycle = updateSpeed(1, pwmDutyCycle);
    delay(1000);
    //pwmDutyCycle = updateSpeed(0, pwmDutyCycle);
    analogWrite(rightMotorLogicPin2, 0);
    analogWrite(leftMotorLogicPin1, 0);
    Serial.print("Distance = ");
    Serial.println("Out of range");
  }
  else {
    //pwmDutyCycle = updateSpeed(3, pwmDutyCycle);
    analogWrite(rightMotorLogicPin2, 255);
    analogWrite(leftMotorLogicPin1, 255);
    Serial.print("Distance = ");
    Serial.print(distance);
    Serial.println(" cm");
    delay(1000);
  } 
  */  
    // Set the motor pins according to speed and direction
    setMotorPins(currentDirection, pwmDutyCycle);
    
    // Was this an exit command
    if (command == 'x') keyboardControl = false;
    
  } 
  
  
  
  // Terminate the program
  analogWrite(rightMotorLogicPin1, 0); //b  
  analogWrite(rightMotorLogicPin2, 0);  //f
  analogWrite(leftMotorLogicPin1, 0); //f 
  analogWrite(leftMotorLogicPin2, 0); //b
  Serial.println("exit");
  while(1);
}
