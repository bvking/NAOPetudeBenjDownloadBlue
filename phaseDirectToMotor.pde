    boolean higerPostion;
  

  void phaseDirectToMotor() // mixed Com
 {   
    oscillatorBlocked=9;  // retour normal 
     text (" osc " + oscillatorBlocked, 200, 200);

         if (key == '1')
      {
       for (int i = 0; i < networkSize; i++)
        {
       // net.phase[networkSize-1-i] += (i*TWO_PI/3)%PI/10;    //PAS TOUCHER

      //  net.phase[networkSize-1-i] = net.phase[networkSize-1-i] + (i*TWO_PI/5)%PI/10; 

       lastActualPosition[networkSize-1-i]+=  (int)  map ((i+1/4*TWO_PI/5)%PI/40, 0, TWO_PI, 0, numberOfStep);
       
       if (formerKeyMetro == '$')
        {
   //    lastActualPosition[networkSize-1-i]%= lastActualPosition[i] + numberOfStep;    // no meaning    
         }
      }
      }


      if (key == 'ç')

      {
          float [] realign = new float [networkSize];
      

        if (lastActualPosition[networkSize-1]> lastActualPosition[0])
        higerPostion = true;
        {  
          for (int i = 0; i < networkSize; i++)
           {
           realign[i] = lastActualPosition[networkSize-1]%(lastActualPosition[networkSize-1]+(numberOfStep)); //+PI/2;
           lastActualPosition[i] = (int) realign[i];
            println (" HIGER POSITIO " + higerPostion );
           }
      
        }
  

        if (lastActualPosition[networkSize-1]< lastActualPosition[0])
        {
          higerPostion = false;
           for (int i = 0; i < networkSize; i++) {
           realign[i] = lastActualPosition[0]%(lastActualPosition[0]+(numberOfStep)); //+PI/2;
         //   realign[i] = lastActualPosition[networkSize-1]%(lastActualPosition[networkSize-1]+(numberOfStep)); //+PI/2;
           lastActualPosition[i] = (int) realign[i];
           println (" HIGER POSITIO " + higerPostion );
           }

        }

      }

      if (key == 'w')
      {
       for (int i = 0; i < networkSize; i++)
        {
       // net.phase[networkSize-1-i] += (i*TWO_PI/3)%PI/10;    //PAS TOUCHER

      //  net.phase[networkSize-1-i] = net.phase[networkSize-1-i] + (i*TWO_PI/5)%PI/10; 

       lastActualPosition[networkSize-1-i]+=  (int)  map ((i+1/4*TWO_PI/5)%PI/40, 0, TWO_PI, 0, numberOfStep);
       
       if (formerKeyMetro == '$')
        {
   //    lastActualPosition[networkSize-1-i]%= lastActualPosition[i] + numberOfStep;    // no meaning    
         }
      }
      }

     if (key == 'W')
      {

       for (int i = 0; i < networkSize; i++)
        {
         // net.phase[networkSize-1-i] += (i*TWO_PI/3)%PI/10;    //PAS TOUCHER

       //    net.phase[networkSize-1-i] = net.phase[networkSize-1-i] -  (i*TWO_PI/5)%PI/10; 

           lastActualPosition[networkSize-1-i]= lastActualPosition[networkSize-1-i] - (int)  map ((i*1/4*TWO_PI/5)%PI/40, 0, TWO_PI, 0, numberOfStep);

           if (formerKeyMetro == '$')
           {
        //   lastActualPosition[networkSize-1-i]%= numberOfStep;        
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
          lastActualPosition[i]+= (int)  map ((i*TWO_PI/networkSize)%PI/(networkSize*3), 0, TWO_PI, 0, numberOfStep);
             }
     }


    if (key == 's')
    {
     for (int i = 0; i < networkSize; i++) {
         lastActualPosition[i]-= (int)  map ( (networkSize-1- oscillatorBlocked-i)*TWO_PI/networkSize*0.1/16, 0, TWO_PI, 0, numberOfStep);   
          }
    }


    if (key == 'S') //     net.phase[i] -= (networkSize-1- oscillatorBlocked-i)*TWO_PI/networkSize*0.1;
    {
     for (int i = 0; i < networkSize; i++) {
         lastActualPosition[i]-= (int)  map ( (networkSize-1- oscillatorBlocked-i)*TWO_PI/networkSize*1/16, 0, TWO_PI, 0, numberOfStep);   
          }
    }


    if (key == 'd')
    {
    for (int i = 0; i < networkSize; i++) {
        lastActualPosition[i]+= (int)  map ( TWO_PI*0.1/16/(networkSize)*(networkSize-1-i), 0, TWO_PI, 0, numberOfStep);
         }
    }

   if (key == 'D') 
    {
             // front  TWO_PI/8/(networkSize)*(i)   behind?
          // + =   TWO_PI*0.1/(networkSize)*(networkSize-1-i)
     for (int i = 0; i < networkSize; i++) {
         lastActualPosition[i]+= (int)  map ( TWO_PI*0.1/(networkSize)*(networkSize-1-i), 0, TWO_PI, 0, numberOfStep);
          }
     }

    if (key == 'f') // as 'S'

     {
      for (int i = 0; i < networkSize; i++) {
           lastActualPosition[i]+=(int)  map ( TWO_PI*0.1/16/(networkSize-0-oscillatorBlocked)*i, 0, TWO_PI, 0, numberOfStep);
          }
     }

       if (key == 'F') 
     {
       for (int i = 0; i < networkSize; i++) {
           lastActualPosition[i]+= (int)  map ( TWO_PI*0.1/(networkSize-0-oscillatorBlocked)*i, 0, TWO_PI, 0, numberOfStep);
          }
     }

      if (key == 'i')
      {  // memory == 0 is the ball "behind"  the screen

        oldMemoryi=memoryi;
        memoryi=(memoryi-1);
      
        if ( memoryi==-1)
         {
         memoryi=networkSize-1;
        oldMemoryi=0;
         }

        for (int i = 0; i < (networkSize-0); i++)
        {  
        lastOldActualPosition[i]=lastActualPosition[i];
        }
    
        for (int i = 1; i < (networkSize-0); i++) 
        {  
        lastActualPosition[i-1]= lastOldActualPosition[i];
        }

        lastActualPosition[networkSize-1]=  lastOldActualPosition[0];
      }

     if (key == 'u')
      {  // memory == 0 is the ball "behind"  the screen

       oldMemoryi=memoryi;
       memoryi=(memoryi+1);
       memoryi%=networkSize;

        for (int i = 0; i < (networkSize-0); i++)
        {  
        lastOldActualPosition[i]=lastActualPosition[i]+numberOfStep/6;
        }

       for (int i = 1; i < (networkSize-0); i++)
       {  
       lastActualPosition[i]=lastOldActualPosition[i-1];       
       }
       lastActualPosition[0]= lastOldActualPosition[networkSize-1];

   } 


     if (key == 'U')
      {  // memory == 0 is the ball "behind"  the screen

       oldMemoryi=memoryi;
       memoryi=(memoryi+1);
       memoryi%=networkSize;

        for (int i = 0; i < (networkSize-0); i++)
        {  
        lastOldActualPosition[i]=lastActualPosition[i]+numberOfStep/2;
        }

       for (int i = 1; i < (networkSize-0); i++)
       {  
       lastActualPosition[i]=lastOldActualPosition[i-1];       
       }
       lastActualPosition[0]= lastOldActualPosition[networkSize-1];

   } 

   textSize (200);
   text ("key" + key, 200, 400 );

   //  key = '#';

  }
