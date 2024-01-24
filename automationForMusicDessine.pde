void automationForMusicMouvement()
 {

    if (music_from_ableton_live == " Dessine ")// blabla
    {
   
      if (measure==1 && beatTrigged==true)
         {   key = '°'; //no speed
             keyReleased();
             key = '9'; //Alig
             keyReleased();
             memoryi=networkSize-1;
     
           //   key = 'A'; //memory=? net.naturalFrequency[memoryi]= 0.25
          //    net.naturalFrequency[memoryi]= 0.93;//4.68/2; // 124 bpm
         }
      /*
      if (measure>=1) 
         {
          net.phase[0]=map (positionFromLive, 0, 1, -PI, PI);
         }
      */  

      if (measure%2==0 && beatTrigged==true)
          {
             key = 'd'; //Alig
            // key = '9'; //Alig
            phaseDirectToMotor();

           //  keyReleased();


          }
     // phaseDirectToMotor() 

      if ((measure+1)%(2+0)==0 && beatTrigged==true)
          {
            // key = 'f'; 
              key = 'D';
               phaseDirectToMotor();
            // key = '9'; //Alig
            // keyReleased();


          }


      if ((measure>=3 && measure+1%3==0) && beatTrigged==true)
         {
          
      //    key = 'P'; 
      //    keyReleased(); // decale une à une et revient dans l'alignement
         }

      if (measure== 7 && beatPrecised == 1 && beatPrecisedTrigged==true)
         {
          
          //  key='1'; keyReleased();

           // key = '°'; // STOP frequency
          // keyReleased();

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
             key = 'F'; //Alig
             keyReleased();
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

            if (measure%4==0 && beatTrigged==true)
         {
           
             key = 'F';keyReleased();
             key = 'F';keyReleased();

         }

        // key = 'F';keyReleased();

   } 
} 
   // key='1'; keyReleased();

   
 

