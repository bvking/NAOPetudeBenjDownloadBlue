void propagation2wayRotationBis()
    {  // FAIRE CONDITION QUAND SIGNAL NEGATIF fu style
    textSize(100);
    modulePhaseAmountWithArrow = true;
    phaseAmount = trigedSignFromAbleton[1];
    phaseAmount = map(phaseAmount, 0, 1, 1, 0);     
    phaseAmount = map(phaseAmount, 0, 1, 0, TWO_PI / networkSize);
    
    
    if (modulePhaseAmountWithArrow)
    { 
        phaseAmount = levelFromArrow;
        phaseAmount = map(phaseAmount, 0, 1, 0, TWO_PI / networkSize);
    }
    
    
    if (doo)   { 
        phaseAmount =-  phaseAmount;  // change Way of phaseAmount
    }
    
    if (propagationTrigged ==  false && doRotation == true)
        {
        for (int i = 0; i < networkSize; i++)
            {
            //   LFO[i]=signal[2];
            //   LFO[i]%=TWO_PI;
            
        } // with else if
    }
    
    
    
    text(" levelFromArrow " + levelFromArrow + " modulePhaseAmountWithArrow " + modulePhaseAmountWithArrow + ((PI / (1 * networkSize - 1))) + "  phaseAmount  " + (phaseAmount), 500, -1000);
    text(" LFO[i]" + LFO[0] +  " doRotationWithoutPropagation " + doRotationWithoutPropagation + " doRotation " + doRotation, 500, -1100); 
    
    if (propagationTrigged ==  true  ) // && doRotationWithoutPropagation ==  false
        { //propaga fixe   doo ==  false && 
        
        LFO[oscillatorChange] = LFO[oldOscillatorChange];//
        if (keyMode == " propagationBallRotationBis " && modulePhaseAmountWithArrow) 
            { 
            LFO[oscillatorChange] = LFO[oscillatorChange] + phaseAmount;
        }
        
        if (keyMode == " propagationBallRotationBis " && !modulePhaseAmountWithArrow) 
            {
            LFO[oscillatorChange] = LFO[oscillatorChange] - (PI / (1 * networkSize - 1));
        }
        
        if (doo && keyMode == " propagationSampleBall ")
            {
            LFO[oscillatorChange] = movementInterpolated - (PI / (2 * networkSize - 1));
            text("  LFO[oscillatorChange] " +   LFO[oscillatorChange], 500, 1100);
        }
        
        if (keyMode == " propagationSampleBall ")
            {
            LFO[oscillatorChange] = movementInterpolated + (PI / (1 * networkSize - 1));
            text("  LFO[oscillatorChange] " +   LFO[oscillatorChange], 500, 1100);
        }
    }

    
    
    //---------- map all propaged Lfo  (angular incrementation from phase Amount)
    //  if (  doRotation == false )  // propagationTrigged ==  false &&
    // {
    
    if (doRotationWithoutPropagation ==  false || doRotationWithoutPropagation == true ) {
        
        
        for (int i = 0; i < networkSize; i++)
           { 
            if (LFO[i] < 0) 
            {
                phaseMapped[i] = LFO[i];//+signal[2]; 
              //  phaseMapped[i] = LFO[i]- newPosFollowed[i];
            }
            
            else
            {
   
                 phaseMapped[i] = LFO[i];//+signal[2];  //LFO[i];
              //  phaseMapped[i] = LFO[i] + newPosFollowed[i];    
            }
        }
                    //    text(" LFO[] pos ou neg" + LFO[oscillatorChange], 400, 100*oscillatorChange);    
    }
    
    if (doRotation == true)  // propagationTrigged ==  false &&
        {
        
        // if(signal[2] < 0.5) 
        if (!signalUpRise)
         {
            phaseMapped[oscillatorChange] -= map(signal[2], 0, 1, TWO_PI, 0);   
        } // with else if
        
        //if(signal[2] >=0.5)
        if (signalUpRise)
            
         {
            //signal[2] = int(map(signal[2], 0, 0.5, 0, TWO_PI));
            //phaseMapped [i] =LFO[i]+signal[2]; 
            phaseMapped[oscillatorChange] += map(signal[2], 0, 1, 0, TWO_PI);        
        }

         memoryi = oscillatorChange;
         phaseMapped[memoryi] = phaseMapped[oscillatorChange];

         text(" doRotation  " + memoryi + " " + phaseMapped[memoryi] + " signalUpRise " + signalUpRise , width , height / 2 - 700);

        
       // memoryi = oscillatorChange;
        
    }
    
    if (doRotationWithoutPropagation) 
      {  
        memoryi = oscillatorChange;
        textSize(100);
        if (propagationTrigged ==  false || propagationTrigged ==  false  ) {
            for (int i = 0; i < networkSize; i++)
            {
                //  phaseMapped [i] = LFO[i];
                
            }
            // propagationTrigged ==  false &&
            if (directionOfsignal ==  6)//(signalUpRise)

            {  
                newPosFollowed[memoryi]= map(signal[2], 0, 1, 0, TWO_PI);

   
                text(" UP WITH phaseMapped " + memoryi + " " + phaseMapped[memoryi], width , height / 2 - 500);
                
            }
            if (directionOfsignal ==  2)
                {
               newPosFollowed[memoryi]= map(signal[2], 1, 0 , 0, TWO_PI);
              
                newPosFollowed[memoryi] = newPosFollowed[memoryi];
                text(" DO withOUT phaseMapped " + memoryi + " " + phaseMapped[memoryi], width , height / 2 - 600);
                
            }
        }       
      }
          if (doRotationWithoutPropagation )  {
      //    for (int i = 0; i < networkSize; i++)
      //     { 
                phaseMapped[memoryi] += newPosFollowed[memoryi];
             //   phaseMapped[i] = LFO[i]; 
       //     }
         }
     
    // end ---------- map all propaged Lfo  (angular incrementation from phase Amount)
    // TRANSFORM DOL en DOROATION
    
    
    if (dol ==  true  && propagationTrigged ==  true) {  //AMPLITUDE  negative way : ccw
        int i;  
        i = (oscillatorChange);
        
        int j;  
        j = (oscillatorChange - 1);
        if (j <= - 1) {
            j = networkSize - 1;
        }
        
        int k;  
        k = (j - 1);
        if (k <= - 1) {
            k = networkSize - 1;
        }
        
        int l;
        l = (k - 1);
        if (l <= - 1) {
            l = networkSize - 1;
        }
        
        int m;
        m = (l - 1);
        if (m <= - 1) {
            m = networkSize - 1;
        }
        
        if (dol ==  true)
            { 
            
            if (newPosXaddSignal[j] < 0)
            { 
                
                phaseKeptAtChange[j] = newPosXaddSignal[j] - (2 * phaseAmount / (1)); //recule la precedente de deux fois 
                //     phaseKeptAtChange[j] = newPosXaddSignal[j] + (phaseAmount / (2)); //avance la precedente de la moitie
                //     phaseKeptAtChange[j] = newPosXaddSignal[j] + (2 * phaseAmount / (1)); //avance la precedente du double
                dataMappedForMotor[j] = int(map(phaseKeptAtChange[j], 0, -TWO_PI, numberOfStep, 0)); 
                LFO[j] = map(dataMappedForMotor[j], numberOfStep, 0, 0, -TWO_PI);
                text(" LFO[j]< " +   LFO[j], 500, 1200);  
            }
            
            else if (newPosXaddSignal[j] > 0)
            { 
                
                phaseKeptAtChange[j] = newPosXaddSignal[j] + (phaseAmount / (1 * networkSize - networkSize / 2));
                dataMappedForMotor[j] = (int) map(phaseKeptAtChange[j], 0, TWO_PI, 0, numberOfStep);
                LFO[j] = map(dataMappedForMotor[j], 0, numberOfStep, 0, TWO_PI);
                text("  LFO[j]> " +   LFO[j], 500, 1200); 
            }
            
            //---------- mapall propaged Lfo (angular incrementation from phase Amount) 
            
            for (int z = 0; z < networkSize; z++)
            {
                
               if (LFO[z] < 0)
                 {
                    dataMappedForMotorisedPosition[z] = int(map(LFO[z], 0, -TWO_PI, numberOfStep, 0)); 
                    phaseMapped[z] = map(dataMappedForMotorisedPosition[z], numberOfStep, 0, 0, -TWO_PI); 
                    newPosXaddSignal[z] = phaseMapped[z]; 
                }
                
                else 
                    {
                    
                    dataMappedForMotorisedPosition[z] = (int) map(LFO[z], 0, TWO_PI, 0, numberOfStep); 
                    phaseMapped[z] = map(dataMappedForMotorisedPosition[z], 0, numberOfStep, 0, TWO_PI);
                    newPosXaddSignal[z] = phaseMapped[z]; 
                    
                }
            }
            // end ---------- map all propaged Lfo (angular incrementation from phase Amount) 
        } // end dol
    } // enddol && propa=true
    
    
    /*
    if (doRotation == true)
    {
    
    for (intz = 0; z < networkSize; z++) {  // track actual Position by tracking dataMappedForMotorisedPosition[z]
    
    if (dataMappedForMotorisedPosition[z] <0) {
    
    track_actual_Position[z] = int(map(dataMappedForMotorisedPosition[z], 0, -TWO_PI, numberOfStep, 0)); 
    track_actual_Position[z] = map(track_actual_Position[z], numberOfStep, 0, 0, -TWO_PI); 
    
    //  newPosXaddSignal[z] = phaseMapped[z]; 
}
    
    else{
    
    track_actual_Position[z] = (int) map(dataMappedForMotorisedPosition[z], 0, TWO_PI, 0, numberOfStep); 
    track_actual_Position[z] = map(track_actual_Position[z], 0, numberOfStep, 0, TWO_PI);
    //newPosXaddSignal[z] = phaseMapped[z]; 
    
}
}
    
    
    
    
    
}
    */
    
}
