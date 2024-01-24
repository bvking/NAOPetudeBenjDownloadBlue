void phaseDirectToMotor() // mixed Com
 { 
   if (key == 'S') {

   // net.phase[i] += (networkSize-1- oscillatorBlocked-i)*0.05;

     for (int i = 0; i < networkSize; i++) {
      //  net.phase[i] -= (networkSize-1- oscillatorBlocked-i)*TWO_PI/networkSize*0.1;
       //  lastActualPosition[i]+=  map ( networkSize-1-oscillatorBlocked-i*0.05, 0, TWO_PI, 0, numberOfStep);
         lastActualPosition[i]+=  map ( (networkSize-1- oscillatorBlocked-i)*TWO_PI/networkSize*0.1, 0, TWO_PI, 0, numberOfStep);   
          }
    }

       if (key == 'd') {
  //  println(" d$: INCREASE (clock way) the gap between phases of 5% from the oscillator " + oscillatorBlocked + " called with the same number as memoryi " + memoryi );
    for (int i = 0; i < networkSize; i++) {
     //  lastActualPosition[i]-=  map ( oscillatorBlocked-i*0.05, 0, TWO_PI, 0, numberOfStep);
       lastActualPosition[i]-=  map ( TWO_PI/12/(networkSize-1)*(networkSize-1-i), 0, TWO_PI, 0, numberOfStep);
         }
    }

     if (key == 'D') 
     {
             // front  TWO_PI/8/(networkSize)*(i)   behind?

         for (int i = 0; i < networkSize; i++) {
         lastActualPosition[i]+=  map ( TWO_PI*0.1/(networkSize)*(networkSize-1-i), 0, TWO_PI, 0, numberOfStep);
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
