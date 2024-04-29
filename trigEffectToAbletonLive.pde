int[] fromEncodeurToLive = new int[networkSize];
boolean[] trigEffectTo = new boolean[networkSize];
boolean[] trigEffectBisTo = new boolean[networkSize];
int[] timeTriggedFromEncodeur = new int[networkSize];
int[] startMeasureFromEncodeur = new int[networkSize];
int[] recEncodeurPosition = new int[networkSize];
int[] dataMappedFromMotor = new int[networkSize];
boolean[] oldEncoderTouched = new boolean[networkSize];
int[]touchedTimeStarter = new int[networkSize];
boolean[] encoderTurnClockWise = new boolean[networkSize];
boolean[] enablingChangeSound = new boolean[networkSize];
boolean[]  enablingChangeSoundB = new boolean[networkSize];
int mapRatio = 400;
int[] encodeurMappedAsMotor = new int[networkSize];
int[] gapEncoder_Motor = new int[networkSize];
int[] gapEncoder_OldEncodeur = new int[networkSize];
int[] ratioNumberOfStepCorraletedFromInstrument = new int[networkSize];// in phaseDirectFromSeq
int[] dataMapped = new int[networkSize];
int[] timeDisablingChangesParameter = new int[networkSize];
int instrumentTouched; 
String modeOfControlDr = " virtual ";


boolean[]  enablingChangeToLive = new boolean[networkSize];

// void sendPositionToLiveFromTouchedEncodeurNetworkSizeOnly(int virtualEncodeur0, int virtualEncodeur1, int virtualEncodeur2, int virtualEncodeur3, int virtualEncodeur4, int virtualEncodeur5 ) 

