void followSignalSampledOppositeWay(int ratioTimeFrame){
 
if (formerDecayTime>decayTime){
  frameCountBis=frameCountBis+1;
  } 
  /*
  formerDecayTime = decayTime;
  decayTime = millis()%25;// incremente frameCountBis+1 each 100 millisecondes
  */
  int delayRatio=ratioTimeFrame;

 //**   samplingMovement(2);
 //**    phases[0][frameCountBis % nbMaxDelais]= newPosF[0];
     
  //  keyReleasedfollowSignal(); useless  phseShifting is controlled in keyRelesead
      float deltaFollow = TWO_PI; // not used
     //here in a previous function we could change the ball followed if the space of phase between phases[0] and phase 9 is more than 360° for example

    samplingMovementPro();
    text ( "  movementInterpolated in FOLLOW opposite WAY" +  movementInterpolated +  " oldmovementInterpolated " + oldMovementInterpolated , 400, 900 );
  //  if (oldMovementInterpolated>movementInterpolated){
   //   movementInterpolated= map (movementInterpolated, 0, TWO_PI, TWO_PI, 0);
   //   }
/*
     if (movementInterpolated>PI) {
 
  //  dataMappedForMotorisedPosition[0]= int (map (movementInterpolated, PI, TWO_PI, 0, - numberOfStep)%numberOfStep); 
   dataMappedForMotorisedPosition[0]= int (map (movementInterpolated, PI, TWO_PI,  numberOfStep, 0)); 
    net.oldPhase[0]=net.phase[0];
   //*** net.phase[0]= map (dataMappedForMotorisedPosition[0], numberOfStep, 0, 0, -TWO_PI);
   movementInterpolated = map (dataMappedForMotorisedPosition[0], numberOfStep, 0, -PI, -TWO_PI);

    print ("  movInter<0  "); print (2); print ( " ");   println (  movementInterpolated  ); 
}
*/

 
    
       phases[0][frameCountBis % nbMaxDelais]=movementInterpolated;
  //     drawBall( 0, movementInterpolated);
    //MAP movementInterpolated
    //   println ( "  movementInterpolated in FOLLOW opposite WAY" +  movementInterpolated +  " oldmovementInterpolated " + oldMovementInterpolated  );
    /*
    if (phases[0][frameCountBis % nbMaxDelais]<=0){
   
     dataMappedForMotorisedPosition[0]= int (map (phases[0][frameCountBis % nbMaxDelais], 0, -TWO_PI, numberOfStep, 0)); 
 
     phases[0][frameCountBis % nbMaxDelais]= map (dataMappedForMotorisedPosition[0], numberOfStep, 0, 0, -TWO_PI);

       }  
   else {
    
    dataMappedForMotorisedPosition[0]= (int) map (phases[0][frameCountBis % nbMaxDelais], 0, TWO_PI, 0, numberOfStep); 

      phases[0][frameCountBis % nbMaxDelais]= map (dataMappedForMotorisedPosition[0], 0, numberOfStep, 0, TWO_PI);
   
     }
    */ 
  
   //drawBall(  0, phases[0][frameCountBis % nbMaxDelais] );  
    // newPosFollowed[i]
    // newPosFollowed[0]= phases[0][frameCountBis % nbMaxDelais]; // %TWO_PI
    // println ( " phases[0][frameCountBis % nbMaxDelais " + phases[0][frameCountBis % nbMaxDelais] ) ; // %TWO_PI

    //  drawBallOppositeWay(0, phases[0][frameCountBis % nbMaxDelais]); //networkSize-5 affiche le point 0. NE PAS AFFICHER SINON IL APPARAIT EN DOUBLE
 
    for (int i = 1; i < networkSize; i+=1) { // 1 follow phase 0
       
  //   follow( i-1, i, 20 * i, 0);  // Modifier les deux derniers paramètres : délais et phase
  //   followOppositeWay( i-1, i+0, delayTimeFollowPhase11*1*frameRatio/ratioTimeFrame, (phaseShiftingFollowPhase11));  // ici, le temps que les points attendent pour se suivre est de 5 frames, et il faut un espace entre eux de QUARTER_PI/6
     followOppositeWay( i-1, i+0, delayTimeFollowPhase11*1, (phaseShiftingFollowPhase11));  // ici, le temps que les points attendent pour se suivre est de 5 frames, et il faut un espace entre eux de QUARTER_PI/6
      
      phaseMapped[i]=phases[i+0][frameCount % nbMaxDelais]; // use varaible phaseMapped (to play movement with time delay or phase delay) to well send it in Teensy
   
    //   drawBallOppositeWay( i, phases[i-0][frameCountBis % nbMaxDelais] ); 
    //  println ( " phases[i][frameCountBis % nbMaxDelais " + i + " " + phases[i][frameCountBis % nbMaxDelais] ) ; 
 }

  for (int i = 0; i < networkSize; i+=1) { // 1 follow phase 0
       
 // newPosFollowed[i]=phases[i][frameCountBis % nbMaxDelais]; // signals to follow

 }

   for (int i = 1; i < networkSize; i+=1) { // 1 follow phase 0

     if (newPosFollowed[i]<=0){
   
 //    dataMappedForMotorisedPosition[0]= int (map (newPosFollowed[i], 0, -TWO_PI, numberOfStep, 0)); 
 
  //   newPosFollowed[i]= map (dataMappedForMotorisedPosition[i], numberOfStep, 0, 0, -TWO_PI);

       }  
   else {
    
 //   dataMappedForMotorisedPosition[0]= (int) map (newPosFollowed[i], 0, TWO_PI, 0, numberOfStep); 

  //   newPosFollowed[i]= map (dataMappedForMotorisedPosition[i], 0, numberOfStep, 0, TWO_PI);
   
    }
  }


       if (key != '#' ) {
    if (modeStartKeyToFollow == " followSignalSampledOppositeWay(frameRatio) ") {
  
    phasePatternBase(); // dans SIMPLIFICATION

   for (int i = 0; i < networkSize; i+=1) { 

    phasePatternFollow[i] = netPhaseBase[i]; //
    phasePatternFollow[i] = phasePatternFollow[i]%TWO_PI;  
    }
  
   }
  }
 
  if ( modeStartKeyToFollow == " followSignalSampledOppositeWay(frameRatio) ") { //||formerFormerKey == '#' 
    
    //text ( " modeStartKeyToFollow " + modeStartKeyToFollow + " newPosFollowed[0] " + newPosFollowed[0], 500, 600);

      for (int i = 0; i < networkSize-0; i+=1) { 
        
       newPosFollowed[i]=phases[i-0][frameCountBis % nbMaxDelais]; // signals to follow
       newPosFollowed[i]=newPosFollowed[i]%TWO_PI;  // signals to follow

       phaseMapped[i] = newPosFollowed[i]+phaseMappedFollow[i]+phasePatternFollow[i]; // new signal is a composition 
   
    if (phaseMapped[i]<0){
   
     dataMappedForMotorisedPosition[i]= int (map (phaseMapped[i], 0, -TWO_PI, numberOfStep, 0));  // map and transform data in good way or rotation
     phaseMapped[i]= map (dataMappedForMotorisedPosition[i], numberOfStep, 0, 0, -TWO_PI);
   
       }
       
   else {
    
    dataMappedForMotorisedPosition[i]= (int) map (phaseMapped[i], 0, TWO_PI, 0, numberOfStep); 
    phaseMapped[i]= map (dataMappedForMotorisedPosition[i], 0, numberOfStep, 0, TWO_PI);
    }
  }
  
 }
/*
    if (key != '#' ) {
    if (modeStartKeyToFollow == " followSignalSampledOppositeWay(frameRatio) ") {
     phasePattern();
     
    for (int i = 0; i < networkSize-0; i+=1) { 
    phaseMappedFollow[i]= net.phase[i];// add offset given by pendularPattern   
    phaseMappedFollow[i]= phaseMappedFollow[i]%TWO_PI;  
    }
   }
  }
 */ 
  // option to add rotationSpeed
  /*
    for (int i = 0; i < networkSize-0; i+=1) {  
  phaseMappedFollow[i]+=0.01;
  phaseMappedFollow[i]= phaseMappedFollow[i]%TWO_PI;  
   }
*/
   


   if (keyCode == BACKSPACE ) {
    
      for (int i = 0; i < networkSize-0; i+=1) { 
        println (" ALIGN MTF " );

    phaseMapped[i] = phases[i-0][frameCountBis % nbMaxDelais]+0; // to aligin ball with the followed one
   
    if (phaseMapped[i]<0){
   
    dataMappedForMotorisedPosition[i]= int (map (phaseMapped[i], 0, -TWO_PI, numberOfStep, 0)); 
   //   net.oldPhase[i]=phaseMapped[i];
   //  net.phase[i]= phaseMapped[i];
   phaseMapped[i]= map (dataMappedForMotorisedPosition[i], numberOfStep, 0, 0, -TWO_PI);
       }
        
   else
  
   dataMappedForMotorisedPosition[i]= (int) map (phaseMapped[i], 0, TWO_PI, 0, numberOfStep);
   phaseMapped[i]= map (dataMappedForMotorisedPosition[i], 0, numberOfStep, 0, TWO_PI);

  }
  keyCode = TAB;
 }

 for (int i = 0; i < networkSize-0; i+=1) { 
  newPosF[i]=phaseMapped[i]; // %TWO_PI      display data and use them to control motor
  net.phase[i]=phaseMapped[i]; // get trouble something
  newPosX[i]=phaseMapped[i]; // better to count revolution
  //print ( " newPosF[i] " + newPosF[i]);
  }


  // COUNT REVOLUTION

  for (int i = 0; i <  networkSize+0; i+=1) { // la premiere celle du fond i=2,  la derniere celle du devant i=11

  //drawBall(i, newPosX[i] ); //  good. 

   print( " newPosX[i] " ); print ( newPosX[i]);

   
    print( " oldPositionToMotor[i]" ); print ( oldPositionToMotor[i]);
    positionToMotor[i]= ((int) map (newPosX[i], 0, TWO_PI, 0, numberOfStep)%numberOfStep); //
   // newPosX[i]=positionToMotor[i]%6400;
 //   if (oldPositionToMotor[i]>positionToMotor[i]){
    if ( oldPosF[i]>newPosF[i]){
      revLfo[i]++;
     } 

      print( " positionToMotor[i] " ); print ( positionToMotor[i]);
      print( " newPosF[i] " ); print ( newPosF[i]); print( " oldPosF[i] " ); print ( oldPosF[i]);
      print (" revolutionLFO "); print ( i); print ("  "); println (revLfo[i]); 
     oldPositionToMotor[i]=  positionToMotor[i];
     oldPosF[i]=newPosF[i]; 
  }



     for (int i = 0; i < networkSize; i++) {
      // rev[i]=rev[0];


      //*******************************  ASSIGN MOTOR WITH POSITION à simplifier

      if (revLfo[i]!=0  && (newPosF[i] >  0) ) { // number of revLfoolution is even and rotation is clock wise   
        dataMappedForMotorisedPosition[i]= int (map (newPosF[i], 0, numberOfStep, 0, numberOfStep))+ (revLfo[i]*numberOfStep);
      }

      if (revLfo[i]!=0  && (newPosF[i] <  0)) { // number of revLfoolution is even and rotation is Counter clock wise          // pos[i]= int (map (newPosF[i], 0, -numberOfStep, 0,  numberOfStep))+ (revLfo[i]*numberOfStep);

        dataMappedForMotorisedPosition[i]= int (map (newPosF[i], 0, numberOfStep, numberOfStep, 0)) +(revLfo[i]*numberOfStep);       //   print ("pos "); print (i); print (" ");println (pos[i]);
      }

      if (revLfo[i]==0 && (newPosF[i] < 0) ) { //  number of revLfoolution is 0 and rotation is counter clock wise 
        dataMappedForMotorisedPosition[i]= int (map (newPosF[i], 0, numberOfStep, numberOfStep, 0));        
      }         
      if  (revLfo[i]==0 && (newPosF[i] > 0) ) {  //  number of revLfoolution is 0 and rotation is clock wise     
        dataMappedForMotorisedPosition[i]= int (map (newPosF[i], 0, numberOfStep, 0, numberOfStep));                //      print ("pos "); print (i); print (" CW revLfo=0 ");println (pos[i]);
      }
    }

 send24DatasToTeensy6motorsToLittleMachine(4, 3, -4, -1);  // avant dernier >-1 alors compute data
 // mapNewPosX(); // just to dislay on screen?
  
}
