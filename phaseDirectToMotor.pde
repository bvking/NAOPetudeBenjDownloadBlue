  void phaseDirectToMotor() // mixed Com
 {   
     //  oscillatorBlocked=2;
     text (" osc " + oscillatorBlocked, 200, 200);
      if (key == 'w')
      {
       for (int i = 0; i < networkSize; i++)
        {
       // net.phase[networkSize-1-i] += (i*TWO_PI/3)%PI/10;    //PAS TOUCHER

       net.phase[networkSize-1-i] = net.phase[networkSize-1-i] + (i*TWO_PI/5)%PI/10; 

       lastActualPosition[networkSize-1-i]= lastActualPosition[networkSize-1-i] + (int)  map ((i*TWO_PI/5)%PI/10, 0, TWO_PI, 0, numberOfStep);
       
       if (formerKeyMetro == '$')
        {
       lastActualPosition[networkSize-1-i]%= numberOfStep;        
         }
      }
      }

     if (key == 'W')
      {

       for (int i = 0; i < networkSize; i++)
        {
         // net.phase[networkSize-1-i] += (i*TWO_PI/3)%PI/10;    //PAS TOUCHER

           net.phase[networkSize-1-i] = net.phase[networkSize-1-i] -  (i*TWO_PI/5)%PI/10; 

           lastActualPosition[networkSize-1-i]= lastActualPosition[networkSize-1-i] - (int)  map ((i*TWO_PI/5)%PI/10, 0, TWO_PI, 0, numberOfStep);

           if (formerKeyMetro == '$')
           {
           lastActualPosition[networkSize-1-i]%= numberOfStep;        
           }
           

          }
      }
      
     
    


     if (key == 'R') {
  
    for (int i = 0; i < networkSize; i++) {
      //   net.phase[i] += (i+1) *(TWO_PI/12); // 12 hit   
      //   net.phase[networkSize-1-i] += (i*TWO_PI/3)%PI/11;    //PAS TOUCHER
      //   net.phase[i] -= (i*TWO_PI/5)%PI/5;

      //    net.phase[i] -= (i*TWO_PI/networkSize)%PI/(networkSize*3); // OK en mode circular ? 

            lastActualPosition[i]= lastActualPosition[i] - (int)  map ((i*TWO_PI/networkSize)%PI/(networkSize*3), 0, TWO_PI, 0, numberOfStep);
      
      }
    }

    if (key == 'r') {
        for (int i = 0; i < networkSize; i++) {
            lastActualPosition[i]= lastActualPosition[i] + (int)  map ((i*TWO_PI/networkSize)%PI/(networkSize*3), 0, TWO_PI, 0, numberOfStep);
             }
     }


    if (key == 's')
    {
     for (int i = 0; i < networkSize; i++) {
         lastActualPosition[i]= lastActualPosition[i] + (int)  map ( (networkSize-1- oscillatorBlocked-i)*TWO_PI/networkSize*1/16, 0, TWO_PI, 0, numberOfStep);   
          }
    }


    if (key == 'S')
    {
     for (int i = 0; i < networkSize; i++) {
         lastActualPosition[i]= lastActualPosition[i] + (int)  map ( (networkSize-1- oscillatorBlocked-i)*TWO_PI/networkSize*1, 0, TWO_PI, 0, numberOfStep);   
          }
    }


    if (key == 'd')
    {
    for (int i = 0; i < networkSize; i++) {
        lastActualPosition[i]= lastActualPosition[i] - (int)  map ( TWO_PI*1/16/(networkSize)*(networkSize-1-oscillatorBlocked-i), 0, TWO_PI, 0, numberOfStep);
         }
    }

   if (key == 'D') 
    {
             // front  TWO_PI/8/(networkSize)*(i)   behind?
     for (int i = 0; i < networkSize; i++) {
         lastActualPosition[i]= lastActualPosition[i] - (int)  map ( TWO_PI*1/(networkSize)*(networkSize-1-oscillatorBlocked-i), 0, TWO_PI, 0, numberOfStep);
          }
     }

    if (key == 'f') // no way

     {
      for (int i = 0; i < networkSize; i++) {
           lastActualPosition[i]=lastActualPosition[i] - (int)  map ( TWO_PI*0.1/8/(networkSize-1-oscillatorBlocked)*i, 0, TWO_PI, 0, numberOfStep);
          }
     }

       if (key == 'F') 
     {
       for (int i = 0; i < networkSize; i++) {
           lastActualPosition[i]=lastActualPosition[i] + (int)  map ( TWO_PI*0.1/(networkSize-1-oscillatorBlocked)*i, 0, TWO_PI, 0, numberOfStep);
          }
     }

  }