void sendPositionToLiveFromTouchedEncodeurNetworkSizeOnly()
{  
    textSize(75);
       
    for (int i = 0; i < networkSize; i++)
    { 
          if ( modeOfControlDr== " virtual ")
         { 
          encodeur[i]=(int) map (slider[i], 0., 127., 0, 4000);
         } 
            
        encoderTouched[i] =  false;
        oldEncodeurPosition[i] = encodeurPosition[i] * 1;
        
        encodeurPosition[i] = encodeur[i];
        encodeur[i] %=  4000;
        
        encodeurMappedAsMotor[i] = abs((int) map(encodeur[i], 0, 4000, 0, numberOfStep)); 
        
        oldVelocityBis[i] = velocityBis[i];// usefull may be to compute acceleration
        
        //*********** COMPUTE SPEED of encoder
          
        gapEncoder_OldEncodeur[i] = encodeurPosition[i] - oldEncodeurPosition[i];
        
        if (gapEncoder_OldEncodeur[i] < ( - 4000 + 400))
        {
            gapEncoder_OldEncodeur[i] += 4000;
        }
        velocityBis[i] = gapEncoder_OldEncodeur[i];
         
        //*********** COMPUTE GAP between where the position of motor would have to be and actual position of encoder
        
        dataMapped[i]  = (int) map(dataMappedForMotorisedBigMachine[networkSize - 1 - i], 0, numberOfStep, 0, numberOfStep); //assign instrument changed at the good order 0 left, then 1,2, .., .. 4 right fonctionne en up
        dataMapped[i]  %= numberOfStep;
        
        dataMappedFromMotor[i] = (int)  map(dataMapped[i], 0, numberOfStep, 0, numberOfStep); 
        dataMappedFromMotor[i] %=  numberOfStep;
           
        if (oldEncoderTouched[i] != encoderTouched[i])
        {            
        }     
        if (velocityBis[i] > 10)
        { 
            encoderTurnClockWise[i] = true;
        }
        if (velocityBis[i] <-  10)
        { 
           encoderTurnClockWise[i] = false; 
        }     
        if (encoderTouched[i] ==  true)
        {       
        }

        gapEncoder_Motor[i] =  abs(encodeurMappedAsMotor[i] - dataMappedFromMotor[i]);
        rotate( -PI / 2);
        if (!systemForBigMachine) 
         { 
         //   "VIRT " + slider[i] +   " GapM " +  gapEncoder_Motor[i] + 
        text( "GAPE " + velocityBis[i] + " acc " + accelerationBis[i] + " " + i + " old " + oldEncodeurPosition[i] + " " + encodeurPosition[i] + " " + numberOfTrig[i] + " " + enablingParametersChangesToLive + " SAVING " + patternFromInstrument + " " + recordPositionsFromInstrument[patternFromInstrument][i] + " "  +
              " recall " + patterFromInstrumentRecorded  + " " + recordPositionsFromInstrument[i][patterFromInstrumentRecorded] +
              "lfo2 " + shapeLfoMode , -1000, +1200 - (i * 75));
           } 
        rotate(PI / 2);

        if (velocityBis[i] >  200 && velocityBis[i] <  250 )  // to change phasePattern
         { 

            instrumentTouched = i;
            patternFromInstrument = networkSize - 1 - instrumentTouched;  //
    
         timeDisablingChangesParameter[patternFromInstrument]=millis();
        
         }

        if (velocityBis[i] >  250 )  // to change phasePattern
         { 
            instrumentTouched = i;
            patternFromInstrument = networkSize - 1 - instrumentTouched;  //
    
         timeEnablingChangesParameter[patternFromInstrument]=millis();
        
         }


        if (timeEnablingChangesParameter[patternFromInstrument]>(timeDisablingChangesParameter[patternFromInstrument])
           && timeEnablingChangesParameter[patternFromInstrument]+20<= millis())
        { 
          enablingChangeToLive[patternFromInstrument]=true;
        }


        if (timeEnablingChangesParameter[patternFromInstrument]+30<= millis())
         {
              enablingChangeToLive[patternFromInstrument]=false;
         }


        
/*¨
   
        if (velocityBis[i] >   250 &&   millis()>timeEnablingChangesParameter[patternFromInstrument]+30)  // to change phasePattern
         { 
            formerPatternFromInstrument = patternFromInstrument;
            instrumentTouched = i;
            patternFromInstrument = networkSize - 1 - instrumentTouched;  //

         //   timeEnablingChangesParameter[patternFromInstrument]=millis();
            enablingChangeToLive[patternFromInstrument]=true;

            enablingParametersChangesToLive = true;

                if (formerPatternFromInstrument != patternFromInstrument)
             {
                instrumentChanged = true;
                instrumentToMute[patternFromInstrument] = false;
                
             } 
             else  if (formerPatternFromInstrument == patternFromInstrument)
             {
                instrumentChanged = false;        
            
               // enablingChangeSound[patternFromInstrument] = true;
             }
         }
*/
           

        //velocityBis[i] >   250 && 
        if (enablingParametersChangesToLive == true && enablingChangeToLive[patternFromInstrument]==true ) // && enablingParametersChangesToLive == true 
        {  
           
            /*
            instrumentTouched = i;
            patternFromInstrument = networkSize - 1 - instrumentTouched;  //
            */
            
             if (formerPatternFromInstrument != patternFromInstrument)
             {
                instrumentChanged = true;
                instrumentToMute[patternFromInstrument] = false;
                
             } 
             else   if (formerPatternFromInstrument == patternFromInstrument)
             {
                instrumentChanged = false;        
            
               // enablingChangeSound[patternFromInstrument] = true;
             }
               
              //  enablingParametersChangesToLive = false;

        } 

        // velocityBis[i] >   250 &&
        if ( enablingParametersChangesToLive == true && enablingChangeToLive[patternFromInstrument]==true && instrumentChanged == false) // && enablingParametersChangesToLive == true 
        { 
            enablingChangeSound[patternFromInstrument] = true;
            /*
            instrumentTouched = i;
            patternFromInstrument = networkSize - 1 - instrumentTouched;  //
            */

          //  instrumentToMute[patternFromInstrument] =! instrumentToMute[patternFromInstrument];

       /*
             if (formerPatternFromInstrument != patternFromInstrument)
             {
                instrumentChanged = true;
                 enablingChangeSound[patternFromInstrument] = false;
             } 
             else
                instrumentChanged = false;
                enablingChangeToLive[patternFromInstrument]= true; 
      */
          //  enablingParametersChangesToLive = false;

        } 
     
        
        if (velocityBis[i] <-  1250) // && enablingParametersChangesToLive == true 
        {  
            /*
            formerPatternFromInstrument = patternFromInstrument;
            instrumentTouched = i;
            patternFromInstrument = networkSize - 1 - instrumentTouched;  //

            timeEnablingChangesParameter[patternFromInstrument]=millis();
    
            instrumentToMute[patternFromInstrument] =! instrumentToMute[patternFromInstrument];
       
            touchedTimeStarter[0] = millis();
            
            encoderTouched[patternFromInstrument] =  true;
            enablingChangeSoundB[patternFromInstrument] = true; 
           // enablingChangeSound[patternFromInstrument] = true;      
           //  enablingParametersChangesToLive = false;
          */
     
        }
    } 

       if (enablingChangeSound[patternFromInstrument] == true && instrumentChanged == true )//&& enablingParametersChangesToLive == true //&&  enablingParametersChangesToLive == false

     {  
         
       //  frameTrigger=frameCount;
         key = 'ç';
         phaseDirectToMotor();
         noLoop();
     
        recallLastPatternInstrument=patternFromInstrument;
        phaseDirectFromSeq();
        // enablingChangeSound[patternFromInstrument] = false;
         recallLastPatternInstrument=1000;
         
     }
    
    
      if (enablingChangeSound[patternFromInstrument] == true && instrumentChanged == false )//&& enablingParametersChangesToLive == true //&&  enablingParametersChangesToLive == false

     {
         recallLastPatternInstrument=1000;
       //  frameTrigger=frameCount;
       //  phaseDirectFromSeq();
        
        background(50);
        key = 'e';
        phaseDirectFromSeq();
        //keyCode = '0';
        
        
        textSize(150);           
        numberOfTrig[patternFromInstrument] += 1;
        numberOfTrig[networkSize - 1 - instrumentTouched] %= 18;
        
        if (numberOfTrig[patternFromInstrument] == 17)
        { 
            numberOfTrig[patternFromInstrument] = 8;
        }
        text("               changeS " + instrumentTouched + " " + numberOfTrig[patternFromInstrument] + " ", 0, 1 * patternFromInstrument * 50); 
        enablingChangeSound[patternFromInstrument] = false; 
        enablingChangeSoundB[patternFromInstrument] = false; 
        enablingParametersChangesToLive = false;
        
    
        if (instrumentChanged == false ) // SAVING new position to recordPositionsFromInstrument[k][patternFromInstrument]
        {  
            textSize(30);  
            // recordPositionsFromInstrument[k][patternFromInstrument] &= positionFromMotorPhase[k];  
            for (int k = 0; k < networkSize; k++)
            {   
            for (int i = patternFromInstrument; i < patternFromInstrument + 1; i++) 
            { 
                //    recordPositionsFromInstrument[k][i] = positionFromMotorPhase[k]; 
                    text(" recPaT " + patternFromInstrument + " " + recordPositionsFromInstrument[k][i] + " enaSound " + (networkSize - 1 - instrumentTouched) + " " + enablingChangeSoundB[networkSize - 1 - instrumentTouched], 700 * 0, k * 30);                        
            }
            }
             timeEnablingChangesParameter[patternFromInstrument]=millis();
        }

        // instrumentChanged = false;

       

        enablingParametersChangesToLive = false;

        // secondTouchedTimeStarter = millis(); 
    }
       if (timeEnablingChangesParameter[patternFromInstrument]+20 <= millis())
         { 
          enablingParametersChangesToLive = false;
        //  enablingChangeSound[patternFromInstrument]=false;
         }
    
    if (secondTouchedTimeStarter + 1000 <=  millis() &&  enablingParametersChangesToLive == true)
        { 
        text("               changeS " + instrumentTouched + " " + numberOfTrig[networkSize - 1 - instrumentTouched] + " ", 0, 1 * networkSize - 1 - instrumentTouched * 50); 
        enablingParametersChangesToLive = false;
       // key = '#';  
        //  enablingChangeSoundB[networkSize-1-instrumentTouched] =!enablingChangeSoundB[networkSize-1-instrumentTouched] ; // = false;              
    }

     if ( enablingChangeSound[networkSize - 1 - instrumentTouched] = false)  
     { 
      // key = '#' ;
      } 
    
    
    /*
    if (oldEncoderTouched[i] == encoderTouched[i] && enablingChangeSound[networkSize-1-i] ==  false && touchedTimeStarter[networkSize-1-i] + 2000 <=  millis())
    { 
    //  touchedTimeStarter[i] = millis();              
    }   
    
    if (midPos[i] ==  true)
    { 
    //  text ("MIDDLE POSITION GOOD MATCH in " + i + " " + midPos[i] + " " + midPos[i]+ " ", -500, 1 * i * 200);   
    }
    //   key = '#';
    */
    
    
}

