

void followSignalSampledOppositeWay(int ratioTimeFrame){
 rotate (-PI/2);
        frameCount=frameCount+1;
        float deltaFollow = TWO_PI; // not used
       //here in a previous function we could change the ball followed if the space of phase between phases[0] and phase 9 is more than 360° for example
 
       phases[0][frameCount % nbMaxDelais]=movementInterpolated;
       newPosFollowed[0]= (phases[0][frameCount % nbMaxDelais]);
       newPosFollowed[0]%=TWO_PI;



       for (int i = 1; i < networkSize; i+=1) { // 1 follow phase 0     
            //   follow( i-1, i, 20 * i, 0);  // Modifier les deux derniers paramètres : délais et phase
                 followOppositeWay( i-1, i+0, delayTimeFollowPhase11, (phaseShiftingFollowPhase11));  // ici, le temps que les points attendent pour se suivre est de 5 frames, et il faut un espace entre eux de QUARTER_PI/6
           }
      


           samplingMovementPro();  
     
          //if (key != '#' ) {
       if (modeStartKeyToFollow == " followSignalSampledOppositeWay(frameRatio) ") {  
                   phasePatternBase(); // 
            for (int i = 0; i < networkSize; i+=1) { 
               phasePatternFollow[i] = netPhaseBase[i]; //
               phasePatternFollow[i] = phasePatternFollow[i]%TWO_PI;  
             } 
          //}       
       }
 
      if ( modeStartKeyToFollow == " followSignalSampledOppositeWay(frameRatio) ") { //||formerFormerKey == '#' 
       for (int i = 0; i < networkSize-0; i+=1) { 


                if ((phases[i][frameCount % nbMaxDelais])<0){
                  newPosFollowed[i]= (phases[i][frameCount % nbMaxDelais])+TWO_PI; // easier
                  newPosFollowed[i]%=TWO_PI;

                    // dataMappedForMotorisedPosition[i]= int (map (phases[i][frameCount % nbMaxDelais], PI, TWO_PI, numberOfStep/2, numberOfStep));           
                    // newPosFollowed[i]= map (dataMappedForMotorisedPosition[i], numberOfStep/2, numberOfStep/1,  PI, TWO_PI)+TWO_PI;
                 } 

                else if ((phases[i][frameCount % nbMaxDelais])>=0){ 
                  newPosFollowed[i]= phases[i][frameCount % nbMaxDelais] ;
                 }
      
            phaseMapped[i] = newPosFollowed[i]+phasePatternFollow[i];


       // if (phaseMapped[i]<0){ // useless even with 'p' ?
      /*

             if (phaseMapped[i]<oldPhaseMapped[i]){
               dataMappedForMotorisedPosition[i]= int (map (phaseMapped[i], 0, -TWO_PI, numberOfStep, 0));  // map and transform data in good way or rotation
                phaseMapped[i]= map (dataMappedForMotorisedPosition[i], numberOfStep, 0, 0, -TWO_PI); 
                }
       
             else { 
                dataMappedForMotorisedPosition[i]= (int) map (phaseMapped[i], 0, TWO_PI, 0, numberOfStep); 
                phaseMapped[i]= map (dataMappedForMotorisedPosition[i], 0, numberOfStep, 0, TWO_PI);
              }
      */
              //  oldPhaseMapped[i]=phaseMapped[i];


        }
       }

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
    //   newPosF[i]=phaseMapped[i]; // %TWO_PI      used to count revolution
    //   net.phase[i]=phaseMapped[i]; //used to display
     //  newPosX[i]=phaseMapped[i]; // better to count revolution
      // newPosXaddSignal[i]=phaseMapped[i]%TWO_PI;
       //print ( " newPosF[i] " + newPosF[i]);
  }


  // COUNT REVOLUTION  in teensyPos?  use 
   
     mapNewPosX();

    

     for (int i = 0; i < networkSize-0; i+=1) {
        oldPhaseMapped[i]=phaseMapped[i]; // used in mapNawPosX to have CCW data 

       newPosF[i]=phaseMapped[i]; // %TWO_PI      used to count revolution
     //  net.phase[i]=phaseMapped[i]; //used to display
       newPosX[i]=phaseMapped[i]; // better to count revolution
      // newPosXaddSignal[i]=phaseMapped[i]%TWO_PI;
       //print ( " newPosF[i] " + newPosF[i]);
  }



   /*
    for (int i = 0; i <  networkSize+0; i+=1) { // la premiere celle du fond i=2,  la derniere celle du devant i=11
   print( " newPosX[i] " ); print ( newPosX[i]);
   print( " newPosFollowed[i] "); print (  newPosFollowed[i]);
   print( " oldPositionToMotor[i]" ); print ( oldPositionToMotor[i]);
    positionToMotor[i]= ((int) map (newPosX[i], 0, TWO_PI, 0, numberOfStep)%numberOfStep); //
   // newPosX[i]=positionToMotor[i]%6400;
   //   if (oldPositionToMotor[i]>positionToMotor[i]){
    if ( oldPosF[i]>newPosF[i]&& newPosF[i]<=100){
      revLfo[i]++;
     } 
      print( " positionToMotor[i] " ); print ( positionToMotor[i]);
      print( " newPosF[i] " ); print ( newPosF[i]); print( " oldPosF[i] " ); print ( oldPosF[i]);
      print (" revolutionLFO "); print ( i); print ("  "); println (revLfo[i]); 
     oldPositionToMotor[i]=  positionToMotor[i];
     oldPosF[i]=newPosF[i]; 
    }
  */
   rotate (PI/2);  
    }
