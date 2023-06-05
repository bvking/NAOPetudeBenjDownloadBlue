
void propagationBallRotationBisTest(){ // as addSignalOneAndTwoQuater() in NAOP 
modeStartKeyToFollow = " null ";
keyMode = " propagationBallRotationBisTest ";

    textSize (50);
    displayPropagationControl();
  
     letter = key;   

    switch(letter) {
    case 'o': // way of rotation
    doo=true;
    key = '#';

    break;

    case 'O': // way of rotation
    doo=false;
    key = '#';

    break;

    case 'c': 
    doC=true;
    key = '#';
    break;

    case 'C': 
    doC=false;
    key = '#';
    break;
 
    
    case 'l': // enable propagation or lock
    dol=true;
    key = '#';

    break;
    case 'L': // disable propagation
    dol=false;

    break;
    case 'q': // way of propagation
    doQ=true;
    doZ=false;
    break;
    case 'b': 
    doQ=false;
    doZ=false;
    doB=!doB;
    key = '#';
    break;

    case 'B': 
    doQ=false;
    doZ=false;
    doB=false;

    break;
    case 'z': // change way of propagation
    doZ=true;
    doQ=true;
    break;
   
    case 'Z': // change way of propagation
    doZ=false;
    doQ=true;
    break;

    case '#': // change way of propagation
    break;
  //  doB=!doB;
    }


 // splitTimeScaleRotation(30.0); //  10.0= vitesse de propagation. On change de sens de ROTATION avec q et z.
 // splitTimeLfoScale();  // change de sens de PROPAGATION

   if ( formerFormerKey == '#' || modeStartKeyToFollow == " null ") { // formerFormerKey == '#' || 

    println ( " modeStartKeyToFollow " + modeStartKeyToFollow);
        if (doo == true ) {
     //   signal[2]=- signal[2] ;
     for (int i = 0; i < networkSize-0; i+=1) { 
      //  newPosFollowed[i]=-newPosFollowed[i];
           }
           }
  

      for (int i = 0; i < networkSize-0; i+=1) {             
  //     newPosFollowed[i]=map (signal[2], 0, 1, 0, TWO_PI); // signals to follow
   //    newPosFollowed[i]=newPosFollowed[i]%TWO_PI;  // signals to follow
       phaseMapped[i] = newPosFollowed[i]+phaseMappedFollow[i]; // new signal is a composition 

      if (phaseMapped[i]<0){
      dataMappedForMotorisedPosition[i]= int (map (phaseMapped[i], 0, -TWO_PI, numberOfStep, 0)); 
      phaseMapped[i]= map (dataMappedForMotorisedPosition[i], numberOfStep, 0, 0, -TWO_PI);  
       }
       
      else {
    
      dataMappedForMotorisedPosition[i]= (int) map (phaseMapped[i], 0, TWO_PI, 0, numberOfStep); 
      phaseMapped[i]= map (dataMappedForMotorisedPosition[i], 0, numberOfStep, 0, TWO_PI);
       }


    //  newPosXaddSignal[i]=phaseMapped[i];  // realign Balls
 
  }
  
 }
    //lockOscillatorToPositionFromPreviousProagedBall();
      //******** Lock last oscillator to the lastPhase

          if (   dol==true) {
      lockOscillatorToPositionFromPreviousProagedBallTest();
      for (int i = 0; i < networkSize-0; i+=1) { 
      phaseMappedFollow[i] = netPhaseBase[i];
      phaseMappedFollow[i] = phaseMappedFollow[i]%TWO_PI; 
      }
     }
/*
      if (  propagationTrigged==true && dol==true) {
    //  lockOscillatorToPositionFromPreviousProagedBallTest();
      for (int i = 0; i < networkSize-0; i+=1) { 
      phaseMappedFollow[i] = netPhaseBase[i];
      phaseMappedFollow[i] = phaseMappedFollow[i]%TWO_PI; 
      }
     }
*/    
 
 
      if (key != '#' ) {
      if (modeStartKeyToFollow == " null ") {
      phasePatternBase();

      for (int i = 0; i < networkSize-0; i+=1) {
      phaseMappedFollow[i] = netPhaseBase[i];
       }
      }
     }


    propagationSpeed=70.0; // useless if propagation comes from ableton Live
 //  splitTimeScaleRotation(signal[2]);

    splitTimeSinusoidaleScale(trigedSignFromAbleton[3]);

  // splitTimeWithTrigSignalFromAbletonSquare(trigedSignFromAbleton[3]);// 2
  // splitTimeWithTrigSignalFromAudioAbleton(trigedSignFromAbleton[0]);
    

   propagation2wayRotationBis(); 
   actualisePositionDataFromCircular = false; //    lastRecordData of motors positiond were stocked when the circular Mode was true as formerKeyMetro == '#'
   mapNewPosX(); // counter actived

 }

 
 
 void propagation2wayRotationBisTest() {   //CONDITION QUAND SIGNAL NEGATIF fu style

if (doo==false  && propagationTrigged==true){  //AMPLITUDE  negative way : ccw
      float phaseAmount=trigedSignFromAbleton[1];
      phaseAmount= map (phaseAmount, 0, 1, 1, 0);     
      phaseAmount = map (phaseAmount, 0, 1, 0, TWO_PI);
      text ( "phaseAmount " + phaseAmount, 500, 1000);

      LFO[oscillatorChange] = LFO[oldOscillatorChange]; //     
      LFO[oscillatorChange] -=  (phaseAmount/(1*networkSize-1));
      text ( "  LFO[oscillatorChange] " +   LFO[oscillatorChange], 500, 1100);
   }       

if (doo==true && propagationTrigged==true){


      LFO[oscillatorChange] = LFO[oldOscillatorChange];// newPosXaddSignal[oscillatorChange]%TWO_PI;
      LFO[oscillatorChange] += (PI/(1*networkSize-1));
      text ( "  LFO[oscillatorChange] " +   LFO[oscillatorChange], 500, 1100);
   }       

       if (LFO[oscillatorChange] <0){
      dataMappedForMotorisedPosition[oscillatorChange]= int (map (LFO[oscillatorChange], 0, -TWO_PI, numberOfStep, 0)); 
      phaseMapped[oscillatorChange]= map (dataMappedForMotorisedPosition[oscillatorChange], numberOfStep, 0, 0, -TWO_PI); 
      newPosXaddSignal[oscillatorChange]=phaseMapped[oscillatorChange]; 
       }
       
      else {
    
      dataMappedForMotorisedPosition[oscillatorChange]= (int) map (LFO[oscillatorChange], 0, TWO_PI, 0, numberOfStep); 
      phaseMapped[oscillatorChange]= map (dataMappedForMotorisedPosition[oscillatorChange], 0, numberOfStep, 0, TWO_PI);
      newPosXaddSignal[oscillatorChange]=phaseMapped[oscillatorChange]; 

       }

  }



 void  splitTimeScaleRotationTest(float propagationSpeed) { 
    


      //   signal[2] = (0*PI + (frameCount / propagationSpeed) * cos (1000 / 500.0)*-1); //%1 TWO_PI
     if (doo==true  ){      
     //     signal[2] = -  signal[2]; //%1
       }    
      //   (if signal is sinusoidale we will see good propagation)
      
  //   signal[2]=   map (((cos  (frameCount / 100.0)*-1) %2), -1, 1, -TWO_PI, TWO_PI);  // sinusoida
 // signal[2]=   map (((cos  (frameCount / 100.0)*-1) %2), -1, 1, -1, 1);  // sinusoida
   
         
    if (doZ==false  ){  // case q && timeLfo>=0
      propagationTrigged=false;
  if (oldSplitTimeLfo>splitTimeLfo){
    
      oldOscillatorChange=oscillatorChange;
      oscillatorChange=oscillatorChange+1;
      propagationTrigged=true;
   } 

      oscillatorChange=oscillatorChange%networkSize;
     if (oscillatorChange<=0) {
    
         oscillatorChange=0;
         oldOscillatorChange=networkSize-1;
   } 
  }

    if (doZ==true   ){ 
   propagationTrigged=false;
  if (  oldSplitTimeLfo>splitTimeLfo){ 

       oldOscillatorChange=oscillatorChange;

      oscillatorChange=oscillatorChange-1;
       propagationTrigged=true;
   } 
      if (oscillatorChange<=-1) {

        oldOscillatorChange=0;

        oscillatorChange=networkSize-1;
   }
  }       
  

   timeLfo = ((int ) map (signal[2], 0, 1, 0, networkSize*100)); // linear  pattern if signal [2] is linear
      if (doo==true  ){      
          timeLfo = -  timeLfo; //%1
       } 
 
       text ( "TIME with continuous signal2] "  + timeLfo, -width-200, +height-100  );
       text (" oldSplitTimeLfo " + oldSplitTimeLfo + " splitTime " +   splitTimeLfo + " timeLFO " + timeLfo,  -width-200, +height );

   oldSplitTimeLfo=splitTimeLfo;
   splitTimeLfo= int  ((timeLfo)%100)+0;    // the time is splitted at each %100. That mean ten time from the beginning to the end of signal[2]. from 0 to 1.
   
}

  