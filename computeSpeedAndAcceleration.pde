void computeSpeedAndAcceleration()
{  
    for (int i = 0; i < networkSize; i++)
    { 
 
        oldOldPositionToMotor[i] = oldPositionToMotor[i];
        oldPositionFromMotor[i] =   positionFromMotor[i];
        positionFromMotor[i] = abs(positionToMotor[i]);

        //*********** COMPUTE SPEED of encoder
        
        //gapEncoder_OldEncodeur[i] = encodeurPosition[i] - oldEncodeurPosition[i];
        gapEncoder_Motor[i] = positionFromMotor[i] -  oldPositionFromMotor[i];
        
        if ( gapEncoder_Motor[i] < 0)
        {
            gapEncoder_Motor[i] = numberOfStep -  oldPositionFromMotor[i] +  positionFromMotor[i];
        }

        oldOldVelocityMotor[i] =  oldVelocityMotor[i]; // to use to disciminate variation of speed
        oldVelocityMotor[i] = velocityMotor[i];// usefull may be to compute acceleration
        velocityMotor[i] = gapEncoder_Motor[i]; //COMPUTE SPEED of encoder
      
    }

    //showArray(oldVelocityBis);
    print("  velocityMotor ");
    showArray(velocityMotor); 
}