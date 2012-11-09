/*

title:      12021 Jam - Samsung Drawing Water 1.0
author:     DNKUPFER 2012-10-10

email:      daniel@steakstudio.com
site:       http://www.steakstudio.com

Copyright:  Steak Studio Ltd 2012

*/

/**
 * oscP5broadcastClient by andreas schlegel
 * an osc broadcast client.
 * an example for broadcast server is located in the oscP5broadcaster exmaple.
 * oscP5 website at http://www.sojamo.de/oscP5
 */


import oscP5.*;
import netP5.*;


OscP5 oscP5;

/* a NetAddress contains the ip address and port number of a remote location in the network. */
NetAddress myBroadcastLocation;

void initialiseClient() {
  
  /* create a new instance of oscP5. 
   * 12000 is the port number you are listening for incoming osc messages.
   */
  oscP5 = new OscP5( this, 12000 );
  
  /* create a new NetAddress. a NetAddress is used when sending osc messages
   * with the oscP5.send method.
   */
  
  /* the address of the osc broadcast server */
  myBroadcastLocation = new NetAddress( serverIP, 32000 );
}

// mode 0 === mouse position
final int MOUSE_POS = 0;
// mode 1 === full grid
final int FULL_GRID = 1;
// mode 2 === number instruction
final int NUMBER_INTRUC = 2;

void sendGridMessage( int[] gridArray )
{
  OscMessage myOscMessage = new OscMessage("grid");
  myOscMessage.add(FULL_GRID);

  for ( int i = 0; i < gridArray.length; i++ )
  {
    myOscMessage.add( gridArray[i] );
  }
  oscP5.send(myOscMessage, myBroadcastLocation);
}

void sendPositionMessage( int[] messageArray )
{
  OscMessage myOscMessage = new OscMessage("mouse");
  myOscMessage.add(MOUSE_POS);
  myOscMessage.add(messageArray[0]);
  myOscMessage.add(messageArray[1]);
  oscP5.send(myOscMessage, myBroadcastLocation);
}
