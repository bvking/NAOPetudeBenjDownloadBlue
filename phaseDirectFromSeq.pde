int recallPositionFromInstrument;
boolean instrumentChangedToAddPulse = false;


void phaseDirectFromSeq() // mixed Com
{  
    // instrumentChangedToAddPulse = false;
    oscillatorBlocked = networkSize - 1;
    
    if (key == '0')
    {
        for (int i = 0; i < networkSize; i++)
        {
            positionFromMotorPhase[i] = 0;
            dataMappedForMotorisedPosition[i] = 0;
            
        }
    } 
    
    if (key == '9')
    {
        for (int i = 0; i < networkSize; i++)
        {
            positionFromMotorPhase[i] = positionFromMotorPhase[i] + (numberOfStep - positionFromMotorPhase[i]);
        }
    } 
    if (key == 'k')
    {
        for (int i = 0; i < networkSize; i++)
        {
            positionFromMotorPhase[i] += numberOfStep / 4;
        }
    }
    
    if (key == 'ç')// reset memories and positions
    { 
        
        for (int i = 0; i < networkSize; i++)
        {
            numberOfRota[i] = numberOfTrig[i] = 0;
        }
        
        for (int k = 0; k < networkSize; k++)
        {   
            for (int j = 0; j < networkSize; j++)  // [patternFromInstrument]
            { 
                recordPositionsFromInstrument[k][j] += (numberOfStep / 4) * k;
                recordPositionsFromInstrument[k][j] %=  numberOfStep;
                positionFromMotorPhase[k] = recordPositionsFromInstrument[k][j];
            }
        }
        
        float[] realign = new float[networkSize];
        if (positionFromMotorPhase[networkSize - 1] > positionFromMotorPhase[0]) 
        {   textSize(200);         
            text(" HIGER POSITIO FRO_SEQ" + higerPostion, 100, 200);
            higerPostion = true; 
            
            
            for (int i = 0; i < networkSize; i++)
            {
                if (networkSize ==  10)
                {
                    
                    realign[i] = (dataMappedForMotorisedPosition[0] + dataMappedForMotorisedPosition[1] + dataMappedForMotorisedPosition[2] + dataMappedForMotorisedPosition[3]+
                        dataMappedForMotorisedPosition[4] + dataMappedForMotorisedPosition[5] + dataMappedForMotorisedPosition[6] + dataMappedForMotorisedPosition[7]+
                        dataMappedForMotorisedPosition[8] + dataMappedForMotorisedPosition[9]) / (networkSize - 1);
                }
                
                if (networkSize ==  6)
                {
                    
                    realign[i] = (dataMappedForMotorisedPosition[0] + dataMappedForMotorisedPosition[1] + dataMappedForMotorisedPosition[2] + dataMappedForMotorisedPosition[3]+
                        dataMappedForMotorisedPosition[4] + dataMappedForMotorisedPosition[5]) / (networkSize - 1);
                }
                
                
                realign[i] %=  numberOfStep;
                
                for (int j = patternFromInstrument; j < patternFromInstrument + 1; j++) 
                { 
                    // recordPositionsFromInstrument[i][j] =(int) realign[i];   
                }
                
                
                //realign[i]= positionFromMotorPhase[i]-(int) realign[9];
                
                //PAS MALM  realign[i] = positionFromMotorPhase[networkSize - 1] % (positionFromMotorPhase[0]) + numberOfStep; //+PI/2;
                //realign[i] = dataMappedForMotorisedPosition[networkSize - 1] % (dataMappedForMotorisedPosition[0]) + numberOfStep; //+PI/2;
                
                positionFromMotorPhase[i] =  positionFromMotorPhase[networkSize - 1] + (int) realign[i];
                //countControlDr[i] += 1;
                
            }
            
            for (int k = 0; k < networkSize; k++)
            {   
                for(int j = 0; j < networkSize; j++)  // [patternFromInstrument]
                { 
                    recordPositionsFromInstrument[k][j] += (numberOfStep / 4) * k;
                    recordPositionsFromInstrument[k][j] %=  numberOfStep;
                    positionFromMotorPhase[k] = recordPositionsFromInstrument[k][j];
            }
            }
            
            
        }
        
        if (positionFromMotorPhase[networkSize - 1] <= positionFromMotorPhase[0] - numberOfStep)
        {
            text(" LOWER  POSITION" + higerPostion, 100, 300);
            higerPostion = false;
            for (int i = 0; i < networkSize; i++) {
                if (networkSize ==  10)
                {
                    realign[i] = (dataMappedForMotorisedPosition[0] + dataMappedForMotorisedPosition[1] + dataMappedForMotorisedPosition[2] + dataMappedForMotorisedPosition[3]+
                        dataMappedForMotorisedPosition[4] + dataMappedForMotorisedPosition[5] + dataMappedForMotorisedPosition[6] + dataMappedForMotorisedPosition[7]+
                        dataMappedForMotorisedPosition[8] + dataMappedForMotorisedPosition[9]) / (networkSize - 1);
                }
                
                if (networkSize ==  6)
                {
                    realign[i] = (dataMappedForMotorisedPosition[0] + dataMappedForMotorisedPosition[1] + dataMappedForMotorisedPosition[2] + dataMappedForMotorisedPosition[3]+
                        dataMappedForMotorisedPosition[4] + dataMappedForMotorisedPosition[5]) / (networkSize - 1);
                }
                
                realign[i] %=  numberOfStep;
                
                positionFromMotorPhase[i] =  positionFromMotorPhase[0] + (int) realign[i];
                countControlDr[i] += 1;
            }
        }
    } 
    
    
    if (key == 'w')
    {
        for (int i = 0; i < networkSize; i++)
        {
            // net.phase[networkSize-1-i] += (i*TWO_PI/3)%PI/10;    //PAS TOUCHER
            
            //net.phase[networkSize-1-i] = net.phase[networkSize-1-i] + (i*TWO_PI/5)%PI/10; 
            
            positionFromMotorPhase[networkSize - 1 - i] += (int)  map((i + 1 / 4 * TWO_PI / 5) % PI / 40, 0, TWO_PI, 0, numberOfStep);
            
            if (formerKeyMetro == '$')
            {
                //    positionFromMotorPhase[networkSize-1-i]%= positionFromMotorPhase[i] + numberOfStep;    // no meaning    
            }
        }
    }
    
    if (key == 'W')
    {
        
        for (int i = 0; i < networkSize; i++)
        {
            // net.phase[networkSize-1-i] += (i*TWO_PI/3)%PI/10;    //PAS TOUCHER
            
            //   net.phase[networkSize-1-i] = net.phase[networkSize-1-i] -  (i*TWO_PI/5)%PI/10; 
            
            positionFromMotorPhase[networkSize - 1 - i] = positionFromMotorPhase[networkSize - 1 - i] - (int)  map((i * 1 / 4 * TWO_PI / 5) % PI / 40, 0, TWO_PI, 0, numberOfStep);
            
            if (formerKeyMetro == '$')
            {
                //   positionFromMotorPhase[networkSize-1-i]%= numberOfStep;        
            }
        }
    }
    
    if (key == 'R')
    {
        
        for (int i = 0; i < networkSize; i++) {
            // net.phase[i] += (i+1) *(TWO_PI/12); // 12 hit   
            // net.phase[networkSize-1-i] += (i*TWO_PI/3)%PI/11;    //PAS TOUCHER
            // net.phase[i] -= (i*TWO_PI/5)%PI/5;
            
            //  net.phase[i] -= (i*TWO_PI/networkSize)%PI/(networkSize*3); // OK en mode circular ? 
            
            positionFromMotorPhase[i] = positionFromMotorPhase[i] - (int)  map((i * TWO_PI / networkSize) % PI / (networkSize * 3), 0, TWO_PI, 0, numberOfStep);   
        }
    }
    
    if (key == 'r')
    {
        for (int i = 0; i < networkSize; i++) {
            positionFromMotorPhase[i] += (int)  map((i * TWO_PI / networkSize) % PI / (networkSize * 3), 0, TWO_PI, 0, numberOfStep);
        }
    }
    
    if (key == 'P')
    {
        for (int i = 0; i < networkSize; i++)
        {
            positionFromMotorPhase[i] += (int)  map((TWO_PI / (networkSize - 0)) * (1 * (networkSize - 1 - i)), 0, TWO_PI, 0, numberOfStep); //  10 hit but problem with counter
        }
    }
    
    
    // END of PHASE OFFSET
    
    if (keyCode == CONTROL)
        {
        enablingParametersChangesToLive = true;
        //enablingParametersChangesToLive =! enablingParametersChangesToLive; 
        secondTouchedTimeStarter = millis(); 
        keyCode = 0;
        
    }
    
    
    if (key == 'a')
        {
        for (int i = 0; i < networkSize; i++) { // 6 HIT  si number of rot=1 -->  42 HIT si umber of rot=7 car 6*7 .  // 8 hit <=networkSize+2. Donc 8 hoit avec numberOfRot 8 = 64 hit
            positionFromMotorPhase[i] =  positionFromMotorPhase[i] + numberOfStep / numberOfRota[0];
            positionFromMotorPhase[i] %=   numberOfStep;
        }
    }
    
    
    
    if (frameCount <=  frameTrigger + 1) // formerPatternFromInstrument != patternFromInstrument && 
        {  
        background(127);
        // frameTrigger=frameCount;     
        //  instrumentChangedToAddPulse = true;       
        // key = 'ç';
        key = 'à';
        //  phaseDirectFromSeq();
        phaseDirectToMotor();
        textSize(200);
        // noLoop();
        //key = 'e';
    }
    
    else
        {
        // formerPatternFromInstrument = patternFromInstrument;
        
    }  
    
    
    
    if (music_from_ableton_live == " controlDr ")
        { 
      //  if (enablingParametersChangesToLive == true &&  key == 'e' && music_from_ableton_live == " controlDr " && instrumentChangedToAddPulse == false) // SELECT PATTEREN DEPEDING INSTRUMENT // key == 'e' && key != '6'
       if  (key == 'e' && music_from_ableton_live == " controlDr " ) // SELECT PATTEREN DEPEDING INSTRUMENT // key == 'e' && key != '6'
        {
            for (int i = 0; i < networkSize; i++)
                {   
                ratioNumberOfStepCorraletedFromInstrument[0] = 2;
                ratioNumberOfStepCorraletedFromInstrument[1] = 2;
                ratioNumberOfStepCorraletedFromInstrument[2] = 2;
                ratioNumberOfStepCorraletedFromInstrument[3] = 2;
                ratioNumberOfStepCorraletedFromInstrument[4] = 2;
                ratioNumberOfStepCorraletedFromInstrument[5] = 2;
                
                
                //  positionFromMotorPhase[i] += recordPositionFromMotorPhaseFromLastInstrument[i][patternFromInstrument];
                // 6HIT  si number of rot=1 -->  42 HIT si umber of rot=7 car 6*7 .
                // 8 hit <=networkSize+ 2. Donc 8 hoit avec numberOfRot 8 = 64 hit
                
                positionFromMotorPhase[i] = (int)  map((networkSize + 0 - 1 - oscillatorBlocked + i) * TWO_PI / 1 / (networkSize + 2), 0, TWO_PI, 0, numberOfStep / ratioNumberOfStepCorraletedFromInstrument[patternFromInstrument]);  
                positionFromMotorPhase[i] %=   numberOfStep;
                
                
                recordPositionsFromInstrument[i][patternFromInstrument] += positionFromMotorPhase[i];
                
                
                positionFromMotorPhase[i] =  recordPositionsFromInstrument[i][patternFromInstrument];
                
                if (numberOfTrig[patternFromInstrument] ==  0)
                { 
                    positionFromMotorPhase[i] = 0;
                }
                
                for (int j = patternFromInstrument; j < patternFromInstrument + 1; j++) 
                    { 
                    recordPositionsFromInstrument[i][j] = positionFromMotorPhase[i]; 
                    text(" recPaTphaseDirect " + patternFromInstrument + " " + recordPositionsFromInstrument[i][j] + " enaSound " + (networkSize - 1 - instrumentTouched) + " " + enablingChangeSoundB[networkSize - 1 - instrumentTouched], 700 * 0, j * 30);           
                    // println(" recPaTphaseDirect " + patternFromInstrument + " " + recordPositionsFromInstrument[i][j]);  
                    
                }
            }
            key = '#';    
        }
        
        
        
        
        // DISPLAY PATTERN SAVED with controlDr
        if (keyCode == CONTROL)
            {
            for (int k = 0; k < networkSize; k++)
                {   
                for (int j = 0; j < j + 1; j++) 
                    { 
                    // println(" SAVINGPATTERNN " + patternFromInstrument + " " + recordPositionsFromInstrument[k][patternFromInstrument]);  
                } 
            }
        }
        
        
        if (enablingRecallFromAndToInstru == true || key == '1' ||  key == '2' ||  key == '3' || key == '4' ||  key == '5' ||  key == '6')
            {
            textSize(200);
            
            if (key == '1' || recallLastPatternInstrument ==  0) //as patterFromInstrumentRecorded = 0;
                {
                
                patterFromInstrumentRecorded = 0;
                for (int i = 0; i < networkSize; i++)
                    {
                    positionFromMotorPhase[i] = recordPositionsFromInstrument[i][patterFromInstrumentRecorded]; //                  
                    text(" recall 0 " + patternFromInstrument + " " + recordPositionsFromInstrument[i][patterFromInstrumentRecorded], 200, patterFromInstrumentRecorded * 100);
                     println(" recall 0 " + patterFromInstrumentRecorded + " " + patternFromInstrument + " " + recordPositionsFromInstrument[i][patterFromInstrumentRecorded]);  
                    noLoop();                 
                }       
            }
            
            
            if (key == '2' || recallLastPatternInstrument ==  1) // as patterFromInstrumentRecorded = 1;
                {
                
                patterFromInstrumentRecorded = 1;
                for (int i = 0; i < networkSize; i++)
                    {
                    positionFromMotorPhase[i] = recordPositionsFromInstrument[i][patterFromInstrumentRecorded]; // positionFromMotorPhase[i] + 
                    println(" recall 1 " + patterFromInstrumentRecorded + " " + patternFromInstrument + " " + recordPositionsFromInstrument[i][patterFromInstrumentRecorded]);  
                    noLoop();
                } 
            }
            
            if (key == '3' || recallLastPatternInstrument ==  2)
                {
                
                patterFromInstrumentRecorded = 2;
                for (int i = 0; i < networkSize; i++)
                    {
                    positionFromMotorPhase[i] =   recordPositionsFromInstrument[i][patterFromInstrumentRecorded];// positionFromMotorPhase[i] +
                    println(" recall 2 " + patterFromInstrumentRecorded + " " + patternFromInstrument + " " + recordPositionsFromInstrument[i][patterFromInstrumentRecorded]);  
                    noLoop();  
                } 
            }
            
            if (key == '4' || recallLastPatternInstrument ==  3)
                {
                // key ='ç';
                // phaseDirectFromSeq();
                patterFromInstrumentRecorded = 3;
                for (int i = 0; i < networkSize; i++)
                    {
                    positionFromMotorPhase[i] = recordPositionsFromInstrument[i][patterFromInstrumentRecorded];// positionFromMotorPhase[i] +
                     println(" recall 3 " + patterFromInstrumentRecorded + " " + patternFromInstrument + " " + recordPositionsFromInstrument[i][patterFromInstrumentRecorded]);  
                    noLoop();  
                } 
            }
            
            
            if (key == '5' || recallLastPatternInstrument ==  4)
                {
                // key ='ç';
                // phaseDirectFromSeq();
                patterFromInstrumentRecorded = 4;
                for (int i = 0; i < networkSize; i++)
                    {
                    positionFromMotorPhase[i] =  recordPositionsFromInstrument[i][patterFromInstrumentRecorded];//positionFromMotorPhase[i] +
                       println(" recall 4 " + patterFromInstrumentRecorded + " " + patternFromInstrument + " " + recordPositionsFromInstrument[i][patterFromInstrumentRecorded]);  
                    noLoop(); 
                } 
            }
            
            if (key == '6' || recallLastPatternInstrument ==  5)
                {
                //key = 'ç';
                //phaseDirectFromSeq();
                patterFromInstrumentRecorded = 5;
                for (int i = 0; i < networkSize; i++)
                    {
                    positionFromMotorPhase[i] =  recordPositionsFromInstrument[i][patterFromInstrumentRecorded];// positionFromMotorPhase[i] + 
                    text(" recall 5 " + patternFromInstrument + " " + recordPositionsFromInstrument[i][patterFromInstrumentRecorded], 200, patterFromInstrumentRecorded * 100);  
                    println(" recall 4 " + patterFromInstrumentRecorded + " " + patternFromInstrument + " " + recordPositionsFromInstrument[i][patterFromInstrumentRecorded]);  
                    noLoop(); 
                }
                // noLoop(); 
            }
            enablingRecallFromAndToInstru = false;
            recallLastPatternInstrument = 1000;
            key = '#';
        } 
    }
    
    
    /*
    for (int k = 0; k < networkSize; k++)
    {         
    for (int j = 0; j < j + 1; j++) 
    {         
    println(" RECORDPATTERNFOMINSTUMENT " + patterFromInstrumentRecorded + " " + recordPositionsFromInstrument[k][patterFromInstrumentRecorded]);       
}
}
    */
    
    
    if (key == 'E' && music_from_ableton_live == " controlDr ")
        {
        for (int i = 0; i < networkSize; i++)
            { //6 HIT
            positionFromMotorPhase[i] =  positionFromMotorPhase[i] - (int)  map((networkSize + 0 - 1 - oscillatorBlocked - i) * TWO_PI / 1 / (networkSize + 2), 0, TWO_PI, 0, numberOfStep / numberOfRota[0]); 
            positionFromMotorPhase[i] %=   numberOfStep;  
        }
    }
    
    
    
    if (key == 'S') //     net.phase[i] -= (networkSize-1- oscillatorBlocked-i)*TWO_PI/networkSize*0.1;
        {
        for (int i = 0; i < networkSize; i++)
            {
            //positionFromMotorPhase[i] -= (int)  map((networkSize - 1 - oscillatorBlocked - i) * TWO_PI / networkSize * 1 / 16, 0, TWO_PI, 0, numberOfStep);  
            positionFromMotorPhase[i] -= (int)  map(TWO_PI * 0.4 / 4 / ( -networkSize - 0) * i, 0, TWO_PI, 0, numberOfStep); 
        }
    }
    
    if (key == 'D') 
        {
        // frontTWO_PI/8/(networkSize)*(i)   behind?
        // +=   TWO_PI*0.1/(networkSize)*(networkSize-1-i)
        for (int i = 0; i < networkSize; i++)
        {
            //positionFromMotorPhase[i] += (int)  map(TWO_PI * 0.1 / (networkSize) * (networkSize - 1 - i), 0, TWO_PI, 0, numberOfStep);
            positionFromMotorPhase[i] += (int)  map(TWO_PI * 0.4 / 4 / (networkSize) * (networkSize - 1 - i), 0, TWO_PI, 0, numberOfStep);
        }
    }
    
    
    
    
    if (key == 's') // as former f as 'S'
        
        {
        for (int i = 0; i < networkSize; i++)
        {
            positionFromMotorPhase[i] -= (int)  map(TWO_PI * 0.4 / 16 / ( -networkSize - 0) * i, 0, TWO_PI, 0, numberOfStep);
        }
    }
    
    
    if (key == 'd')
        {
        for (int i = 0; i < networkSize; i++)
            {
            positionFromMotorPhase[i] += (int)  map(TWO_PI * 0.4 / 16 / (networkSize) * (networkSize - 1 - i), 0, TWO_PI, 0, numberOfStep);
        }
    }
    
    /*  with oscillator blocked
    
    if (key == 's')
    {
    for (int i = 0; i < networkSize; i++)
    {
    positionFromMotorPhase[i] -= (int)  map((networkSize - 1 - oscillatorBlocked - i) * TWO_PI / 12 / networkSize, 0, TWO_PI, 0, numberOfStep);   
}
}
    
    
    if (key == 'd')
    {
    for (int i = 0; i < networkSize; i++)
    {
    positionFromMotorPhase[i] += (int)  map(TWO_PI / 12 / (networkSize) * (networkSize - 1 - i), 0, TWO_PI, 0, numberOfStep);
    // positionFromMotorPhase[i] += (int)  map(TWO_PI / 12 / (networkSize) * (networkSize - 1 + oscillatorBlocked - i), 0, TWO_PI, 0, numberOfStep); // not so good
    //  positionFromMotorPhase[i] += (int)  map(TWO_PI / 12 / (networkSize) * (networkSize - 1 + - i - oscillatorBlocked), 0, TWO_PI, 0, numberOfStep);
    
    
}
}
    */
    
    
    
    if (key == 'i')
        {  // memory == 0 is the ball "behind"  the screen
        
        oldMemoryi = memoryi;
        memoryi = (memoryi - 1);
        
        if (memoryi == -1)
            {
            memoryi = networkSize - 1;
            oldMemoryi = 0;
        }
        
        for (int i = 0; i < (networkSize - 0); i++)
            {  
            lastOldActualPosition[i] = positionFromMotorPhase[i];
        }
        
        for (int i = 1; i < (networkSize - 0); i++) 
            {  
            positionFromMotorPhase[i - 1] = lastOldActualPosition[i];
        }
        
        positionFromMotorPhase[networkSize - 1] =  lastOldActualPosition[0];
    }
    
    if (key == 'u')
        {  // memory == 0 isthe ball "behind"  the screen   
        oldMemoryi = memoryi;
        memoryi = (memoryi + 1);
        memoryi %=  networkSize;
        
        for (int i = 0; i < (networkSize - 0); i++)
            {  
            lastOldActualPosition[i] = positionFromMotorPhase[i] + 0 * numberOfStep / 1;//+numberOfStep/6;
        }
        
        for (int i = 1; i < (networkSize - 0); i++)
            {
            positionFromMotorPhase[i] = lastOldActualPosition[i - 1];       
        }
        positionFromMotorPhase[0] = lastOldActualPosition[networkSize - 1];
        
    } 
    
    if (key == 'U')
        {  // memory == 0 is the ball "behind"  the screen    
        oldMemoryi = memoryi;
        memoryi = (memoryi + 1);
        memoryi %=  networkSize;
        
        
        for (int i = 0; i < (networkSize - 0); i++)
            {
            println(" lastP " + lastPositionFromMotorPhase[i] + " P " + positionFromMotorPhase[i]);
            if (lastPositionFromMotorPhase[i] < positionFromMotorPhase[i])
                {
                positionFromMotorPhase[i] = positionFromMotorPhase[i] + numberOfStep;
                
            }
            
        }
        for (int i = 0; i < (networkSize - 0); i++)
            {  
            // lastOldActualPosition[i] = positionFromMotorPhase[i]+numberOfStep/1;//+numberOfStep/6;   
            lastOldActualPosition[i] = positionFromMotorPhase[i] + numberOfStep / 1;//+numberOfStep/6;
        }
        
        for (int i = 1; i < (networkSize - 0); i++)
            {
            positionFromMotorPhase[i] = lastOldActualPosition[i - 1];       
        }
        
        positionFromMotorPhase[0] = lastOldActualPosition[networkSize - 1];
        
        for (int i = 0; i < (networkSize - 0); i++)
            {
            lastPositionFromMotorPhase[i] = positionFromMotorPhase[i];        
        } 
    } 
    //çs   key = '#'; 
    key = '#';    
    
    //  text(" formerKey " + formerKey , 100, -200);
    
}