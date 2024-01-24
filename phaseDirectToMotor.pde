void phaseDirectToMotor()
 { 

       if (key == 'd') {
  //  println(" d$: INCREASE (clock way) the gap between phases of 5% from the oscillator " + oscillatorBlocked + " called with the same number as memoryi " + memoryi );
    for (int i = 0; i < networkSize; i++) {
    //  net.phase[i] +=(oscillatorBlocked-i)*0.05; // oscillator 10 do not nove
    //   net.phase[i]-=   TWO_PI/2/(networkSize)*(networkSize-1-i); // front  TWO_PI/8/(networkSize)*(i)   behind?


       lastActualPosition[i]-=  map ( TWO_PI/10/(networkSize)*(networkSize-1-i), 0, TWO_PI, 0, numberOfStep);
         }
    }

     if (key == 'D') 
     {
         for (int i = 0; i < networkSize; i++) {
         lastActualPosition[i]+=  map ( TWO_PI/10/(networkSize)*(networkSize-1-i), 0, TWO_PI, 0, numberOfStep);
          }
     }

  }
