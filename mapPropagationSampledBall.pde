void mapPropagationSampledBall() {
   textSize(40);
     for (int i = 0; i <  networkSize-0; i+=1) { 
          //   net.phase[i]=newPosXaddSignal[i]; // use to display  ?

              //     net.phase[i]=phaseMapped[i]; // use with trigEventWithAbletonLive            /*
          if ( keyMode == " trigEventWithAbletonSignal ") { 
              phaseMapped[i]=net.phase[i];
                    } 

               if ((phaseMapped[i])<0){
                  phaseMapped[i]= (phaseMapped[i])+TWO_PI; // easier
                  phaseMapped[i]%=TWO_PI;     
                 } 

                else if (phaseMapped[i]>=0){ 
                   phaseMapped[i]%=TWO_PI;
                 }
            

//        OldSpecialPhase[i]=specialPhase[i]; // Old not used
             specialPhase[i] = (int) map (phaseMapped[i], 0, TWO_PI, 0, numberOfStep);
            // oldPositionToMotor[i]=  positionToMotor[i];

           //  oldPositionToMotor[i]=  OldSpecialPhase[i];

             positionToMotor[i]= specialPhase[i]%numberOfStep;
             text (oldPositionToMotor[i] + " " + positionToMotor[i] , -800, -500 + (50*i));  
      }
     
     
     if (keyMode == " trigEventWithAbletonSignal " || keyMode == " propagationBallRotationBis " || modeStartKeyToFollow == " followSignalSampledOppositeWay(frameRatio) " ) { // || formerKeyMetro == '$'//  if (circularMov==true) { doesn't work
       if (circularMov) {
          countRevsPhaseMappedPositiveOnly(); // with motor Positive Only
          } 
      } 
        for (int i = 0; i <  networkSize-0; i+=1) {
           oldPositionToMotor[i]=  positionToMotor[i];
           } 


          print ( " counter made with position Motor godd with Prop and follow and trigEvent?  "); showArray(rev);    
          text ( " specialPhase " + specialPhase[0] + " propagationSpeed " + propagationSpeed + " or signal[2] " + signal[2], 0, -800 );  // //degrees (signal[2])
     
      if ( keyMode == " propagationSampleBall " || keyMode == " trigEventWithAbletonSignal " || keyMode == " propagationBallRotationBis " || modeStartKeyToFollow == " followSignalSampledOppositeWay(frameRatio) ") { 
     for (int i = 0; i <  networkSize-0; i+=1) { 
            newPosF[i]=phaseMapped[i];

             text (revLfo[i] +  " newPosF " + newPosF[i] + " oldPosF[i] " + oldPosF[i], 1000, -700+50*i );  // //degrees (signal[2])
     
            if ( oldPosF[i]>newPosF[i] && (oldPosF[i]> PI*1.75 && newPosF[i]<(0.25*PI))) { //
            revLfo[i]++;
            TrigmodPos[i]=0;   
            }
          
            if (  newPosF[i]>oldPosF[i]  && (oldPosF[i]<=oldOldPosF[i])  && (oldPosF[i]< PI*1.75 && newPosF[i]>0.25) ){  // voir dans quel sens la retropropagation oriente  i et j
            revLfo[i]--;
            TrigmodPos[i]=0;
          }
        }
     } 

       print ( " Good+PropSampl in maPropa "); showArray(revLfo);  

     for (int i = 0; i <  networkSize-0; i+=1) { 
         //  oldPositionToMotor[i]=  positionToMotor[i];
           oldOldPosF[i]=oldPosF[i];
           oldPosF[i]=newPosF[i];
           oldOldPhaseMapped[i]=oldPhaseMapped[i];
           oldPhaseMapped[i]=phaseMapped[i];
           net.phase[i]=phaseMapped[i];
           // net.phase[i]=specialPhase[i];
         }

  }