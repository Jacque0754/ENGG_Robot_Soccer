
// =======================================================
// ENGG1000 - Computing Technical Stream
// Motor Controller
// Written by Michael Schofield August 2015
// Controls motors via an H Bridge 
// ======================================================= 

// -------------------------------------------------------
// Global Variables
// -------------------------------------------------------
int rightMotorLogicPin1 = 3;    
int rightMotorLogicPin2 = 5;  
int leftMotorLogicPin1 = 9;    
int leftMotorLogicPin2 = 11; 

// -------------------------------------------------------
// Subroutine: Initialize Motor Pins
// -------------------------------------------------------
void initializeMotorPins(){
   pinMode(3,OUTPUT) ; 	
   pinMode(5,OUTPUT) ;
   pinMode(9,OUTPUT) ; 	
   pinMode(11,OUTPUT) ;
  
   
  
   

}

// -------------------------------------------------------
// Function: Receive Byte
// -------------------------------------------------------
 /*char receiveCommand(){

  char command = 0;
  
  if (Serial.available() > 0) {

    // Read the oldest byte in the serial buffer:
    command = Serial.read();
  
  }
  
  return command;
  
}

// -------------------------------------------------------
// Function: Update Direction
// -------------------------------------------------------
char updateDirection(char command, char currentDirection){
  
  if (command == 'f') {
      Serial.println("Forwards");
      currentDirection = 'f';
    }
    if (command == 'b') {
      Serial.println("Backwards");
      currentDirection = 'b';
    }
    if (command == 'l') {
      Serial.println("Turn Left");
      currentDirection = 'l';
    }
    if (command == 'r') {
      Serial.println("Turn Right");
      currentDirection = 'r';
    }
    
    return currentDirection;
    
}

// -------------------------------------------------------
// Function: Update Speed
// -------------------------------------------------------
int updateSpeed(char command, int pwmDutyCycle){
  
  if (command == '0') {
      Serial.println("Stop");
      pwmDutyCycle = 0;
    }
    if (command == '1') {
      Serial.println("Speed = 10%");
      pwmDutyCycle = 26;
    }
    if (command == '2') {
      Serial.println("Speed = 20%");
      pwmDutyCycle = 51;
    }
    if (command == '3') {
      Serial.println("Speed = 30%");
      pwmDutyCycle = 77;
    }
    if (command == '4') {
      Serial.println("Speed = 40%");
      pwmDutyCycle = 102;
    }
    if (command == '5') {
      Serial.println("Speed = 50%");
      pwmDutyCycle = 128;
    }
    
    return pwmDutyCycle;
}
  
// -------------------------------------------------------
// Subroutine: Set Motor Pins
// -------------------------------------------------------
void setMotorPins(int currentDirection, int pwmDutyCycle){
  
  if ((currentDirection == 'b') || (currentDirection == 'r')) 
      analogWrite(rightMotorLogicPin1, pwmDutyCycle);
    if ((currentDirection == 'f') || (currentDirection =='l')) 
      analogWrite(rightMotorLogicPin2, pwmDutyCycle);
    if ((currentDirection == 'b') || (currentDirection == 'l')) 
      analogWrite(leftMotorLogicPin1, pwmDutyCycle);
    if ((currentDirection == 'f') || (currentDirection == 'r')) 
      analogWrite(leftMotorLogicPin2, pwmDutyCycle);
  
} */

// -------------------------------------------------------
// The setup() method runs once, when the sketch starts
// -------------------------------------------------------
void setup(){ 
 
  // Initialize the serial communications
  Serial.begin(9600);

  // Print the program details
  Serial.println("-------------------------------------");
  Serial.println("Program: Motor Controller"); 
  Serial.println("Initializing ...");
  
  // Call a subroutine to initialize the motor pins
  initializeMotorPins();

  // Initialization completed successfully
  Serial.println("Initialization complete");
  
}

// -------------------------------------------------------
// The loop() method runs over and over again
// -------------------------------------------------------
void loop(){
  
  
   analogWrite(rightMotorLogicPin1, 255);   
   analogWrite(rightMotorLogicPin2, 0);   
   analogWrite(leftMotorLogicPin1, 255);   
   analogWrite(leftMotorLogicPin2, 0);
  /*int pwmDutyCycle = 0;
  char currentDirection = 'x';
  char command = 0;
  bool keyboardControl = true;
  
  // Control the motors from the keyboard
  while (keyboardControl) {
    
    // Wait for a command from the keyboard
    command = receiveCommand(); 
    
    // Update the direction of the robot
    currentDirection = updateDirection(command, currentDirection);
    
    // Update the speed of the robot
    pwmDutyCycle = updateSpeed(command, pwmDutyCycle);
    
    // Set the motor pins according to speed and direction
    setMotorPins(currentDirection, pwmDutyCycle);
    
    // Was this an exit command
    if (command == 'x') keyboardControl = false;
    
  } */
  
  // Terminate the program
 //Serial.println("exit");
 //while(true);
  
}

