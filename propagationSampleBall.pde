  void propagationSampleBall(){ 

    samplingMovementPro();
    phaseMapped[0] = movementInterpolated;
  
        modeStartKeyToFollow = " null ";
        keyMode = " propagationSampleBall ";
        formerKeyMetro = '*';

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

    }


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
  //    lockOscillatorToPositionFromPreviousProagedBallTest();
      for (int i = 0; i < networkSize-0; i+=1) { 
  //    phaseMappedFollow[i] = netPhaseBase[i];
  //    phaseMappedFollow[i] = phaseMappedFollow[i]%TWO_PI; 
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
      //phasePatternBase();

      for (int i = 0; i < networkSize-0; i+=1) {
      phaseMappedFollow[i] = netPhaseBase[i];
       }
      }
     }


    propagationSpeed=70.0; // useless if propagation comes from ableton Live

         signal[2] = map((((cos (frameCount / 30.0)) *-  1) % 1), -1, 1, -1, 1);  // sinusoida
      // dans Live on peut avoir dent scie ou triange ou sinusoidal   
      splitTimeScaleRotation(signal[2]);  // ascendant vs descendant => changement de sens de propagation

       // splitTimeSinusoidaleScale(trigedSignFromAbleton[3]);
       // splitTimeWithTrigSignalFromAbletonSquare(trigedSignFromAbleton[3]);// with signal ==1
       // splitTimeWithTrigSignalFromAudioAbleton(trigedSignFromAbleton[0]); // wit z false need triangular if not need signal == 1
       propagation2wayRotationBis(); 

       actualisePositionDataFromCircular = false; //    lastRecordData of motors positiond were stocked when the circular Mode was true as formerKeyMetro == '#'

        mapNewPosX(); // counter actived
   
      if (measure == 66 && beatPrecised == 4 && beatPrecisedTrigged==true) { 

        addSignalOneAndTwoTer();
     //     positionMov = " troisieme " ;  
       textSize (500);         
      } 

 }