void trigMiddlePositionFromEncodeur() // midPos à revoir avec ancienne version
{
    int mapRatio = 400;
    textSize(100);
    rotate( -HALF_PI);
    for (int i = 0; i < networkSize; i++)
    { 
        midPos[i] =  false;
        oldEncodeurPosition[i] = encodeurPosition[i];      
        encodeurPosition[i] = (int) map(encodeur[i], 0, 4000, 0, 4000);    
        //text(" trigMid " + oldEncodeurPosition[i] + " " + encodeurPosition[i], -1000, 1 * i * 100);
        if ((oldEncodeurPosition[i] < mapRatio / 2 && encodeurPosition[i] > mapRatio / 2)) 
        {
            midPos[i] =  true;
            text("MIDDLE POSITION GOD2 MATCH in " + i + " " + midPos[i] + " " + midPos[i] , -1000, 1 * i * 100);          
        }
        if ((oldEncodeurPosition[i] > mapRatio / 2 && encodeurPosition[i] < mapRatio / 2)) 
        {
            midPos[i] =  true;
        }
        text(oldEncodeurPosition[i] + " " + encodeurPosition[i] + " " +  midPos[i], 100, 200 * i);
    }
    rotate(HALF_PI);
}

void computeMidPosToSend()
    {
    
    result = multiMatchData(0, 1, TrigmodPos.clone());
    TrigmodPos = result;
    //print(" showResul ");showArray(result);
    textSize(150);
    
    //- --------------- prepare Display midPos pos sent
    if (networkSize ==  6) 
    {
        char resultString[] = {'A', 'A', 'A', 'A', 'A', 'A'};
        
        for (int i = 0; i < networkSize; i++)
        {
            if (result[i] ==  0) {
                resultString[i] = 'B';
            }
        }
        
        char data[] = {resultString[0], resultString[1], resultString[2],resultString[3], resultString[4], resultString[5]};
        String str2 = new String(data);
        //text(" showTrig " + str2, 300, -850);
        
        //- --------------- middle pos sent
        
        //text(" midPos[0] " + midPos[0], 300, -450);
        char midPosString[] = {'F', 'F', 'F', 'F', 'F', 'F'};
        
        // resultString='A';
        for (int i = 0; i < networkSize; i++)
        {
            if (midPos[i] ==  true) {
                midPosString[i] = 'T';
                sendMiddle[i] = 0;  // to trig something in M4Live
            }
            else {
                sendMiddle[i] = 1; 
            }
        }
        char middlePos[] = {midPosString[0], midPosString[1], midPosString[2],midPosString[3], midPosString[4], midPosString[5]};
        String strMiddle = new String(middlePos);
        //text(" showMid " + strMiddle, 800, -1000);
        
        //midPos  but not aligned  covertir en int puis float DO NOT WORK WELL
        
        for (int i = 0; i < networkSize; i++)
        {
            sendMiddleInt[i] = (int)  sendMiddle[i];      
        }
        
        resultMidPosWithEncoderInt = multiMatchData(1, 0, sendMiddleInt.clone());
        
        for (int i = 0; i < networkSize; i++)
        { 
            sendMiddle[i] = (float) resultMidPosWithEncoderInt[i];
            //text(" sendMid " +  sendMiddle[i], -800, -1000-100*i);
            
        }
        
        
        // println (" sendMiddle ");showArrayF(sendMiddle);
        // println(" sendMiddle ");showArrayF(sendMiddle);
        
        /* 
        resultMidPosWithEncoderF = multiMatchDataF(1, 0, sendMiddle.clone());
        sendMiddle = resultMidPosWithEncoder;
        */
        // println(" sendMiddle ");showArrayF(sendMiddle);
        // println(" sendMiddle ");showArrayF(sendMiddle);
        
        
    }
}




