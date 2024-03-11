

void phaseDirectFromSeq() // mixed Com
{  
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
        
        if (positionFromMotorPhase[networkSize - 1] <= positionFromMotorPhase[0] - 6400)
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
        keyCode = 0;
    }
    
    
    if (key == 'a')
    {
        for (int i = 0; i < networkSize; i++) { // 6 HIT  si number of rot=1 -->  42 HIT si umber of rot=7 car 6*7 .  // 8 hit <=networkSize+2. Donc 8 hoit avec numberOfRot 8 = 64 hit
            positionFromMotorPhase[i] =  positionFromMotorPhase[i] + numberOfStep / numberOfRota[0];
            positionFromMotorPhase[i] %=   numberOfStep;
        }
    }
    
    
    if (key == 'e')
    {
        for (int i = 0; i < networkSize; i++)
        { // 6 HIT  si number of rot=1 -->  42 HIT si umber of rot=7 car 6*7 .  // 8 hit <=networkSize+2. Donc 8 hoit avec numberOfRot 8 = 64 hit
            positionFromMotorPhase[i] =  positionFromMotorPhase[i] + (int)  map((networkSize + 0 - 1 - oscillatorBlocked + i) * TWO_PI / 1 / (networkSize + 2), 0, TWO_PI, 0, numberOfStep / numberOfRota[0]);  
            positionFromMotorPhase[i] %=   numberOfStep;
            
            if (enablingChangeSound[i] ==  true)
            {
                patterFromInstument = i;
            } 
        }
        
        
        for (int k = 0; k < networkSize; k++)
        {         
            for (int i = patterFromInstument; i < patterFromInstument + 1; i++) 
            { 
                recordPositionsFromInstrument[k][i] = positionFromMotorPhase[k]; 
                        
            }
        }
          
    }
    // display recorded pattern
       for (int k = 0; k < networkSize; k++)
        {         
            for (int i = patterFromInstument; i < patterFromInstument + 1; i++) 
            { 
             
                  println ( " RECORDPATTERN " + patterFromInstument + " " + recordPositionsFromInstrument[k][i]);       
            }
         }

    if (key == '0')
    {
       key = 'ç';
       phaseDirectFromSeq(); // align motor

       for (int i = 0; i < networkSize; i++)
       positionFromMotorPhase[i] =  positionFromMotorPhase[i] + recordPositionsFromInstrument[i][0];
    }


    if (key == '1')
    {
       key = 'ç';
       phaseDirectFromSeq();

       for (int i = 0; i < networkSize; i++)
       positionFromMotorPhase[i] =  positionFromMotorPhase[i] + recordPositionsFromInstrument[i][1];
    }

     if (key == '2')
    {
       key = 'ç';
       phaseDirectFromSeq();

       for (int i = 0; i < networkSize; i++)
       positionFromMotorPhase[i] =  positionFromMotorPhase[i] + recordPositionsFromInstrument[i][2];
    }
    
      
    
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