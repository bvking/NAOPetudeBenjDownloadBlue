  void phaseDirectFromSeq() // mixed Com
 {  
    oscillatorBlocked=networkSize-1;
        if (key == 'ç')
      {
        float [] realign = new float [networkSize];
        if (positionFromMotorPhase [networkSize-1]> positionFromMotorPhase [0])
        higerPostion = true;
        {  
          for (int i = 0; i < networkSize; i++)
           {
           realign[i] = positionFromMotorPhase [networkSize-1]%(positionFromMotorPhase [networkSize-1]+(numberOfStep)); //+PI/2;
          // positionFromMotorPhase [i] = (int) realign[i];

            positionFromMotorPhase [i] = positionFromMotorPhase [0];

            println (" HIGER POSITIO " + higerPostion );
           }  
         }
  
        if (positionFromMotorPhase [networkSize-1]< positionFromMotorPhase [0])
        {
          higerPostion = false;
           for (int i = 0; i < networkSize; i++) {
           realign[i] = positionFromMotorPhase [0]%(positionFromMotorPhase [0]+(numberOfStep)); //+PI/2;
         //   realign[i] = positionFromMotorPhase [networkSize-1]%(positionFromMotorPhase [networkSize-1]+(numberOfStep)); //+PI/2;
          
         //** */  positionFromMotorPhase [i] = (int) realign[i];

            positionFromMotorPhase [i] = positionFromMotorPhase [0];

           println (" HIGER POSITIO " + higerPostion );
           }
        }

      }

       if (key == 'e')
    {
     for (int i = 0; i < networkSize; i++) { // 6 HIT
         positionFromMotorPhase [i]-= (int)  map ( (networkSize-1- oscillatorBlocked-i)*TWO_PI/1/networkSize, 0, TWO_PI, 0, numberOfStep);   
          }
    }

    if (key == 's')
    {
     for (int i = 0; i < networkSize; i++) {
         positionFromMotorPhase [i]-= (int)  map ( (networkSize-1- oscillatorBlocked-i)*TWO_PI/12/networkSize, 0, TWO_PI, 0, numberOfStep);   
          }
    }


    if (key == 'S') //     net.phase[i] -= (networkSize-1- oscillatorBlocked-i)*TWO_PI/networkSize*0.1;
    {
     for (int i = 0; i < networkSize; i++) {
         positionFromMotorPhase [i]-= (int)  map ( (networkSize-1- oscillatorBlocked-i)*TWO_PI/networkSize*1/16, 0, TWO_PI, 0, numberOfStep);   
          }
    }


    if (key == 'd')
    {
    for (int i = 0; i < networkSize; i++) {
       
       //  positionFromMotorPhase [i]+= (int)  map ( TWO_PI/12/(networkSize)*(networkSize-1-i), 0, TWO_PI, 0, numberOfStep);
       positionFromMotorPhase [i]+= (int)  map ( TWO_PI/12/(networkSize)*(networkSize-1+ oscillatorBlocked-i), 0, TWO_PI, 0, numberOfStep);
      //      positionFromMotorPhase [i]+= (int)  map ( TWO_PI/12/(networkSize)*(networkSize-1+ -i-oscillatorBlocked), 0, TWO_PI, 0, numberOfStep);


         }
    }

   if (key == 'D') 
    {
             // front  TWO_PI/8/(networkSize)*(i)   behind?
          // + =   TWO_PI*0.1/(networkSize)*(networkSize-1-i)
     for (int i = 0; i < networkSize; i++) {
         positionFromMotorPhase [i]+= (int)  map ( TWO_PI*0.1/(networkSize)*(networkSize-1-i), 0, TWO_PI, 0, numberOfStep);
          }
     }

     text (" key " + key , 100, -200);
    
     
}