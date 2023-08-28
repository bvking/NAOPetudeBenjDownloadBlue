void updateAbletonLiveClock() {
   print( " LIVE CLOCK lastSec " ) ; print( " actualPseudoSec " ) ; print( actualSec ) ; print( " measure " ) ; println( measure ) ; print( " actualSec " ) ; println( actualSec ) ;
   
   
  // if (formerMeasure==measure) {
   if ( formerMeasure != measure) {
    actualSec+=1; 
   }

   if ( keyMode == " samplingModeWithLive "  || modeStartKeyToFollow ==  " followSignalSampledOppositeWay(frameRatio) "  ) {
      actualSec;
      println ( measure + " in " + keyMode);
    } 
}

void updateInternalClock() {
  // print( " INTERNAL CLOCK lastSec " ) ; print( lastSec ) ; print( " actual " ) ; print( actualSec ) ; print( " measure " ) ; println( measure ) ;


  if (actualSec!=lastSec) {
    lastSec=actualSec;
    if (modeStartKeyToFollow == " samplingModeInternal "  || modeStartKeyToFollow ==  " followSignalSampledOppositeWay(frameRatio) "  ) {
      measure ++;
    }
  }
  actualSec =(int) (millis()*0.001);
}

