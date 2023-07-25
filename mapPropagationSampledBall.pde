void mapPropagationSampledBall() {
   textSize(40);
     for (int i = 0; i <  networkSize-0; i+=1) { 
          //   net.phase[i]=newPosXaddSignal[i]; // use to display  ?

            /*
               if ((phaseMapped[i])<0){
                  phaseMapped[i]= (phaseMapped[i])+TWO_PI; // easier
                  phaseMapped[i]%=TWO_PI;     
                 } 

                else if (phaseMapped[i]>=0){ 
                   phaseMapped[i]%=TWO_PI;
                 }
            */


             //specialPhase[i]=newPosXaddSignal[i];
             //if (specialPhase[i] < 0) { 
             //   specialPhase[i]= TWO_PI-specialPhase[i];
              //  }
             //specialPhase[i] = map (specialPhase[i], 0, TWO_PI, 0, numberOfStep);
             // specialPhase[i]=dataMappedForMotorisedPosition[i];
            
             OldSpecialPhase[i]=specialPhase[i]; // Old not used
             specialPhase[i] = (int) map (phaseMapped[i], 0, TWO_PI, 0, numberOfStep);
            // oldPositionToMotor[i]=  positionToMotor[i];
             oldPositionToMotor[i]=  OldSpecialPhase[i];
             positionToMotor[i]= specialPhase[i]%numberOfStep;
             text (oldPositionToMotor[i] + " " + positionToMotor[i] , -800, -500 + (50*i));  
      }
     
     
     if (formerKeyMetro == '*' ) { // || formerKeyMetro == '$'//  if (circularMov==true) { doesn't work
          countRevsPhaseMappedPositiveOnly(); // with motor Positive Only
      } 
          print ( " cou+Only in maPropa "); showArray(rev);    
          text ( " specialPhase " + specialPhase[0] + " propagationSpeed " + propagationSpeed + " or signal[2] " + signal[2], 0, -800 );  // //degrees (signal[2])
     
      if ( keyMode == " propagationSampleBall " ) { 
     for (int i = 0; i <  networkSize-0; i+=1) { 
            newPosF[i]=phaseMapped[i];

             text (revLfo[i] +  " newPosF " + newPosF[i] + " oldPosF[i] " + oldPosF[i], 1000, -700+50*i );  // //degrees (signal[2])
     
            if ( oldPosF[i]>newPosF[i] ) { //
            revLfo[i]++;
            TrigmodPos[i]=0;   
            }
          
            if (  newPosF[i]>oldPosF[i]  && (oldPosF[i]<=oldOldPosF[i]) ){  // voir dans quel sens la retropropagation oriente  i et j
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