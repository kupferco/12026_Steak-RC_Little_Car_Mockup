/*
  12021 Drawing Water
  Author: Daniel Kupfer
  user: dnkupfer (daniel@steakstudio.com)
  
 */

// ==================================================
/*

  

*/
// ==================================================

#define SERIAL_CHANNELS 51

#define GET_LINE 0
#define LOCAL_TEST 1

int state = GET_LINE;

int bank[SERIAL_CHANNELS] = { 
  0, 0, 0, 0, 0, 0 };

void setup() {
  pinMode(13, OUTPUT);
  Serial.begin(115200);
  
//  Serial.println("starting up!");
  initControl();
}


// 0 = get line
void loop() {
  
  switch (state)
  {
    // *****************************************
    // GATHER LINE DATA    
    case GET_LINE :
      serialRead();
      break;


    // *****************************************
    // USED FOR LOCAL DEBUGGING
    case LOCAL_TEST :
      bank[0] = 255;
      bank[1] = 255;
      bank[2] = 255;
      bank[3] = 0;
      bank[4] = 0;
      bank[5] = 255;
      shiftRegister();
      break;
 }
}
