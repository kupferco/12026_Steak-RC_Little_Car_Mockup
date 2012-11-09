/*
  12021 Drawing Water
  Author: Daniel Kupfer
  user: dnkupfer (daniel@steakstudio.com)
 
 */

// ==================================================
/*
  Shift Register example provided by Andy Huntington
 (andy@andyhuntington.co.uk)
 
 */
// ==================================================

//Pin connected to latch pin (ST_CP) of 74HC595
const int latchPin = 8;
//Pin connected to clock pin (SH_CP) of 74HC595
const int clockPin = 12;
////Pin connected to Data in (DS) of 74HC595
const int dataPin = 11;

const int OE = 10;
const int MR = 9;

void initControl () {
  //set pins to output because they are addressed in the main loop
  pinMode(latchPin, OUTPUT);
  pinMode(dataPin, OUTPUT);  
  pinMode(clockPin, OUTPUT);

  pinMode(OE, OUTPUT);
  digitalWrite(OE, LOW);

  pinMode(MR, OUTPUT);
  digitalWrite(MR, HIGH);

  //  Serial.begin(115200);
  //  Serial.println("reset");
}

void registerBubbleON( int canal ) {
  registerBank( canal, 1 );
}

void registerBubbleOFF( int canal ) {
  registerBank( canal, -1 );
}

void bubbleOFF( int canal )
{
  registerBank( canal, -1 );
  shiftRegister();
}

void shutoffAllValves() {
  bank[0] = 0;
  bank[1] = 0;
  bank[2] = 0;
  shiftRegister();
}

void registerBank( int canal, int directionState )
{
  int bankIndex = canal / 8;
  canal -= bankIndex * 8;
  bank[bankIndex] += round( pow( 2, canal ) ) * directionState;
}

void forceShift( int _bank, int value )
{
  bank[_bank] = value;
  shiftRegister();
}

void forceShiftArray( int array[], int length )
{
  for ( int i=0; i < length; i++ )
  {
    bank[i] = array[i];
  }

  shiftRegister();
}

void shiftRegister() {
  // turn off the output so the pins don't light up
  // while you're shifting bits:
  digitalWrite(latchPin, LOW);

  for ( int i = SERIAL_CHANNELS - 1; i >= 0; i-- )
  {
    shiftOut(dataPin, clockPin, MSBFIRST, bank[i]);
  }

//  // 41-48 = bank5
//  shiftOut(dataPin, clockPin, MSBFIRST, bank[5]);
//  
//  // 33-40 = bank4
//  shiftOut(dataPin, clockPin, MSBFIRST, bank[4]);
//  
//  // 25-32 = bank3
//  shiftOut(dataPin, clockPin, MSBFIRST, bank[3]);
//  
//  // 17-24 = bank2
//  shiftOut(dataPin, clockPin, MSBFIRST, bank[2]);
//  
//  // 9-16 = bank1
//  shiftOut(dataPin, clockPin, MSBFIRST, bank[1]);
//  
//  // 1-8 = bank0
//  shiftOut(dataPin, clockPin, MSBFIRST, bank[0]);

  // turn on the output so the LEDs can light up:
  digitalWrite(latchPin, HIGH);
}

