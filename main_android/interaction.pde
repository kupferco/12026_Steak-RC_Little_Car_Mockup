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


//void mousePressed()
//{
//  touching = true;
//}
//
//void mouseReleased()
//{
//  touching = false;
//}


boolean surfaceTouchEvent(MotionEvent event) {
  
  // extract the action code & the pointer ID
  int action = event.getAction();
  int code   = action & MotionEvent.ACTION_MASK;
  int index  = action >> MotionEvent.ACTION_POINTER_ID_SHIFT;

  float x = event.getX(index);
  float y = event.getY(index);
  int id  = event.getPointerId(index);
  
  if(  (event.getAction() == MotionEvent.ACTION_UP ) )
    touching = false;
  else
    touching = true;
  
  return super.surfaceTouchEvent(event);
}

