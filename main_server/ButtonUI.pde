/*

title:      12026 Steak - RC Little Car Mockup
author:     DNKUPFER 2012-11-09

email:      daniel@steakstudio.com
site:       http://www.steakstudio.com

Copyright:  Steak Studio Ltd 2012

*/

ArrayList buttons = new ArrayList();
int[] buttonColours = { color( 50 ),
                        color( 50 ),
                        color( 50 ),
                        color( 50 ),
                        color( 0 ),
                        color( 50 ),
                        color( 50 ),
                        color( 50 ),
                        color( 50 ) };

int[] buttonBytes = { 1,
                      3,
                      2,
                      6,
                      0,
                      9,
                      4,
                      12,
                      8 };

class ButtonUI
{ 

	int id, xpos, ypos, colour, byteInstruction, buttonWidth, buttonHeight;
        boolean active = false;

	ButtonUI( int _id, int _x, int _y, int _colour, int _byteInstruction, int[] buttonSize)
	{
		id = _id;
		xpos = _x;
		ypos = _y;
                colour = _colour;
                byteInstruction = _byteInstruction;
                buttonWidth = buttonSize[0];
                buttonHeight = buttonSize[1];
	}

        void update()
        {
                if ( !checkFingerCollision() )
                  fill ( colour );
                else
                  fill ( 255 );
                  
                rect( xpos, ypos, buttonWidth, buttonHeight );
                fill ( appColour );
        }
      
        boolean checkFingerCollision()
        {
                boolean conditionX = ( mouseX > xpos & mouseX < xpos + buttonWidth );
                boolean conditionY = ( mouseY > ypos & mouseY < ypos + buttonHeight );
                boolean not4 = ( id != 4 );
                return ( conditionX && conditionY && not4 && touching || active );
        }
        
        int getID()
        {
                return id;
        }
        
        int getByte()
        {
                return byteInstruction;
        }
        
        void forceActivate( boolean state )
        {
                active = state;
        }

}

void initialiseButtonInterface()
{
  int count = -1;
  int buttonWidth = window[0]/grid[0];
  int buttonHeight = window[1]/grid[1];
  int[] buttonSize = { buttonWidth, buttonHeight }; 
  
  for ( int r = 0; r < grid[0]; r++ )
  {
    for ( int c = 0; c < grid[1]; c++ )
    {
      int x = buttonWidth * c;
      int y = buttonHeight * r;
      buttons.add( new ButtonUI( ++count, x, y, buttonColours[count], buttonBytes[count], buttonSize ) );
    }
  }
}

void drawButtons()
{
  byteInstruction = 0;
  
  for ( int i = 0; i < buttons.size(); i++ )
  {
    ButtonUI button = (ButtonUI) buttons.get(i);
    button.update();
    byteInstruction = ( button.checkFingerCollision() ) ? button.getByte() : byteInstruction;
  }
  
//  sendRCMessage( byteInstruction );
}

void forceActivateButton( int byteMessage )
{
  for ( int i = 0; i < buttons.size(); i++ )
  {
    ButtonUI button = (ButtonUI) buttons.get(i);
    
    if ( buttonBytes[i] == byteMessage && i != 4 )
      button.forceActivate( true );
    else
      button.forceActivate( false );
  }
}

