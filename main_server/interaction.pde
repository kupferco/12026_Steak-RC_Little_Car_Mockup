/*

title:      12021 Jam - Samsung Drawing Water 1.0
author:     DNKUPFER 2012-10-10

email:      daniel@steakstudio.com
site:       http://www.steakstudio.com

Copyright:  Steak Studio Ltd 2012

*/

int mousex, mousey;

void interaction()
{
  fill( 255 );
  ellipse( mousex, mousey, fingerWidth, fingerWidth );
  fill( gridColour );
}

void setFingerPosition( int enabled, int _x, int _y )
{
  if ( enabled == 1 )
  {
    mousex = _x;
    mousey = _y;
  } else {
    mousex = 2000;
    mousey = 2000;
  }
}

void mouseMoved()
{
  mousex = mouseX;
  mousey = mouseY;
}

void keyPressed()
{
  switch( key )
  {
    case 'f' :
      showFingerFeedback = !showFingerFeedback;
      break;
    case 'i' :
      showId = !showId;
      break;
    default :
      int scene = keyCode - 48;
      animation = ( scene >= 1 && scene <= 9 ) ? scene : 0;
      
      switch ( animation )
      {
        case 1 :
          offDelay = localOffDelay;
          break;
        case 0 :
        default :
          offDelay = minDelay;
          break;
      }
      break;
  }
}
