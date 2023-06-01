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


     textSize (50);
     text (" oldOscillatorChange " + oldOscillatorChange + " oscillatorChange " + oscillatorChange + " j " + nf (phaseKeptAtChange[oscillatorChange], 0, 2), -width, -height- 900+300 );
     text (" propagationTrigged " + propagationTrigged + " propagationSpeed " + propagationSpeed + " key " + key, -width, -height- 800+300  );
     text (" signal2  " +nf(signal[2], 0, 2) + " QpropWay " + doQ + " doZ " + doZ + " BlargerPhase " + doB , -width, -height- 700+300 );
     text (" lock " + dol + " oWay " + doo + " doC " + doC , -width, -height- 600+300 );
     text (" QpropWay " + doQ + " doZ " + doZ + " BlargerPhase " + doB , -width, -height- 500+300   );
     text (" oldSignalToSplit " + oldSplitTime + " splitTime " +  splitTime + " timeLFO " + timeLfo,  -width, -height- 400+300  );
     text (" oldSignalToSplit " + nf (oldSignalToSplit, 0, 2) + " signalToSplit " +     nf (signalToSplit, 0, 2) + " timeLFO " + timeLfo,  -width, -height );
     
     letter = key;   

     
  switch(letter) {
    case 'o': // way of rotation
    doo=!doo;
    key = '#';
    break;

    case 'c': 
    doC=!doC;
    key = '#';
    break;
    
    case 'l': // enable propagation or lock
    dol=!dol;
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
    case '#': // break to not loop
    break;
    }
 
 // splitTimeScaleRotation(30.0); //  10.0= vitesse de propagation. On change de sens de ROTATION avec q et z.
 // splitTimeLfoScale();  // change de sens de PROPAGATION
  
   if ( formerFormerKey == '#' || modeStartKeyToFollow == " null ") { // formerFormerKey == '#' || 
    
    println ( " modeStartKeyToFollow " + modeStartKeyToFollow);
        if (key == 'o' ) {
     //   signal[2]=- signal[2] ;
     for (int i = 0; i < networkSize-0; i+=1) { 
        newPosFollowed[i]=-newPosFollowed[i];
           }
       }
  

      for (int i = 0; i < networkSize-0; i+=1) {             
  //    newPosFollowed[i]=map (signal[2], 0, 1, 0, TWO_PI); // signals to follow
   //    newPosFollowed[i]=newPosFollowed[i]%TWO_PI;  // signals to follow
       phaseMapped[i] = newPosFollowed[i]+phaseMappedFollow[i]; // new signal is a composition 

      if (phaseMapped[i]<0){
      DataToDueCircularVirtualPosition[i]= int (map (phaseMapped[i], 0, -TWO_PI, numberOfStep, 0)); 
      phaseMapped[i]= map (DataToDueCircularVirtualPosition[i], numberOfStep, 0, 0, -TWO_PI);  
       }
       
      else {
    
      DataToDueCircularVirtualPosition[i]= (int) map (phaseMapped[i], 0, TWO_PI, 0, numberOfStep); 
      phaseMapped[i]= map (DataToDueCircularVirtualPosition[i], 0, numberOfStep, 0, TWO_PI);
       }


      newPosXaddSignal[i]=phaseMapped[i];
 
  }
  
 }
    //lockOscillatorToPositionFromPreviousProagedBall();
      //******** Lock last oscillator to the lastPhase

      if (  propagationTrigged==true && dol==true) {
      lockOscillatorToPositionFromPreviousProagedBallTest();
      for (int i = 0; i < networkSize-0; i+=1) { 
      phaseMappedFollow[i] = netPhaseBase[i];
      phaseMappedFollow[i] = phaseMappedFollow[i]%TWO_PI; 
      }
     }
    
 
 
      if (key != '#' ) {
      if (modeStartKeyToFollow == " null ") {
   //  phasePatternOriginal();
      phasePatternBase();

      for (int i = 0; i < networkSize-0; i+=1) {
  //  newPosFollowed[i]=netPhaseBase[i]; 
      phaseMappedFollow[i] = netPhaseBase[i];
    //  phaseMappedFollow[i] = phaseMappedFollow[i]%TWO_PI; 
       }
      }
     }


   propagationSpeed=100;
   splitTimeScaleRotationTest(propagationSpeed);
   propagation2wayRotationBisTest(); 
   mapDataToMotor();

 
 
 }
 
 void propagation2wayRotationBisTest() {   //CONDITION QUAND SIGNAL NEGATIF fu style

   if (doC==true && doo==false ){ // // fonctionne avec o = false

  //    LFO[oscillatorChange] = newPosXaddSignal[oscillatorChange]%TWO_PI;
   //   LFO[oscillatorChange] = LFO[oldOscillatorChange] - (PI/(6*networkSize)-1);
      LFO[oscillatorChange] = LFO[oldOscillatorChange] ;

        if (LFO[oscillatorChange]<0){ 
      for (int i = 0; i <  networkSize-0; i+=1) { 

   //    LFO[oscillatorChange]= map (LFO[oscillatorChange], - TWO_PI, 0, 0, TWO_PI);
    }
      }

  //     dataMappedForMotor[oldOscillatorChange]= (int) map (LFO[oldOscillatorChange], 0, TWO_PI , 0, numberOfStep);  // 
       dataMappedForMotor[oscillatorChange]= (int) map (LFO[oscillatorChange], 0, TWO_PI , 0, numberOfStep);  // 
       
              
       println (" MAIN true phaseKeptAtChange[oscillatorChange] ", oscillatorChange, " " ,  LFO[oscillatorChange]);
       println (" MAIN true phaseKeptAtChange[oldOscillatorChange] ", oldOscillatorChange, " " ,  LFO[oldOscillatorChange]);

      newPosXaddSignal[oldOscillatorChange]= map (dataMappedForMotor[oldOscillatorChange], 0, numberOfStep, 0, TWO_PI);
      newPosXaddSignal[oscillatorChange]= map (dataMappedForMotor[oscillatorChange], 0, numberOfStep, 0, TWO_PI);
    
     }

      if (doC==true && doo==true && doB!=true ){ // // fonctionne avec o = false/ ajoute  ou retire )1 au compteur selon propa
  //     LFO[oscillatorChange] = LFO[oldOscillatorChange]+QUARTER_PI*1/2 ;  // on ajoute 
//++  phaseKeptAtChange[oscillatorChange]=LFO[oscillatorChange]%TWO_PI;

 //***  phaseKeptAtChange[oscillatorChange]= newPosXaddSignal[oscillatorChange]%TWO_PI;
//***   phaseKeptAtChange[oscillatorChange]= phaseKeptAtChange[oscillatorChange]+(PI/(2*networkSize)-1);


   //   LFO[oscillatorChange] = newPosXaddSignal[oscillatorChange]%TWO_PI;
      LFO[oscillatorChange] = LFO[oldOscillatorChange] + (PI/(3*networkSize)-1);
      text ( "  doC==true && doo==true && doB!=true LFO " + LFO[oscillatorChange], 0, 500);
        if (LFO[oscillatorChange]<0){ 
    //  for (int i = 0; i <  networkSize-0; i+=1) { 

    //  LFO[oscillatorChange]= map (LFO[oscillatorChange], - TWO_PI, 0, 0, TWO_PI);
  //  }
      }

       dataMappedForMotor[oscillatorChange]= (int) map (LFO[oscillatorChange], 0, TWO_PI , 0, numberOfStep);  // 
       
      newPosXaddSignal[oldOscillatorChange]= map (dataMappedForMotor[oldOscillatorChange], 0, numberOfStep, 0, TWO_PI);
      newPosXaddSignal[oscillatorChange]= map (dataMappedForMotor[oscillatorChange], 0, numberOfStep, 0, TWO_PI);
    
     }






   if (doB!=true && doC!=true){ // && propagationTrigged==true
  //     LFO[oscillatorChange] = LFO[oldOscillatorChange]+QUARTER_PI*1/2 ;  // on ajoute 
//++  phaseKeptAtChange[oscillatorChange]=LFO[oscillatorChange]%TWO_PI;
 //***  phaseKeptAtChange[oscillatorChange]= newPosXaddSignal[oscillatorChange]%TWO_PI;


    //  LFO[oscillatorChange] = newPosXaddSignal[oscillatorChange]%TWO_PI;
      LFO[oscillatorChange] = LFO[oscillatorChange] + (PI/(3*networkSize-0));

        if (LFO[oscillatorChange]<0){ 
      for (int i = 0; i <  networkSize-0; i+=1) { 

   //    LFO[oscillatorChange]= map (LFO[oscillatorChange], - TWO_PI, 0, 0, TWO_PI);
    }


      }

       dataMappedForMotor[oscillatorChange]= (int) map (LFO[oscillatorChange], 0, TWO_PI , 0, numberOfStep);  // 
       
              
       text (" MAIN true phaseKeptAtChange[oscillatorChange] " + oscillatorChange + " " + phaseKeptAtChange[oscillatorChange], 0, 400);
       println (" MAIN true phaseKeptAtChange[oldOscillatorChange] ", oldOscillatorChange, " " ,  phaseKeptAtChange[oldOscillatorChange]);

      newPosXaddSignal[oscillatorChange]= map (dataMappedForMotor[oscillatorChange], 0, numberOfStep, 0, TWO_PI);
    
     }


    if (doB==true && doC!=true){ 
      
   //      phaseKeptAtChange[oscillatorChange]= newPosXaddSignal[oscillatorChange]%TWO_PI;
         phaseKeptAtChange[oscillatorChange]= phaseKeptAtChange[oldOscillatorChange];//+(PI/((2*networkSize)-1)); // on ajoute 
   //****    LFO[oscillatorChange] =LFO[oldOscillatorChange]+(PI/(2*networkSize-1)) ;  
  
    //   dataMappedForMotor[oscillatorChange]= (int) map (LFO[oscillatorChange], 0, TWO_PI , 0, numberOfStep);  // 
        dataMappedForMotor[oscillatorChange]= (int) map (phaseKeptAtChange[oscillatorChange], 0, TWO_PI , 0, numberOfStep);  // 
       
       text (" phaseKeptAtChange[oscillatorChange] " + oscillatorChange + " " +  phaseKeptAtChange[oldOscillatorChange], 0, 300);
      
       
     //   newPosXaddSignal[oldOscillatorChange]= map (dataMappedForMotor[oldOscillatorChange], 0, numberOfStep, 0, TWO_PI); // GOOD

         newPosXaddSignal[oscillatorChange]= map (dataMappedForMotor[oscillatorChange], 0, numberOfStep, 0, TWO_PI);
     }

      for (int i = 0; i <  networkSize-0; i+=1) { 
   // net.phase[i]=newPosXaddSignal[i]; // to display to screen
   // net.phase[i]%=TWO_PI;
    }
 
///////////////////// 
 //  mapDataToMotor();


  }



 void  splitTimeScaleRotationTest(float propagationSpeed) { 
   

      //   signal[2] = (0*PI + (frameCount / propagationSpeed) * cos (1000 / 500.0)*-1); //%1 TWO_PI
     if (doo==true  ){      
          signal[2] = -  signal[2]; //%1
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
  
  
//    if (doZ==false && timeLfo<=0  ){ // doZ==true  // doZ==false with signal sinusoidale
//   if (oldSplitTimeLfo<splitTimeLfo){ //  if (  oldSplitTimeLfo>splitTimeLfo){  //  if (oldSplitTimeLfo<splitTimeLfo)  signal sinusoidale


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
 
       text ( "   SPLIT TIME  timeLfoooooooooo " + " timeLfo   " + timeLfo, -width-200, +height-100  );
        text (" oldSplitTimeLfo " + oldSplitTimeLfo + " splitTime " +   splitTimeLfo + " timeLFO " + timeLfo,  -width-200, +height );

   oldSplitTimeLfo=splitTimeLfo;
   splitTimeLfo= int  ((timeLfo)%100)+0;    // the time is splitted at each %100. That mean ten time from the beginning to the end of signal[2]. from 0 to 1.
   
}

  