/*

title:      12021 Jam - Samsung Drawing Water 1.0
author:     DNKUPFER 2012-10-10

email:      daniel@steakstudio.com
site:       http://www.steakstudio.com

Copyright:  Steak Studio Ltd 2012

*/



int controllerTestX, controllerTestY;

int speed = 12;
int xWidth = 500;
int yHeight = 280;

void initialiseControllerTest()
{
  controllerTestX = gridAnchor[0];
  controllerTestY = gridAnchor[1];
}



void controllerTest()
{
  controllerTestX += speed;
  
  if ( controllerTestX >= xWidth )
  {
    controllerTestX = gridAnchor[0];
    controllerTestY += gridSpacing;
    if ( controllerTestY >= yHeight )
      controllerTestY = gridAnchor[1];
  }
  
  fill( 255 );
  ellipse( controllerTestX, controllerTestY, fingerWidth, fingerWidth );
  fill( gridColour );
}

