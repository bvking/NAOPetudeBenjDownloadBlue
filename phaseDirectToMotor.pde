boolean higerPostion;


void phaseDirectToMotor() // mixed Com
    {  
    oscillatorBlocked = networkSize - 1;  // retour normal et joli avec f et d 
    text(" osc " + oscillatorBlocked, 200, 200);
    
    if (key == '1' && music_from_ableton_live == " Dessine ")
    {
        for (int i = 0; i < networkSize; i++)
        {
            // net.phase[networkSize-1-i] += (i*TWO_PI/3)%PI/10;    //PAS TOUCHER
            
          //  net.phase[networkSize-1-i] = net.phase[networkSize-1-i] + (i*TWO_PI/5)%PI/10; 
            
            positionFromMotorPhase[networkSize - 1 - i] += (int)  map((i + 1 / 4 * TWO_PI / 5) % PI / 40, 0, TWO_PI, 0, numberOfStep);
            
            if (formerKeyMetro == '$')
            {
               //    positionFromMotorPhase[networkSize-1-i]%= positionFromMotorPhase[i] + numberOfStep;    // no meaning    
        }
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
            higerPostion = true;
        {  
            for (int i = 0; i < networkSize; i++)
            {
                realign[i] = positionFromMotorPhase[networkSize - 1] % (positionFromMotorPhase[networkSize - 1] + (numberOfStep)); //+PI/2;
                positionFromMotorPhase[i] = (int) realign[i];
                println(" HIGER POSITIO " + higerPostion);
        }  
        }
        
        
        if (positionFromMotorPhase[networkSize - 1] < positionFromMotorPhase[0])
        {
            higerPostion = false;
            for (int i = 0; i < networkSize; i++) {
                realign[i] = positionFromMotorPhase[0] % (positionFromMotorPhase[0] + (numberOfStep)); //+PI/2;
              //   realign[i] = positionFromMotorPhase[networkSize-1]%(positionFromMotorPhase[networkSize-1]+(numberOfStep)); //+PI/2;
                positionFromMotorPhase[i] = (int) realign[i];
                println(" HIGER POSITIO " + higerPostion);
        }
            
        }
        // key = '#';
        
}
    
    if (key == 'w')
    {
        for (int i = 0; i < networkSize; i++)
        {
            // net.phase[networkSize-1-i] += (i*TWO_PI/3)%PI/10;    //PAS TOUCHER
            
          //  net.phase[networkSize-1-i] = net.phase[networkSize-1-i] + (i*TWO_PI/5)%PI/10; 
            
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
    
    if (key == 'R') {
        
        for (int i = 0; i < networkSize; i++) {
         //   net.phase[i] += (i+1) *(TWO_PI/12); // 12 hit   
         //   net.phase[networkSize-1-i] += (i*TWO_PI/3)%PI/11;    //PAS TOUCHER
         //   net.phase[i] -= (i*TWO_PI/5)%PI/5;
            
        //    net.phase[i] -= (i*TWO_PI/networkSize)%PI/(networkSize*3); // OK en mode circular ? 
            
            positionFromMotorPhase[i] = positionFromMotorPhase[i] - (int)  map((i * TWO_PI / networkSize) % PI / (networkSize * 3), 0, TWO_PI, 0, numberOfStep);   
    }
    }
    
    if (key == 'r') {
        for (int i = 0; i < networkSize; i++) {
            positionFromMotorPhase[i] += (int)  map((i * TWO_PI / networkSize) % PI / (networkSize * 3), 0, TWO_PI, 0, numberOfStep);
        }
    }
    
    
    if (key == 'f')
    {  key = 's';
        for(int i = 0; i < networkSize; i++) {
            //  positionFromMotorPhase[i]-= (int)  map ( (networkSize-1- oscillatorBlocked-i)*TWO_PI/networkSize*0.1/16, 0, TWO_PI, 0, numberOfStep);  
           //NOPE positionFromMotorPhase[i] -= (int)  map((networkSize - 1 - oscillatorBlocked - i) * TWO_PI / networkSize * 0.1 / 16, 0, TWO_PI, 0, numberOfStep);   
        }
    }
    
    
    if (key == 'S') //     net.phase[i] -= (networkSize-1- oscillatorBlocked-i)*TWO_PI/networkSize*0.1;
    {
        for(int i = 0; i < networkSize; i++) {
            positionFromMotorPhase[i] -= (int)  map((networkSize - 1 - oscillatorBlocked - i) * TWO_PI / networkSize * 1 / 16, 0, TWO_PI, 0, numberOfStep);   
        }
    }
    
    
    if (key == 'd')
    {
        for (int i = 0; i < networkSize; i++)
        {
            positionFromMotorPhase[i] += (int)  map(TWO_PI * 0.1 / 8 / (networkSize) * (networkSize - 1 - i), 0, TWO_PI, 0, numberOfStep);
        }
    }
    
    if (key == 'D') 
    {
        // front  TWO_PI/8/(networkSize)*(i)   behind?
        // + =   TWO_PI*0.1/(networkSize)*(networkSize-1-i)
        for(int i = 0; i < networkSize; i++) {
            positionFromMotorPhase[i] += (int)  map(TWO_PI * 0.1 / (networkSize) * (networkSize - 1 - i), 0, TWO_PI, 0, numberOfStep);
        }
}
    
    if (key == 's') // as former f as 'S'
        
    {
        for (int i = 0; i < networkSize; i++)
        {
            positionFromMotorPhase[i] -= (int)  map(TWO_PI * 0.1 / 8 / ( - networkSize - 0) * i, 0, TWO_PI, 0, numberOfStep);
        }
}
    
    if (key == 'F') 
    {
        for (int i = 0; i < networkSize; i++) {
            positionFromMotorPhase[i] += (int)  map(TWO_PI * 0.1 / (networkSize - 0 - oscillatorBlocked) * i, 0, TWO_PI, 0, numberOfStep);
        }
}
    
    if (key == 'i')
    {  // memory == 0 is the ball "behind"  the screen
        
        oldMemoryi = memoryi;
        memoryi = (memoryi - 1);
        
        if (memoryi == -  1)
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
            lastOldActualPosition[i] = positionFromMotorPhase[i] + numberOfStep / 6;
        }
        
        for (int i = 1; i < (networkSize - 0); i++)
        {
            positionFromMotorPhase[i] = lastOldActualPosition[i - 1];       
    }
        positionFromMotorPhase[0] = lastOldActualPosition[networkSize - 1];
        
} 
    
    
    if (key == 'M')
    {  // memory == 0 is the ball "behind"  the screen
        
        oldMemoryi = memoryi;
        memoryi = (memoryi + 1);
        memoryi %=  networkSize;
        
        for (int i = 0; i < (networkSize - 0); i++)
        {  
            lastOldActualPosition[i] = positionFromMotorPhase[i] + numberOfStep * 0;
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
            println (" lastP " + lastPositionFromMotorPhase[i] + " P " + positionFromMotorPhase[i]);
            if (lastPositionFromMotorPhase[i]< positionFromMotorPhase[i])

            {
                positionFromMotorPhase[i]=positionFromMotorPhase[i]+numberOfStep;

            }

        }

        
        for (int i = 0; i < (networkSize - 0); i++)
        {  
           // lastOldActualPosition[i] = positionFromMotorPhase[i]+numberOfStep/1;//+numberOfStep/6;

            lastOldActualPosition[i] = positionFromMotorPhase[i]+numberOfStep/1;//+numberOfStep/6;
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
    
    textSize(200);
    text("key" + key, 200, 400);
    
    key = '#';
    
}