void trigEffectToAbletonLive()
    { 
    if (oldEncodeur[0] != encodeur[0]) {   
        trigEffectTo[0] = true;
        textSize(150);
        timeTriggedFromEncodeur[0] = millis(); // NOT USED
        trigEffectBisTo[0] = true;
        fromEncodeurToLive[0] = 1;   
    }
    else trigEffectTo[0] = false;
    
    if (trigEffectBisTo[0] ==  true && beatTrigged ==  true) {
        startMeasureFromEncodeur[0] = measure;
        textSize(400);
        trigEffectBisTo[0] = false;  
    }
    
    if (measure ==  startMeasureFromEncodeur[0] + 2) {   
        textSize(200);
        fromEncodeurToLive[0] = 0;
    }
    text(" trigEffectTo[0] " + trigEffectTo[0] + " fromEncodeurToLive[0] " + fromEncodeurToLive[0] +  " encodeur[0] " + encodeur[0] , -300, 700);
    
    oldEncodeur[0] = encodeur[0];
    
    /*
    if (oldEncodeur[1] != encodeur[1]) {   
    trigEffectTo[1] = true;
    textSize(150);
    timeTriggedFromEncodeur[1] = millis(); // NOT USED
    trigEffectBisTo[1] = true;
    fromEncodeurToLive[1] = 1;
    
}
    else trigEffectTo[1] = false;
    
    if (trigEffectBisTo[1] ==  true && beatTrigged ==  true) {
    startMeasureFromEncodeur[1] = measure;
    textSize(400); 
    trigEffectBisTo[1] = false; 
}
    
    if (measure ==  startMeasureFromEncodeur[1] + 2) {   
    textSize(200);
    fromEncodeurToLive[1] = 0;
}
    text(" trigEffectTo[1]" + trigEffectTo[1] + " fromEncodeurToLive[1]"  + fromEncodeurToLive[1] +  " encodeur[1] " + encodeur[1] , -300, 800);
    
    oldEncodeur[1] = encodeur[1];
    
    */
    
    
    
    
} 






void trigEffectToAbletonLiveArray() { 
    
    /*
    
    for (int j = 0; j < networkSize; j++)  {
    
    for (int i = j; i < j + 1; i++) {
    
    if (oldEncodeur[i] != encodeur[i]) {   
    trigEffectTo[i] = true;
    textSize(150);
    timeTriggedFromEncodeur[i] = millis(); // NOT USED
    trigEffectBisTo[i] = true;
    fromEncodeurToLive[i] = 1;
    
}
    else trigEffectTo[i] = false;
    
    if (trigEffectBisTo[i] ==  true && beatTrigged ==  true) {
    startMeasureFromEncodeur[i] = measure;
    textSize(400); 
    trigEffectBisTo[i] = false;  
}
    
    if (measure ==  startMeasureFromEncodeur[i] + 2) {   
    textSize(200);
    fromEncodeurToLive[i] = 0;
}
    
    oldEncodeur[i] = encodeur[i];
    
    
    
}
    text ( j + " fromEncodeurToLive[j] " + fromEncodeurToLive[j] +  " encodeur[j] " + encodeur[j] , -300, 700 + 100 * j);
    
}
    */  
} 
