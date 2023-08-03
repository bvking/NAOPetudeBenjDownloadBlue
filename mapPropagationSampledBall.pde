void mapPropagationSampledBall() {

        textSize(20);
      for (int i = 0; i <  networkSize-0; i+=1) { 
          //   net.phase[i]=newPosXaddSignal[i]; // use to display  ?

          if ( keyMode == " trigEventWithAbletonSignal ") { 
              phaseMapped[i]=net.phase[i];
            } 
          
          if ( keyMode == " propagationBallRotationBis ") { 
            //  phaseMapped[i]=newPosXaddSignal[i];
            }

               if ((phaseMapped[i])<0){
                  phaseMapped[i]= abs ((phaseMapped[i])+TWO_PI); // easier
                  phaseMapped[i]%=TWO_PI;     
                 } 

                else if (phaseMapped[i]>=0){ 
                   phaseMapped[i]%=TWO_PI;
                 }
    
             specialPhase[i] = (int) map (phaseMapped[i], 0, TWO_PI, 0, numberOfStep);

             positionToMotor[i]= specialPhase[i]%numberOfStep;
             text (oldPositionToMotor[i] + " " + positionToMotor[i] , -800, -500 + (50*i));  
       }

     if (circularMov ) {  // || keyMode == " propagationBallRotationBis "
     textSize( 20);
     if (keyMode == " trigEventWithAbletonSignal "  || keyMode == " propagationBallRotationBis " || modeStartKeyToFollow == " followSignalSampledOppositeWay(frameRatio) " ) { // || formerKeyMetro == '$'//  if (circularMov==true) { doesn't work
  
          countRevsPhaseMappedPositiveOnly(); // with motor Positive Only, counter is rev   
      } 
        for (int i = 0; i <  networkSize-0; i+=1) {
           oldPositionToMotor[i]=  positionToMotor[i];
        } 
          print ( " counter made with position Motor godd with Prop and follow and trigEvent?  "); showArray(rev); 
          text (rev[0] + " specialPhase " + specialPhase[0] + " propagationSpeed " + propagationSpeed + " or signal[2] " + signal[2], 0, -800 );  // //degrees (signal[2])
     
      if ( keyMode == " propagationSampleBall " || keyMode == " propagationBallRotationBis "  ) {// || keyMode == " propagationBallRotationBis " 
           //|| modeStartKeyToFollow == " followSignalSampledOppositeWay(frameRatio) ") {// 
         for (int i = 0; i <  networkSize-0; i+=1) { 

            oldOldOldPosF[i]= oldOldPosF[i];
            oldOldPosF[i]=oldPosF[i];
            oldPosF[i]=newPosF[i];
            newPosF[i]=phaseMapped[i];

           text (revLfo[i] + " newPosF " + newPosF[i] + " oldPosF[i] " + oldPosF[i] + " oldOld " + oldOldPosF[i] + " oOOld " + oldOldOldPosF[i] ,200, -700+50*i );  // //degrees (signal[2])
     
            if ( //(newPosF[i]>oldPosF[i]) && (oldPosF[i]>=oldOldPosF[i]) && (oldPosF[i]<= PI && newPosF[i]>PI) voir dans quel sens la retropropagation oriente  i et j
                newPosF[i]>oldPosF[i] && doo==true && (oldPosF[i]<=oldOldPosF[i])
              ){
                revLfo[i]--;TrigmodPos[i]=0;
                text (i + " " + revLfo[i], 0, -700+50*i);
              } 

            if ( //((newPosF[i]<oldPosF[i]) && (oldPosF[i]<=oldOldPosF[i]) && (oldPosF[i]>= PI && newPosF[i]<PI))
               newPosF[i]<oldPosF[i] && doo==false && (oldPosF[i]>=oldOldPosF[i])// false CW newPos uprise
            
              // newPosF[i]<oldPosF[i] && 
             // && (oldPosF[i]<=oldOldPosF[i]) && (oldPosF[i]>= PI*1.0 && newPosF[i]<(PI))
             ) { //  && (oldPosF[i]>=oldOldPosF[i]) 
              revLfo[i]++;TrigmodPos[i]=0;   
              text (i + " " + revLfo[i], 0, -700+50*i); 
            }
        }
      } 
          print ( " propagationBallRotationBis in m  any difference with rev revLfo better?  "); showArray(revLfo);     

    } // end circularMov 

     for (int i = 0; i <  networkSize-0; i+=1) { 
         //  oldPositionToMotor[i]=  positionToMotor[i];
         //  oldOldPosF[i]=oldPosF[i];
         //  oldPosF[i]=newPosF[i];

           oldOldPhaseMapped[i]=oldPhaseMapped[i];
           oldPhaseMapped[i]=phaseMapped[i];
           net.phase[i]=phaseMapped[i];
           // net.phase[i]=specialPhase[i];
       }

  }