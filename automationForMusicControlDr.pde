float oldOldSignal2controlDr, oldSignal2controlDr, signal2controlDr;  // phasor signal from AbletonLive

void mapSignal2ToMotor() {
    oldOldSignal2controlDr=oldSignal2controlDr;
    oldSignal2controlDr=signal2controlDr;
    signal2controlDr= map (signal[2], 0, 1, 0, numberOfStep);

 
        for(int i = 0; i <  networkSize - 0; i += 1)
         { 
         
            OldSpecialPhase[i] = specialPhase[i]; 
            positionToMotor[i] = specialPhase[i] % numberOfStep;
            text(oldPositionToMotor[i] + " " + positionToMotor[i] , -800, -500 + (50 * i));  
        }
 

    if (modeStartKeyToFollow == " controlDr ")
    {

        for (int i = 0; i <  networkSize; i += 1)
        { 
       
                positionToMotor[i] = ((int) map(signal2controlDr, 0, numberOfStep, 0, numberOfStep)); //
                newPosF[i] = positionToMotor[i] % 6400;

                if (oldPositionToMotor[i] > positionToMotor[i])
                {
                positionToMotor[i] = ((int) map(signal2controlDr, 0, numberOfStep, numberOfStep, 0)); //
                newPosF[i] = positionToMotor[i] % 6400;
                }
        }
    }

}








/*

  for (int i = 0; i < networkSize; i++) {
  

    if (revLfo[i]!=0  && (positionToMotor[i] >  0) ) { // number of revLfoolution is even and rotation is clock wise
      dataMappedForMotorisedPosition[i]= int (map (positionToMotor[i], 0, numberOfStep, 0, numberOfStep))+ (revLfo[i]*numberOfStep);
    }

    if (revLfo[i]!=0  && (positionToMotor[i] <  0)) { // number of revLfoolution is even and rotation is Counter clock wise          // pos[i]= int (map (positionToMotor[i], 0, -numberOfStep, 0,  numberOfStep))+ (revLfo[i]*numberOfStep);
      dataMappedForMotorisedPosition[i]= int (map (positionToMotor[i], 0, -numberOfStep, numberOfStep, 0)) +(revLfo[i]*numberOfStep);       //   print ("pos "); print (i); print (" ");println (pos[i]);
    }

    if (revLfo[i]==0 && (positionToMotor[i] < 0) ) { //  number of revLfoolution is 0 and rotation is counter clock wise
      dataMappedForMotorisedPosition[i]= int (map (positionToMotor[i], 0, -numberOfStep, numberOfStep, 0));
    }
    if  (revLfo[i]==0 && (positionToMotor[i] > 0) ) {  //  number of revLfoolution is 0 and rotation is clock wise
      dataMappedForMotorisedPosition[i]= int (map (positionToMotor[i], 0, numberOfStep, 0, numberOfStep));                //      print ("pos "); print (i); print (" CW revLfo=0 ");println (pos[i]);
    }

    recordLastDataOfMotorPosition[i]=  dataMappedForMotorisedPosition[i];
  }

  countRevsContinue();
  */

