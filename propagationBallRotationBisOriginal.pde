
void propagationBallRotationBisOriginal(){ // as addSignalOneAndTwoQuater() in NAOP 
modeStartKeyToFollow = " null ";
keyMode = " propagationBallRotationBis ";


     textSize (50);
     text (" oldOscillatorChange " + oldOscillatorChange + " oscillatorChange " + oscillatorChange + " j " + nf (phaseKeptAtChange[oscillatorChange], 0, 2), -width, -height- 900+300 );
     text (" propagationTrigged " + propagationTrigged + " propagationSpeed " + propagationSpeed + " key " + key, -width, -height- 800+300  );
     text (" signal2  " +nf(signal[2], 0, 2) + " QpropWay " + doQ + " doZ " + doZ + " BlargerPhase " + doB , -width, -height- 700+300 );
     text (" lock " + dol + " oWay " + doo + " doC " + doC , -width, -height- 600+300 );
     text (" QpropWay " + doQ + " doZ " + doZ + " BlargerPhase " + doB , -width, -height- 500+300   );
     text (" oldSignalToSplit " + oldSplitTime + " splitTime " +  splitTime + " timeLFO " + timeLfo,  -width, -height- 400+300  );
     text (" oldSignalToSplit " + nf (oldSignalToSplit, 0, 2) + " signalToSplit " +     nf (signalToSplit, 0, 2) + " timeLFO " + timeLfo,  -width, -height );
     
  
 //  if (key=='q' || key=='b' || key=='z' || key=='#' || key=='o' || key=='l'  ) { // q == addsignal
     letter = key;   
//     }
     
  switch(letter) {
    case 'o': // way of rotation
    doo=!doo;
    key = '#';
  //  return letter;
  
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
  //  doB=false;

    break;
    case 'z': // change way of propagation
    doZ=true;
    doQ=true;
    break;
    case '#': // change way of propagation
    
    break;
  //  doB=!doB;
    }

    switch(key) {
   case '#': // change way of propagation
    
    break;
      }
//   key = '#';
   
    
 
 // splitTimeScaleRotation(30.0); //  10.0= vitesse de propagation. On change de sens de ROTATION avec q et z.
 // splitTimeLfoScale();  // change de sens de PROPAGATION
 //  if (key == 'l' ) {
     

  
  
   if ( formerFormerKey == '#' || modeStartKeyToFollow == " null ") { // formerFormerKey == '#' || 
    
    println ( " modeStartKeyToFollow " + modeStartKeyToFollow);
        if (key == 'o' ) {
     //   signal[2]=- signal[2] ;
     for (int i = 0; i < networkSize-0; i+=1) { 
        newPosFollowed[i]=-newPosFollowed[i];
           }
           }
  

      for (int i = 0; i < networkSize-0; i+=1) {             
       newPosFollowed[i]=map (signal[2], 0, 1, 0, TWO_PI); // signals to follow
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


      newPosXaddSignal[i]=phaseMapped[i];
 
  }
  
 }
    //lockOscillatorToPositionFromPreviousProagedBall();
      //******** Lock last oscillator to the lastPhase

      if (  propagationTrigged==true && dol==true) {
      lockOscillatorToPositionFromPreviousProagedBall();
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


   propagationSpeed=70;
   splitTimeScaleRotation(propagationSpeed);
   propagation2wayRotationBisOriginal(); 
   actualisePositionDataFromCircular = false; //    lastRecordData of motors positiond were stocked when the circular Mode was true as formerKeyMetro == '#'
   mapNewPosX();

     
     
  //  

 
// formerFormerKey= formerKey;   
// formerKey=key;
 
 }




 
 
 void propagation2wayRotationBisOriginal() {   // FAIRE CONDITION QUAND SIGNAL NEGATIF fu style
  //    if (newPosXaddSignal[oscillatorChange]<0){ 
  //    for (int i = 0; i <  networkSize-0; i+=1) { 
  //   newPosXaddSignal[oscillatorChange]= map (dataMappedForMotor[oscillatorChange], numberOfStep, 0, -TWO_PI, 0);
  //  }
  //    }
  

    //   phaseKeptAtChange[oscillatorChange]=newPosXaddSignal[oldOscillatorChange];
 /*  
   if (doC==true && doo==false ){ // // fonctionne avec o = false
  //     LFO[oscillatorChange] = LFO[oldOscillatorChange]+QUARTER_PI*1/2 ;  // on ajoute 
//++  phaseKeptAtChange[oscillatorChange]=LFO[oscillatorChange]%TWO_PI;

 //***  phaseKeptAtChange[oscillatorChange]= newPosXaddSignal[oscillatorChange]%TWO_PI;
//***   phaseKeptAtChange[oscillatorChange]= phaseKeptAtChange[oscillatorChange]+(PI/(2*networkSize)-1);

      LFO[oscillatorChange] = newPosXaddSignal[oscillatorChange]%TWO_PI;
   //   LFO[oscillatorChange] = LFO[oldOscillatorChange] - (PI/(6*networkSize)-1);
      LFO[oscillatorChange] = LFO[oldOscillatorChange] ;

        if (LFO[oscillatorChange]<0){ 
      for (int i = 0; i <  networkSize-0; i+=1) { 

   //    LFO[oscillatorChange]= map (LFO[oscillatorChange], - TWO_PI, 0, 0, TWO_PI);
    }
      }

       dataMappedForMotor[oldOscillatorChange]= (int) map (LFO[oldOscillatorChange], 0, TWO_PI , 0, numberOfStep);  // 
       dataMappedForMotor[oscillatorChange]= (int) map (LFO[oscillatorChange], 0, TWO_PI , 0, numberOfStep);  // 
            
       println (" MAIN true phaseKeptAtChange[oscillatorChange] ", oscillatorChange, " " ,  LFO[oscillatorChange]);
       println (" MAIN doC==true && doo==false ");
      newPosXaddSignal[oldOscillatorChange]= map (dataMappedForMotor[oldOscillatorChange], 0, numberOfStep, 0, TWO_PI);
      newPosXaddSignal[oscillatorChange]= map (dataMappedForMotor[oscillatorChange], 0, numberOfStep, 0, TWO_PI);   
     }
*/

/*
      if (doC==true && doo==true && doB!=true ){ // // fonctionne avec o = false/ ajoute  ou retire )1 au compteur selon propa
  //     LFO[oscillatorChange] = LFO[oldOscillatorChange]+QUARTER_PI*1/2 ;  // on ajoute 
//++  phaseKeptAtChange[oscillatorChange]=LFO[oscillatorChange]%TWO_PI;

 //***  phaseKeptAtChange[oscillatorChange]= newPosXaddSignal[oscillatorChange]%TWO_PI;
//***   phaseKeptAtChange[oscillatorChange]= phaseKeptAtChange[oscillatorChange]+(PI/(2*networkSize)-1);

      LFO[oscillatorChange] = newPosXaddSignal[oscillatorChange]%TWO_PI;
      LFO[oscillatorChange] = LFO[oldOscillatorChange] + (PI/(3*networkSize)-1);
      text ( "  LFO[oscillatorChange] " + LFO[oscillatorChange], 900, 900 );
      println (" doC==true && doo==true && doB!=true ");

        if (LFO[oscillatorChange]<0){ 
    //  for (int i = 0; i <  networkSize-0; i+=1) { 
    //  LFO[oscillatorChange]= map (LFO[oscillatorChange], - TWO_PI, 0, 0, TWO_PI);
  //  }
      }

       dataMappedForMotor[oscillatorChange]= (int) map (LFO[oscillatorChange], 0, TWO_PI , 0, numberOfStep);  // 
       
      newPosXaddSignal[oldOscillatorChange]= map (dataMappedForMotor[oldOscillatorChange], 0, numberOfStep, 0, TWO_PI);
      newPosXaddSignal[oscillatorChange]= map (dataMappedForMotor[oscillatorChange], 0, numberOfStep, 0, TWO_PI);
    
     }
*/


   if (doo==false || doo==true){ // && propagationTrigged==true
  //     LFO[oscillatorChange] = LFO[oldOscillatorChange]+QUARTER_PI*1/2 ;  // on ajoute 
//++  phaseKeptAtChange[oscillatorChange]=LFO[oscillatorChange]%TWO_PI;

 //***  phaseKeptAtChange[oscillatorChange]= newPosXaddSignal[oscillatorChange]%TWO_PI;
//***   phaseKeptAtChange[oscillatorChange]= phaseKeptAtChange[oscillatorChange]+(PI/(2*networkSize)-1);

 if (doo==true){  // negative way : ccw
      print ( " newPosXaddSignal " + newPosXaddSignal[oscillatorChange]%TWO_PI );

      LFO[oscillatorChange] = newPosXaddSignal[oscillatorChange]%TWO_PI;
      LFO[oscillatorChange] = LFO[oscillatorChange] - (PI/(1*networkSize-1));

            println ( " LFO[oscillatorChange] " + LFO[oscillatorChange] );

   }       

if (doo==false){


      LFO[oscillatorChange] = newPosXaddSignal[oscillatorChange]%TWO_PI;
      LFO[oscillatorChange] = LFO[oscillatorChange] + (PI/(3*networkSize-1));

            println ( " LFO[oscillatorChange] " + LFO[oscillatorChange] );


     }
        if (LFO[oscillatorChange]<0){ 
      for (int i = 0; i <  networkSize-0; i+=1) { 

   //    LFO[oscillatorChange]= map (LFO[oscillatorChange], - TWO_PI, 0, 0, TWO_PI);
    }
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

    //   dataMappedForMotor[oscillatorChange]=               phaseMapped[oscillatorChange];

     //  dataMappedForMotor[oscillatorChange]= (int) map (LFO[oscillatorChange], 0, TWO_PI , 0, numberOfStep);  // 
       
       println (" MAIN true phaseKeptAtChange[oscillatorChange] ", oscillatorChange, " " ,  phaseKeptAtChange[oscillatorChange]);
      
       println (" LFO[oscillatorChange] ", LFO[oscillatorChange], " " ,  phaseKeptAtChange[oscillatorChange]);
       println (" doB!=true && doC!=true] ", oldOscillatorChange, " " ,  phaseKeptAtChange[oldOscillatorChange]);

  //    newPosXaddSignal[oscillatorChange]= map (dataMappedForMotor[oscillatorChange], 0, numberOfStep, 0, TWO_PI);
       println (" newPosXaddSignal[oscillatorChange] ", newPosXaddSignal[oscillatorChange], " " );

    
     }

/*
    if (doB==true && doC!=true){ 
      
         phaseKeptAtChange[oscillatorChange]= newPosXaddSignal[oscillatorChange]%TWO_PI;
         phaseKeptAtChange[oscillatorChange]= phaseKeptAtChange[oldOscillatorChange]+(PI/((2*networkSize)-1)); // on ajoute 
   //****    LFO[oscillatorChange] =LFO[oldOscillatorChange]+(PI/(2*networkSize-1)) ;  
  
    //   dataMappedForMotor[oscillatorChange]= (int) map (LFO[oscillatorChange], 0, TWO_PI , 0, numberOfStep);  // 
        dataMappedForMotor[oscillatorChange]= (int) map (phaseKeptAtChange[oscillatorChange], 0, TWO_PI , 0, numberOfStep);  // 
       
       println (" true phaseKeptAtChange[oscillatorChange] ", oscillatorChange, " " ,  phaseKeptAtChange[oldOscillatorChange]);
      
     //   newPosXaddSignal[oldOscillatorChange]= map (dataMappedForMotor[oldOscillatorChange], 0, numberOfStep, 0, TWO_PI); // GOOD
         newPosXaddSignal[oscillatorChange]= map (dataMappedForMotor[oscillatorChange], 0, numberOfStep, 0, TWO_PI);
     }
*/
 

 
///////////////////// 
 //  mapNewPosX();
  }


