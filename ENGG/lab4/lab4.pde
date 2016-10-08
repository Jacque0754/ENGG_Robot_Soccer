
// =======================================================
// ENGG1000 - Computing Technical Stream
// Motor Controller
// Written by Michael Schofield August 2015
// Controls motors via an H Bridge 
// ======================================================= 

// -------------------------------------------------------
// Global Variables
// -------------------------------------------------------
int rightMotorLogicPin1 = 0;    
int rightMotorLogicPin2 = 0;  
int leftMotorLogicPin1 = 0;    
int leftMotorLogicPin2 = 0; 
int pwmDutyCycle = 0;
char currentDirection = 0;

// -------------------------------------------------------
// The setup() method runs once, when the sketch starts
// -------------------------------------------------------
void setup(){ 
 
  // Initialize the serial communications
  Serial.begin(9600);

  // Print the program details
  Serial.println("-------------------------------------");
  Serial.println("Program: Name"); 
  Serial.println("Initializing ...");

  // Configuration the motor pins

  int rightMotorLogicPin1 = 5;    
  int rightMotorLogicPin2 = 6;  
  int leftMotorLogicPin1 = 9;    
  int leftMotorLogicPin2 = 10; 

  // Print the motor pin configuration for wiring

  Serial.println("Right Motor Pin 1 = ") 

  // Initialization completed successfully
  Serial.println("Initialization complete");
  
}

// -------------------------------------------------------
// The loop() method runs over and over again
// -------------------------------------------------------
void loop(){
  
  char incomingByte = 0;

  // See if there's incoming serial data:
  if     . . . . . . . . .    {

    // Read the oldest byte in the serial buffer:
    . . . . . . . . .   
    
    // Is this a direction; 'f' 'b' 'l' 'r'
    if (incomingByte == 'f') {
      currentDirection = 'f';
      Serial.println("Forwards");
    }

    . . . . . . . . .   
    
    // Is this a motor speed '0' - '5'
    if (incomingByte == '0') {
      pwmDutyCycle = 0;
      Serial.println("Stop");
    }

    . . . . . . . . .   
    
    // Reset all of the pins

    . . . . . . . . .   
    
    // Set the motor pins appropriately
    // Use the motor logic from lectures
    
    // Pin1  Pin2  Motor
    //  0     0    Idle
    //  0     5v   Forward
    //  5v    0    Reverse
    //  5v    5v   Idle
    
    // ReftMotor  LeftMotor  Direction
    //    For        For      Forward
    //    For        Rev      Turn Left
    //    Rev        For      Turn Right
    //    Rev        Rev      Backwards

    if ((currentDirection == 'b') || (currentDirection == 'r')) 
      analogWrite(rightMotorLogicPin1, pwmDutyCycle);

    . . . . . . . . .   
    
  }
  
  // Small delay for a character to arrive
  . . . . . . . . .   

}

Previous
