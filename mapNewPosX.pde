void mapNewPosX() {
    textSize(40);

         for (int i = 0; i <  networkSize-0; i+=1) { 
       //  TrigmodPos[i]=1; 
         }



    if ( modeStartKeyToFollow == " followSignalSampledOppositeWay(frameRatio) " ) {
     for (int i = 0; i <  networkSize-0; i+=1) { 
   //  text (" revLfo[i] " + revLfo[i] + " trigModPos[oscillatorChange] " + TrigmodPos[oscillatorChange]  +  " mapData From Key" +  keyMode + " modStart "  + modeStartKeyToFollow, 800, 100*(i));
     newPosXaddSignal[i]%=TWO_PI;
     net.phase[i]=newPosXaddSignal[i]; // to trig something with arduinoPos
     }
    }

    if ( modeStartKeyToFollow == " followSignalSampledOppositeWay(frameRatio) " ) {
     text ( " delay " + delayTimeFollowPhase11 + " phase " + degrees (phaseShiftingFollowPhase11), 0, -800 );
     for (int i = 0; i <  networkSize-0; i+=1) { 
         //  net.phase[i]=phaseMapped[i];

             OldSpecialPhase[i]=specialPhase[i]; //specialPhase[i] from  followSignal
    
              positionToMotor[i]= specialPhase[i]%numberOfStep;
    
                            text (oldPositionToMotor[i] + " " + positionToMotor[i] , -800, -500 + (50*i));


       
      }
    } 
  
    //  if (circularMov==true) {
       if (formerKeyMetro == '*') {
          countRevsPhaseMappedPositiveOnly();
          }

      println ( " revsSpecial in mapNew "); showArray(rev);    
     
    // map depending way of rotation

    if ( modeStartKeyToFollow != " followSignalSampledOppositeWay(frameRatio) " ) {
    for (int i = 0; i <  networkSize-0; i+=1) { // la premiere celle du fond i=2,  la derniere celle du devant i=11  
         positionToMotor[i]= ((int) map (newPosXaddSignal[i], 0, TWO_PI, 0, numberOfStep)%numberOfStep); //
         newPosF[i]=positionToMotor[i]%6400;
   
     //if (net.oldPhase[i] > net.phase[i] ) {
      if ( oldPositionToMotor[i]>positionToMotor[i]) {

       positionToMotor[i]= ((int) map (newPosXaddSignal[i], 0, -TWO_PI,  numberOfStep, 0)%numberOfStep); //
       newPosF[i]=positionToMotor[i]%6400;
       }
      }
     } 
    

    // end map depending way of rotation
  
     textSize (50);



     if ( modeStartKeyToFollow == " followSignalSampledOppositeWay(frameRatio) " ) { 
     for (int i = 0; i <  networkSize-0; i+=1) { 
           //newPosF[i]=phaseMapped[i];
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

     else  if ( modeStartKeyToFollow == " propagationBallRotationBis " ) { 

  
      //____ only with popagation

     for (int i = 0; i <  networkSize-0; i+=1) { 
       if ( doo==false && formerKeyMetro == '*') { //  work with propaBis in circularMode only

          if ( oldPosF[i]>newPosF[i] ) { //
            revLfo[i]++;
            TrigmodPos[i]=0;   
          }
        }
      }

     if (dol && !doo ) { // && TrigmodPos[oscillatorChange]!=0

            if ( propagationTrigged)  {    // set j as 2  
             int j; 
             j= (oscillatorChange-1);
              if (j<= -1){
                j= networkSize-1;
                TrigmodPos[j]=2;
              }
    
              text ( " cancel counting bug by minusing ", 400, 400);
              revLfo[oscillatorChange]--;  // cancel counter
             // revLfo[j]--;  // cancel counter
              TrigmodPos[j]=3;   
      
            }
      }
 
      for (int i = 0; i <  networkSize-0; i+=1) { 
         //  text (  " net.oldPhase[i] " + net.phase[i] + " " + newPosXaddSignal[i] + " oldOldPosF " + oldOldPosF[i] + " oldPosF " + oldPosF[i] + " newPosF " + newPosF[i], width*2, i*50);
 
       if ( doo==true && formerKeyMetro == '*' ){  // compteur pour propagation circulaire
  
         if (  newPosF[i]>oldPosF[i]  && (oldPosF[i]<=oldOldPosF[i]) ){  // voir dans quel sens la retropropagation oriente  i et j
         revLfo[i]--;
         TrigmodPos[i]=0;
         }
       }

       if (dol && doo  && TrigmodPos[i]!=0) {

         if ( propagationTrigged)  {    // set j as 2  
         int j; 
         j= (oscillatorChange-1);
         if (j<= -1){
         j= networkSize-1;
         TrigmodPos[j]=2;
       }

       //   text ( " cancel counting bug by adding ", 400, 400);
       //   revLfo[oscillatorChange]++;
       //   revLfo[j]++;  // cancel counter
         TrigmodPos[j]=4;   
    
       }
      }
     }
   }

       for (int i = 0; i <  networkSize-0; i+=1) { 
          oldPositionToMotor[i]=  positionToMotor[i];
            oldOldPosF[i]=oldPosF[i];
            oldPosF[i]=newPosF[i];
            oldOldPhaseMapped[i]=oldPhaseMapped[i];
            oldPhaseMapped[i]=phaseMapped[i];
            net.phase[i]=phaseMapped[i];
           // net.phase[i]=specialPhase[i];
          }
   
}



