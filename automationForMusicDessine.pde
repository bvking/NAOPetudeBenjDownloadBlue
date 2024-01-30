void automationForMusicMouvement()
 {

    if (music_from_ableton_live == " Dessine ")//oldMac blabla2021
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

      if (measure>=3 && measure< 6 && beatPrecisedTrigged==true) 
         {
         // net.phase[0]=map (positionFromLive, 0, 1, -PI, PI);
             key = 's'; //1/16 grand D      
             phaseDirectToMotor();
             key = 's'; //1/16 grand D      
             phaseDirectToMotor();
         }

    
      
       if ((measure>=6 && measure<=6) && (beatPrecised ==1 || beatPrecised ==5+4 ) && beatPrecisedTrigged==true) 
       {   speedDelta = 3;  
             key = 'D';  
             phaseDirectToMotor();

           //  key = 'D';  
           //  phaseDirectToMotor();
           //  key = 'D';  
          //   phaseDirectToMotor();
       } 
      


       if (measure==7 && beatTrigged==true)

       {             
            key = '9'; //Alig graphic
            keyReleased();

             key = '=';
            keyReleased();
         
          }
        
        if (measure>=7 && measure<11 && (beatPrecised == 5+4 || beatPrecised == 1) && beatPrecisedTrigged==true) 

        {   key = 'S';  
           phaseDirectToMotor();  
         
         }

        if ((measure==10) && beatPrecised ==16 && beatPrecisedTrigged==true) 
        {   
             key = '9'; //Alig
             keyReleased();
       } 

       if (measure==11 && beatTrigged==true)

       {    
          //  key = ';'; // align direct phase motor
          //  keyReleased();

            key = '=';
            keyReleased();
         
       }

       if (measure>=11 && measure<=16  && beatPrecisedTrigged==true) 
       {
        speedDelta=2;

             key = 's';        
             phaseDirectToMotor();
             key = 's';        
             phaseDirectToMotor();
       }  

       if (measure>=17 && measure<=23  && beatPrecisedTrigged==true) 
       {
             key = 'd';        
             phaseDirectToMotor();
             key = 'd';        
             phaseDirectToMotor();
       } 

            
       if (measure>=23 && measure<=24 && (beatPrecised == 1 || beatPrecised == 5 || beatPrecised == 9 || beatPrecised == 13) && beatPrecisedTrigged==true) 

        {   key = 'w';  
           phaseDirectToMotor();  
         
         } 

        
       if (measure==24  &&  beatPrecised == 16 && beatPrecisedTrigged==true) 
       {
         
            key= '=';
            keyReleased();
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
       } 

      if (measure>=25 && measure<=28  &&  (beatPrecised == 5 || beatPrecised == 13) && beatPrecisedTrigged==true) 
       {     
             key = 'D';        
             phaseDirectToMotor();    
            key = 'D';        
             phaseDirectToMotor();   
       } 


       if (measure>=28 && measure<32 && beatPrecisedTrigged==true)  
       {     
           int ratioSpeed = 1; 
            if (frameCount%ratioSpeed==0)
             {
              for (int i = 0; i < networkSize; i++)
              {
              lastActualPosition[i]+= (int)  map ( PI*ratioSpeed/5/16, 0, TWO_PI, 0, numberOfStep);
              }
             }
        }
      
       if (measure==29 &&  beatPrecised == 1 && beatPrecisedTrigged==true)  
       {     
            key= '=';
            keyReleased();
       }

      if (measure>=28 && measure<32 && (beatPrecised == 1 || beatPrecised == 5 || beatPrecised == 9 || beatPrecised == 13) && beatPrecisedTrigged==true) 
       {
           //formerKeyMetro = '$';
            key = 'w';  
           phaseDirectToMotor();  
       } 

        
        if (measure==32 &&  beatPrecised == 1 && beatPrecisedTrigged==true)     
       {     
            key= '=';
            keyReleased();
          }



            if (measure>=32 && measure%2==0 && measure<=35  ) // &&  beatPrecisedTrigged==true
            {  
            int repeatEachNumberOfFrame = 5; 
            if (frameCount%repeatEachNumberOfFrame==0)
             {    
             key = 'r';        
             phaseDirectToMotor(); 
              }    
            } 
 
            if (measure>=32 && (measure+1)%2==0 && measure<=35 ) //  &&  beatPrecisedTrigged==true) 
            {  
              int repeatEachNumberOfFrame = 5; 
             if (frameCount%repeatEachNumberOfFrame==0)
             {       
              key = 'R';        
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

                if (measure==40  && (beatPrecised == 9) && beatPrecisedTrigged==true) 
            { 
             key= '=';
            keyReleased();
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

            if (measure>40  && measure<=49 && (beatPrecised == 1 || beatPrecised == 5 || beatPrecised == 9 || beatPrecised == 13) && beatPrecisedTrigged==true) 
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
             key = '=';        
             phaseDirectToMotor();                   
            }

           if (measure==44) 
           {
            int repeatEachNumberOfFrame = 5; 
             if (frameCount%repeatEachNumberOfFrame==0)
             { 
             key = 'r';        
             phaseDirectToMotor();  
            }          
           }

           if (measure>=44 &&  measure<=60 && (beatPrecised == 1 || beatPrecised == 9 ) && beatPrecisedTrigged==true) 
           { speedDelta = 3;
             key = 'u';        
             phaseDirectToMotor();                
           } 

           if (measure>=51 && (beatPrecised >= 13 )   
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

         if (measure%4==0 && beatTrigged==true)
         {
           
          //   key = 'F';keyReleased();
          //   key = 'F';keyReleased();

         }

        // key = 'F';keyReleased();

    }  
  
} 


   
 

