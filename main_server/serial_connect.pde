/*

title:      12026 Steak - RC Little Car Mockup
author:     DNKUPFER 2012-11-09

email:      daniel@steakstudio.com
site:       http://www.steakstudio.com

Copyright:  Steak Studio Ltd 2012

*/

import processing.serial.*;

Serial arduinoController;

Boolean arduinoSerial = false;

void initialiseSerial()
{
  println(Serial.list());
  
  try {
    arduinoController = new Serial(this, Serial.list()[0], 115200 );
    println( arduinoController );
    arduinoSerial = true;
    println( "ARDUINO CONNECTED!!" );
  } catch ( Exception e ) {
    println( "NO ARDUINO SERIAL FOUND!!" );
    arduinoSerial = false;
  }
}

void drawSerial()
{
  sendSerialCommand();
}

int state = 0;
int counting = 0;
void sendSerialCommand()
{
  arduinoController.write( carRCControl );
  
  println( carRCControl );

// TEST SCRIPT
//  arduinoController.write( 1 );
  
}

