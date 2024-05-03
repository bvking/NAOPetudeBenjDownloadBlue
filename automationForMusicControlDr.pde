int oldOldSignal2controlDr, oldSignal2controlDr, signal2controlDr;  // phasor signal from AbletonLive

void automationForMusicControlDr()
{
  formerKeyMetro = '*';

        textSize (50);

    if (music_from_ableton_live == " controlDr ")//oldMac blabla2021
    {  
      if ((measure==1 || measure==2) && beatPrecised%4==0 && beatPrecisedTrigged==true)
       {   
          //  formerKey = 's';        
        }

     if ( (measure>=3 && measure<=4) && beatPrecised%9==0 && beatPrecisedTrigged==true)
       {     
            formerKey = 'e';              
       }
    } 
    phaseDirectFromSeq(); 
    //key = '#'; 

    // based on followSignaSampledOppositeWay    
  
     if(formerKey != 'q') // q is used to preStart speed of repetio
        {
          if(formerKey != 'q') // q is used to preStart speed of repetio
             {   
             if (modeStartKeyToFollow == " followSignal2 ")
                 {
                  textSize(10); 
                    for (int i = 0; i < networkSize; i += 1)
                      {
                        phasePatternFollow[i] = positionFromMotorPhase[i]; //
                      }
             formerKey = 'q';
                 }
              }
           formerKey = 'q'; 
        }
          for (int i = 0; i < networkSize; i++)
          { 
           if (phasePatternFollow [i]<0)
            {
                phasePatternFollow [i] = phasePatternFollow[i] +numberOfStep; // easier
                phasePatternFollow [i] %=  numberOfStep;
            } 
           else if (phasePatternFollow [i] >=  0)
            {
                phasePatternFollow [i] %=  numberOfStep;
            }
          }
  
      //shapeLfoMode = (int) shapeLfo*10;  // DO NO TURN WITH       30 = DOWN=> CounterClockWay  10= UP CW

      if (shapeLfoMode==10)
      {      
      signal2controlDr= (int) map  (signal[2], 0, 1, 0, numberOfStep);
       }

      if (shapeLfoMode==30)
      { 
      signal2controlDr= (int) map  (signal[2], 0, 1,  numberOfStep, 0)+numberOfStep;
      signal2controlDr%=numberOfStep;
      }
             
       for (int i = 0; i < networkSize; i++)
       {      
           phaseSigna2Followed[i]= (int)  map (signal2controlDr, 0, numberOfStep, 0, numberOfStep);

          if (shapeLfoMode==10 || shapeLfoMode==30) // if up or down add position
           {   
           lastActualPosition [i] = (  int (phaseSigna2Followed[i]) +int ( phasePatternFollow[i])); 
           lastActualPosition [i]%=numberOfStep; 
           } 
        } 
}
