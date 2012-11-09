/*

title:      12026 Steak - RC Little Car Mockup
author:     DNKUPFER 2012-11-09

email:      daniel@steakstudio.com
site:       http://www.steakstudio.com

processing: 1.5.1

Copyright:  Steak Studio Ltd 2012

*/

// *****************************************************************************

// -----------------------------
// LIBRARIES
// -----------------------------

//import apwidgets.*;



// *****************************************************************************

// -----------------------------
// GRID CONFIG
// -----------------------------

int FPSSize = 14;
int[] window = { 1280, 720 };
int[] grid = { 3, 3 };
color appColour = color( 255, 0, 255 );
color backgroundColour = color( 50 );
color fingerColour = color( 255 );
int fingerWidth = 30;
int lastTouchDelay = 500;
String serverIP = "192.168.12.83";

// x , y, FPS x
int[] FPSPos = { window[0]/2 - 10, window[1]/2 - 5 };
int FPSColour = 255;



// INTERFACE
Boolean showFPS = false;
Boolean showFinger = false;


// *****************************************************************************

// -----------------------------
// VAR DECLARATION
// -----------------------------

PFont font;
int lastReading, buttonPressed, byteInstruction, lastTouch, carRCControl;
boolean touching;

// *****************************************************************************

void setup()
{  
  size( window[0], window[1] );
  fill( appColour );
  font = createFont("Uni-Sans-Regular-48", 32);

  initialiseServer();
  initialiseSerial();
  initialiseButtonInterface();
}

void draw()
{
  background( backgroundColour );
  
  drawButtons();
  interaction();

  drawSerial();
  
  if ( showFPS )
  {
    fill( FPSColour );
    textFont(font, FPSSize);
    text( "FPS :: " + fpsCounter(), FPSPos[0], FPSPos[1] );
  }
}

int fpsCounter()
{
  int fps = millis() - lastReading;
  lastReading = millis();
  return fps;
}
