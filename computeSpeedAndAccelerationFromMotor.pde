int numberOfDataToComputeAverage= 3;

MovingAverage avgAcceleration0= new MovingAverage(numberOfDataToComputeAverage);  // only 5 datas
MovingAverage avgAcceleration1= new MovingAverage(numberOfDataToComputeAverage);  // only 5 datas
MovingAverage avgAcceleration2= new MovingAverage(numberOfDataToComputeAverage);  // only 5 datas
MovingAverage avgAcceleration3= new MovingAverage(numberOfDataToComputeAverage);  // only 5 datas
MovingAverage avgAcceleration4= new MovingAverage(numberOfDataToComputeAverage);  // only 5 datas
MovingAverage avgAcceleration5= new MovingAverage(numberOfDataToComputeAverage);  // only 5 datas
MovingAverage avgAcceleration6= new MovingAverage(numberOfDataToComputeAverage);  // only 5 datas
MovingAverage avgAcceleration7= new MovingAverage(numberOfDataToComputeAverage);  // only 5 datas
MovingAverage avgAcceleration8= new MovingAverage(numberOfDataToComputeAverage);  // only 5 datas


MovingAverage avgAcceleratioNnetworkSize_1= new MovingAverage(numberOfDataToComputeAverage);  // only 5 datas

void computeSpeedAndAcceleration()
{  
    print("  oldPo ");
    showArray(oldPositionFromMotor); 
    
    print("  PoMot ");
    showArray(positionFromMotor); 
    
    println();
    println();
    
    
    for (int i = 0; i < networkSize; i++)
    { 
        oldVelocityMotor[i] = velocityMotor[i];// usefull may be to compute acceleration
              
        // oldOldPositionFromMotor[i] = oldPositionFromMotor[i];
        oldPositionFromMotor[i] =   positionFromMotor[i];
        positionFromMotor[i] = abs(positionToMotor[i]);
        
        //*********** COMPUTE SPEED of encoder
        
        //gapEncoder_OldEncodeur[i] = encodeurPosition[i] - oldEncodeurPosition[i];
        oldVelocityMotor[i] = velocityMotor[i];// usefull may be to compute acceleration
        gapEncoder_OldMoteur[i] = oldVelocityMotor[i];
        
        gapEncoder_OldMoteur[i] =  oldOldPositionFromMotor[i] - oldPositionFromMotor[i];
        gapEncoder_Motor[i] = positionFromMotor[i] -  oldPositionFromMotor[i];
        
        if (gapEncoder_Motor[i] < 0)
        {
            gapEncoder_Motor[i] = numberOfStep -  oldPositionFromMotor[i] +  positionFromMotor[i];
        }
        
        // oldOldVelocityMotor[i] =  oldVelocityMotor[i]; // to use to disciminate variation of spee
       if (gapEncoder_Motor[i] <1)
        {
          gapEncoder_Motor[i]  = 1;
        } 

        velocityMotor[i] = gapEncoder_Motor[i]; //COMPUTE SPEED of encoder
        if ((gapEncoder_Motor[i] - oldVelocityMotor[i]) !=0)
         {
            acceleraMotor[i] = (gapEncoder_Motor[i] - oldVelocityMotor[i]) / 2; 
         } 
         else   acceleraMotor[i]  = 1;
     }
    
    // acceleration0.nextValue( (float) (gapEncoder_Motor[0] - oldVelocityMotor[0])/2);
    // acceleration0.nextValue (float (acceleraMotor[0])) ;
    
    for (int i = 0; i < networkSize; i++)
    {
       if (acceleraMotor[i]<1)
        {
          acceleraMotor[i]  = 1;
        } 
        acceleraMotor[i]=abs(acceleraMotor[i]);
     } 
     avgAcceleration0.nextValue(acceleraMotor[0]);
     avgAcceleration1.nextValue(acceleraMotor[1]);
     avgAcceleration0.nextValue(acceleraMotor[2]);
     avgAcceleration1.nextValue(acceleraMotor[3]);
     avgAcceleration0.nextValue(acceleraMotor[4]);
     avgAcceleration1.nextValue(acceleraMotor[5]);
     avgAcceleration0.nextValue(acceleraMotor[6]);
     avgAcceleration1.nextValue(acceleraMotor[7]);
     avgAcceleration1.nextValue(acceleraMotor[8]);
    
     avgAcceleratioNnetworkSize_1.nextValue(acceleraMotor[networkSize-1]);
    
      for (int i = 0; i < networkSize; i++)
    {
      speedRatio[i]= (int) map (velocityMotor[i], 0, numberOfStep, 1, 10);
     // accelRatio[i]= (int) map (avgAcceleration1.nextValue(acceleraMotor[i]), 0, sqrt(numberOfStep), 1, 10);
      accelRatio[i]= (int) map (avgAcceleration1.nextValue(acceleraMotor[i]), 0, numberOfStep/2, 1, 10);
    } 
     
        print("  V2 ");
        showArray(oldVelocityMotor); 
        print("  V1 ");
        showArray(velocityMotor); 
    
        println();
        println();
    
        print(" accelMotor   ");
         showArray(acceleraMotor); 
        //  print (" acc0 " + avgAcceleration0.average() + " acc1 " + avgAcceleration1.average() + " acc9 " + avgAcceleratioNnetworkSize_1.average());
       

        print("speedR   ");
        showArray(speedRatio);

        print("accelRatio   ");
        showArray(accelRatio);

        println();
        println();
    
}





void averageAcceleration()
    {
    
    print(" averageAcceleration " + acceleraMotor[0]);
}

