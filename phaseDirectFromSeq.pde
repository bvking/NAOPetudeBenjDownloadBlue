int recallPositionFromInstrument;
int formerPatternFromInstrument;
boolean instrumentChanged = false;
/*
            ratioNumberOfStepCorraletedFromInstrument[0] = 1;
            ratioNumberOfStepCorraletedFromInstrument[1] = 2;
            ratioNumberOfStepCorraletedFromInstrument[2] = 4;
            ratioNumberOfStepCorraletedFromInstrument[3] = 8;
            ratioNumberOfStepCorraletedFromInstrument[4] = 12;
            ratioNumberOfStepCorraletedFromInstrument[5] = 16;
*/

void phaseDirectFromSeq() // mixed Com
{  
    instrumentChanged = false;
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
            positionFromMotorPhase[i] += numberOfStep / 16;
        }
    }
    
    
    if (key == 'ç')
    {
        float[] realign = new float[networkSize];
        if (positionFromMotorPhase[networkSize - 1] > positionFromMotorPhase[0])
            
            text(" HIGER POSITIO " + higerPostion, 100, 200);
        higerPostion = true;
        {  
            for (int i = 0; i < networkSize; i++)
            {
                numberOfTrig[i] = 8;
                realign[i] = positionFromMotorPhase[networkSize - 1] % (positionFromMotorPhase[networkSize - 1] + (numberOfStep)); //+PI/2;
                positionFromMotorPhase[i] = (int) realign[i];
                
                //positionFromMotorPhase [i] = positionFromMotorPhase [0];
                
            }  
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
    
    if (keyCode == CONTROL)
    {
    
        enablingParametersChangesToLive =! enablingParametersChangesToLive; 
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
    
  
         formerPatternFromInstrument = patterFromInstument;
    
    
    for (int i = 0; i < networkSize; i++)
    {  
              
        if (enablingChangeSound[networkSize - 1 - i] ==  true) // assign instrument changed at the good order 0 left, then 1,2, .., .. 4 right
            {
            patterFromInstument = i;  //
        } 
    }

        if (formerPatternFromInstrument != patterFromInstument)

    {  
       //   noLoop();
          background (127);
        instrumentChanged = true;     
        int recallPositionFromInstrument = patterFromInstument;
         key = 'ç';
         phaseDirectFromSeq();
         textSize(200);
    }
      
       
    if (key == 'e' && instrumentChanged == false  )
    {
        for (int i = 0; i < networkSize; i++)
        {   
            
            
            ratioNumberOfStepCorraletedFromInstrument[0] = 1;
            ratioNumberOfStepCorraletedFromInstrument[1] = 2 ;
            ratioNumberOfStepCorraletedFromInstrument[2] = 4;
            ratioNumberOfStepCorraletedFromInstrument[3] = 8;
            ratioNumberOfStepCorraletedFromInstrument[4] = 12;
            ratioNumberOfStepCorraletedFromInstrument[5] = 16;
            
            
            // 6 HIT  si number of rot=1 -->  42 HIT si umber of rot=7 car 6*7 .  // 8 hit <=networkSize+2. Donc 8 hoit avec numberOfRot 8 = 64 hit
            positionFromMotorPhase[i] =  positionFromMotorPhase[i] + (int)  map((networkSize + 0 - 1 - oscillatorBlocked + i) * TWO_PI / 1 / (networkSize + 2), 0, TWO_PI, 0, numberOfStep / ratioNumberOfStepCorraletedFromInstrument[patterFromInstument]);  
            positionFromMotorPhase[i] %=   numberOfStep;     

            recordPositionFromMotorPhaseFromLastInstrument[i][patterFromInstument]+=positionFromMotorPhase[i];   
            recordPositionFromMotorPhaseFromLastInstrument[i][patterFromInstument]%=  numberOfStep; 
            positionFromMotorPhase[i] = recordPositionFromMotorPhaseFromLastInstrument[i][patterFromInstument];
        }
    }
    
 
    
    /*
    int letter = 'B';
    
    switch(letter) {
    case 'A': 
    println("Alpha");  // Does not execute
    break;
    case 'B': 
    println("Bravo");  // Prints "Bravo"
    break;
    default:
    println("Zulu");   // Does not execute
    break;
}
    */
    
    for (int k = 0; k < networkSize; k++)
        {    
        recordPositionsFromInstrument[k][patterFromInstument] = positionFromMotorPhase[k];  
        /*    
        for (int i = patterFromInstument; i < patterFromInstument + 1; i++) 
        { 
        recordPositionsFromInstrument[k][i] = positionFromMotorPhase[k]; 
        println(" RECORDPATTERN" + recordPositionsFromInstrument[k][i]);       
    }
        */
    }
    
    
    
    // DISPLAY PATTERN SAVED
    if (keyCode == CONTROL)
    {
        for (int k = 0; k < networkSize; k++)
        {         
            for (int j = 0; j < j + 1; j++) 
            { 
                // println(" SAVINGPATTERNN " + patterFromInstument + " " + recordPositionsFromInstrument[k][patterFromInstument]);  
            } 
        }
    }
    
    if (key == '1') //as patterFromInstrumentRecorded = 0;
    {
        
        key = 'ç';
        phaseDirectFromSeq();
        patterFromInstrumentRecorded = 0;
        for (int i = 0; i < networkSize; i++)
        {
            positionFromMotorPhase[i] =  positionFromMotorPhase[i] + recordPositionsFromInstrument[i][patterFromInstrumentRecorded];
        } 
    }
    
    
    if (key == '2') // as patterFromInstrumentRecorded = 1;
    {
        key = 'ç';
        phaseDirectFromSeq();
        patterFromInstrumentRecorded = 1;
        for (int i = 0; i < networkSize; i++)
        {
            positionFromMotorPhase[i] =  positionFromMotorPhase[i] + recordPositionsFromInstrument[i][patterFromInstrumentRecorded];
        } 
    }
    
    if (key == '3')
    {
        key = 'ç';
        phaseDirectFromSeq();
        patterFromInstrumentRecorded = 2;
        for (int i = 0; i < networkSize; i++)
        {
            positionFromMotorPhase[i] =  positionFromMotorPhase[i] + recordPositionsFromInstrument[i][patterFromInstrumentRecorded];
        } 
    }
    
    if (key == '4')
    {
        key = 'ç';
        phaseDirectFromSeq();
        patterFromInstrumentRecorded = 3;
        for (int i = 0; i < networkSize; i++)
        {
            positionFromMotorPhase[i] =  positionFromMotorPhase[i] + recordPositionsFromInstrument[i][patterFromInstrumentRecorded];
        } 
    }
    
    
    if (key == '5')
    {
        key = 'ç';
        phaseDirectFromSeq();
        patterFromInstrumentRecorded = 4;
        for (int i = 0; i < networkSize; i++)
        {
            positionFromMotorPhase[i] =  positionFromMotorPhase[i] + recordPositionsFromInstrument[i][patterFromInstrumentRecorded];
        } 
    }
    
    if (key == '6')
    {
        key = 'ç';
        phaseDirectFromSeq();
        patterFromInstrumentRecorded = 5;
        for (int i = 0; i < networkSize; i++)
        {
            positionFromMotorPhase[i] =  positionFromMotorPhase[i] + recordPositionsFromInstrument[i][patterFromInstrumentRecorded];
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
    
    
    if (key == 'E')
    {
        for (int i = 0; i < networkSize; i++)
        { // 6 HIT
            positionFromMotorPhase[i] =  positionFromMotorPhase[i] - (int)  map((networkSize + 0 - 1 - oscillatorBlocked - i) * TWO_PI / 1 / (networkSize + 2), 0, TWO_PI, 0, numberOfStep / numberOfRota[0]); 
            positionFromMotorPhase[i] %=   numberOfStep;  
        }
    }
    
    
    
    if (key == 's')
        {
        for (int i = 0; i < networkSize; i++)
        {
            positionFromMotorPhase[i] -= (int)  map((networkSize - 1 - oscillatorBlocked - i) * TWO_PI / 12 / networkSize, 0, TWO_PI, 0, numberOfStep);   
        }
    }
    
    
    if (key == 'S') //     net.phase[i] -= (networkSize-1- oscillatorBlocked-i)*TWO_PI/networkSize*0.1;
        {
        for (int i = 0; i < networkSize; i++)
        {
            positionFromMotorPhase[i] -= (int)  map((networkSize - 1 - oscillatorBlocked - i) * TWO_PI / networkSize * 1 / 16, 0, TWO_PI, 0, numberOfStep);   
        }
    }
    
    
    if (key == 'd')
        {
        for (int i = 0; i < networkSize; i++)
        {
            //positionFromMotorPhase [i]+= (int)  map ( TWO_PI/12/(networkSize)*(networkSize-1-i), 0, TWO_PI, 0, numberOfStep);
            positionFromMotorPhase[i] += (int)  map(TWO_PI / 12 / (networkSize) * (networkSize - 1 + oscillatorBlocked - i), 0, TWO_PI, 0, numberOfStep);
            //  positionFromMotorPhase [i]+= (int)  map ( TWO_PI/12/(networkSize)*(networkSize-1+ -i-oscillatorBlocked), 0, TWO_PI, 0, numberOfStep);
            
            
        }
    }
    
    if (key == 'D') 
    {
        // front  TWO_PI/8/(networkSize)*(i)   behind?
        // + =   TWO_PI*0.1/(networkSize)*(networkSize-1-i)
        for (int i = 0; i < networkSize; i++) {
            positionFromMotorPhase[i] += (int)  map(TWO_PI * 0.1 / (networkSize) * (networkSize - 1 - i), 0, TWO_PI, 0, numberOfStep);
        }
    }
    
    
    if (key == 'u')
    {  // memory == 0 is the ball "behind"  the screen
        
        oldMemoryi = memoryi;
        memoryi = (memoryi + 1);
        memoryi %=  networkSize;
        
        for (int i = 0; i < (networkSize - 0); i++)
        {  
            lastOldActualPosition[i] = positionFromMotorPhase[i];//+numberOfStep/6;
        }
        
        for (int i = 1; i < (networkSize - 0); i++)
        {
            positionFromMotorPhase[i] = lastOldActualPosition[i - 1];       
        }
        positionFromMotorPhase[0] = lastOldActualPosition[networkSize - 1];
        
    } 
    
    //  text (" formerKey " + formerKey , 100, -200);
    
    
}