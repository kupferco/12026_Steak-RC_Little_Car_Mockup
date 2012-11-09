/*

title:      12026 Steak - RC Little Car Mockup
author:     DNKUPFER 2012-11-09

email:      daniel@steakstudio.com
site:       http://www.steakstudio.com

processing: 2.0b3

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
int lastReading, buttonPressed, byteInstruction, lastTouch;
boolean touching;

final int DRAW_1      = 0;
final int DRAW_2      = 1;
final int BE_CREATIVE = 2;
final int RIPPLES     = 3;
final int STRIPES     = 4;

// *****************************************************************************

void setup()
{
//  orientation(LANDSCAPE);
  
  size( 1280, 720 );
  fill( appColour );
  font = createFont("SansSerif", 32);

  initialiseClient();
  initialiseButtonInterface();
}

void draw()
{
  background( backgroundColour );
  
  drawButtons();
  interaction();

  
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
