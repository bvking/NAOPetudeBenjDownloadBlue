void addSignalOneAndTwoOriginal(){
   textSize (50);

     text (" olldOriginal " + oldOscillatorChange + " oscillatorChange " + oscillatorChange + " j " + nf (phaseKeptAtChange[oscillatorChange], 0, 2), -width, -height- 900-300 );
     text (" propagationTrigged " + propagationTrigged + " propagationSpeed " + propagationSpeed + " key " + key, -width, -height- 800-300  );
     text (" signal2  " +nf(signal[2], 0, 2) + " QpropWay " + doQ + " doZ " + doZ + " BlargerPhase " + doB , -width, -height- 700-300 );
     text (" lock " + dol + " oWay " + doo + " doC " + doC , -width, -height- 600-300 );
     text (" QpropWay " + doQ + " doZ " + doZ + " BlargerPhase " + doB , -width, -height- 500-300   );
     text (" oldSignalToSplit " + oldSplitTime + " splitTime " +  splitTime + " timeLFO " + timeLfo,  -width, -height- 400-300  );
     text (" oldSignalToSplit " + nf (oldSignalToSplit, 0, 2) + " signalToSplit " +     nf (signalToSplit, 0, 2) + " timeLFO " + timeLfo,  -width, -height );
     
     
     letter = key;   

     // manage effect to splitTimeScale
     
    switch(letter) {
    case 'o': // way of propagation
    doo=true;
    break;
    case 'O': // way of propagation:
    doo=false;
    break;

    case 'l': // way of propagation
    dol=true;
    break;
    case 'L': // way of propagation
    dol=false;
    break;
    case 'q': // way of propagation
    doQ=true;
    doZ=false;
    break;
    case 'b': 
   
    doB=true;
    key = '#';
    break;
   
    case 'B': 
    doB=false;
    key = '#';
    break;

    case 'Z': // change way of propagation
    doZ=true;
   // doZ=!doZ;
    doQ=true;
    break;
     case 'z': // change way of propagation
    doZ=false;
    doQ=true;
    break;
    case '#': // change way of propagation
    
    break;
    }

  
  
   if (formerFormerKey == '#' || keyMode == " addSignalOneAndTwo ") {
    

      for (int i = 0; i < networkSize-0; i+=1) {       
     //  newPosFollowed[i]=map (signal[2], 0, 1, 0, TWO_PI); // balls don't turn but propaged only
       phaseMapped[i] = newPosFollowed[i]+phaseMappedFollow[i]; // new signal is a composition 
       phaseMapped[oscillatorChange]=   phaseMapped[oscillatorChange]+   LFO[oscillatorChange];     //      newPosXaddSignal[oscillatorChange];
   
       if (phaseMapped[i]<0){   
       dataMappedForMotorisedPosition[i]= int (map (phaseMapped[i], 0, -TWO_PI, numberOfStep, 0)); 
       phaseMapped[i]= map (dataMappedForMotorisedPosition[i], numberOfStep, 0, 0, -TWO_PI);
       }
       
       else {  
       dataMappedForMotorisedPosition[i]= (int) map (phaseMapped[i], 0, TWO_PI, 0, numberOfStep); 
       phaseMapped[i]= map (dataMappedForMotorisedPosition[i], 0, numberOfStep, 0, TWO_PI);
       }

         newPosXaddSignal[i]=phaseMapped[i];  // 
       }  
      }

   
      //******** Lock last oscillator to the lastPhase

      if (  propagationTrigged==true && dol==true) {
      lockOscillatorToPositionFromPreviousProagedBall();
      for (int i = 0; i < networkSize-0; i+=1) { 
      phaseMappedFollow[i] = netPhaseBase[i];
      phaseMappedFollow[i] = phaseMappedFollow[i]%TWO_PI; 
      }
     }



    if (key!='#' ) {
    if (keyMode == " addSignalOneAndTwo ") {
     phasePatternBase();
     
    for (int i = 0; i < networkSize-0; i+=1) { 
   // phaseMappedFollow[i]= net.phase[i];// add offset given by pendularPattern   
      phaseMappedFollow[i] = netPhaseBase[i];
   // phaseMappedFollow[i]= phaseMappedFollow[i]%TWO_PI;  
    }
   }
  }

    //******** Lock last oscillator to the lastPhase
   splitTimeWithTrigSignalFromAudioAbleton(trigedSignFromAbleton[0]); // change de change de sens de PROPAGATION avec Z ou z
    propagation2wayDelay(); 
  //  addSignalLfoPatternTer();
    mapNewPosX();   // transform data to count revolution
  

   for (int i = 0; i <  networkSize-0; i+=1) { 
 //   net.phase[i]=newPosXaddSignal[i]; // to display to screen
  //  net.phase[i]%=TWO_PI;
    }

  
    
 }

 
 
 
 void propagation2wayDelay() { 
  
   if (doo=true && propagationTrigged==true){ 

    float phaseAmount=trigedSignFromAbleton[1];
      phaseAmount= map (phaseAmount, 0, 1, 1, 0);     
      phaseAmount = map (phaseAmount, 0, 1, 0, TWO_PI);
      text ( "phaseAmount " + phaseAmount, 500, 1000);

      LFO[oscillatorChange] = LFO[oldOscillatorChange]; //     
      LFO[oscillatorChange] -=  (phaseAmount/(1*networkSize-1));
      text ( "  LFO[oscillatorChange] " +   LFO[oscillatorChange], 500, 1100);

    //    LFO[oscillatorChange] =LFO[oldOscillatorChange]-QUARTER_PI*1/2 ;  // CCW
 
    //   dataMappedForMotor[oscillatorChange]= (int) map (LFO[oscillatorChange], 0, TWO_PI , 0, numberOfStep);  // 
       println (" true phaseKeptAtChange[oscillatorChange] ", oscillatorChange, " " ,  phaseKeptAtChange[oldOscillatorChange]);
 
     //  newPosXaddSignal[oscillatorChange]= map (dataMappedForMotor[oscillatorChange], 0, numberOfStep, 0, TWO_PI);
      //    LFO[oldOscillatorChange]= map (dataMappedForMotor[oldOscillatorChange], 0, numberOfStep, 0, TWO_PI);
      //    LFO[oscillatorChange]= map (dataMappedForMotor[oscillatorChange], 0, numberOfStep, 0, TWO_PI);
     }
   
     
   if (doo==false && propagationTrigged==true){ 

       LFO[oscillatorChange] =LFO[oldOscillatorChange]+QUARTER_PI*1/2 ;  // CW
     //  LFO[oscillatorChange] =  LFO[oscillatorChange] %TWO_PI;

   //    dataMappedForMotor[oscillatorChange]= (int) map (LFO[oscillatorChange], 0, TWO_PI , 0, numberOfStep);  // 
    //   println (" true phaseKeptAtChange[oscillatorChange] ", oscillatorChange, " " ,  phaseKeptAtChange[oldOscillatorChange]);

  //     newPosXaddSignal[oldOscillatorChange]= map (dataMappedForMotor[oldOscillatorChange], 0, numberOfStep, 0, TWO_PI);
  //     newPosXaddSignal[oscillatorChange]= map (dataMappedForMotor[oscillatorChange], 0, numberOfStep, 0, TWO_PI);
     }


  // MAP depends of the way of rotation


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

  
  // END MAP depends of the way of rotation
 
        for (int i = 0; i <  networkSize-0; i+=1) { 
 //   net.phase[i]=newPosXaddSignal[i]; // to display to screen
 //   net.phase[i]%=TWO_PI;
    }
///////////////////// 
 

 for (int k = 0; k < this.nbBalls; k++) 
    {    
    //    drawBall(k, newPosXaddSignal[k] );  
    //    print (" newPosXaddSignal[k] " + newPosXaddSignal[k]); 
    } 
  }
 
 void addSignalLfoPatternOld()  {
   
    if (doQ==true ){
  //   pendularPattern(); // offset with lfo oscillator by osillator
 //    print ("  case q phaseFollowLFO " + oscillatorChange + " "  + phaseFollowLFO[oscillatorChange] + " "); print ("  LFOoscillatorChange  "); print (oscillatorChange); print ("   ") ;  print (LFO[oscillatorChange]  ); 
 //    print (" newPosXaddSignal[oscillatorChange] " + newPosXaddSignal[oscillatorChange]);
     //   phaseFollowLFO[oscillatorChange]= lfoPhase[2];  
  //   signal[4] = (0*PI + (frameCount / 20.0) * cos (1000 / 500.0)*-1)%1;
    phaseFollowLFO[oscillatorChange]= map (signal[4], 0, 1, 0, TWO_PI);    // speed of rotation
  // phaseFollowLFO[oscillatorChange]= map (0.01, 0, 1, 0, TWO_PI); //   ..DON4T WORK

   }

  
    print ("  LFO+LFOoscillatorChange  "); print (oscillatorChange); print ("   ") ;  println (LFO[oscillatorChange]  ); 

   if (formerFormerKey  == '#' ) { //  != '#'
     print ("  normal " + frameCount + " lfoPhase[1] " + lfoPhase[1] + " lfoPhase[2] " + lfoPhase[2]);    println (   ); 
       
  //    for (int i = 2; i <  networkSize-0; i+=1) { 
    int i;
    i= oscillatorChange;
    
  int j;  
  j= (oscillatorChange-1);
  if (j<= 1){
  j= networkSize-1;
  }
 
 //********POURQUOI DIFFERENT AU DEMARRAGE DE lA FONCTION
  //  signal[2] = (0*PI + (frameCount / 20.0) * cos (1000 / 500.0)*-1)%1; //NO vitesse roat
   //  signal[2] = 0.08;
   
      LFO[i] =  map (signal[2], 0, 1, 0, TWO_PI);  
      
      
   //    LFO[i] =  map (0.01, 0, 1, 0, TWO_PI);  // CONSTANT

  
    if ( LFO[i]<0){   
       LFO[i] =    LFO[i];
       dataMappedForMotor[i]= int (map (LFO[i], 0, -TWO_PI, numberOfStep, 0)); 

       newPosXaddSignal[i]= map (dataMappedForMotor[i], numberOfStep, 0, 0, -TWO_PI);
  }
       
   else
       LFO[i] = LFO[i];

       LFO[i] = LFO[i]%TWO_PI;
       dataMappedForMotor[i]= (int) map (LFO[i], 0, TWO_PI, 0, numberOfStep);

       newPosXaddSignal[i]= map (dataMappedForMotor[i], 0, numberOfStep, 0, TWO_PI);
   
 // ABOVE LFO on oscillatorChange
 
/*    
   if (LFO[oscillatorChange]<0 && phaseFollowLFO[oscillatorChange]<0 ) {        
       LFO[oscillatorChange] =   phaseFollowLFO[oscillatorChange]-LFO[oscillatorChange]; 
       dataMappedForMotor[oscillatorChange]= int (map (LFO[oscillatorChange], 0, -TWO_PI, numberOfStep, 0)); 

       newPosXaddSignal[oscillatorChange]= map (dataMappedForMotor[oscillatorChange], numberOfStep, 0, 0, -TWO_PI);
  }
       
   else if (LFO[oscillatorChange]>0 && phaseFollowLFO[oscillatorChange]>0 ) {      
       LFO[oscillatorChange] = phaseFollowLFO[oscillatorChange]; // +LFO[oscillatorChange];
       LFO[oscillatorChange] = LFO[oscillatorChange]%TWO_PI;
       dataMappedForMotor[oscillatorChange]= (int) map (LFO[oscillatorChange], 0, TWO_PI, 0, numberOfStep);

       newPosXaddSignal[oscillatorChange]= map (dataMappedForMotor[oscillatorChange], 0, numberOfStep, 0, TWO_PI);
    
    }
    
 */   
  }

    println (" newPosXaddSignal[oscillatorChange] ",  oscillatorChange, " ",  newPosXaddSignal[oscillatorChange] );
  
     int j;  
  j= (oscillatorChange-1);
  if (j<= 1){
  j= networkSize-1;
  }
       
  if (oscillatorChanged==true )  { 
//  phaseKeptAtChange[k]=newPosXaddSignal[j];
   phaseKeptAtChange[oscillatorChange]=newPosXaddSignal[oscillatorChange];
  //   phaseKeptAtChange[oscillatorChange]=newPosXaddSignal[oscillatorChange];    //  RECORD on oscillatorChange-1 the postion of oscillatorChange where it has just changed
 //phaseKeptAtChange[oscillatorChange]=newPosXaddSignal[j];    //  RECORD on oscillatorChange-1 the postion of oscillatorChange where it has just changed
  
  
   }
   
 //  else key='&';
   
      print (" phaseKeptAtChange[o] ",  oscillatorChange, " ",  phaseKeptAtChange[oscillatorChange] );
      println (" phaseKeptAtChange[j] " , j, " ",  phaseKeptAtChange[j] );
      
   //**    LFO[j] = phaseKeptAtChange[j]+PI/(15-j);
       LFO[j] = phaseKeptAtChange[oscillatorChange];//;+TWO_PI*3 ; //*PI/24 
       LFO[j] = LFO[j]%TWO_PI;
    //   dataMappedForMotor[j]= (int) map (LFO[j], 0, TWO_PI, 0, numberOfStep);
       dataMappedForMotor[oscillatorChange]= (int) map (newPosXaddSignal[oscillatorChange], 0, TWO_PI, 0, numberOfStep);
       println (" phaseKeptAtChange[oscillatorChange] ", oscillatorChange, " " ,  phaseKeptAtChange[oscillatorChange]);
 
   //    newPosXaddSignal[j]= map (dataMappedForMotor[j], 0, numberOfStep, 0, TWO_PI);
          newPosXaddSignal[oscillatorChange]= map (dataMappedForMotor[oscillatorChange], 0, numberOfStep, 0, TWO_PI);
       

///////////////////// 
//mapNewPosX(); // counter actived above




}
 
 
 void assignMotorWithPosition() {
  text (" assignMotorWithPositionTo " + keyMode , 500, 1000);
           for (int i = 0; i < networkSize; i++) {
      // rev[i]=rev[0];


      //*******************************  ASSIGN MOTOR WITH POSITION

      if (revLfo[i]!=0  && (positionToMotor[i] >  0) ) { // number of revLfoolution is even and rotation is clock wise   
        dataMappedForMotorisedPosition[i]= int (map (positionToMotor[i], 0, numberOfStep, 0, numberOfStep))+ (revLfo[i]*numberOfStep);
      }

      if (revLfo[i]!=0  && (positionToMotor[i] <  0)) { // number of revLfoolution is even and rotation is Counter clock wise          // pos[i]= int (map (positionToMotor[i], 0, -numberOfStep, 0,  numberOfStep))+ (revLfo[i]*numberOfStep);
        dataMappedForMotorisedPosition[i]= int (map (positionToMotor[i], 0, -numberOfStep, numberOfStep, 0)) +(revLfo[i]*numberOfStep);       //   print ("pos "); print (i); print (" ");println (pos[i]);
      }

      if (revLfo[i]==0 && (positionToMotor[i] < 0) ) { //  number of revLfoolution is 0 and rotation is counter clock wise 
        dataMappedForMotorisedPosition[i]= int (map (positionToMotor[i], 0, -numberOfStep, numberOfStep, 0));        
      }         
      if  (revLfo[i]==0 && (positionToMotor[i] > 0) ) {  //  number of revLfoolution is 0 and rotation is clock wise     
        dataMappedForMotorisedPosition[i]= int (map (positionToMotor[i], 0, numberOfStep, 0, numberOfStep));                //      print ("pos "); print (i); print (" CW revLfo=0 ");println (pos[i]);
      }
      
      recordLastDataOfMotorPosition[i]=  dataMappedForMotorisedPosition[i];
    }
  
  }
  
  
  void assignMotorWithDataMapped() {
  
           for (int i = 0; i < networkSize; i++) {
      // rev[i]=rev[0];


      //*******************************  ASSIGN MOTOR WITH POSITION

      if (countFollowSignalLfo[i]!=0  && (dataMappedForMotor[i] >  0) ) { // number of countFollowSignalLfoolution is even and rotation is clock wise   
        dataMappedForMotorisedPosition[i]= int (map (dataMappedForMotor[i], 0, numberOfStep, 0, numberOfStep))+ (countFollowSignalLfo[i]*numberOfStep);
      }

      if (countFollowSignalLfo[i]!=0  && (dataMappedForMotor[i] <  0)) { // number of countFollowSignalLfoolution is even and rotation is Counter clock wise          // pos[i]= int (map (dataMappedForMotor[i], 0, -numberOfStep, 0,  numberOfStep))+ (countFollowSignalLfo[i]*numberOfStep);
        dataMappedForMotorisedPosition[i]= int (map (dataMappedForMotor[i], 0, -numberOfStep, numberOfStep, 0)) +(countFollowSignalLfo[i]*numberOfStep);       //   print ("pos "); print (i); print (" ");println (pos[i]);
      }

      if (countFollowSignalLfo[i]==0 && (dataMappedForMotor[i] < 0) ) { //  number of countFollowSignalLfoolution is 0 and rotation is counter clock wise 
        dataMappedForMotorisedPosition[i]= int (map (dataMappedForMotor[i], 0, -numberOfStep, numberOfStep, 0));        
      }         
      if  (countFollowSignalLfo[i]==0 && (dataMappedForMotor[i] > 0) ) {  //  number of countFollowSignalLfoolution is 0 and rotation is clock wise     
        dataMappedForMotorisedPosition[i]= int (map (positionToMotor[i], 0, numberOfStep, 0, numberOfStep));                //      print ("pos "); print (i); print (" CW countFollowSignalLfo=0 ");println (pos[i]);
      }
      
      recordLastDataOfMotorPosition[i]=  dataMappedForMotorisedPosition[i];
    }
  
  }
 
 void  splitTimeOld() { 
  //   key='b';
  if (formerDecayTimeLfo>decayTimeLfo){
      oldOscillatorChange=oscillatorChange;
      oscillatorChange=oscillatorChange+1;
   //  key='q';
  } 
  if ( oldOscillatorChange!=oscillatorChange )
  {
       oscillatorChanged=true;
  } 
       formerDecayTimeLfo = decayTimeLfo; 

//   int splitTimeLfo = millis()%150; // linear time  to change " oscillator " each 200 ms

   //    signal[2] = (0*PI + (frameCount / 18.0) * cos (1000 / 500.0)*-1)%1;  // speed of split
    
       println ( " ***************************************************    SPLIT TIME  timeLfoooooooooo " + " signal[2] " + signal[2] );

 int  timeLfo = (int ) map (signal[2], 0, 1, 0, 1000); // linear time  to change " oscillator " each 200 ms
 
       println ( " ***************************************************    SPLIT TIME  timeLfoooooooooo " + " timeLfo   " + timeLfo );


 int   splitTime= int  (timeLfo%100);   
       text ( " ***************************************************    SPLIT TIME  decayTimeLfo     " + decayTimeLfo + " signalToSplit " + splitTime, 800, height+200 );
       println ( " ***************************************************    SPLIT TIME  oldSignalToSplit " + oldSignalToSplit + " signalToSplit " + signalToSplit );
  
         oscillatorChange=oscillatorChange%networkSize;
     if (oscillatorChange<=0) {
         oscillatorChange=0;
         }
         decayTimeLfo = splitTime;
    //     print (" oscillatorChange "); println ( oscillatorChange ); 
      
}
 
 
void  splitTimeLfo() {  // signalToSplit = lfoPhase3
 
   if (doZ==false){ 
  if (formerDecayTimeLfo>decayTimeLfo){
 // frameCountBis=frameCountBis+1;
  
    oscillatorChange=oscillatorChange+1;

     }    
 // key='a';
  } 
   if (doZ==true){
  if (formerDecayTimeLfo>decayTimeLfo){
    oldMemoryi=memoryi;
    memoryi=(memoryi-1);
      oscillatorChange=oscillatorChange-1;
    } 
   } 
  
  if ( oldOscillatorChange!=oscillatorChange )
  {
       oscillatorChanged=true;
  } 
  
  formerDecayTimeLfo = decayTimeLfo;
  
    lfoPhase[3] = map ((((cos  (frameCount / 300.0))*-1) %2), -1, 1, -TWO_PI, TWO_PI);  // sinusoida
 
    signalToSplit= lfoPhase[3];
  
 // decayTime = millis()%500;// incremente frameCountBis+1 each 100 millisecondes  
  if (oldSignalToSplit> signalToSplit ) {
  timeLfo= map (signalToSplit, TWO_PI, -TWO_PI, 0, 1000);  // 0 to  
    }
  else if (oldSignalToSplit< signalToSplit ) {  
  timeLfo= map (signalToSplit, -TWO_PI, TWO_PI, 0, 1000);  // 0 to
   }
   
   
    
   oldSignalToSplit=signalToSplit;
   
//   timeLfo= map (signal[11], 0, 1, 0, 1000);
   
   int splitTimeLfo= int  (timeLfo%100);
   
   
   //  println ( " oldlfoPhase[3] " + oldLfoPhase[3] + " lfoPhase[2] " + lfoPhase[3] );
  println ( " oldSignalToSplit " + oldSignalToSplit + " signalToSplit " + signalToSplit );
  
  

      print (" timeLfo "); print ( timeLfo );   print (" splittimeLfo "); println ( splitTimeLfo );  

      if (doZ==false){   
         oscillatorChange=oscillatorChange%networkSize;
     if (oscillatorChange<=0) {
         oscillatorChange=0;
         }
       }
       
       
     if (doZ==true) {   
     if (oscillatorChange<=0) {
        memoryi=networkSize-1;
        oldMemoryi=0;
        oscillatorChange=networkSize-1;
         }
       } 
         
     
         decayTimeLfo = splitTimeLfo;
         print (" oscillatorChange "); println ( oscillatorChange ); 
        
         
}
 
 void  splitTimeLfoWithAbleton() { 
 
    
  if (formerDecayTimeLfo>decayTimeLfo+10){
 // frameCountBis=frameCountBis+1;
    oscillatorChange=oscillatorChange+1;

        
 // key='a';
  } 
  
  if ( oldOscillatorChange!=oscillatorChange )
  {
       oscillatorChanged=true;
  } 
  
  formerDecayTimeLfo = decayTimeLfo;
 // decayTime = millis()%500;// incremente frameCountBis+1 each 100 millisecondes  
 /*
  if (oldSignalToSplit> signalToSplit ) {
//  timeLfo= map (signalToSplit, TWO_PI, -TWO_PI, 0, 1000);  // 0 to  
    timeLfo= map (signalToSplit, 0, 100, 0, 1000);  // 0 to  
    }
  else if (oldSignalToSplit< signalToSplit ) {  
//  timeLfo= map (signalToSplit, -TWO_PI, TWO_PI, 0, 1000);  // 0 to
  timeLfo= map (signalToSplit, 100, 0, 0, 1000);  // 0 to  
  
   }
 */  
   
  //  println ( " oldlfoPhase[3] " + oldLfoPhase[3] + " lfoPhase[2] " + lfoPhase[3] );
//  print ( " oldSignalToSplit " + oldSignalToSplit + " signalToSplit " + signalToSplit );

  
  
  
   oldSignalToSplit=signalToSplit;

//_____   signalToSplit= map (automationAbleton[8], 0, 1, 0, 127);
   
//   if ( formerKeyMetro == '>' )  {
     
       if (oldSignalToSplit> signalToSplit ) { println (" SIGNAL DESCEND " );
   timeLfo= map (signalToSplit, TWO_PI, -TWO_PI, 0, 1000);  // 0 to  
 //_____   timeLfo= map (signalToSplit, 0, 127, 1000, 0);  // 0 to  
    }
    
    else   println (" SIGNAL MONTE " ); timeLfo= map (signalToSplit, 127, 0, 0, 1000);   
   
   
//  timeLfo= map (signalToSplit, 0, 100, 0, 1000); 

  //  timeLfo=   timeLfo;
  
  print (" timeLfo "); print ( timeLfo );   println (" splittimeLfo ");// println ( splitTimeLfo );  

  print (" timeLfo "); print ( timeLfo );   println (" splittimeLfo ");// println ( splitTimeLfo );  

  print (" timeLfo "); print ( timeLfo );   println (" splittimeLfo ");// println ( splitTimeLfo );  

  
//  int splitTimeLfo= (int) timeLfo; //  (timeLfo%100
 if (signalToSplit>15){
   // timeLfo= map (signalToSplit, 0, 100, 0, 1000);  // 0 to 
    
  print (" TIMELfo "); print ( timeLfo );   println (" splittimeLfo ");// println ( splitTimeLfo );  

 }
// int splitTimeLfo= int (timeLfo);
  
  
 //** float timeLfo= millis();  // 0 to
 //**  int splitTimeLfo= frameCountBis;
 
   //    print (" oldLfoPhase[2] "); print ( oldLfoPhase[2] ); print (" lfoPhase[2] "); print ( lfoPhase[2] );

       
         oscillatorChange=oscillatorChange%12;
     if (oscillatorChange<=0) {
         oscillatorChange=2;
         }
      //   decayTimeLfo = splitTimeLfo;
       decayTimeLfo = (int) timeLfo;
         print (" oscillatorChange "); println ( oscillatorChange ); 
        
         
}
 
