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
        velocityMotor[i] = gapEncoder_Motor[i]; //COMPUTE SPEED of encoder
        
        acceleraMotor[i] =  (gapEncoder_Motor[i] - oldVelocityMotor[i])/2;
        
    }
    
    
    print("  V2 ");
    showArray(oldVelocityMotor); 
    print("  V1 ");
    showArray(velocityMotor); 

    println();
    println();

    print(" accelMotor   ");
    showArray(acceleraMotor); 
    
}