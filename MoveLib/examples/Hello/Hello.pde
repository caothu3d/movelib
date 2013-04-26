// Import the Move Library
import movelib.library.*;

// The MoveLib object used to initialize the library
MoveLib ml;

// The abstraction layer used to communicate with the controller(s)
MoveManager moveManager;

void setup() {
  
  // Instanciate the lib
  ml = new MoveLib(this);           
  
  // Enable move support. Try 'MoveManager(1)' to activate debug messages
  moveManager = new MoveManager();   
  
  // Print the info about all connected controllers
  moveManager.printAllControllers(); 

}

void draw() {

  // Set the color of the sphere. Note: update() must be called 
  // for the controllers to actually get the message
  moveManager.setLeds(10,150,255);
  
  // Poll the controller for new information and send the LED and rumble values
  moveManager.update();             
  
}


void exit() {
  
  // We clean after ourselves (stop rumble and lights off)
  moveManager.shutdown(); 
  
  // Whatever Processing usually does at shutdown
  super.exit();  
  
} // Note: this function is not called on closing the sketch with the "stop" button
  
