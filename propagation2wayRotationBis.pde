void propagation2wayRotationBis()
 {   // FAIRE CONDITION QUAND SIGNAL NEGATIF fu style
    textSize (50);
    modulePhaseAmountWithArrow=true;
    phaseAmount = trigedSignFromAbleton[1];
    phaseAmount = map(phaseAmount, 0, 1, 1, 0);     
    phaseAmount = map(phaseAmount, 0, 1, 0, TWO_PI / networkSize);
    
    if (modulePhaseAmountWithArrow)  { 
          phaseAmount= levelFromArrow;
          phaseAmount = map(phaseAmount, 0, 1, 0, TWO_PI / networkSize);
     }


    if (doo)   { 
          phaseAmount=-phaseAmount;  // change Way of phaseAmount
    }

      if ( propagationTrigged ==  false && doRotation == true )
    {
       for (int i = 0; i < networkSize; i++)
     {
     //   LFO[i]=signal[2];
     //   LFO[i]%=TWO_PI;

      } // with else if
    }

  
   
    text(" levelFromArrow " + levelFromArrow + " modulePhaseAmountWithArrow " + modulePhaseAmountWithArrow +  ( (PI / (1 * networkSize - 1))) + "  phaseAmount  " + (  phaseAmount  ), 500, -1000);
    text(" LFO[i]" + LFO[0] +  " doRotationWithoutPropagation "+ doRotationWithoutPropagation, 500, -1100); 
    
    if (propagationTrigged ==  true) { // propaga fixe   doo ==  false && 
        LFO[oscillatorChange] = LFO[oldOscillatorChange];//
     if ( keyMode == " propagationBallRotationBis " && modulePhaseAmountWithArrow)  { 
        LFO[oscillatorChange] = LFO[oscillatorChange] + phaseAmount ;
     }

      if ( keyMode == " propagationBallRotationBis " && !modulePhaseAmountWithArrow)  { 
        LFO[oscillatorChange] = LFO[oscillatorChange] - (PI / (1 * networkSize - 1));
     }

     if ( doo && keyMode == " propagationSampleBall ")  { 
        LFO[oscillatorChange] = movementInterpolated - (PI / (2 * networkSize - 1));
        text("  LFO[oscillatorChange] " +   LFO[oscillatorChange], 500, 1100);
     }

     if ( keyMode == " propagationSampleBall ")  { 
        LFO[oscillatorChange] = movementInterpolated + (PI / (1 * networkSize - 1));
        text("  LFO[oscillatorChange] " +   LFO[oscillatorChange], 500, 1100);
     }
    }

         //---------- map all propaged Lfo  (angular incrementation from phase Amount)
    //  if (  doRotation == false )  // propagationTrigged ==  false &&
    // {

    if (doRotationWithoutPropagation ==  false || doRotationWithoutPropagation ==  true) {


      for (int i = 0; i < networkSize; i++)
      {  
         if(LFO[i] < 0) 
          {
            //     dataMappedForMotorisedPosition[i] = int(map(LFO[i], 0, -TWO_PI, numberOfStep, 0)); 
            //     phaseMapped[i] = map(dataMappedForMotorisedPosition[i], numberOfStep, 0, 0, -TWO_PI); 

            //LFO[i]= LFO[i]- newPosFollowed[i];//  LFO[i]+TWO_PI;   
            //LFO[i] = newPosFollowed[i];  

               text ( " LFO[0] neg " + LFO[0], 200, 100);

               phaseMapped [i] = LFO[i];//+signal[2]; 
         }
        
         else
         {
            
             //   dataMappedForMotorisedPosition[i] = (int) map(LFO[i], 0, TWO_PI, 0, numberOfStep); 
             //   phaseMapped[i] = map(dataMappedForMotorisedPosition[i], 0, numberOfStep, 0, TWO_PI);
             //   newPosXaddSignal[i] = LFO[i]; 
     
              //   LFO[i]= LFO[i]+ newPosFollowed[i];//  LFO[i]+TWO_PI;  
           // LFO[i] = newPosFollowed[i];  

             text ( " LFO[1] pos " + LFO[1], 300, 100);     

            phaseMapped [i] =LFO[i];//+signal[2];  //LFO[i];    
         }
      }
     }

    if ( doRotation == true)  // propagationTrigged ==  false &&
    {
     //   for (int i = 0; i < networkSize; i++)
     // {
        if(signal[2] < 0.5) 
        {
           //   signal[2] = int(map(LFO[i], 0, -PI, numberOfStep/2, 0)); 
          // signal[2] = int(map(signal[2], 0.5, 0, 0, -TWO_PI));

            //     phaseMapped[i] = map(dataMappedForMotorisedPosition[i], numberOfStep, 0, 0, -TWO_PI); 
             //   LFO[i]=signal[2];
              //   LFO[i]%=TWO_PI;
        // phaseMapped [i] =LFO[i]-signal[2];  //LFO[i];   
         phaseMapped [oscillatorChange] -= map (signal[2], 0, 1, TWO_PI, 0); 


         } // with else if

        if(signal[2] >=0.5) 
        {
          // signal[2] = int(map(signal[2], 0, 0.5, 0, TWO_PI));
          // phaseMapped [i] =LFO[i]+signal[2]; 
           phaseMapped [oscillatorChange] += map (signal[2], 0, 1, 0, TWO_PI); 

        }

        memoryi=oscillatorChange;

    }

     if ( doRotationWithoutPropagation  ) 
     {                                                                           // propagationTrigged ==  false &&
      if (signalUpRise)
      {
       phaseMapped [memoryi] += signal[2]; 
      }
     else
       phaseMapped [memoryi] -= signal[2]; 


    }

  

    // end ---------- map all propaged Lfo  (angular incrementation from phase Amount)

    // TRANSFORM DOL en DOROATION
    
    
    if (dol ==  true  && propagationTrigged ==  true) {  //AMPLITUDE  negative way : ccw
        int i;  
        i = (oscillatorChange);
        
        int j;  
        j = (oscillatorChange - 1);
        if (j <= -1) {
            j = networkSize - 1;
        }
        
        int k;  
        k = (j - 1);
        if (k <= -1) {
            k = networkSize - 1;
        }
        
        int l;
        l = (k - 1);
        if (l <= -1) {
           l = networkSize - 1;
        }
        
        int m;
        m = (l - 1);
        if (m <= -1) {
           m = networkSize - 1;
        }

      if (dol ==  true)
        { 
            
          if (newPosXaddSignal[j] < 0) { 
                
                phaseKeptAtChange[j] = newPosXaddSignal[j] - (2 * phaseAmount / (1)); //recule la precedente de deux fois 
               //    phaseKeptAtChange[j] = newPosXaddSignal[j] + (phaseAmount / (2)); //avance la precedente de la moitie
               //     phaseKeptAtChange[j] = newPosXaddSignal[j] + (2 * phaseAmount / (1)); //avance la precedente du double
                dataMappedForMotor[j] = int(map(phaseKeptAtChange[j], 0, -TWO_PI, numberOfStep, 0)); 
                LFO[j] = map(dataMappedForMotor[j], numberOfStep, 0, 0, -TWO_PI);
                text(" LFO[j]< " +   LFO[j], 500, 1200);  
            }
                
           else if (newPosXaddSignal[j] > 0) { 
                        
                  phaseKeptAtChange[j] = newPosXaddSignal[j] + (phaseAmount / (1 * networkSize - networkSize / 2));
                  dataMappedForMotor[j] = (int) map(phaseKeptAtChange[j], 0, TWO_PI, 0, numberOfStep);
                  LFO[j] = map(dataMappedForMotor[j], 0, numberOfStep, 0, TWO_PI);
                  text("  LFO[j]> " +   LFO[j], 500, 1200); 
            }
                            
               //---------- mapall propaged Lfo (angular incrementation from phase Amount) 

           for (int z = 0; z < networkSize; z++) {
                        
                  if (LFO[z] <0) {
                            dataMappedForMotorisedPosition[z] = int(map(LFO[z], 0, -TWO_PI, numberOfStep, 0)); 
                            phaseMapped[z] = map(dataMappedForMotorisedPosition[z], numberOfStep, 0, 0, -TWO_PI); 
                            newPosXaddSignal[z] = phaseMapped[z]; 
                  }
                    
                  else {
                        
                        dataMappedForMotorisedPosition[z] = (int) map(LFO[z], 0, TWO_PI, 0, numberOfStep); 
                        phaseMapped[z] = map(dataMappedForMotorisedPosition[z], 0, numberOfStep, 0, TWO_PI);
                        newPosXaddSignal[z] = phaseMapped[z]; 
                        
                }
            }
                // end ---------- map all propaged Lfo (angular incrementation from phase Amount) 
       } // end dol
    } // end dol && propa=true


    /*
     if (doRotation == true)
       {

         for (int z = 0; z < networkSize; z++) {  // track actual Position by tracking dataMappedForMotorisedPosition[z]
                        
                  if (dataMappedForMotorisedPosition[z] <0) {

                            track_actual_Position[z] = int(map(dataMappedForMotorisedPosition[z], 0, -TWO_PI, numberOfStep, 0)); 
                            track_actual_Position[z] = map(track_actual_Position[z], numberOfStep, 0, 0, -TWO_PI); 

                          //  newPosXaddSignal[z] = phaseMapped[z]; 
                  }
                    
                  else {
                        
                        track_actual_Position[z] = (int) map(dataMappedForMotorisedPosition[z], 0, TWO_PI, 0, numberOfStep); 
                        track_actual_Position[z] = map(track_actual_Position[z], 0, numberOfStep, 0, TWO_PI);
                        //newPosXaddSignal[z] = phaseMapped[z]; 
                        
                }
            }





        }
  */

}
