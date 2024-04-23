int recallPositionFromInstrument;
int formerPatternFromInstrument;
boolean instrumentChanged = false;


void phaseDirectFromSeq() // mixed Com
{  
   // instrumentChanged = false;
    oscillatorBlocked = networkSize - 1;
    
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
    
    if (key == 'ç')
    {
        float[] realign = new float[networkSize];
        if (positionFromMotorPhase[networkSize - 1] > positionFromMotorPhase[0]) 
        {            
            text(" HIGER POSITIO " + higerPostion, 100, 200);
            higerPostion = true;
            
            
            for (int i = 0; i < networkSize; i++)
            {
                realign[i] = positionFromMotorPhase[networkSize - 1] % (positionFromMotorPhase[networkSize - 1] + (numberOfStep)); //+PI/2;
                positionFromMotorPhase[i] = (int) realign[i];
                //positionFromMotorPhase [i] = positionFromMotorPhase [0];
            } 
            
            /*
            if (networkSize ==10)
            { 
            for (int i = 0; i < 1; i++) 
            {      
            lastActualPosition[i]=(dataMappedForMotorisedPosition[0]+dataMappedForMotorisedPosition[1]+dataMappedForMotorisedPosition[2]+dataMappedForMotorisedPosition[3]+
            dataMappedForMotorisedPosition[4]+dataMappedForMotorisedPosition[5]+dataMappedForMotorisedPosition[6]+dataMappedForMotorisedPosition[7]+
            dataMappedForMotorisedPosition[8]+dataMappedForMotorisedPosition[9])/(networkSize-1);
            text ( lastActualPosition[i], 100, 100*i); 
        }
        }
            
            for (int i = 0; i < networkSize; i++) {
            CircularVirtualPosition[i]=0;
            ActualVirtualPosition[i]=lastActualPosition[0];
            lastActualPosition[i]+= lastActualPosition[0];
        } 
            */ 
        }
        
        if (positionFromMotorPhase[networkSize - 1] <= positionFromMotorPhase[0] - numberOfStep)
        {
            text(" LOWER  POSITION" + higerPostion, 100, 300);
            higerPostion = false;
            for (int i = 0; i < networkSize; i++) {
                realign[i] = positionFromMotorPhase[0] % (positionFromMotorPhase[0] + (numberOfStep)); //+PI/2;
                //realign[i] = positionFromMotorPhase [networkSize-1]%(positionFromMotorPhase [networkSize-1]+(numberOfStep)); //+PI/2;
                
                positionFromMotorPhase[i] = (int) realign[i];
                
                // positionFromMotorPhase [i] = positionFromMotorPhase [0];
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
    
    
    
    if (frameCount<=frameTrigger+2) // formerPatternFromInstrument != patternFromInstrument && 
        {  
        background(127);
        // frameTrigger=frameCount;     
        //  instrumentChanged = true;       
        key = 'ç';
        //  phaseDirectFromSeq();
        phaseDirectToMotor();
        textSize(200);
       // noLoop();
      //   key = 'e';
    }
    
    else
        {
              // formerPatternFromInstrument = patternFromInstrument;
        
    }  
  
    
    
    
    if (instrumentChanged == false &&  key == 'e' && music_from_ableton_live == " controlDr ") // SELECT PATTEREN DEPEDING INSTRUMENT // key == 'e' && key != '6'
    {
        for (int i = 0; i < networkSize; i++)
        {   
            ratioNumberOfStepCorraletedFromInstrument[0] = 1;
            ratioNumberOfStepCorraletedFromInstrument[1] = 2;
            ratioNumberOfStepCorraletedFromInstrument[2] = 3;
            ratioNumberOfStepCorraletedFromInstrument[3] = 8;
            ratioNumberOfStepCorraletedFromInstrument[4] = 12;
            ratioNumberOfStepCorraletedFromInstrument[5] = 16;
            
            // 6 HIT  si number of rot=1 -->  42 HIT si umber of rot=7 car 6*7 .                                                            // 8 hit <=networkSize+ 2. Donc 8 hoit avec numberOfRot 8 = 64 hit
            positionFromMotorPhaseRecorded[i] =  positionFromMotorPhase[i]+ (int)  map((networkSize + 0 - 1 - oscillatorBlocked + i) * TWO_PI / 1 / (networkSize + 2), 0, TWO_PI, 0, numberOfStep / ratioNumberOfStepCorraletedFromInstrument[patternFromInstrument]);  
            positionFromMotorPhaseRecorded[i] = positionFromMotorPhaseRecorded[i] + recordPositionFromMotorPhaseFromLastInstrument[i][patternFromInstrument];
            positionFromMotorPhaseRecorded[i] %=   numberOfStep;     
            
            recordPositionFromMotorPhaseFromLastInstrument[i][patternFromInstrument] = positionFromMotorPhaseRecorded[i];  
            //  recordPositionFromMotorPhaseFromLastInstrument[i][patternFromInstrument]%=  numberOfStep; 
            positionFromMotorPhase[i] = recordPositionFromMotorPhaseFromLastInstrument[i][patternFromInstrument];
        }
         key = '#';    
    }
    
    
    if (instrumentChanged == false  ) // SAVING new position to recordPositionsFromInstrument[k][patternFromInstrument]
    {  
    textSize(30);  
    // recordPositionsFromInstrument[k][patternFromInstrument] &= positionFromMotorPhase[k];  
    for (int k = 0; k < networkSize; k++)
    {   
    for (int i = patternFromInstrument; i < patternFromInstrument + 1; i++) 
    { 
    recordPositionsFromInstrument[k][i] = positionFromMotorPhase[k]; 
    text(" recPaT " + patternFromInstrument + " " + recordPositionsFromInstrument[k][i] + " enaSound " + (networkSize-1-instrumentTouched) + " " + enablingChangeSoundB[networkSize-1-instrumentTouched], 700*0, k*30);           
    
}
}
}
    
    
    // DISPLAY PATTERN SAVED
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
    
    if (key == '1' || recallLastPatternInstrument ==0) //as patterFromInstrumentRecorded = 0;
        {
        
        // key = 'ç';
        // phaseDirectFromSeq();
        patterFromInstrumentRecorded = 0;
        for (int i = 0; i < networkSize; i++)
            {
            positionFromMotorPhase[i] = recordPositionsFromInstrument[i][patterFromInstrumentRecorded]; //   positionFromMotorPhase[i] + 
        } 
    }
    
    
    if (key == '2'|| recallLastPatternInstrument==1) // as patterFromInstrumentRecorded = 1;
        {
        // key = 'ç';
        // phaseDirectFromSeq();
        patterFromInstrumentRecorded = 1;
        for (int i = 0; i < networkSize; i++)
            {
            positionFromMotorPhase[i] = recordPositionsFromInstrument[i][patterFromInstrumentRecorded]; // positionFromMotorPhase[i] + 
        } 
    }
    
    if (key == '3' || recallLastPatternInstrument==2)
        {
        // key = 'ç';
        // phaseDirectFromSeq();
        patterFromInstrumentRecorded = 2;
        for (int i = 0; i < networkSize; i++)
            {
            positionFromMotorPhase[i] =   recordPositionsFromInstrument[i][patterFromInstrumentRecorded];// positionFromMotorPhase[i] +
        } 
    }
    
    if (key == '4'|| recallLastPatternInstrument==3)
        {
        // key = 'ç';
        // phaseDirectFromSeq();
        patterFromInstrumentRecorded = 3;
        for (int i = 0; i < networkSize; i++)
            {
            positionFromMotorPhase[i] = recordPositionsFromInstrument[i][patterFromInstrumentRecorded];// positionFromMotorPhase[i] + 
        } 
    }
    
    
    if (key == '5'|| recallLastPatternInstrument==4)
        {
        // key = 'ç';
        // phaseDirectFromSeq();
        patterFromInstrumentRecorded = 4;
        for (int i = 0; i < networkSize; i++)
            {
            positionFromMotorPhase[i] =  recordPositionsFromInstrument[i][patterFromInstrumentRecorded];//positionFromMotorPhase[i] +
        } 
    }
    
    if (key == '6'|| recallLastPatternInstrument==5)
        {
        //key = 'ç';
        //phaseDirectFromSeq();
        patterFromInstrumentRecorded = 5;
        for (int i = 0; i < networkSize; i++)
            {
            positionFromMotorPhase[i] =  recordPositionsFromInstrument[i][patterFromInstrumentRecorded];// positionFromMotorPhase[i] + 
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
          //  positionFromMotorPhase[i] -= (int)  map((networkSize - 1 - oscillatorBlocked - i) * TWO_PI / networkSize * 1 / 16, 0, TWO_PI, 0, numberOfStep);  
             positionFromMotorPhase[i] -= (int)  map(TWO_PI * 0.4 / 4 / ( - networkSize - 0) * i, 0, TWO_PI, 0, numberOfStep); 
        }
    }

    if (key == 'D') 
        {
        // front  TWO_PI/8/(networkSize)*(i)   behind?
        // +=   TWO_PI*0.1/(networkSize)*(networkSize-1-i)
        for (int i = 0; i < networkSize; i++) {
          //  positionFromMotorPhase[i] += (int)  map(TWO_PI * 0.1 / (networkSize) * (networkSize - 1 - i), 0, TWO_PI, 0, numberOfStep);
            positionFromMotorPhase[i] += (int)  map(TWO_PI * 0.4 / 4 / (networkSize) * (networkSize - 1 - i), 0, TWO_PI, 0, numberOfStep);
        }
    }
        
    

       
    if (key == 's') // as former f as 'S'
        
    {
        for (int i = 0; i < networkSize; i++)
        {
            positionFromMotorPhase[i] -= (int)  map(TWO_PI * 0.4 / 16 / ( - networkSize - 0) * i, 0, TWO_PI, 0, numberOfStep);
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
            positionFromMotorPhase [i]+= (int)  map ( TWO_PI/12/(networkSize)*(networkSize-1-i), 0, TWO_PI, 0, numberOfStep);
           // positionFromMotorPhase[i] += (int)  map(TWO_PI / 12 / (networkSize) * (networkSize - 1 + oscillatorBlocked - i), 0, TWO_PI, 0, numberOfStep); // not so good
            //  positionFromMotorPhase [i]+= (int)  map ( TWO_PI/12/(networkSize)*(networkSize-1+ -i-oscillatorBlocked), 0, TWO_PI, 0, numberOfStep);
            
            
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
        {  // memory == 0 is the ball "behind"  the screen   
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
    
    //  text (" formerKey " + formerKey , 100, -200);

}