void automationForMusicControlDr()
 {
//
    if (music_from_ableton_live == " controlDr ")
    {  
      if (measure==1 && beatTrigged==true)
       speedDelta=2;

         { // modeCircular=true;
             key = '°'; //no speed
             keyReleased();
             key = '9'; //Alig
             keyReleased();
             memoryi=networkSize-1;
           //   key = 'k'; //Alig
           //  keyReleased();
     
           //   key = 'A'; //memory=? net.naturalFrequency[memoryi]= 0.25
           //    net.naturalFrequency[memoryi]= 0.93;//4.68/2; // 124 bpm
         }

       if (((measure>=1 && measure <=3 )  && beatTrigged==true) ||  (beatPrecised == 5+4 && beatPrecisedTrigged==true && measure <=2 ))
       {    
             key = 'k'; 
             keyReleased();       
           //  phaseDirectToMotor();

           //  key = 'S';        
           //  phaseDirectToMotor();
       } 


       if (measure==3 && beatTrigged==true)

         { // key = ';'; // align direct phase motor
           // keyReleased();

           // key = '=';
           // keyReleased();
            
         //   key = '9'; //Alig graphic
         //   keyReleased();
         
          }

         

      if (measure>=3 && measure< 6 ) 
         {
             int repeatEachNumberOfFrame = 30; 
              if (frameCount%repeatEachNumberOfFrame==0)
             {  
             key = 's';        
             phaseDirectToMotor();
             }   
            
         }

    
      
       if ((measure>=6 && measure<=6) && (beatPrecised ==1 || beatPrecised ==5+4 ) && beatPrecisedTrigged==true) 
       {   
             speedDelta = 2;  
             key = 'D';  
             phaseDirectToMotor();
             key = 'D';  
             phaseDirectToMotor();
       } 
//
      


       if (measure==7 && beatTrigged==true)

       {             
             key = '=';
            keyReleased();
         
          }
        
        if (measure>=7 && measure<11 && (beatPrecised == 5+4 || beatPrecised == 1) && beatPrecisedTrigged==true) 

        {  
           key = 'S';  
           phaseDirectToMotor();  
           key = 'S';  
           phaseDirectToMotor();
         
         }

        if ((measure==10) && beatPrecised ==16 && beatPrecisedTrigged==true) 
        {   
             key = '9'; //Alig
             keyReleased();
       } 

       if (measure==11 && beatTrigged==true)

       {    
            key = '=';
            keyReleased();
         
       }

       if (measure>=11 && measure<=12  && beatPrecised>0) 
       {
        speedDelta=2;

           int repeatEachNumberOfFrame = 1; 
              if (frameCount%repeatEachNumberOfFrame==0)
             {  
             key = 'd';        
             phaseDirectToMotor();
              key = 'd';        
             phaseDirectToMotor();
             }   
       }  

       if (measure>=13 && measure<=14  && beatPrecised<17) 
       {
            int repeatEachNumberOfFrame = 1; 
              if (frameCount%repeatEachNumberOfFrame==0)
             {  
             key = 's';        
             phaseDirectToMotor();
               key = 's';        
             phaseDirectToMotor();
             }   
       } 


       if (measure>=15 && measure<=16  && beatPrecised>0) 
       {
        speedDelta=2;

           int repeatEachNumberOfFrame = 1; 
              if (frameCount%repeatEachNumberOfFrame==0)
             {  
             key = 'd';        
             phaseDirectToMotor();
              key = 'd';        
             phaseDirectToMotor();
             }   
       }  

       if (measure>=17 && measure<=18  && beatPrecised<17) 
       {
            int repeatEachNumberOfFrame = 1; 
              if (frameCount%repeatEachNumberOfFrame==0)
             {  
             key = 's';        
             phaseDirectToMotor();
             key = 's';        
             phaseDirectToMotor();
             }   
       } 

        if (measure==17 && beatTrigged==true)

       {    
         //   key = 'w';
         //   phaseDirectToMotor();
         //   key = 'w';
         //   phaseDirectToMotor();
         
       }

        if (measure>=17 && measure<=20  && beatPrecisedTrigged==true) 
       {
        speedDelta=2;

           int repeatEachNumberOfFrame = 1; 
              if (frameCount%repeatEachNumberOfFrame==0)
             {  
             key = 'd';        
             phaseDirectToMotor();
              key = 'd';        
             phaseDirectToMotor();
             }   
       }  

       if (measure>=20 && measure<=23  && beatPrecisedTrigged==true)
       {
            int repeatEachNumberOfFrame = 1; 
              if (frameCount%repeatEachNumberOfFrame==0)
             {  
             key = 's';        
             phaseDirectToMotor();
              key = 's';        
             phaseDirectToMotor();
             }   
       } 

       if (measure==23 && beatPrecised==15) 

       {    key = 'ç';
          phaseDirectToMotor();
         
       }

            
       if (measure>=24 && measure<=24 && beatPrecised == 1 || beatPrecised == 5 || beatPrecised == 9 && beatPrecisedTrigged==true )
         //  || beatPrecised == 5 || beatPrecised == 9 || beatPrecised == 13) && beatPrecisedTrigged==true
        { 
             {  
          //   key = 'w';   
              key = 'f';        
             phaseDirectToMotor();
          
             }  
         
         } 

        
       if (measure==24  &&  beatPrecised == 13 && beatPrecisedTrigged==true) 
       {   
           
              key = '=';
              keyReleased();
        } 

       if (measure==24  &&  beatPrecised == 15 && beatPrecisedTrigged==true) 
       { 

               key = 'S';        
               phaseDirectToMotor(); 
              speedDelta=3;
       } 

         
       if (measure>=25 && measure<=28  &&   (beatPrecised == 1 || beatPrecised == 9) && beatPrecisedTrigged==true) 
       {     
             key = 'S';        
             phaseDirectToMotor();    
             key = 'S';        
             phaseDirectToMotor();   
               key = 'S';        
             phaseDirectToMotor();   
       } 

      if (measure>=25 && measure<=28  &&  (beatPrecised == 5 || beatPrecised == 13) && beatPrecisedTrigged==true) 
       {     
              key = 'D';        
              phaseDirectToMotor();    
              key = 'D';        
             phaseDirectToMotor(); 
                key = 'D';        
             phaseDirectToMotor();   
       } 


       if (measure>28 && measure<32 && beatPrecisedTrigged==true)  
       {     
           int ratioSpeed = 1; 
            if (frameCount%ratioSpeed==0)
             {
              for (int i = 0; i < networkSize; i++)
              {
         //     lastActualPosition[i]+= (int)  map ( PI*ratioSpeed/5/16, 0, TWO_PI, 0, numberOfStep);
              }
             }
        }
      
       if (measure==29 &&  beatPrecised == 1 && beatPrecisedTrigged==true)  
       {     
         //   key= '=';
         //   keyReleased();
       }

      if (measure>=28 && measure<32 && ( beatPrecised == 1 || beatPrecised == 5 || beatPrecised == 9 || beatPrecised == 13) && beatPrecisedTrigged==true) 
       {
             {  
            // key = 'w'; 
             key = 'r';        
             phaseDirectToMotor();
             }  
       } 

        
        if (measure==32 &&  beatPrecised == 1 && beatPrecisedTrigged==true)     
       {     
              key= 'ç';
             phaseDirectToMotor();
             speedDelta = 3;
          }



            if (measure>=32 && measure%2==0 && measure<=35  ) // &&  beatPrecisedTrigged==true
            {  
            int repeatEachNumberOfFrame = 5; 
            if (frameCount%repeatEachNumberOfFrame==0)
             {    
              textSize(200);
             key = 'R';        
             phaseDirectToMotor(); 
              key = 'R';        
             phaseDirectToMotor(); 
              }    
            } 
 
            if (measure>=32 && (measure+1)%2==0 && measure<=35 ) //  &&  beatPrecisedTrigged==true) 
            {  
              int repeatEachNumberOfFrame = 5; 
             if (frameCount%repeatEachNumberOfFrame==0)
             { 
                 textSize(400);      
              key = 'r';        
              phaseDirectToMotor(); 
                key = 'r';        
              phaseDirectToMotor(); 
              }    
            }

            if (measure==34 && beatPrecised>=8 )
            {  
             int repeatEachNumberOfFrame = 1; 
              if (frameCount%repeatEachNumberOfFrame==0)
             {  
             key = 's';        
             phaseDirectToMotor();   
             key = 's';        
             phaseDirectToMotor();          
             }         
            }  

            if (measure>=35 && measure%2==0 && measure<=38 )
            {  
             int repeatEachNumberOfFrame = 1; 
              if (frameCount%repeatEachNumberOfFrame==0)
             {  
             key = 's';        
             phaseDirectToMotor();   
             key = 's';        
             phaseDirectToMotor();          
             }         
            } 

            if (measure>=35 && (measure+1)%2==0 && measure<=38 ) 
            {
             int repeatEachNumberOfFrame = 1; 
              if (frameCount%repeatEachNumberOfFrame==0)
             {  
             key = 'd';        
             phaseDirectToMotor();    
             key = 'd';        
             phaseDirectToMotor(); 
             }         
            }

            if (measure==38  && beatPrecisedTrigged==true && beatPrecised%13==0)
            {
            key = 'u';        
            phaseDirectToMotor();        
            } 

            if (measure==39  && (beatPrecised == 1 || beatPrecised == 5 || beatPrecised == 9 || beatPrecised == 13) && beatPrecisedTrigged==true) 
            {
            key = 'u';        
            phaseDirectToMotor();        
            }

            if (measure==40  && (beatPrecised == 1) && beatPrecisedTrigged==true) 
            { 
             key= 'ç';
           
             phaseDirectToMotor();  
             }

            if (measure==40  && (beatPrecised == 13) && beatPrecisedTrigged==true) 
            {
             key = 'r';        
             phaseDirectToMotor();   
             key = 'r';        
             phaseDirectToMotor(); 
              key = 'r';        
             phaseDirectToMotor(); 
              key = 'r';        
             phaseDirectToMotor();     
            } 

            if (measure>40  && measure<=43 && (beatPrecised == 1 || beatPrecised == 5 || beatPrecised == 9 || beatPrecised == 13) && beatPrecisedTrigged==true) 
            {
            key = 'u';        
            phaseDirectToMotor();        
            } 

            /* 
            if (measure>=39 && (measure+1)%2==0 && measure<=43  &&  (beatPrecised < 16)) //  &&  beatPrecisedTrigged==true
            {
             int repeatEachNumberOfFrame = 2; 
             if (frameCount%repeatEachNumberOfFrame==0)
             {  
             key = 'd';        
             phaseDirectToMotor();         
             }         
            }        
            
            if (measure>=40 && (measure+0)%2==0 && measure<=43   &&  (beatPrecised < 16)) // &&  beatPrecisedTrigged==true
            {
             int repeatEachNumberOfFrame = 2; 
              if (frameCount%repeatEachNumberOfFrame==0)
              { 
              key = 's';        
              phaseDirectToMotor();
              }       
            }  
          */

            if (measure==43  &&  (beatPrecised == 15) && beatPrecisedTrigged==true) 
            {
         //    key = '=';        
        //     phaseDirectToMotor();                   
            }

           if (measure==44 && beatPrecisedTrigged==true) 
           {
            int repeatEachNumberOfFrame = 1; 
             if (frameCount%repeatEachNumberOfFrame==0)
             { 
    
             key = 'f';  
             phaseDirectToMotor();  
            }          
           }

           if (measure>=45 &&  measure<=50 && (beatPrecised == 1 || beatPrecised == 9 ) && beatPrecisedTrigged==true) 
           { //speedDelta = 3;
             key = 'u';        
             phaseDirectToMotor();                
           } 

              if (measure==51 && beatPrecised ==1 && beatPrecisedTrigged==true)   // align
           { 
             key = 'ç';        
             phaseDirectToMotor(); 
              }    

            if (measure==51 && beatPrecised ==9 && beatPrecisedTrigged==true)   //pas trop car revient en arriere
           { 
             
             key = 'r';        
             phaseDirectToMotor();   
             key = 'r';        
             phaseDirectToMotor(); 
             key = 'r';        
             phaseDirectToMotor(); 
             key = 'r';        
             phaseDirectToMotor();  
              key = 'r';        
             phaseDirectToMotor();   
             key = 'r';        
             phaseDirectToMotor(); 
             key = 'r';        
             phaseDirectToMotor(); 
             key = 'r';        
             phaseDirectToMotor();  
         
             } 

           if (measure==51 && beatPrecised >= 13 )   // ROTATION
           {    
            int repeatEachNumberOfFrame = 1; 
            if (frameCount%repeatEachNumberOfFrame==0)
             {
              for (int i = 0; i < networkSize; i++)
              {
              lastActualPosition[i]+= (int)  map ( PI*repeatEachNumberOfFrame/5/16, 0, TWO_PI, 0, numberOfStep);
              }
             }
           }

              if (measure>=52 && measure <635 )    // ROTATION pas trop vite
           {    
            int repeatEachNumberOfFrame = 1; 
            if (frameCount%repeatEachNumberOfFrame==0)
             {
              for (int i = 0; i < networkSize; i++)
              {
              lastActualPosition[i]+= (int)  map ( PI*3/5/16, 0, TWO_PI, 0, numberOfStep);
              }
             }
           }



         if (measure>=52 && (measure+1)%2==0 && (beatPrecised+1)%3==0 && beatPrecisedTrigged==true)
         {
             key = 'U';        
             phaseDirectToMotor(); 
           
          //   key = 'F';keyReleased();
          //   key = 'F';keyReleased();

         }

        // key = 'F';keyReleased();

    }  
  
} 


   
 
