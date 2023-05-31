void teensyPos(){
  
  text ( " circularMov " + circularMov , 200, 100)  //
  if (keyMode == " trigEventWithAbletonSignal " && circularMov==false) { 

 for (int i = 0; i < networkSize; i++) {

     dataToControlStepMotorisedPosition[i] = int (map ( metroPhase[i], -PI/2, PI/2, 0, numberOfStep/2);
   

  

   
    //   pos[i]= pos[i]-numberOfStep/4; // The positions 0 of my motors in real are shifted of - half_PI  
    /*
    if (rev[i]!=0  && (net.phase[i] >  0) ) { // number of revolution is even and rotation is clock wise   
     dataToControlStepMotorisedPosition[i]= int (map (net.phase[i], 0, TWO_PI, 0, numberOfStep))+ rev[i]*numberOfStep;
    }

    //   if (rev[i]!=0  && (net.phase[i] <  0)) { // number of revolution is even and rotation is Counter clock wise   
    if (rev[i]!=0  && (net.phase[i] <  0)) { // number of revolution is even and rotation is Counter clock wise   

     dataToControlStepMotorisedPosition[i]= int (map (net.phase[i], 0, -TWO_PI, numberOfStep, 0))+ rev[i]*numberOfStep;
    }

    if (rev[i]==0 && (net.phase[i] < 0) ) { //  number of revolution is 0 and rotation is counter clock wise 
      dataToControlStepMotorisedPosition[i]= int (map (net.phase[i], 0, -TWO_PI, numberOfStep, 0));        
      //    print ("pos "); print (i); print (" CCW rev=0");println (pos[i]);
    }         
    if  (rev[i]==0 && (net.phase[i] > 0) ) {  //  number of revolution is 0 and rotation is clock wise     
      dataToControlStepMotorisedPosition[i]= int (map (net.phase[i], 0, TWO_PI, 0, numberOfStep));         
    }
  }
  */
  }



    if (modeStartKeyToFollow == " null ") {    // when propagationBall
    
  for (int i = 0; i < networkSize; i++) {  
 //   dataToControlStepMotorisedPosition[i]=(int) newPosF[i]+ (rev[i]*numberOfStep);  // map motor with countrevs doesn't work
     rev=revLfo;
      dataToControlStepMotorisedPosition[i]=(int) newPosF[i]+ (revLfo[i]*numberOfStep)+ (int) recordLastDataOfMotorPosition[i];
 
    }
   //    send24DatasToTeensy6motors( 4, 3, -3, -1);
   }

   if (keyMode != " trigEventWithAbletonSignal ") { 

 for (int i = 0; i < networkSize; i++) {

    //rev[i]=rev[0];

    //*******************************  ASSIGN MOTOR WITH POSITION
    //   pos[i]= pos[i]-numberOfStep/4; // The positions 0 of my motors in real are shifted of - half_PI  

    if (rev[i]!=0  && (net.phase[i] >  0) ) { // number of revolution is even and rotation is clock wise   
     dataToControlStepMotorisedPosition[i]= int (map (net.phase[i], 0, TWO_PI, 0, numberOfStep))+ rev[i]*numberOfStep;
    }

    //   if (rev[i]!=0  && (net.phase[i] <  0)) { // number of revolution is even and rotation is Counter clock wise   
    if (rev[i]!=0  && (net.phase[i] <  0)) { // number of revolution is even and rotation is Counter clock wise   

     dataToControlStepMotorisedPosition[i]= int (map (net.phase[i], 0, -TWO_PI, numberOfStep, 0))+ rev[i]*numberOfStep;
    }

    if (rev[i]==0 && (net.phase[i] < 0) ) { //  number of revolution is 0 and rotation is counter clock wise 
      dataToControlStepMotorisedPosition[i]= int (map (net.phase[i], 0, -TWO_PI, numberOfStep, 0));        
      //    print ("pos "); print (i); print (" CCW rev=0");println (pos[i]);
    }         
    if  (rev[i]==0 && (net.phase[i] > 0) ) {  //  number of revolution is 0 and rotation is clock wise     
      dataToControlStepMotorisedPosition[i]= int (map (net.phase[i], 0, TWO_PI, 0, numberOfStep));         
    }
  }
  // send24DatasToTeensy6motors( 3, 3, -13, -1);
  }
 

   }

void mapNewPosX() {
  text ( " mapData From Key" +  keyMode + " modStart "  + modeStartKeyToFollow, 800, 800);

    for (int i = 0; i <  networkSize-0; i+=1) { 
    newPosXaddSignal[i]%=TWO_PI;
    net.phase[i]=newPosXaddSignal[i]; // to display to screen
    }


 // countRevs(); // doesn't work whit propagation function
     for (int i = 0; i <  networkSize-0; i+=1) {
     net.oldPhase[i]=net.phase[i];

    }


    // map depending way of rotation

      for (int i = 0; i <  networkSize-0; i+=1) { // la premiere celle du fond i=2,  la derniere celle du devant i=11
   //  if ( newPosXaddSignal[i]>0 )  {
     positionToMotor[i]= ((int) map (newPosXaddSignal[i], 0, TWO_PI, 0, numberOfStep)%numberOfStep); //
     newPosF[i]=positionToMotor[i]%6400;
   
    // if ( newPosXaddSignal[i]<0 )  {
       if (net.oldPhase[i] > net.phase[i] ) {

     positionToMotor[i]= ((int) map (newPosXaddSignal[i], 0, -TWO_PI,  numberOfStep, 0)%numberOfStep); //
     newPosF[i]=positionToMotor[i]%6400;
   }

   //  newPosF[i]=positionToMotor[i]%6400;
   }
   // }

     for (int i = 0; i <  networkSize-0; i+=1) { 

     TrigmodPos[i]=1;
      
      if ( doo==false) { //

    if ( oldPosF[i]>newPosF[i]) { //
         revLfo[i]++;
         TrigmodPos[i]=0;
     
    }
     }  
  
    
    text (  " net.oldPhase[i] " + net.phase[i] + " " + newPosXaddSignal[i] + " oldOldPosF " + oldOldPosF[i] + " oldPosF " + oldPosF[i] + " newPosF " + newPosF[i], width*2, i*50);
    println (  " oldOldPosF " + oldOldPosF[i] + " oldPosF " + oldPosF[i] + " newPosF " + newPosF[i]);


     textSize (100);
     
   if ( doo==true && ( keyMode == " propagationBallRotation " || keyMode == " propagationBallRotationBis " ) ){  // A AMELIORER DANS PROPABIS
  
     if (  newPosF[i]>oldPosF[i]  && (oldPosF[i]<=oldOldPosF[i]) ){ 
     revLfo[i]--;
     TrigmodPos[i]=1;
       }
   }
      
   if ( doo==true && keyMode == " propagationBallRotationBis "){  // A AMELIORER DANS PROPABIS
   /* 
    if ( (newPosF[i]>oldPosF[i]) && (oldPosF[i]<oldOldPosF[i])){ 
         revLfo[i]--;
         TrigmodPos[i]=2;
      }
   */   
    }
     

    textSize(50);

     print (" TrigmodPos[i" , TrigmodPos[i]);

     oldPositionToMotor[i]=  positionToMotor[i];
     oldOldPosF[i]=oldPosF[i];
     oldPosF[i]=newPosF[i];
    // oldPosX[i]=newPosF[i];

  
     text ("revLFO ", -1600, height-500 - 75*i);
     text ( revLfo[i], -1400, height-500 - 75*i);
     }
     
     text (" mode " + keyMode + " signal2 " + signal[2] , -1600, height-300 );  


     
    for (int i = 0; i < networkSize; i++) {
   //  dataToControlStepMotorisedPosition[i] = dataToControlStepMotorisedPosition[i]+ recordLastDataOfMotorPosition[i];
   }

  
}
