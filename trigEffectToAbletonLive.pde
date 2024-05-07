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
boolean enablingRecordFromAndToInstru;
boolean enablingRecallFromAndToInstru;
String modeOfControlDr = " virtual ";

int formerPatternFromInstrument;
int formerPatternFromInstrumentWithNegativeSpeed;

int  instrumentTouchedWithNegativeSpeed;
int[] timeDisablingChangesParameterWithNegativeSpeed = new int[networkSize];
int[]  timeEnablingChangesParameterWithNegativeSpeed = new int[networkSize];
boolean instrumentChangedToAddPulseWithNegativeSpeed;
boolean enablingParametersChangesToLiveWithNegativeSpeed;
boolean[]  enablingChangeToSpecificInstrumentWithNegativeSpeed = new boolean[networkSize];
int thresholdToDiscriminateNegativeSpeed;

int[]  oldOldVelocityBis = new int[networkSize];
boolean[]  enablingChangeToSpecificInstrument = new boolean[networkSize];

// void sendPositionToLiveFromTouchedEncodeurNetworkSizeOnly(int virtualEncodeur0, int virtualEncodeur1, int virtualEncodeur2, int virtualEncodeur3, int virtualEncodeur4, int virtualEncodeur5 ) 

void sendPositionToLiveFromTouchedEncodeurNetworkSizeOnly()
{  
    textSize(75);
    
    for (int i = 0; i < networkSize; i++)
    { 
        if (modeOfControlDr == " virtual ")
        { 
         // encodeur[i] = (int) map(slider[i], 0., 127., 0, 4000);
        } 
        
        encoderTouched[i] =  false;
        oldEncodeurPosition[i] = encodeurPosition[i] * 1;
        
        encodeurPosition[i] = encodeur[i];
        encodeur[i] %=  4000;
        
        encodeurMappedAsMotor[i] = abs((int) map(encodeur[i], 0, 4000, 0, numberOfStep)); 

        oldOldVelocityBis[i] = (int) oldVelocityBis[i]; // to use to disciminate variation of speed
        oldVelocityBis[i] = velocityBis[i];// usefull may be to compute acceleration
        
        //*********** COMPUTE SPEED of encoder
        
        gapEncoder_OldEncodeur[i] = encodeurPosition[i] - oldEncodeurPosition[i];
        
        if (gapEncoder_OldEncodeur[i] < ( -4000 + 400))
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
            // "VIRT " + slider[i] +   " GapM " +  gapEncoder_Motor[i] +  " acc " + accelerationBis[i] +
        text    (" GAP " + velocityBis[i] + " OLD " + oldVelocityBis[i] + " olDD " + oldOldVelocityBis[i] + " " + (networkSize-1-i) + " Ro " + numberOfRota[networkSize-1-i] + " M " + instrumentToMute[networkSize-1-i] + 
                 " old " + oldEncodeurPosition[networkSize-1-i] + " " + encodeurPosition[networkSize-1-i] + " " + numberOfTrig[networkSize-1-i] + " " + enablingParametersChangesToLive + " SAVING " + patternFromInstrument + " " + recordPositionsFromInstrument[patternFromInstrument][networkSize-1-i] + " "  +
                 " recall " + patterFromInstrumentRecorded  + " " + recordPositionsFromInstrument[networkSize-1-i][patterFromInstrumentRecorded] +
                 " lfo2 " + shapeLfoMode , -1000, + 1200 -75*(networkSize-1-i));
        } 
        rotate(PI / 2);
        
      // DISCRIMINATE BIS INSTRUMENT TOUCHED with POSITIVE SPEED

    for (int i = 0; i < networkSize; i++)
    { 
        if (velocityBis[i] >  100 && velocityBis[i] <  200 && velocityBis[i]> oldVelocityBis [i] && oldVelocityBis [i]> oldOldVelocityBis [i])  // to ENABLEchange phasePattern
        {
            formerPatternFromInstrument = patternFromInstrument;
            instrumentTouched = i;
            patternFromInstrument = networkSize - 1 - instrumentTouched;  //
            
            timeEnablingChangesParameter[patternFromInstrument] = millis();

        //   enablingChangeToSpecificInstrument[patternFromInstrument] = true;
        //    enablingParametersChangesToLive = true;          
        }

        if (velocityBis[i] >  100 && velocityBis[i] <  200 && velocityBis[i]< oldVelocityBis [i] && oldVelocityBis [i]< oldOldVelocityBis [i])  // to DISABLEchange phasePattern
        {
            formerPatternFromInstrument = patternFromInstrument;
            instrumentTouched = i;
            patternFromInstrument = networkSize - 1 - instrumentTouched;  //
            
            timeDisablingChangesParameter[patternFromInstrument] = millis(); 

         //   enablingChangeToSpecificInstrument[patternFromInstrument] = false;
         //   enablingParametersChangesToLive = false;          
        }  
    }

    // // TIME to TRIG NEGATIVE SPEED DISCRIMINATION to enablingChangeToSpecificInstrument with

    if (timeEnablingChangesParameter[patternFromInstrument] + 34 <= millis())
    { 
        enablingChangeToSpecificInstrument[patternFromInstrument] = true;
        enablingParametersChangesToLive = true;
    }
    
    if (timeEnablingChangesParameter[patternFromInstrument]+ 69<= millis() && timeEnablingChangesParameter[patternFromInstrument]+35> millis() ) // timeEnablingChangesParameter[patternFromInstrument] +70 <= millis() && 
        {
        enablingChangeToSpecificInstrument[patternFromInstrument] = false;
        enablingParametersChangesToLive = false;
    }
       
    if ( timeDisablingChangesParameter[patternFromInstrument]+ 34> millis()) // timeEnablingChangesParameter[patternFromInstrument] +70 <= millis() && 
        {
        enablingChangeToSpecificInstrument[patternFromInstrument] = false;
        enablingParametersChangesToLive = false;
    }
    
    if (timeEnablingChangesParameter[patternFromInstrument] > timeDisablingChangesParameter[patternFromInstrument]+33)
        {
        enablingChangeToSpecificInstrument[patternFromInstrument] = false;
        enablingParametersChangesToLive = false;
    }
    //-------------------------------------------------------------------------------------------
  
    if (formerPatternFromInstrument != patternFromInstrument)
        {
        instrumentChangedToAddPulse = true;
        // instrumentToMute[patternFromInstrument] = false;      
    } 
    else  if (formerPatternFromInstrument == patternFromInstrument)
        {
            instrumentChangedToAddPulse = false;                 
            // enablingChangeSound[patternFromInstrument] = true;
        }
    
    //--------------------------:-------------------------------------------------------------------



    // DISCRIMINATE INSTRUMENT TOUCHED with NEGATIVE SPEED
    thresholdToDiscriminateNegativeSpeed = 0;
    /*
    print ( "velocityBis ");
    showArrayF( velocityBis);
    print ( " c ");
    showArray ( countControlDr );
    print ( "oldOldPositionToMotors ");
    showArray( oldOldPositionToMotor);
    print ( " oldPositionToMotor ");
    showArray( oldPositionToMotor);
    print ( "  positionToMotor ");
    showArray(  positionToMotor);
    */

    for (int i = 0; i < networkSize; i++)
    { 
       //  println ("                     GAPGAPGAP " +  velocityBis[i] + " old "+  oldVelocityBis[i]  +  " old "+  oldOldVelocityBis[i] +
       //             "oldDpMotor " + oldOldPositionToMotor[i] + " " + oldPositionToMotor[i] + " " + positionToMotor[i]  );
        
        // newSolution

           if (velocityBis[i] <  -100 && velocityBis[i] >  -400)  // to ENABLEchange phasePattern 250
        {
            formerPatternFromInstrumentWithNegativeSpeed = patternFromInstrumentWithNegativeSpeed;
            instrumentTouchedWithNegativeSpeed = i;
            patternFromInstrumentWithNegativeSpeed = networkSize - 1 - instrumentTouchedWithNegativeSpeed;  //
            
            timeEnablingChangesParameterWithNegativeSpeed[patternFromInstrumentWithNegativeSpeed] = millis();          
        }
        
        if (velocityBis[i] < -15 && oldVelocityBis[i] >-15)  // to DISABLEchange phasePattern
        {
            formerPatternFromInstrumentWithNegativeSpeed = patternFromInstrumentWithNegativeSpeed;
            instrumentTouchedWithNegativeSpeed = i;
            patternFromInstrumentWithNegativeSpeed = networkSize - 1 - instrumentTouchedWithNegativeSpeed;  //
            
            timeDisablingChangesParameterWithNegativeSpeed[patternFromInstrumentWithNegativeSpeed] = millis();          
        }  
        
    
    
        
        
        // // TIME to TRIG NEGATIVE SPEED DISCRIMINATION to enablingChangeToSpecificInstrument with
        if (timeEnablingChangesParameterWithNegativeSpeed[patternFromInstrumentWithNegativeSpeed] + 34 <= millis())
        {     
            enablingChangeToSpecificInstrumentWithNegativeSpeed[patternFromInstrumentWithNegativeSpeed] = true;
            enablingParametersChangesToLiveWithNegativeSpeed = true;

        }
        
        if (timeEnablingChangesParameterWithNegativeSpeed[patternFromInstrument] + 40 <= millis() && timeEnablingChangesParameterWithNegativeSpeed[patternFromInstrumentWithNegativeSpeed]> 35)
        {
           enablingChangeToSpecificInstrumentWithNegativeSpeed[patternFromInstrumentWithNegativeSpeed] = false;
           enablingParametersChangesToLiveWithNegativeSpeed = false;
        }
        
        if (timeEnablingChangesParameterWithNegativeSpeed[patternFromInstrumentWithNegativeSpeed] > timeDisablingChangesParameter[patternFromInstrumentWithNegativeSpeed])
        {
         //  enablingChangeToSpecificInstrumentWithNegativeSpeed[patternFromInstrumentWithNegativeSpeed] = false;
         //  enablingParametersChangesToLiveWithNegativeSpeed = false;
        }
    }
    
    if (formerPatternFromInstrumentWithNegativeSpeed != patternFromInstrumentWithNegativeSpeed)
    {
        instrumentChangedToAddPulseWithNegativeSpeed = true;
        // instrumentToMute[patternFromInstrument] = false;      
    } 
    else  if (formerPatternFromInstrument == patternFromInstrument)
        {
            instrumentChangedToAddPulseWithNegativeSpeed = false;                 
            // enablingChangeSound[patternFromInstrument] = true;
        }
 
    //********
    
    print(" " + patternFromInstrument +  " slider ");
    showArrayF(slider);
    print(" velocityBis ");
    showArrayF(velocityBis); 
    
    //********
    
    if (enablingChangeToSpecificInstrument[patternFromInstrument] ==  true) // && enablingParametersChangesToLive == true 
        { 
        enablingChangeSound[patternFromInstrument] = true;
        print(" enablingChangeSound ");
        showArrayB(enablingChangeSound);
        
    } 
    
    
    //ALIGN AND RECALL
    if (enablingChangeSound[patternFromInstrument] == true && instrumentChangedToAddPulse == true)//&& enablingParametersChangesToLive == true //&&  enablingParametersChangesToLive == false       
        {  
   
        key = 'à';
        phaseDirectToMotor();
        for (int i = 0; i < networkSize; i++)
            {  
            
            for (int j = patternFromInstrument; j < patternFromInstrument + 1; j++) 
                { 
                //   recordPositionsFromInstrument[i][j] = positionFromMotorPhase[i]; 
                //  recordPositionsFromInstrument[i][j] = 0;             
                //  recordPositionsFromInstrument[i][j] = (int) realign[i];                 
                positionFromMotorPhase[i] =  recordPositionAligned[i][patternFromInstrument];
            
                text(" recPaTAbletonLive " + patternFromInstrument + " " + recordPositionsFromInstrument[i][j] + " enaSound " + (networkSize - 1 - instrumentTouched) + " " + enablingChangeSoundB[networkSize - 1 - instrumentTouched], 700 * 0, j * 30);           
             //   println(" recPaTAbletonLive " + patternFromInstrument + " " + recordPositionsFromInstrument[i][j]); 
            }
        }      
        recallLastPatternInstrument = patternFromInstrument;
        enablingRecallFromAndToInstru = true;
        phaseDirectFromSeq();
        for (int i = 0; i < networkSize; i++)
            {  
            for (int j = patternFromInstrument; j < patternFromInstrument + 1; j++) 
                { 
                //  recordPositionsFromInstrument[i][j] =  recordPositionsFromInstrument[i][patterFromInstrumentRecorded]; 
                //  recordPositionsFromInstrument[i][j] = 0;              
                //  recordPositionsFromInstrument[i][j] = (int) realign[i]; 
                
                text(" recPaTphaseDirect " + patternFromInstrument + " " + recordPositionsFromInstrument[i][j] + " enaSound " + (networkSize - 1 - instrumentTouched) + " " + enablingChangeSoundB[networkSize - 1 - instrumentTouched], 700 * 0, j * 30);           
             //   println(" recPaTAbletonLiveBis " + patternFromInstrument + " " + recordPositionsFromInstrument[i][j]);  
            }
        }
        
        enablingRecallFromAndToInstru = false;      
        // enablingChangeSound[patternFromInstrument] = false;
        // recallLastPatternInstrument = 1000;
        //  print(" enablingChangeSound");
        showArrayB(enablingChangeSound);
        enablingChangeSound[patternFromInstrument] = false;
        
    }
   
    // ADD PULSE WITH POSITIVE DISCIMINATION
    if (enablingParametersChangesToLive == true && instrumentChangedToAddPulse == false)  
        {
        background(50);
        key = 'e';
        phaseDirectFromSeq();
        //keyCode = '0'; 
        textSize(150);           
        numberOfTrig[patternFromInstrument] += 1;
        numberOfTrig[networkSize - 1 - instrumentTouched] %= 10;
        
        if (numberOfTrig[patternFromInstrument] == 9)
            { 
            numberOfTrig[patternFromInstrument] = 0;  // all go from 8 to 16
        }
        //  0--> Kick
            numberOfTrig[0] = (int) map (numberOfTrig[0], 0, 8, 0, 8);  // all go from 8 to 16
        //   5--> HitHat


        text("               changeS " + instrumentTouched + " " + numberOfTrig[patternFromInstrument] + " ", 0, 1 * patternFromInstrument * 50); 
        
        enablingParametersChangesToLive = false;
        enablingRecordFromAndToInstru = true;
        
        enablingChangeSound[patternFromInstrument] = false; 
        enablingChangeSoundB[patternFromInstrument] = true;       
    }
    
    // ADD PULSE WITH NEGATIVE DISCIMINATION
    
    if (enablingParametersChangesToLiveWithNegativeSpeed == true && instrumentChangedToAddPulseWithNegativeSpeed == false)//&& enablingParametersChangesToLive == true //&&  enablingParametersChangesToLive == false
        {
        //keyCode = '0'; 
        textSize(150);           
        numberOfRota[patternFromInstrumentWithNegativeSpeed] += 1;
        numberOfRota[networkSize - 1 - instrumentTouched] %= 10;
        
        if (numberOfRota[patternFromInstrumentWithNegativeSpeed] == 9)
        { 
            numberOfRota[patternFromInstrumentWithNegativeSpeed] = 0;
        }
        
        if (numberOfRota[patternFromInstrumentWithNegativeSpeed] % 2 == 0)
        { 
            instrumentToMute[patternFromInstrumentWithNegativeSpeed] = false;
        }
        
        if (numberOfRota[patternFromInstrumentWithNegativeSpeed] % 2 == 1)
        { 
            instrumentToMute[patternFromInstrumentWithNegativeSpeed] = true;
        }
             
        // text("               changeMUTE " + instrumentTouched + " " + numberOfTrig[patternFromInstrument] + " ", 0, 1 * patternFromInstrument * 50); 
        
        enablingParametersChangesToLiveWithNegativeSpeed = false;
        // enablingRecordFromAndToInstru = true;
        
        // enablingChangeSound[patternFromInstrument] = false; 
        //enablingChangeSoundB[patternFromInstrument] = true;       
    }
      
    //USELESS ? 
    if (enablingRecordFromAndToInstru == true)  // SAVING new position to recordPositionsFromInstrument[k][patternFromInstrument]
        {  
        textSize(30);  
        // recordPositionsFromInstrument[k][patternFromInstrument] &= positionFromMotorPhase[k];  
        for (int k = 0; k < networkSize; k++)
            {  
            for (int j = patternFromInstrument; j < patternFromInstrument + 1; j++) 
                { 
                //recordPositionsFromInstrument[k][j] = positionFromMotorPhase[k]; 
                text(" recPaT " + patternFromInstrument + " " + recordPositionsFromInstrument[k][j] + " enaSound " + (networkSize - 1 - instrumentTouched) + " " + enablingChangeSoundB[networkSize - 1 - instrumentTouched], 700 * 0, k * 30);           
                
            }
        }
        enablingRecordFromAndToInstru = false;
        enablingChangeSoundB[patternFromInstrument] = false;
        timeEnablingChangesParameter[patternFromInstrument] = millis();
    }
    
    
    if (timeEnablingChangesParameter[patternFromInstrument] + 20 <= millis())
        { 
        
        // enablingParametersChangesToLive = false;
        //  enablingChangeSound[patternFromInstrument]=false;
    }
    
    if (secondTouchedTimeStarter + 1000 <=  millis() &&  enablingParametersChangesToLive == true)
        { 
        text("               changeS " + instrumentTouched + " " + numberOfTrig[networkSize - 1 - instrumentTouched] + " ", 0, 1 * networkSize - 1 - instrumentTouched * 50); 
        // enablingParametersChangesToLive = false;
        // key = '#';  
        //  enablingChangeSoundB[networkSize-1-instrumentTouched] =!enablingChangeSoundB[networkSize-1-instrumentTouched] ; // = false;              
    }
    
    if (enablingChangeSound[networkSize - 1 - instrumentTouched] = false)  
        { 
        //key = '#' ;
    }
    
} 

/*
if (midPos[i] ==  true)
{ 
//  text ("MIDDLE POSITION GOOD MATCH in " + i + " " + midPos[i] + " " + midPos[i]+ " ", -500, 1 * i * 200);   
}
//   key = '#';
*/




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
