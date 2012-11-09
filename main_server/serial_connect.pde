/*

title:      12021 Jam - Samsung Drawing Water 1.0
author:     DNKUPFER 2012-10-10

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
  int[] compiledGrid = compileGrid();
  
  for ( int i=0; i < compiledGrid.length; i++ )
  {
    arduinoController.write( compiledGrid[i] );
  }
  
//  println( compiledGrid +" /// " + arduinoController );



// TEST SCRIPT
//  arduinoController.write( 1 );
  
}

void mousePressed()
{
  sendSerialCommand();
}
