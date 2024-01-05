void automationForMusicMouvement()
 {

    if (music_from_ableton_live == " mouvement ")
    {

      if (measure==324 && beatTrigged==true)
         {

             key = '9'; //Alig
             keyReleased();
             memoryi=networkSize-1;
     
              key = 'A'; //memory=? net.naturalFrequency[memoryi]= 0.25
              net.naturalFrequency[memoryi]= 0.5;//4.68/2; // 124 bpm
         }

         if (measure%4==0 && beatTrigged==true)
         {
             key = '9'; //Alig
             keyReleased();

         }


         if ((measure>=325 && measure<=327) && beatTrigged==true)
          {
          key = 'P'; 
          keyReleased(); // decale une à une et revient dans l'alignement
         }

        if (measure==327 && beatPrecised == 1 && beatPrecisedTrigged==true)
         {
            key='1'; keyReleased();

           // key = '°'; // STOP frequency
          // keyReleased();

            for (int i = 0; i < networkSize; i++) {    
           // net.naturalFrequency[i]=0.5;
           }
         }

        if ((measure>=328 && measure<=342 ) && beatPrecised == 2 && beatPrecisedTrigged==true)
          {
           key = 'u'; 
           keyReleased(); // decale une à une et revient dans l'alignement
          }

        // key = 'F';keyReleased();

   }
   // key='1'; keyReleased();
 }

