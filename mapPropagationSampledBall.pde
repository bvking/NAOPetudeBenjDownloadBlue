void mapPropagationSampledBall() {

        textSize(100);
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
           //  text (" positionToMotor " + oldPositionToMotor[i] + " " + positionToMotor[i] , -800, -500 + (50*i));  
             //dataMappedForMotorisedPosition[i] = positionToMotor[i];
       }

    if (modeCircular )
      {  
         textSize( 75);
       if (keyMode == " trigEventWithAbletonSignal "  || keyMode == " propagationBallRotationBisLessBetterWayToCountRevolution "
                                                      || modeStartKeyToFollow == " followSignalSampledOppositeWay(frameRatio) " )                       // || formerKeyMetro == '$'//  if (modeCircular==true) { doesn't work
       { 
        countRevsPhaseMappedPositiveOnly(); // with motor Positive Only, counter is rev   //  print ( " counter made with position Motor godd with Prop and follow and trigEvent?  "); showArray(rev); 
       } 
        for (int i = 0; i <  networkSize-0; i+=1)
         {
           oldPositionToMotor[i]=  positionToMotor[i];
         } 
           //  text (rev[0] + " specialPhase " + specialPhase[0] + " propagationSpeed " + propagationSpeed + " or signal[2] " + signal[2], 0, -800 );  // //degrees (signal[2])
          text (" key " + key + " fKey " + formerKey + " fKeyC " + formerKeyCode + " KeyC "+ keyCode + " Mouse? " + samplingWithMouse + " sysForBig " + systemForBigMachine, -600, -900 ); 
          text (" modeStart " +  modeStartKeyToFollow + "frame/s " + frameRatio + " speedOfR " + speedOfrepetition + " f/s " +  delayTimeFollowPhase11 + "fSync "+ factorSynchro  , -600, -800 );  // //degrees (signal[2])

     
       if ( keyMode == " propagationSampleBall " || keyMode == " propagationBallRotationBis " )
                                              //   || modeStartKeyToFollow == " followSignalSampledOppositeWay(frameRatio) " ) 
       { 
       
         for (int i = 0; i <  networkSize-0; i+=1)
          { 

            oldOldOldPosF[i]= oldOldPosF[i];
            oldOldPosF[i]=oldPosF[i];
            oldPosF[i]=newPosF[i];
            newPosF[i]=phaseMapped[i];

     
            if (               newPosF[i]>oldPosF[i] && doo==true && (oldPosF[i]<=oldOldPosF[i])           )
              {
                  if ( doRotationWithoutPropagation == false )   // inside  mapPropagationSampledBall()  to rename // mapPropagationTomanageCounter
                    {
                    revLfo[i]--;TrigmodPos[i]=0;
                    } 
                text (i + " " + revLfo[i], 0, -700+50*i);
              } 


            if (               newPosF[i]<oldPosF[i] && doo==false && (oldPosF[i]>=oldOldPosF[i]))// doo false CW newPos uprise
              { 

                  if ( doRotationWithoutPropagation == false )   // inside  mapPropagationSampledBall()  to rename // mapPropagationTomanageCounter
                    {
                    revLfo[i]++;TrigmodPos[i]=0;
                    } 
               text (i + " " + revLfo[i], 0, -700+50*i); 
             }
        }
      } 
              // print ( " propagationBallRotationBis in m  any difference with rev revLfo better?  "); showArray(revLfo);     

     } // end modeCircular 

     for (int i = 0; i <  networkSize-0; i+=1) { 
      
           oldOldPhaseMapped[i]=oldPhaseMapped[i];
           oldPhaseMapped[i]=phaseMapped[i];
           net.phase[i]=phaseMapped[i];
           // net.phase[i]=specialPhase[i];
       }

  }
