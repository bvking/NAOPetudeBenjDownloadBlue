void teensyPos(){

    if (modeStartKeyToFollow == " null ") {  
        /*
    for (int i = 0; i < networkSize; i++) {   //*******************************  ASSIGN MOTOR WITH POSITION
  
      if (revLfo[i]!=0  && (newPosF[i] >  0) ) { // number of revolution is even and rotation is clock wise   
        DataToDueCircularVirtualPosition[i]= int (map (newPosF[i], 0, TWO_PI, 0, numberOfStep))+ (revLfo[i]*numberOfStep);
      }

      if (revLfo[i]!=0  && (newPosF[i] <  0)) { // number of revolution is even and rotation is Counter clock wise          // pos[i]= int (map (newPosF[i], 0, -TWO_PI, 0,  numberOfStep))+ (rev[i]*numberOfStep);

        DataToDueCircularVirtualPosition[i]= int (map (newPosF[i], 0, -TWO_PI, numberOfStep, 0)) +(revLfo[i]*numberOfStep);       //   print ("pos "); print (i); print (" ");println (pos[i]);
      }

      if (revLfo[i]==0 && (newPosF[i] < 0) ) { //  number of revolution is 0 and rotation is counter clock wise 
        DataToDueCircularVirtualPosition[i]= int (map (newPosF[i], 0, -TWO_PI, numberOfStep, 0));        
      }         
      if  (revLfo[i]==0 && (newPosF[i] > 0) ) {  //  number of revolution is 0 and rotation is clock wise     
        DataToDueCircularVirtualPosition[i]= int (map (newPosF[i], 0, TWO_PI, 0, numberOfStep));                //      print ("pos "); print (i); print (" CW rev=0 ");println (pos[i]);
      }
    }
    */
  for (int i = 0; i < networkSize; i++) {  
    DataToDueCircularVirtualPosition[i]=(int) newPosF[i]+ (revLfo[i]*numberOfStep);
 
    }
       send24DatasToTeensy6motors( 9, 3, -3, -1);
   }
 if (modeStartKeyToFollow != " null ") { 
  for (int i = 0; i < networkSize; i++) {

    //rev[i]=rev[0];

    //*******************************  ASSIGN MOTOR WITH POSITION
    //   pos[i]= pos[i]-numberOfStep/4; // The positions 0 of my motors in real are shifted of - half_PI  

    if (rev[i]!=0  && (net.phase[i] >  0) ) { // number of revolution is even and rotation is clock wise   
     DataToDueCircularVirtualPosition[i]= int (map (net.phase[i], 0, TWO_PI, 0, numberOfStep))+ rev[i]*numberOfStep;
    }

    //   if (rev[i]!=0  && (net.phase[i] <  0)) { // number of revolution is even and rotation is Counter clock wise   
    if (rev[i]!=0  && (net.phase[i] <  0)) { // number of revolution is even and rotation is Counter clock wise   

      DataToDueCircularVirtualPosition[i]= int (map (net.phase[i], 0, -TWO_PI, numberOfStep, 0))+ rev[i]*numberOfStep;
    }

    if (rev[i]==0 && (net.phase[i] < 0) ) { //  number of revolution is 0 and rotation is counter clock wise 
      DataToDueCircularVirtualPosition[i]= int (map (net.phase[i], 0, -TWO_PI, numberOfStep, 0));        
      //    print ("pos "); print (i); print (" CCW rev=0");println (pos[i]);
    }         
    if  (rev[i]==0 && (net.phase[i] > 0) ) {  //  number of revolution is 0 and rotation is clock wise     
      DataToDueCircularVirtualPosition[i]= int (map (net.phase[i], 0, TWO_PI, 0, numberOfStep));         
    }
  }
   send24DatasToTeensy6motors( 10, 3, -3, -1);
  }
 

   }

void mapDataToMotor() {

     for (int i = 0; i <  networkSize-0; i+=1) { // la premiere celle du fond i=2,  la derniere celle du devant i=11
 //   drawBall(i, newPosXaddSignal[i] );
  println (" CONVERSION pour AFFICHAGE net.phase[i]=newPosXaddSignal[i ]" + newPosXaddSignal[i]);
   
 //    print( " oldPositionToMotor[i]" ); print ( oldPositionToMotor[i]);
  //  positionToMotor[i]= ((int) map (newPosXaddSignal[i], 0, TWO_PI, 0, numberOfStep)%numberOfStep); //
    positionToMotor[i]= ((int) map (net.phase[i], 0, TWO_PI, 0, numberOfStep)%numberOfStep); //
    
    newPosF[i]=positionToMotor[i]%6400;
    
    net.oldPhase[i]=net.phase[i];
    }
    countRevs();
      for (int i = 0; i <  networkSize-0; i+=1) { 
    net.phase[i]=newPosXaddSignal[i]; // to display to screen
    net.phase[i]%=TWO_PI;
    }
    

     for (int i = 0; i <  networkSize-0; i+=1) { 
    positionToMotor[i]= positionToMotor[i]%6400;
     TrigmodPos[i]=1;
    
    if ( oldPosF[i]>newPosF[i]){
         revLfo[i]++;
         TrigmodPos[i]=0;
     
    }
   
     if ( (oldPosF[i]>(numberOfStep-numberOfStep*0.1))  && newPosF[i]<numberOfStep*0.1){
         revLfo[i]--;
         TrigmodPos[i]=0;
     
    }

     print (" TrigmodPos[i" , TrigmodPos[i]);
     print (" oldPosF " + oldPosF[i] + " newPosF " + newPosF[i]);
     oldPositionToMotor[i]=  positionToMotor[i];
     oldPosF[i]=newPosF[i];
     oldPosX[i]=newPosF[X];


     

     print (" revLFO "); print ( i); print ("  "); println (revLfo[i]); 
     
     
     text ("count", -1600, height-500 - 75*i);
     text ( revLfo[i], -1400, height-500 - 75*i);
     }
     
     text (" mode " + keyMode , -1600, height-300 );  
     text ( signal[2], -400, height-300);

  
    teensyPos();
     oscSend(); // depend de arduinopos
   //  assignMotorWithPosition();
     
    for (int i = 0; i < networkSize; i++) {
   //  DataToDueCircularVirtualPosition[i] = DataToDueCircularVirtualPosition[i]+ recordLastDataOfMotorPosition[i];
   }

 //  send24DatasToTeensy6motors( 10, 3, -3, -1);
  
}
