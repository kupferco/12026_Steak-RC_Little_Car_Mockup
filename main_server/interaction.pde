/*

title:      12026 Steak - RC Little Car Mockup
author:     DNKUPFER 2012-11-09

email:      daniel@steakstudio.com
site:       http://www.steakstudio.com

Copyright:  Steak Studio Ltd 2012

*/

void interaction()
{
  fill( fingerColour );
  
  if ( showFinger )
    ellipse( mouseX, mouseY, fingerWidth, fingerWidth );
    
  fill( appColour );
  
  int[] mousePos = { mouseX, mouseY };
//  sendPositionMessage( mousePos );

}


void mousePressed()
{
  touching = true;
}

void mouseReleased()
{
  touching = false;
}
