boolean enableRotation = true;

void automationForMusicDessine()
{
   
    // shapeLfoMode = int (shapeLfo * 100);  // 33 = DOWN=> CounterClockWay  17= UP CW
    if (measure <=  1)
    {
        formerKeyMetro = '*';
        //modeCircular = true;
    }
    
    if (music_from_ableton_live == " Dessine ")//oldMac blabla2021
    {  
        if (measure ==  1 && beatPrecised == 1 && beatPrecisedTrigged ==  true)
        {  
            keyMode = " trigEventWithAbletonSignal "; // 
            modeStartKeyToFollow = " followSignal2 ";   
            speedDelta = 2;
            key = '0';
            phaseDirectFromSeq();   
            key = 'D';        
            phaseDirectFromSeq();     
        }
        
        if (((measure >=  1 && measure < 3)  && beatTrigged ==  true) || (beatPrecised == 5 + 4 && beatPrecisedTrigged ==  true && measure <= 2))
        {
            key = 'k'; 
            phaseDirectFromSeq();          
        } 
        
        
        if (measure >=  3 && measure < 5 && (beatPrecised ==  1 || beatPrecised ==  5 + 4) && beatPrecisedTrigged) 
        { 
            enableRotation = true;         
            key = 'S';        
            phaseDirectFromSeq();  
            key = 'S';        
            phaseDirectFromSeq();            
        }
        
                
        if ((measure >=  5 && measure <=6  ) && (beatPrecised ==  1 || beatPrecised ==  5 + 4) && beatPrecisedTrigged ==  true) 
        {
        
            speedDelta = 2;  
            key = 'D';  
            phaseDirectFromSeq();      
            key = 'D';  
            phaseDirectFromSeq();      
        } 
        //

        if (measure ==  6 && beatPrecised ==  16 && beatPrecisedTrigged ==  true) 
        {
             key = 'k'; 
            phaseDirectFromSeq();       
           key = 'S';
           phaseDirectFromSeq();  
            // key = '=';
            // keyReleased();
          //**   key = 'ç';
          //**   phaseDirectFromSeq();   
            //phaseDirectToMotor(); 
        }
        
        if (measure >=  7 && measure <=8 && (beatPrecised == 5 + 4 || beatPrecised == 1) && beatPrecisedTrigged ==  true)          
        {  
            key = 'S';  
            phaseDirectFromSeq();        
            key = 'S';  
            phaseDirectFromSeq();   
            key = 'S';  
            phaseDirectFromSeq();        
        }

       if (measure >=  9 && measure <=10 && (beatPrecised == 5 + 4 || beatPrecised == 1) && beatPrecisedTrigged ==  true)          
        {  
            key = 'D';  
            phaseDirectFromSeq();        
            key = 'D';  
            phaseDirectFromSeq();   
            key = 'D';  
            phaseDirectFromSeq();      
        }
        
    

        if (measure ==  197 && beatTrigged ==  true)   // comeBack Normal choregraphy     
        {
                keyMode = " trigEventWithAbletonSignal "; 
                modeStartKeyToFollow = " followSignal2 ";  // to test followSignal

        }
        
        if (measure >=  11 && measure <=  11  && beatPrecised > 0 && beatPrecisedTrigged ==  true) 
        {
            speedDelta = 2;
            key = 'd';        
            phaseDirectFromSeq();        
            key = 'd';        
            phaseDirectFromSeq();    
        }  
        
        if (measure >=  12 && measure <=  12  && beatPrecised < 17 && beatPrecisedTrigged == true) 
        {
            key = 's';        
            phaseDirectFromSeq();      
              key = 's';        
            phaseDirectFromSeq();    
            
        } 
        
        if (measure >=  13 && measure <=  13  && beatPrecised > 0 && beatPrecisedTrigged ==  true) 
        {
            speedDelta = 2;
            key = 'd';        
            phaseDirectFromSeq();       
               key = 'd';        
            phaseDirectFromSeq();      
            
        }  
        
        if (measure >=  14 && measure <=  14  && beatPrecised < 17 && beatPrecisedTrigged == true) 
        {
            key = 's';        
            phaseDirectFromSeq();      
              key = 's';        
            phaseDirectFromSeq();          
        } 
        
        
        if (measure ==  11 && beatTrigged ==  true)
            
        {
            key = 'k'; 
            phaseDirectFromSeq();       
          //  key = 'S';
          //  phaseDirectFromSeq();            
        }
        
        
        if (measure >=  15 && measure <=  15  && ((beatPrecised + 0) % 2) ==  0 && beatPrecisedTrigged) 
        {
            speedDelta = 2;          
            key = 'd';        
            phaseDirectFromSeq();      
            key = 'd';        
            phaseDirectFromSeq();  
              key = 'd';        
            phaseDirectFromSeq();        
            
        }  
        
        if (measure >=  16 && measure <=  16  && ((beatPrecised + 0) % 2) ==  0 && beatPrecisedTrigged) 
        {    
            key = 's';        
            phaseDirectFromSeq();      
            key = 's';        
            phaseDirectFromSeq();     
            key = 's';        
            phaseDirectFromSeq();    
        }
    } 
    
    
    
    
    if (measure >=  17 && measure <=  17  && ((beatPrecised + 1) % 2) ==  0 && beatPrecisedTrigged) 
        {
        speedDelta = 2;
        
        key = 'd';        
        phaseDirectFromSeq();      
        key = 'd';        
        phaseDirectFromSeq();    
        key = 'd';        
        phaseDirectFromSeq();    
        
    }  
    
    if (measure >=  18 && measure <=  18  && ((beatPrecised + 1) % 2) ==  0 && beatPrecisedTrigged) 
        {        
        key = 's';        
        phaseDirectFromSeq();      
        key = 's';        
        phaseDirectFromSeq();  
             key = 's';        
        phaseDirectFromSeq();       
        
    }  
    
    if (measure ==  19 && beatTrigged )          
        {
     //**   key = 'ç';
       key = '0';
       specialPropagationKey  = key ;  
       phaseDirectFromSeq();  
        /*
        key = 'k';
        phaseDirectFromSeq();  
        key = 'k';
        phaseDirectFromSeq();  
        */
        key = 'D';
        phaseDirectFromSeq();      
        key = 'D';
        phaseDirectFromSeq();   
        
    }
    
 //   if (measure >  19 && measure <  24  && ((beatPrecised + 1) % 5) ==  0 && beatPrecisedTrigged)
   if (measure >  19 && measure <  24  && ( beatPrecised == 1|| beatPrecised == 5|| beatPrecised == 9 || beatPrecised == 13 )  && beatPrecisedTrigged)
        {  
        enableRotation =false;
        key = 'i';   
        specialPropagationKey  = key ;     
        phaseDirectFromSeq();      
        
    } 
    
    if (measure ==  23 && beatPrecised ==  16 && beatPrecisedTrigged)
        {
       enableRotation =false;   
       key = '0';
       specialPropagationKey  = key ;    
       phaseDirectFromSeq();           
    }
    
    
    if (measure >=  24 && measure <=  24 && beatPrecised == 1 || beatPrecised == 5 || beatPrecised == 9 && beatPrecisedTrigged)
        { 
        {  
            // key = 'w';   
         //   key = 'f';        
         //   phaseDirectFromSeq();               
        }  
        
    } 
    
    
    if (measure ==  24  &&  beatPrecised == 13 && beatPrecisedTrigged ) 
        {        
      //  key = 'ç';
      //  phaseDirectFromSeq(); 
    } 
    
    if (measure ==  24  &&  beatPrecised == 15 && beatPrecisedTrigged ) 
        {     
        key = 'S';        
        phaseDirectFromSeq();       
        speedDelta = 3;
    } 
    
    
    if (measure >=  25 && measure <=  28  && (beatPrecised == 1 || beatPrecised == 9) && beatPrecisedTrigged ) 
        {
        key = 'S';        
        phaseDirectFromSeq();          
        key = 'S';        
        phaseDirectFromSeq();         
        key = 'S';        
        phaseDirectFromSeq();         
    } 
    
    if (measure >=  25 && measure <=  28  && (beatPrecised == 5 || beatPrecised == 13) && beatPrecisedTrigged ) 
        {
        key = 'D';        
        phaseDirectFromSeq();          
        key = 'D';        
        phaseDirectFromSeq();       
        key = 'D';        
        phaseDirectFromSeq();         
    } 
    
    
    if (measure > 28 && measure < 32 && beatPrecisedTrigged ==  false)   // look at the end
        {
        
        for (int i = 0; i < networkSize; i++)
            {
            //  lastActualPosition[i]+= (int)  map ( PI/4/32, 0, TWO_PI, 0, numberOfStep);
        }
    }
    
    if (measure ==  29 &&  beatPrecised == 1 && beatPrecisedTrigged )  
    {
        // key= '=';
        // keyReleased();
    }
    
    if (measure >=  28 && measure < 32 && beatPrecisedTrigged ) 
    {
        speedDelta = 2;
        key = 'r';        
        phaseDirectFromSeq();      
        
    } 
    
    
    if (measure ==  32 &&  beatPrecised == 1 && beatPrecisedTrigged )     
    {
          
        key = 'k';
        phaseDirectFromSeq();      
        key = 'k';
        phaseDirectFromSeq(); 
        
        key = '0'; // not ç
        specialPropagationKey  = key ; 
        phaseDirectFromSeq(); 
       
         
        //key = 'k';
        //phaseDirectFromSeq(); 
      
       
    }
    
    
    
    if (measure >=  32 && measure % 2 ==  0 && measure <=  35 && beatPrecisedTrigged ) 
    {    
        textSize(200);
        key = 'R';        
        phaseDirectFromSeq();       
        key = 'R';        
        phaseDirectFromSeq();       
        
    } 
    
    if (measure >=  32 && (measure + 1) % 2 ==  0 && measure< 35 && beatPrecisedTrigged ) 
        {     
        textSize(200);      
        key = 'r';        
        phaseDirectFromSeq();       
        key = 'r';        
        phaseDirectFromSeq();       
        
    }
    
    if (measure ==  34 && beatPrecised >=  8 && beatPrecisedTrigged)
        {      
        key = 's';        
        phaseDirectFromSeq();         
        
    } 

     if (measure ==  35 && beatPrecised ==  1 && beatPrecisedTrigged)
    { 
        key = '0'; // not ç
        specialPropagationKey  = key ; 
        phaseDirectFromSeq(); 
        /*
        key = 'k';
        phaseDirectFromSeq();      
            key = 'k';
        phaseDirectFromSeq();      
            key = 'k';
        phaseDirectFromSeq();  
        */    
       
    }  
    
    if (measure >=  35 && measure % 2 ==  0 && measure <=  38 && beatPrecised % 1 ==  0  &&  beatPrecisedTrigged)
        {  
        key = 's';        
        phaseDirectFromSeq();             
    } 
    
    if (measure >=  35 && (measure + 1) % 2 ==  0 && measure<= 38 && beatPrecised % 1 ==  0  && beatPrecisedTrigged) 
        {
        key = 'd';        
        phaseDirectFromSeq();          
    }
  /*
    if ((measure ==  38) && beatPrecised == 12 && beatPrecisedTrigged ==  true) 
        {  
            key = '0';
            keyReleased();
            speedDelta = 3; 
        
            keyMode = " trigEventWithAbletonSignal "; // 
            modeStartKeyToFollow = " followSignalSampledOppositeWay(frameRatio) ";   
          // 
        } 
        
    if (measure ==  39 && beatTrigged ==  true)       
        {  
              for (int i = 0; i < networkSize; i++)
        { 
            countControlDr[i]= countControlDr[i];
            rev[i]=  countControlDr[i]+1;
        }  
            keyCode = BACKSPACE;
            followSignalSampledOppositeWay(frameRatio);
             keyCode = LEFT;
            followSignalSampledOppositeWay(frameRatio); 
            keyCode = LEFT;
            followSignalSampledOppositeWay(frameRatio); 
        }


   if (measure ==  (39+8) && beatTrigged ==  true)   // comeBack Normal choregraphy     
        {
                keyMode = " trigEventWithAbletonSignal "; 
                modeStartKeyToFollow = " followSignal2 ";  // to test followSignal
        }
    */
    
    
    if (measure ==  38  && beatPrecisedTrigged ==  true && beatPrecised % 13 ==  0)
        {
       enableRotation=false;
        key = 'U';  
        specialPropagationKey  = key ; 
        phaseDirectFromSeq();                    
    } 
    
    if (measure ==  39  && (beatPrecised!= 0)  && beatPrecisedTrigged ==  true)  //|| beatPrecised == 5 || beatPrecised == 9 || beatPrecised == 13) && beatPrecisedTrigged ==  true) 
        {
        key = 'U';  
        specialPropagationKey  = key ; 
        phaseDirectFromSeq();               
    }

     
    if (measure ==  40  && (beatPrecised == 1) && beatPrecisedTrigged ==  true) 
        { 
        key = '0'; // not ç
        specialPropagationKey  = key ; 
        phaseDirectFromSeq();   
        enableRotation = true;    
    }
    
    
    if (measure ==  40  && ((beatPrecised+1)%2 ==0) && beatPrecisedTrigged ==  true) 
        {
        key = 'r';        
        phaseDirectFromSeq();         
        key = 'r';        
        phaseDirectFromSeq();       
        
    } 
    
  //  if (measure > 40  && measure <=  43 && (beatPrecised == 1 || beatPrecised == 5 || beatPrecised == 9 || beatPrecised == 13) && beatPrecisedTrigged ==  true) 
      if (measure > 40  && measure <=  43 && ((beatPrecised+1)%1 ==0) && beatPrecisedTrigged ==  true) 
        {
        enableRotation = false;    
          key = 'R';        
        phaseDirectFromSeq();         
    } 
    
    
    
    if (measure ==  43  && (beatPrecised == 15) && beatPrecisedTrigged ==  true) 
        {
           enableRotation =true;
        key = '0'; // not ç
        specialPropagationKey  = key ; 
        
        phaseDirectFromSeq();    
         key = 'k'; // not ç     
          phaseDirectFromSeq();           
    }
    
    if (measure ==  44 && (beatPrecised + 1) % 5 == 0 && beatPrecisedTrigged ==  true && beatPrecised < 10 ) 
        {  
       key = 'S';
        phaseDirectFromSeq(); 
        key = 'S';
        phaseDirectFromSeq();     
    }

    if (measure ==  44 && (beatPrecised >= 10 ) && beatPrecisedTrigged ==  true) 
        {  
        enableRotation=false;  
        key = 'U';
        specialPropagationKey  = key ;        
        phaseDirectFromSeq();       
    }
    
    if (measure >=  45 &&  measure <=  48 && beatPrecisedTrigged ==  true) //4*2 == 8 event  //|| beatPrecised == 13
        
        { //speedDelta = 3;
        key = 'U';        
        specialPropagationKey  = key ;        
        phaseDirectFromSeq();               
    } 
    
    if (measure >=  48 &&  measure <=  48 && beatPrecised >= 15  && beatPrecisedTrigged ==  true)
    {
        key = '0'; // not ç
        keyReleased(); 
          key = 'k'; // not ç     
          phaseDirectFromSeq(); 
            key = 'k'; // not ç     
          phaseDirectFromSeq();   
        enableRotation=true;          
    } 
     
    if (measure ==  49 && beatPrecised == 1 && beatPrecisedTrigged)   
        {    
        key = '0'; // not ç
        keyReleased();
        key = '0'; // not ç
        phaseDirectFromSeq(); 
         key = 'k'; // not ç     
          phaseDirectFromSeq();    
       //key = 's';
        //phaseDirectFromSeq(); 
        // key = 's';
        //phaseDirectFromSeq(); 
       

     
    }

    if (measure ==  49 && beatPrecised == 2 && beatPrecisedTrigged)   
        {
        key = '0'; // not ç
        keyReleased(); 
        formerKeyMetro = '$';   
        
        key = 's';
        phaseDirectFromSeq(); 
        key = 's';
        phaseDirectFromSeq(); 
        key = 's';
        phaseDirectFromSeq();  
         key = 's';
        phaseDirectFromSeq(); 
        key = 's';
        phaseDirectFromSeq();  
        key = 's';
        phaseDirectFromSeq(); 
        key = 's';
        phaseDirectFromSeq();       
        key = 's';
        phaseDirectFromSeq();  
        /*
         key = 's';
        phaseDirectFromSeq(); 
        key = 's';
        phaseDirectFromSeq(); 
        */
          
    }

    if (measure ==  59 && (beatPrecised == 15 || beatPrecised == 15) && beatPrecisedTrigged)   
        {    
        key = '0'; // not ç
        specialPropagationKey  = key ; 
        phaseDirectFromSeq();    
    }     
    if (measure ==  60 && beatPrecisedTrigged ) 
        {     
        textSize(200);      
        key = 'r';        
        phaseDirectFromSeq();       
        key = 'r';        
        phaseDirectFromSeq();          
    }
    
    if (measure ==  61 && beatPrecisedTrigged ) 
        { 
        key = 's';        
        phaseDirectFromSeq();      
       
    }
       
    if (measure >=  61 && measure <  69 && (measure+0)%2==0  && beatPrecisedTrigged) // && (beatPrecised ==  1  || beatPrecised ==  9) 
    {
        key = 'D';  
        phaseDirectFromSeq();        
    }

    if (measure >=  61 && measure <  69 && (measure+1)%2==0   && beatPrecisedTrigged) // && (beatPrecised ==  1  || beatPrecised ==  9)
    {
        key = 'S';  
        phaseDirectFromSeq();        
    }

    if (measure >=  69 &&   measure <=  76 && (beatPrecised % 2== 0) && beatPrecisedTrigged)   
     {    
      //  key = 'i'; // not ç
         speedDelta=2;
      //  specialPropagationKey  = key ;
         key = 'd';
        keyReleased();      
        phaseDirectFromSeq();    
    } 

    if (measure >=  69 && (beatPrecised == 9) && beatPrecisedTrigged)   
    {    
      //  key = 'P';
        keyReleased();      
    } 

    if (measure >=  76 &&   measure <=  83 && (beatPrecised == 1) && beatPrecisedTrigged)   
     {    
      //  key = 'U'; // not ç
      //  specialPropagationKey  = key ; 
        key = 'S';
        keyReleased();   

        phaseDirectFromSeq();    
    } 
    
    
    // based on followSignaSampledOppositeWay   
    if (measure >= 0)
    { 
        if (measure ==  49 && beatPrecisedTrigged)
            { 
            speedDelta = 2;
            formerKeyMetro = '$';
            //modeCircular = true;
        }
        
        if (measure ==  60 && beatPrecisedTrigged)
        {   speedDelta = 2;
            formerKeyMetro = '*';
            //modeCircular = true;
        }
        
         //if(key != '#') // q is used to preStart speed of repetio
            //{
        if (key != 'q') // q is used to preStart speed of repetio
        {   
            if (modeStartKeyToFollow == " followSignal2 ")
                {
                textSize(10); 
                for (int i = 0; i < networkSize; i += 1)
                    {
                    phasePatternFollow[i] = positionFromMotorPhase[i] ; // oui ou non + phaseSigna2Followed[i]?
                }
                key = 'q';
            }
        }


         for (int i = 0; i < networkSize; i++)
         { 
            oldPhasePatternFollow[i] = phasePatternFollow[i]%numberOfStep;
            if (phasePatternFollow[i] < 0)
            {
             
                phasePatternFollow[i] = phasePatternFollow[i] + numberOfStep; // easier
                 if (key != 'U')
                 {
                 phasePatternFollow[i] %=  numberOfStep;
                 } 
            } 
            else if (phasePatternFollow[i] >=  0) {
                 if (key != 'U')
                 {
                 phasePatternFollow[i] %=  numberOfStep;
                 } 
               
            }
         }

        // shapeLfoToCount = (shapeLfo*10.0);
        
        // shapeLfoMode = int (shapeLfo * 100.);  // 33 = DOWN=> CounterClockWay  17= UP CW
        
        
        if (shapeLfoMode ==  10)
        {      
            signal2controlDr = (int) map(signal[2], 0, 1, 0, numberOfStep);
        }
        
        if (shapeLfoMode ==  33)
        { 
            signal2controlDr = (int) map(signal[2], 0, 1,  numberOfStep, 0) + numberOfStep;
            signal2controlDr %=  numberOfStep;
        }
        
   
     
        if (measure > 0 && measure < 32) // ADD ROTATION FROM LFO
        {   
            for (int i = 0; i < networkSize; i++)
            { 
            
                phaseSigna2Followed[i] = (int)  map(signal2controlDr, 0, numberOfStep, 0, numberOfStep);
            }
        }

           //  if (measure > 32 && measure < 50) // ADD SLOW ROTATION FROM LFO

        if (measure ==  32) // STOP ROTATION FROM LFO
        {
             //   enableRotation = false;
        }

        if (measure == 35 && beatPrecised ==9)
        {
          //  enableRotation = true;
        }

        if (enableRotation && measure <  91  )
        {
            for (int i = 0; i < networkSize; i++)
        { 
            phaseSigna2Followed[i] = (int)  map(signal2controlDr, 0, numberOfStep, 0, numberOfStep);
        }
        }
 

        if (measure ==  68  && beatTrigged ) // 
        {
            speedDelta =2;
            enableRotation = true;
        }

        if (measure ==  86  && beatTrigged ) // 
        {
                speedDelta = 2;
        }

        if (measure ==  87  && beatTrigged ) // 
        {
            speedDelta = 2;
        }

         for (int i = 0; i < networkSize; i++)
        { 
          // ADDITIOn ROTATION+PHASE  
            phaseSigna2Followed[i] %= numberOfStep;                       
            if (shapeLfoMode !=  0) // if up or down add position
            {
                if (enableRotation)
                  {
                lastActualPosition[i] = (int(phaseSigna2Followed[i]) + int(phasePatternFollow[i])); 
                  }
                
                 if (!enableRotation)
                  {
                lastActualPosition[i] = ( int(phasePatternFollow[i])); 
                  }

                if (key != 'U')
                 {
                lastActualPosition[i] %=  numberOfStep; 
                 }
            } 
        } 

    }
 } 
                
        
        
        
        
    