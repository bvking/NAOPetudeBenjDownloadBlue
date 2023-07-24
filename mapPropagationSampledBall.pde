void mapPropagationSampledBall() {
   text ( " propagationSpeed " + propagationSpeed + " or signal[2] " + signal[2], 0, -800 );  // //degrees (signal[2])
     for (int i = 0; i <  networkSize-0; i+=1) { 
             //  net.phase[i]=phaseMapped[i]
             // specialPhase[i]=newPosXaddSignal[i];
             // specialPhase[i]=dataMappedForMotorisedPosition[i];
             OldSpecialPhase[i]=specialPhase[i]; //specialPhase[i] from  followSignal
             positionToMotor[i]= specialPhase[i]%numberOfStep;
             text (oldPositionToMotor[i] + " " + positionToMotor[i] , -800, -500 + (50*i));  
      }
     
     
     if (formerKeyMetro == '*') { // //  if (circularMov==true) { doesn't work
          countRevsPhaseMappedPositiveOnly();
      }
  }