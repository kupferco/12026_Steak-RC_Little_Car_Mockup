/*

title:      12021 Jam - Samsung Drawing Water 1.0
author:     DNKUPFER 2012-10-10

email:      daniel@steakstudio.com
site:       http://www.steakstudio.com

Copyright:  Steak Studio Ltd 2012

*/



PImage img;

void loadMyImage()
{
  img = loadImage("samsung_logo.png");
}

void drawLetter()
{
//  image(img, mouseX, mouseY);
  fill( 255 );
  textFont(font, 620);
  text( "E", mouseX, 470 );
  fill( gridColour );
}

