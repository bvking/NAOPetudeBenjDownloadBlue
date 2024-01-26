void automationForMusicMouvement()
 {

    if (music_from_ableton_live == " Dessine ")//oldMac blabla2021
    { 
      speedDelta=4;
   
      if ((measure==1 && beatTrigged==true) ||  (beatPrecised == 2 && beatPrecisedTrigged==true && measure <1 ))

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
         }

      if (measure==4  && beatPrecised ==5+4+4 &&beatPrecisedTrigged==true) 
         {
         // net.phase[0]=map (positionFromLive, 0, 1, -PI, PI);
             key = 'd'; //1/16 grand D      
             phaseDirectToMotor();
         }
      


      if (measure>=5 && measure< 25 &&  (beatPrecised ==1 || beatPrecised ==5 || beatPrecised ==5+4 || beatPrecised ==5+4+4  ) && beatPrecisedTrigged==true) 
         {
         // net.phase[0]=map (positionFromLive, 0, 1, -PI, PI);
             key = 'd'; //1/16 grand D      
             phaseDirectToMotor();
         }

      if (measure==14 && beatPrecised ==14  && beatPrecisedTrigged==true) 
       {   
             key = 'D';  
             phaseDirectToMotor();

           //  key = 'D';  
           //  phaseDirectToMotor();
           //  key = 'D';  
          //   phaseDirectToMotor();
       } 

    
      
       if ((measure>=6 && measure<=6) && (beatPrecised ==1 || beatPrecised ==5+4 ) && beatPrecisedTrigged==true) 
       {   
             key = 'D';  
             phaseDirectToMotor();

           //  key = 'D';  
           //  phaseDirectToMotor();
           //  key = 'D';  
          //   phaseDirectToMotor();
       } 
      


       if (measure==7 && beatTrigged==true)

       {  //  key = ';'; // accelre le frame/s
          //  keyReleased();

            key = '=';
            keyReleased();
            
            key = '9'; //Alig graphic
            keyReleased();
         
          }
        
        if (measure>=7 && measure<11 && (beatPrecised == 5+4 || beatPrecised == 1) && beatPrecisedTrigged==true) 

        {   key = 's';  
           phaseDirectToMotor();  
         
         }

        if ((measure==10) && (beatPrecised ==16) && beatPrecisedTrigged==true) 
        {   
             key = '9'; //Alig
             keyReleased();
       } 
        
        if (measure==11 && beatTrigged==true)

        {    
            key = ';'; // align direct phase motor
            keyReleased();

            key = '=';
            keyReleased();
         
         }

       if (measure>=11 && measure<=16  && beatPrecisedTrigged==true) 
       {
             key = 'd';        
             phaseDirectToMotor();
       }  

       if (measure>=17 && measure<=22  && beatPrecisedTrigged==true) 
       {
             key = 's';        
             phaseDirectToMotor();
       }  

     /*  

        if ((measure>=11 && measure<=14) && beatPrecisedTrigged==true)
       {
             key = 'r'; //Alig        
             phaseDirectToMotor();
       } 
       if ((measure>=15 && measure<=18) && beatPrecisedTrigged==true)
       {
             key = 'R'; //Alig        
             phaseDirectToMotor();
       }  
        if ((measure>=19 && measure<=22) && beatPrecisedTrigged==true)
       {
             key = 'w'; //Alig        
             phaseDirectToMotor();
       } 
       if ((measure>=23 && measure<=26) && beatPrecisedTrigged==true)
       {
             key = 'W'; //Alig        
             phaseDirectToMotor();
       }  

           if ((measure>=27 && measure<=30) && beatPrecisedTrigged==true)
       { 
             formerKeyMetro = '*';
             key = 'W'; //Alig        
             phaseDirectToMotor();
       } 
       if ((measure>=31 && measure<=34) && beatPrecisedTrigged==true)
       {
             key = 'w'; //Alig        
             phaseDirectToMotor();
       } 

       */ 

         

      if (measure%2==0 && beatTrigged==true)
          {
           //  key = 'd'; //Alig
            // key = '9'; //Alig
            // phaseDirectToMotor();

           //  keyReleased();


          }
     // phaseDirectToMotor() 

      if ((measure+1)%(2+0)==0 && beatTrigged==true)
          {
            // key = 'f'; 
            //  key = 'D';
           //    phaseDirectToMotor();
            // key = '9'; //Alig
            // keyReleased();


          }


      if ((measure>=3 && measure+1%3==0) && beatTrigged==true)
         {
          
      //    key = 'P'; 
      //    keyReleased(); // decale une à une et revient dans l'alignement
         }

         /*

        if (measure== 7 && beatPrecised == 1 && beatPrecisedTrigged==true)
         {
            for (int i = 0; i < networkSize; i++) {    
            net.naturalFrequency[i]=0.93;
           }
         }

        if ((measure>=8 && measure<=342 ) && beatPrecised == 2 && beatPrecisedTrigged==true)
          {
           key = 'u'; 
           keyReleased(); // decale une à une et revient dans l'alignement
          }
        

        if (measure%25==0 && beatTrigged==true)
         {
             key = '9'; //Alig
             keyReleased();
            // key = 'F'; //Alig
            // keyReleased();
             key = 'F'; //Alig
             keyReleased();
         }
        
         if ((measure== 25) && beatPrecised == 1 && beatPrecisedTrigged==true)
          {
           formerKeyMetro = '*';
          // keyReleased(); // decale une à une et revient dans l'alignement
           for (int i = 0; i < networkSize; i++)
                 {    
                 net.naturalFrequency[i]=0.5;
                 }
          }
            if (measure>25 && beatPrecised == 2 && beatPrecisedTrigged==true)
          {
           key = 'U'; 
           keyReleased(); // decale une à une et revient dans l'alignement
          }

*/

            if (measure%4==0 && beatTrigged==true)
         {
           
          //   key = 'F';keyReleased();
          //   key = 'F';keyReleased();

         }

        // key = 'F';keyReleased();

   } 
} 
   // key='1'; keyReleased();

   
 

