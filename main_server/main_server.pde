/*

title:      12021 Jam - Samsung Drawing Water 1.0
author:     DNKUPFER 2012-10-10

email:      daniel@steakstudio.com
site:       http://www.steakstudio.com

processing: 1.5.1

Copyright:  Steak Studio Ltd 2012

*/


// *****************************************************************************

// -----------------------------
// GRID CONFIG
// -----------------------------

int FPSSize = 12;
int[] window = { 1250, 740 };
// grid = row / columns
int[] grid = { 17, 24 };
//int[] grid = { 2, 24 };
int[] gridAnchor = { 1000, 50 };
int gridSpacing = 40;
color gridColour = color( 255, 0, 255 );
color backgroundColour = color( 30 );
int jetDiameter = 10;
int fingerWidth = 60;

// In milliseconds (minimum value = 1)
int localOffDelay = 1000;
int minDelay = 1;
String serverIP = "192.168.12.83";

// x , y, FPS x
int[] FPSPos = { 940, gridAnchor[1] };



// INTERFACE
Boolean showFPS = true;
Boolean showId = true;
Boolean showFingerFeedback = true;


// *****************************************************************************

// -----------------------------
// VAR DECLARATION
// -----------------------------

int lastReading = 0;
int animation = 0;
PFont font;
GridUnit[] gridArray = new GridUnit[ grid[0] * grid[1] + 10];
int mode = 0;
int offDelay = minDelay;

// *****************************************************************************

void setup()
{
  size( window[0], window[1] );
  fill( gridColour );
  noStroke();
  //String[] fontList = PFont.list();
  //println(fontList);
  font = createFont("Cuba-48.vlw", 32);

  frameRate( 200 );

  initialiseServer();
  
  initialiseGrid();
  initialiseSerial();
  
  
  // FEATURED NOT IMPLEMENTED
  //initialiseMovie();
  
  // INITIALISE EFFECTS
  initialiseControllerTest();
  loadMyImage();
}

void draw()
{
  background( backgroundColour );

//  drawMovie();

  interaction();
  
  switch ( animation )
  {
    case 1 :
      registerGrid();
      break;
    case 2 :
      drawLetter();
      registerGrid();
      break;
    case 3 :
      controllerTest();
      registerGrid();
      break;
      
    case 0 :
    default :
      break;
  }    
  
  if ( !showFingerFeedback )
    background( backgroundColour );
    
  updateGrid();

  fill( 125 );
  //rect( ( grid[0] * gridSpacing ) + gridAnchor[0] + 100, 0, 500, 1000 );

  fill( 255 );
  if ( showFPS )
  {
    textFont(font, FPSSize);
    text( "FPS :: " + fpsCounter(), FPSPos[0], FPSPos[1] - 30 );
  }
  
  if ( arduinoSerial )
    drawSerial();
}

int fpsCounter()
{
  int fps = millis() - lastReading;
  lastReading = millis();
  return fps;
}
