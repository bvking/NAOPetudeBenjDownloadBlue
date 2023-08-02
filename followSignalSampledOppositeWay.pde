void followSignalSampledOppositeWay(int ratioTimeFrame){

          if (key == '*' || key == '$') {  formerKeyMetro = key; }
          
          if (formerKeyMetro == '*') {  circularMov = true; }
          if (formerKeyMetro == '$') {  circularMov = false; }
     

         println ( " cricular in followSOWay(frameRatio) ..... ??" + circularMov);

         // above to  avoid bug 



 rotate (-PI/2);
        frameCount=frameCount+1;
        float deltaFollow = TWO_PI; // not used
       //here in a previous function we could change the ball followed if the space of phase between phases[0] and phase 9 is more than 360° for example
 
       phases[0][frameCount % nbMaxDelais]=movementInterpolated;
       newPosFollowed[0]= (phases[0][frameCount % nbMaxDelais]);
      // if (newPosFollowed[0]<0) newPosFollowed[0]=TWO_PI+newPosFollowed[0];
       newPosFollowed[0]%=TWO_PI;


          for (int i = 1; i < networkSize; i+=1) { // 1 follow phase 0     
            //   follow( i-1, i, 20 * i, 0);  // Modifier les deux derniers paramètres : délais et phase
                 followOppositeWay( i-1, i+0, delayTimeFollowPhase11, (phaseShiftingFollowPhase11));  // ici, le temps que les points attendent pour se suivre est de 5 frames, et il faut un espace entre eux de QUARTER_PI/6
           }

           samplingMovementPro();  
     
          if (key != '#' ) {
              if (modeStartKeyToFollow == " followSignalSampledOppositeWay(frameRatio) ") {  
                   phasePatternBase(); // 
                   //   phasePattern();
              for (int i = 0; i < networkSize; i+=1) { 
                   phasePatternFollow[i] = netPhaseBase[i]; //
                    // phasePatternFollow[i] += net.phase[i];
                   phasePatternFollow[i] = phasePatternFollow[i]%TWO_PI;  
                } 
               }
             key='#';       
            }
 
      if ( modeStartKeyToFollow == " followSignalSampledOppositeWay(frameRatio) ") { //||formerFormerKey == '#' 
       for (int i = 0; i < networkSize-0; i+=1) { 

                if ((phases[i][frameCount % nbMaxDelais])<0){
                  newPosFollowed[i]= (phases[i][frameCount % nbMaxDelais])+TWO_PI; // easier
                  newPosFollowed[i]%=TWO_PI;     
                 } 

                else if ((phases[i][frameCount % nbMaxDelais])>=0){ 
                  newPosFollowed[i]= phases[i][frameCount % nbMaxDelais] ;
                 }
      
                 phaseMapped[i] = newPosFollowed[i]+phasePatternFollow[i];

                  // phaseMapped always > 0 with below to be well use in the counter

                if ((phaseMapped[i])<0){
                  phaseMapped[i]= (phaseMapped[i])+TWO_PI; // easier
                  phaseMapped[i]%=TWO_PI;     
                 } 

                else if (phaseMapped[i]>=0){ 
                   phaseMapped[i]%=TWO_PI;
                 }

                net.phase[i] = phaseMapped[i]; // to be used in !circularMov
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
      phasePatternFollow[i]=0;
  
     } 
   
      keyCode = TAB;
   }

  // COUNT REVOLUTION  
   
   //  mapNewPosX();
    
 
     for (int i = 0; i < networkSize-0; i+=1) {
       oldPhaseMapped[i]=phaseMapped[i]; // used in mapNawPosX to have CCW data 
       newPosF[i]=phaseMapped[i]; // %TWO_PI      used to count revolution
     //  newPosX[i]=phaseMapped[i]; // better to count revolution  
      }
    
   // if (circularMov) {
     mapPropagationSampledBall();
   //   }

   rotate (PI/2);  
    }
