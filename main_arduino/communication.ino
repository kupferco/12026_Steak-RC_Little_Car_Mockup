/*
  12021 Drawing Water
  Author: Daniel Kupfer
  user: dnkupfer (daniel@steakstudio.com)
  
 */

// ==================================================
/*



*/
// ==================================================

int lastRead = 0;
String incomingString = "";
int incomingIndex = 0;
int incomingArray[SERIAL_CHANNELS];

void serialRead() {
  if (Serial.available() > 0) {
    int incomingByte = Serial.read();
    incomingArray[incomingIndex++] = incomingByte;
    
    if ( incomingIndex == SERIAL_CHANNELS ) {
    
      forceShiftArray( incomingArray, SERIAL_CHANNELS );
    
    
    
    
//    Serial.write( lastRead + " // " + incomingByte );
//    Serial.write( 55 );
      
      lastRead = millis();
      incomingIndex = 0;
    }
    
    // TESTING SCRIPT
//    if ( incomingByte == 1 )
//    {
//      digitalWrite( 13, HIGH );
//    } else {
//      digitalWrite( 13, LOW );
//    }
    
  } else {
    digitalWrite( 13, LOW );
  }  
}

