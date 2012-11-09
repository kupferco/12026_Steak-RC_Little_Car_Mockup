/*

title:      12021 Jam - Samsung Drawing Water 1.0
author:     DNKUPFER 2012-10-10

email:      daniel@steakstudio.com
site:       http://www.steakstudio.com

Copyright:  Steak Studio Ltd 2012

*/

class GridUnit
{ 

	int id, xpos, ypos, myDelay;
	boolean active = false;

	GridUnit( int _id, int _x, int _y)
	{
		id = _id;
		xpos = _x;
		ypos = _y;
		myDelay = -offDelay;
	}

	void update()
	{
		//if ( millis() < myDelay + offDelay )
                if ( active || offDelayTimer() )
		{
			ellipse(xpos, ypos, jetDiameter, jetDiameter);
		}

		if ( showId )
			text( id, xpos + 5, ypos );
	}

	void register()
	{
		setRegister( ( pixels[ ypos * window[0] + xpos ] == -1 ) ? true : false );
	}

        void setRegister( Boolean state )
        {
               active = state;
               if (active)
                 myDelay = millis();
//               else
//                 myDelay = millis() - offDelay;
        }

        boolean getState()
        {
          return active;
        }
        
        boolean offDelayTimer()
        {
               boolean on_off = ( myDelay + offDelay > millis() ) ? true : false;
               return on_off;
        }
}

void initialiseGrid()
{
	int count = -1;
	for ( int r = 0; r < grid[0]; r++ )
	{
		for ( int c = 0; c < grid[1]; c++ )
		{
			gridArray[ ++count ] = new GridUnit( count, gridAnchor[0] - (c * gridSpacing), gridAnchor[1] + (r * gridSpacing) );
		}
	}
}

void registerGrid()
{
	loadPixels();
	int count = -1;
	for ( int r = 0; r < grid[0]; r++ )
	{
		for ( int c = 0; c < grid[1]; c++ )
		{
			gridArray[ ++count ].register();
		}
	}	
}

void updateGrid()
{
	int count = -1;
	for ( int r = 0; r < grid[0]; r++ )
	{
		for ( int c = 0; c < grid[1]; c++ )
		{
			gridArray[ ++count ].update();
		}
	}
}

int[] compileGrid()
{
        int[] compiledGrid = new int[ ceil( float(grid[0]) * float(grid[1]) / 8.0 ) ];
        
	int count = -1;
	for ( int r = 0; r < grid[0]; r++ )
	{
		for ( int c = 0; c < grid[1]; c++ )
		{
                      if ( gridArray[ ++count ].getState() )
                        compiledGrid[ count / 8 ] += round( pow( 2, count % 8 ) );
		}
	}

//  println( compiledGrid.length );
//  println( compiledGrid );
//  println("");

  
  return compiledGrid;
}

void setGridFromAndroid( OscMessage theOscMessage )
{  
	int count = -1;
	for ( int r = 0; r < grid[0]; r++ )
	{
		for ( int c = 0; c < grid[1]; c++ )
		{
                  int bank = (++count / 8) + 1; // index 0 always send the mode, that's why it needs a "+1"
                  int pixelPos = c % 8;
                  boolean pixelState = boolean( theOscMessage.get( bank ).intValue() >> pixelPos & 0x01 );
                  gridArray[ count ].setRegister( pixelState );
		}
	}
}
