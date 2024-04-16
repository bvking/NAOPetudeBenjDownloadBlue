void automationForMusicDessine()
    {
   
    // shapeLfoMode = int (shapeLfo * 100);  // 33 = DOWN=> CounterClockWay  17= UP CW
    if (measure <  50)
        {
        formerKeyMetro = '*';
        //modeCircular = true;
    }
    
    if (music_from_ableton_live == " Dessine ")//oldMac blabla2021
    {  
        if (measure ==  1 && beatPrecised == 1 && beatPrecisedTrigged ==  true)
        {  
            speedDelta = 2;
            key = 'ç';
            phaseDirectFromSeq();   
        
              key = 'S';        
            phaseDirectFromSeq();     
        }
        
        if (((measure >=  1 && measure < 3)  && beatTrigged ==  true) || (beatPrecised == 5 + 4 && beatPrecisedTrigged ==  true && measure <= 2))
        {
            key = 'k'; 
            phaseDirectFromSeq();          
        } 
        
        
        if (measure >=  3 && measure < 6 && (beatPrecised ==  1 || beatPrecised ==  5 + 4) && beatPrecisedTrigged) 
        {          
            key = 'S';        
            phaseDirectFromSeq();  
            key = 'S';        
            phaseDirectFromSeq();            
        }
        
                
        if ((measure >=  6 && measure <=  6) && (beatPrecised ==  1 || beatPrecised ==  5 + 4) && beatPrecisedTrigged ==  true) 
        {
            speedDelta = 2;  
            key = 'D';  
            phaseDirectFromSeq();      
            key = 'D';  
            phaseDirectFromSeq();      
        } 
        //

        if (measure ==  7 && beatTrigged ==  true)
            
        {
            // key = '=';
            //phaseDirectToMotor(); 
            
        }
        
        if (measure >=  7 && measure < 11 && (beatPrecised == 5 + 4 || beatPrecised == 1) && beatPrecisedTrigged ==  true) 
            
        {  
            key = 'S';  
            phaseDirectFromSeq();        
            key = 'S';  
            phaseDirectFromSeq();      
            
        }
        
        if ((measure ==  10) && beatPrecised ==  16 && beatPrecisedTrigged ==  true) 
        {   
            // key = '9'; //Alig
            // keyReleased();
        } 
        
        if (measure ==  11 && beatTrigged ==  true)
            
        {
            key = 'ç';
            phaseDirectFromSeq();      
            
        }
        
        if (measure >=  11 && measure <=  11  && beatPrecised > 0 && beatPrecisedTrigged ==  true) 
        {
            speedDelta = 2;
            key = 'd';        
            phaseDirectFromSeq();          
            
        }  
        
        if (measure >=  12 && measure <=  12  && beatPrecised < 17 && beatPrecisedTrigged == true) 
        {
            key = 's';        
            phaseDirectFromSeq();      
            
        } 
        
        if (measure >=  13 && measure <=  13  && beatPrecised > 0 && beatPrecisedTrigged ==  true) 
        {
            speedDelta = 2;
            key = 'd';        
            phaseDirectFromSeq();          
            
        }  
        
        if (measure >=  14 && measure <=  14  && beatPrecised < 17 && beatPrecisedTrigged == true) 
        {
            key = 's';        
            phaseDirectFromSeq();             
        } 
        
        
        if (measure ==  11 && beatTrigged ==  true)
            
        {
          //  key = 'S';
          //  phaseDirectFromSeq();            
        }
        
        
        if (measure >=  15 && measure <=  15  && ((beatPrecised + 1) % 2) ==  0 && beatPrecisedTrigged) 
        {
            speedDelta = 2;          
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
        }
    } 
    
    
    
    
    if (measure >=  17 && measure <=  17  && ((beatPrecised + 1) % 2) ==  0 && beatPrecisedTrigged) 
        {
        speedDelta = 2;
        
        key = 'd';        
        phaseDirectFromSeq();      
        key = 'd';        
        phaseDirectFromSeq();      
        
    }  
    
    if (measure >=  18 && measure <=  18  && ((beatPrecised + 0) % 2) ==  0 && beatPrecisedTrigged) 
        {        
        key = 's';        
        phaseDirectFromSeq();      
        key = 's';        
        phaseDirectFromSeq();      
        
    } 
    
    if (measure ==  19 && beatTrigged )          
        {
        key = 'ç';
        phaseDirectFromSeq();  
        key = 'k';
        phaseDirectFromSeq();  
        key = 'k';
        phaseDirectFromSeq();  
        key = 'D';
        phaseDirectFromSeq();      
        
    }
    
    if (measure >=  19 && measure <=  24  && ((beatPrecised + 1) % 5) ==  0 && beatPrecisedTrigged)
        {  
        key = 'i';        
        phaseDirectFromSeq();      
        
    } 
    
    if (measure ==  23 && beatPrecised ==  16 && beatPrecisedTrigged)
        {   
       // key = 'ç';
       // phaseDirectFromSeq();           
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
        key = 'ç';
        phaseDirectFromSeq(); 
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
    
    if (measure >=  28 && measure < 32 && (beatPrecised == 1 || beatPrecised == 5 || beatPrecised == 9 || beatPrecised == 13) && beatPrecisedTrigged ) 
    {
        
        // key = 'w'; 
        key = 'r';        
        phaseDirectFromSeq();      
        
    } 
    
    
    if (measure ==  32 &&  beatPrecised == 1 && beatPrecisedTrigged )     
    {
        key = 'ç';
        phaseDirectFromSeq(); 
          key = 'k';
        phaseDirectFromSeq();      
            key = 'k';
        phaseDirectFromSeq(); 
        speedDelta = 3;
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
        
        textSize(400);      
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
    
    if (measure >=  35 && measure % 2 ==  0 && measure <=  38 && beatPrecised % 2 ==  0  &&  beatPrecisedTrigged)
        {  
        key = 's';        
        phaseDirectFromSeq();             
    } 
    
    if (measure >=  35 && (measure + 1) % 2 ==  0 && measure<= 38 && beatPrecised % 2 ==  0  && beatPrecisedTrigged) 
        {
        key = 'd';        
        phaseDirectFromSeq();          
    }
    
    if (measure ==  38  && beatPrecisedTrigged ==  true && beatPrecised % 13 ==  0)
        {
        key = 'U';        
        phaseDirectFromSeq();              
    } 
    
    if (measure ==  39  && (beatPrecised == 1 || beatPrecised == 5 || beatPrecised == 9 || beatPrecised == 13) && beatPrecisedTrigged ==  true) 
        {
        key = 'U';        
        phaseDirectFromSeq();              
    }
    
    if (measure ==  40  && (beatPrecised == 1) && beatPrecisedTrigged ==  true) 
        { 
        key = 'ç';     
        phaseDirectFromSeq();        
    }
    
    if (measure ==  40  && (beatPrecised == 13) && beatPrecisedTrigged ==  true) 
        {
        key = 'r';        
        phaseDirectFromSeq();         
        key = 'r';        
        phaseDirectFromSeq();       
        key = 'r';        
        phaseDirectFromSeq();       
        key = 'r';        
        phaseDirectFromSeq();           
    } 
    
    if (measure > 40  && measure <=  43 && (beatPrecised == 1 || beatPrecised == 5 || beatPrecised == 9 || beatPrecised == 13) && beatPrecisedTrigged ==  true) 
        {
        key = 'U';        
        phaseDirectFromSeq();              
    } 
    
    
    
    if (measure ==  43  && (beatPrecised == 15) && beatPrecisedTrigged ==  true) 
        {
        key = 'ç';        
        phaseDirectFromSeq();               
    }
    
    if (measure ==  44 && (beatPrecised + 1) % 5 == 0 && beatPrecisedTrigged ==  true) 
        {  
        key = 's';        
        phaseDirectFromSeq();       
    }
    
    if (measure >=  45 &&  measure <=  48 && (beatPrecised == 1 || beatPrecised == 9) && beatPrecisedTrigged ==  true) 
        
        { //speedDelta = 3;
        key = 'U';        
        //  phaseDirectFromSeq();       
        phaseDirectFromSeq();               
    } 
     
    if (measure ==  49 && beatPrecised == 1 && beatPrecisedTrigged)   
        {    
        key = 'ç';
         phaseDirectFromSeq();        
    }
    if (measure ==  49 && beatPrecised == 2 && beatPrecisedTrigged)   
        {    
        key = 's';
        phaseDirectFromSeq(); 
        key = 's';
        phaseDirectFromSeq(); 
        key = 's';
        phaseDirectFromSeq();       
    }

    if (measure ==  59 && (beatPrecised == 15 || beatPrecised == 15) && beatPrecisedTrigged)   
        {    
        key = 'ç';
        phaseDirectFromSeq();        
    }
    
       
    if (measure >=  60 && (measure+0)%2==0  && beatPrecisedTrigged) // && (beatPrecised ==  1  || beatPrecised ==  9) 
        {
        key = 's';  
        phaseDirectFromSeq();        
    }

     
    if (measure >=  60 && (measure+1)%2==0   && beatPrecisedTrigged) // && (beatPrecised ==  1  || beatPrecised ==  9)
        {
        key = 'd';  
        phaseDirectFromSeq();        
    }
    
    
    // based on followSignaSampledOppositeWay   
    if (measure >= 0)
    { 
        if (measure ==  49 && beatTrigged)
            { 
            speedDelta = 2;
            formerKeyMetro = '$';
            //modeCircular = true;
        }
        
        if (measure ==  60 && beatTrigged)
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
                    phasePatternFollow[i] = positionFromMotorPhase[i]; //
                }
                key = 'q';
            }
        }
        //key = '#'; 
          //}
        for (int i = 0; i < networkSize; i++)
        { 
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
        
      //  shapeLfoMode = int (shapeLfo * 100.);  // 33 = DOWN=> CounterClockWay  17= UP CW
        
        
        if (shapeLfoMode ==  10)
        {      
            signal2controlDr = (int) map(signal[2], 0, 1, 0, numberOfStep);
        }
        
        if (shapeLfoMode ==  33)
        { 
            signal2controlDr = (int) map(signal[2], 0, 1,  numberOfStep, 0) + numberOfStep;
            signal2controlDr %=  numberOfStep;
        }
        
   
        
        for (int i = 0; i < networkSize; i++)
        { 
            
            if (measure > 28 && measure < 32) // ADD ROTATION FROM LFO
            {
                phaseSigna2Followed[i] = (int)  map(signal2controlDr, 0, numberOfStep, 0, numberOfStep);
            }

             if (measure > 32 && measure < 50) // ADD ROTATION FROM LFO
            {
                phaseSigna2Followed[i] = (int)  map(signal2controlDr, 0, numberOfStep*4, 0, numberOfStep);
            }

            
            if (measure >=  50 && measure <  68  ) //
            {
                phaseSigna2Followed[i] = (int)  map(signal2controlDr, 0, numberOfStep, 0, numberOfStep);
            }

            if (measure ==  68  && beatTrigged ) // 
            {
            speedDelta =5;
            }

            if (measure >=  68 && measure <=  71   ) // ADD DOUBLE ROATATION  FROM LFO
            {
                phaseSigna2Followed[i] = (int)  map(signal2controlDr, 0, numberOfStep/2, 0, numberOfStep/1);
            }

             if (measure ==  72  && beatTrigged ) // 
            {
            speedDelta =6;
            }

              if (measure >=  72 && measure <=  75   ) // ADD DOUBLE ROATATION  FROM LFO
            {
                phaseSigna2Followed[i] = (int)  map(signal2controlDr, 0, numberOfStep/2, 0, numberOfStep/1);
            } 


              if (measure ==  76  && beatTrigged ) // 
            {
            speedDelta =7;
            }

            if (measure >=  76 && measure <=  78   ) // ADD DOUBLE ROATATION  FROM LFO
            {
                phaseSigna2Followed[i] = (int)  map(signal2controlDr, 0, numberOfStep/2, 0, numberOfStep/1);
            } 

            if (measure ==  78  && beatTrigged ) // 
            {
            speedDelta =6;
            }

            if (measure >=  78 && measure <=  80  ) // ADD DOUBLE ROATATION  FROM LFO
            {
                phaseSigna2Followed[i] = (int)  map(signal2controlDr, 0, numberOfStep/2, 0, numberOfStep/1);
            } 

            if (measure ==  80  && beatTrigged ) // 
            {
            speedDelta = 5;
            }

            if (measure >=  80 && measure <  84  ) // ADD DOUBLE ROATATION  FROM LFO
            {
                phaseSigna2Followed[i] = (int)  map(signal2controlDr, 0, numberOfStep/2, 0, numberOfStep/1);
            } 






          // ADDITIOn ROTATION+PHASE  
            phaseSigna2Followed[i] %= numberOfStep; 
            
            
            if (shapeLfoMode !=  0 ) // if up or down add position
            {
                lastActualPosition[i] = (int(phaseSigna2Followed[i]) + int(phasePatternFollow[i])); 
                  if (key != 'U')
                 {
                lastActualPosition[i] %=  numberOfStep; 
                 }
            } 
        }
    } 
        
        
        
    } 
        
        
        
        
        
    