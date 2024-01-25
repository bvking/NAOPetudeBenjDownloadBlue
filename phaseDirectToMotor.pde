void phaseDirectToMotor() // mixed Com
 { text (" osc " + oscillatorBlocked, 200, 200);

   if (key == 'S')
    {
     for (int i = 0; i < networkSize; i++) {
         lastActualPosition[i]= lastActualPosition[i] + (int)  map ( (networkSize-1- oscillatorBlocked-i)*TWO_PI/networkSize*0.1, 0, TWO_PI, 0, numberOfStep);   
          }
    }


   if (key == 'd')
    {
    for (int i = 0; i < networkSize; i++) {
     //  lastActualPosition[i]-=  map ( oscillatorBlocked-i*0.05, 0, TWO_PI, 0, numberOfStep);
        lastActualPosition[i]-=  map ( TWO_PI/12/(networkSize-1)*(networkSize-1-i), 0, TWO_PI, 0, numberOfStep);
         }
    }

    if (key == 'D') 
     {
             // front  TWO_PI/8/(networkSize)*(i)   behind?
     for (int i = 0; i < networkSize; i++) {
         lastActualPosition[i]= lastActualPosition[i] - (int)  map ( TWO_PI*0.1/(networkSize)*(networkSize-1-i), 0, TWO_PI, 0, numberOfStep);
          }
     }

      if (key == 'f') 
     {
      for (int i = 0; i < networkSize; i++) {
         lastActualPosition[i]-=  map ( TWO_PI/12/(networkSize-1)*i, 0, TWO_PI, 0, numberOfStep);
          }
     }

       if (key == 'F') 
     {
       for (int i = 0; i < networkSize; i++) {
         lastActualPosition[i]+=  map ( TWO_PI/12/(networkSize-1)*i, 0, TWO_PI, 0, numberOfStep);
          }
     }

  }
