  void phaseDirectFromSeq() // mixed Com
 {  
    
    if (key == 's')
    {
     for (int i = 0; i < networkSize; i++) {
         positionFromMotorPhase [i]-= (int)  map ( (networkSize-1- oscillatorBlocked-i)*TWO_PI/networkSize*0.1/16, 0, TWO_PI, 0, numberOfStep);   
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
        positionFromMotorPhase [i]+= (int)  map ( TWO_PI*0.1/16/(networkSize)*(networkSize-1-i), 0, TWO_PI, 0, numberOfStep);
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

     
}