//boolean doQ, doZ, doB; 

boolean propagationTrigged;
boolean doo=false;
boolean dol=false;
boolean doC=false;
/*
String modeStartKeyToFollow, keyMode;
     
float phaseMapped [] =  new float  [networkSize]; 
float newPosFollowed  [] =  new float  [networkSize]; 
float phaseMappedFollow  [] =  new float  [networkSize]; 
*/


void propagationBallRotationBis(){ // as addSignalOneAndTwoQuater() in NAOP 
modeStartKeyToFollow = " null ";
keyMode = " propagationBallRotationBis ";

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
void  splitTimeWithTrigSignalFromAbletonSquare(float propagationSpeedWithSquareSignal) { 
        text ( " Z to change Propagation Way trigedSignFromAbleton2 " + trigedSignFromAbleton[2] + " 3 " + trigedSignFromAbleton[3],  500, 900);

 //    signal[2] = (0*PI + (frameCount / propagationSpeed) * cos (1000 / 500.0)*-1); //%1 IF NO SIGNAL FROM ABLETON LIVE
         
    propagationTrigged=false;;
         
       if (doZ==false && trigedSignFromAbleton[3]==1){  // propagationSpeedWithSquareSignal==1

  
      propagationTrigged=true;
      oldOscillatorChange=oscillatorChange;
      oscillatorChange=oscillatorChange+1;
   

      oscillatorChange=oscillatorChange%networkSize;
      if (oscillatorChange<=0) {
      oscillatorChange=0;
      oldOscillatorChange=networkSize-1;
   } 
  }
  

       if (doZ==true  &&  trigedSignFromAbleton[3]==1 ){  //     if (doZ==true  && propagationSpeedWithSquareSignal==1 ){ 
 
      propagationTrigged=true;
      oldOscillatorChange=oscillatorChange;
      oscillatorChange=oscillatorChange-1;
   
      if (oscillatorChange<=-1) {
      oldOscillatorChange=0;
      oscillatorChange=networkSize-1;
   }
  }       

}


 void  splitTimeWithTrigSignalFromAudioAbleton(float trigedSignFromAbleton0) { 
        text ( "trigedSignFromAbleton0 " + trigedSignFromAbleton[0], 500, 900);

 //    signal[2] = (0*PI + (frameCount / propagationSpeed) * cos (1000 / 500.0)*-1); //%1 IF NO SIGNAL FROM ABLETON LIVE
         
    propagationTrigged=false;
    oscillatorChanged=false;

    
  
         
    if (doZ==false &&
    ((trigedSignFromAbleton[0]>0.5 && oldTrigedSignFromAbleton[0]<0.5) || (trigedSignFromAbleton[0]<0.5 && oldTrigedSignFromAbleton[0]>0.5))
    ){  
       
      oscillatorChanged=propagationTrigged=true;
      oldOscillatorChange=oscillatorChange;
      oscillatorChange=oscillatorChange+1;
   

      oscillatorChange=oscillatorChange%networkSize;
      if (oscillatorChange<=0) {
      oscillatorChange=0;
      oldOscillatorChange=networkSize-1;
   } 
  }
  
   if (doZ==true  && trigedSignFromAbleton[0]==1  ){ 

     
      oscillatorChanged= propagationTrigged=true;
      oldOscillatorChange=oscillatorChange;
      oscillatorChange=oscillatorChange-1;
   
     if (oscillatorChange<=-1) {
     oldOscillatorChange=0;
     oscillatorChange=networkSize-1;
   }
  }

     oldTrigedSignFromAbleton[0]=trigedSignFromAbleton[0];       

}


 void propagation2wayRotationBis() {   // FAIRE CONDITION QUAND SIGNAL NEGATIF fu style

 if (doo==true  && propagationTrigged==true){  //AMPLITUDE  negative way : ccw
      float phaseAmount=trigedSignFromAbleton[1];
      phaseAmount= map (phaseAmount, 0, 1, 1, 0);     
      phaseAmount = map (phaseAmount, 0, 1, 0, TWO_PI);
      text ( "phaseAmount " + phaseAmount, 500, 1000);

      LFO[oscillatorChange] = LFO[oldOscillatorChange]; //     
      LFO[oscillatorChange] -=  (phaseAmount/(1*networkSize-1));
      text ( "  LFO[oscillatorChange] " +   LFO[oscillatorChange], 500, 1100);
   }       

if (doo==false && propagationTrigged==true){
      LFO[oscillatorChange] = LFO[oldOscillatorChange];// newPosXaddSignal[oscillatorChange]%TWO_PI;
      LFO[oscillatorChange] = LFO[oscillatorChange] + (PI/(1*networkSize-1));
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


void  splitTimeLfoScaleBis() {  // change de sens de propagagtion.   ATTENTION dans ce reglage le signalToSplit de propgation est UP continue de 0 à TWO_PI

    lfoPhase[1] = (frameCount / 10.0 * cos (1000 / 500.0)*-1)%TWO_PI;  // continue 0 to TWO_PI;
    lfoPhase[3] = map ((((cos  (frameCount / 30.0))*-1) %2), -1, 1, -TWO_PI, TWO_PI);  // sinusoidale lente
    lfoPhase[2] = map ((((cos  (frameCount / 50.0))*-1) %2), -1, 1, -TWO_PI, TWO_PI); // sinusoidale rapide
    
    println (" forme d'onde lfoPhase[1] ", lfoPhase[1], "lfoPhase[2] ", lfoPhase[2], "lfoPhase[3]= signalTosplit ", lfoPhase[3]); 

    oldSignalToSplit=signalToSplit;
    signalToSplit= lfoPhase[3];
 
  if (oldSignalToSplit> signalToSplit ) {
    key = 'q' ; // when signal goes down --> propagation FRONT SIDE
   timeLfo= map (signalToSplit, TWO_PI, -TWO_PI, 0, 1000);  //  if we have an oscillation as  lfoPhase[3]
    }
  else if (oldSignalToSplit< signalToSplit ) { // on est dans cette configuration avec  signalToSplit= lfoPhase[1]
   key = 'z';  //  when signal goes down --> propagation BEHIND SIDE 
//   key = 'q' ;  // propagation in on the same way
   timeLfo= map (signalToSplit, -TWO_PI, TWO_PI, 0, 1000);  // if we have an oscillation  lfoPhase[3]
 //**   timeLfo= map (signalToSplit, 0, TWO_PI, 0, 1000);  // if we have a continuois from 0 to TWO_PI 
 //   timeLfo= map (signalToSplit, 0, 1, 0, 1000); //  if we have a continuois from 0 to TWO_PI from an other software
 
   }

  int splitTimeLfo= int  (timeLfo%100);   // 100 is the size of the gate trigging the change of the ball  
   
      println ( " oldSignalToSplit " + oldSignalToSplit + " signalToSplit " + signalToSplit );
      print (" timeLfo "); print ( timeLfo );   print (" splittimeLfo "); println ( splitTimeLfo );


 if (doZ==false){  // case q
  if (oldSplitTimeLfo>splitTimeLfo){

      oldOscillatorChange=oscillatorChange;
      oscillatorChange=oscillatorChange+1;
   } 
      oscillatorChange=oscillatorChange%networkSize;
      
  if (oscillatorChange<=0) {
  //    oscillatorChange=0;
      oldOscillatorChange=networkSize-1;
   } 
  }
  
 if (doZ==true){ // case z
  if (  oldSplitTimeLfo>splitTimeLfo){

      oldOscillatorChange=oscillatorChange;
      oscillatorChange=oscillatorChange-1;
   } 
      if (oscillatorChange<=-1) {

      oldOscillatorChange=0;
      oscillatorChange=networkSize-1;
   }
  }  

  if ( oldOscillatorChange!=oscillatorChange )
  {
   oscillatorChanged=true;
  } 
   oldSplitTimeLfo = splitTimeLfo;
             
}

 void splitTimeScaleRotation(float propagationSpeed) {
  if (doo) {
    signal[2] = -signal[2];
  }
  
  if (!doZ) {
    propagationTrigged = false;
    if (oldSplitTimeLfo > splitTimeLfo) {
      oldOscillatorChange = oscillatorChange;
      oscillatorChange++;
      propagationTrigged = true;
    }
    
    oscillatorChange %= networkSize;
    if (oscillatorChange <= 0) {
      oscillatorChange = 0;
      oldOscillatorChange = networkSize - 1;
    }
  }
  
  if (doZ) {
    propagationTrigged = false;
    if (oldSplitTimeLfo > splitTimeLfo) {
      oldOscillatorChange = oscillatorChange;
      oscillatorChange--;
      propagationTrigged = true;
    }
    
    if (oscillatorChange <= -1) {
      oldOscillatorChange = 0;
      oscillatorChange = networkSize - 1;
    }
  }
  
  timeLfo = int(map(signal[2], 0, 1, 0, networkSize * 100));
  if (doo) {
    timeLfo = -timeLfo;
  }
  
  text("SPLIT TIME timeLfoooooooooo " + splitTimeLfo + " timeLFO " + timeLfo, -width - 200, +height);
  
  oldSplitTimeLfo = splitTimeLfo;
  splitTimeLfo = int((timeLfo) % 100) + 0;
}

void lockOscillatorToPositionFromPreviousProagedBall() { // revoir lock
  if (propagationTrigged ) {
    int i = oscillatorChange;
    int h = (oscillatorChange + 1) % networkSize;
    int j;  
    j= (oscillatorChange-1);
    if (j<= -1){
    j= networkSize-1;
    }
   // int j = (oscillatorChange - 1 <= -1) ? networkSize - 1 : oscillatorChange - 1;
    int k = (j - 1 <= -1) ? networkSize - 1 : j - 1;
    int l = (k - 1 <= -1) ? networkSize - 1 : k - 1;
    int m = (l - 1 <= -1) ? networkSize - 1 : l - 1;
    
    if (propagationTrigged ) {
      if (newPosXaddSignal[i] < 0) {
        phaseKeptAtChange[j] = newPosXaddSignal[i] % TWO_PI;
        dataMappedForMotor[i] = int(map(phaseKeptAtChange[i], 0, -TWO_PI, numberOfStep, 0));
        netPhaseBase[i] = map(dataMappedForMotor[i], numberOfStep, 0, 0, -TWO_PI);
      }
      else {
        phaseKeptAtChange[j] = newPosXaddSignal[i] % TWO_PI;
        dataMappedForMotor[i] = int(map(phaseKeptAtChange[i], 0, TWO_PI, 0, numberOfStep));
        netPhaseBase[i] = map(dataMappedForMotor[i], 0, numberOfStep, 0, TWO_PI);
      }
    }
    
    for (int p = 0; p < networkSize - 0; p += 1) {
      // phaseMappedFollow[i]= net.phase[i];// add offset given by pendularPattern
     //  phaseMappedFollow[i] = netPhaseBase[i]; // NO
      // phaseMappedFollow[p]= phaseMappedFollow[p]%TWO_PI;
    }

   /* //------- to add2 more locked ball
    LFO[l] = LFO[l] % TWO_PI;
    dataMappedForMotor[l] = int(map(LFO[l], 0, TWO_PI, 0, numberOfStep));
    netPhaseBase[l] = map(dataMappedForMotor[l], 0, numberOfStep, 0, TWO_PI);
    
    LFO[k] = LFO[k] % TWO_PI;
    dataMappedForMotor[k] = int(map(LFO[k], 0, TWO_PI, 0, numberOfStep));
    netPhaseBase[k] = map(dataMappedForMotor[k], 0, numberOfStep, 0, TWO_PI);
     //------- to add2 more locked ball
   // println("phaseKeptAtChange[oscillatorChange] ", oscillatorChange, " ", phaseKeptAtChange[oscillatorChange]);
   // println("phaseKeptAtChange[oldOscillatorChange] ", oldOscillatorChange, " ", phaseKeptAtChange[oldOscillatorChange]);
   */
  }
}

   void  displayPropagationControl(){
     text (" oldOscillatorChange " + oldOscillatorChange + " oscillatorChange " + oscillatorChange + " j " + nf (phaseKeptAtChange[oscillatorChange], 0, 2), -width, -height- 900-300 );
     text (" propagationTrigged " + propagationTrigged + " propagationSpeed " + propagationSpeed + " key " + key, -width, -height- 800-300  );
     text (" signal2  " +nf(signal[2], 0, 2) + " QpropWay " + doQ + " doZ " + doZ + " BlargerPhase " + doB , -width, -height- 700-300 );
     text (" lock " + dol + " oWay " + doo + " doC " + doC , -width, -height- 600-300 );
     text (" QpropWay " + doQ + " doZ " + doZ + " BlargerPhase " + doB , -width, -height- 500-300   );
     text (" oldSignalToSplit " + oldSplitTime + " splitTime " +  splitTime + " timeLFO " + timeLfo,  -width, -height- 400-300  );
     text (" oldSignalToSplit " + nf (oldSignalToSplit, 0, 2) + " signalToSplit " +     nf (signalToSplit, 0, 2) + " timeLFO " + timeLfo,  -width, -height );
    } 
