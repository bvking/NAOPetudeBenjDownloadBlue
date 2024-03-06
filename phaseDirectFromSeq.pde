  void phaseDirectFromSeq() // mixed Com
 {  
    oscillatorBlocked=networkSize-1;
       if (key == 'ç')
       {
        float [] realign = new float [networkSize];
        if (positionFromMotorPhase [networkSize-1]> positionFromMotorPhase [0])

            text (" HIGER POSITIO " + higerPostion, 100, 200 );
        higerPostion = true;
        {  
          for (int i = 0; i < networkSize; i++)
           {
           realign[i] = positionFromMotorPhase [networkSize-1]%(positionFromMotorPhase [networkSize-1]+(numberOfStep)); //+PI/2;
           positionFromMotorPhase [i] = (int) realign[i];

          //  positionFromMotorPhase [i] = positionFromMotorPhase [0];

           }  
         }
  
        if (positionFromMotorPhase [networkSize-1]<= positionFromMotorPhase [0]-6400)
        {
              text (" LOWER  POSITION" + higerPostion, 100, 300 );
          higerPostion = false;
           for (int i = 0; i < networkSize; i++) {
           realign[i] = positionFromMotorPhase [0]%(positionFromMotorPhase [0]+(numberOfStep)); //+PI/2;
         //   realign[i] = positionFromMotorPhase [networkSize-1]%(positionFromMotorPhase [networkSize-1]+(numberOfStep)); //+PI/2;
          
            positionFromMotorPhase [i] = (int) realign[i];

          // positionFromMotorPhase [i] = positionFromMotorPhase [0];
           }
         }
       }

        if (formerKey == 'e' && shapeLfoMode == 30)
        {
         for (int i = 0; i < networkSize; i++) { // 6 HIT
         positionFromMotorPhase [i]=  positionFromMotorPhase [i]+ (int)  map ( (networkSize-1- oscillatorBlocked-i)*TWO_PI/1/networkSize, 0, TWO_PI, 0, numberOfStep/numberOfRota[0]);  
         positionFromMotorPhase [i]%=   numberOfStep;
          }
        }

        if (formerKey == 'e' && shapeLfoMode == 10)
        {
         for (int i = 0; i < networkSize; i++) { // 6 HIT
         positionFromMotorPhase [i]=  positionFromMotorPhase [i]+ (int)  map ( (networkSize-1- oscillatorBlocked-i)*TWO_PI/1/networkSize, 0, TWO_PI, 0, numberOfStep/numberOfRota[0]); 
         positionFromMotorPhase [i]%=   numberOfStep;  
          }
        }



        if (formerKey == 's')
        {
        for (int i = 0; i < networkSize; i++)
         {
         positionFromMotorPhase [i]-= (int)  map ( (networkSize-1- oscillatorBlocked-i)*TWO_PI/12/networkSize, 0, TWO_PI, 0, numberOfStep);   
          }
        }


        if (formerKey == 'S') //     net.phase[i] -= (networkSize-1- oscillatorBlocked-i)*TWO_PI/networkSize*0.1;
        {
        for (int i = 0; i < networkSize; i++)
         {
         positionFromMotorPhase [i]-= (int)  map ( (networkSize-1- oscillatorBlocked-i)*TWO_PI/networkSize*1/16, 0, TWO_PI, 0, numberOfStep);   
          }
         }


        if (formerKey == 'd')
        {
        for (int i = 0; i < networkSize; i++)
         {
          //  positionFromMotorPhase [i]+= (int)  map ( TWO_PI/12/(networkSize)*(networkSize-1-i), 0, TWO_PI, 0, numberOfStep);
              positionFromMotorPhase [i]+= (int)  map ( TWO_PI/12/(networkSize)*(networkSize-1+ oscillatorBlocked-i), 0, TWO_PI, 0, numberOfStep);
      //      positionFromMotorPhase [i]+= (int)  map ( TWO_PI/12/(networkSize)*(networkSize-1+ -i-oscillatorBlocked), 0, TWO_PI, 0, numberOfStep);


         }
    }

   if (formerKey == 'D') 
    {
             // front  TWO_PI/8/(networkSize)*(i)   behind?
          // + =   TWO_PI*0.1/(networkSize)*(networkSize-1-i)
     for (int i = 0; i < networkSize; i++) {
         positionFromMotorPhase [i]+= (int)  map ( TWO_PI*0.1/(networkSize)*(networkSize-1-i), 0, TWO_PI, 0, numberOfStep);
          }
     }

     text (" formerKey " + formerKey , 100, -200);
    
     
}