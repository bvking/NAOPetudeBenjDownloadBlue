void teensyPos(){
  
  text ( " circularMov " + !circularMov , 200, 100) ; //


  if (keyMode == " trigEventWithAbletonSignal " && formerKeyMetro =='$') {  // circularMov==false
   for (int i = 0; i < networkSize; i++) {
     dataMappedForMotorisedPosition[i] = (int) map ( metroPhase[i], -PI/2, PI/2, 0, numberOfStep/2);
    }
  }

    if (modeStartKeyToFollow == " null " || keyMode == " propagationBallRotationBis ") {    // when propagationBall  
     rev=revLfo; // actualise counter of normal mode  
   for(int i = 0; i < networkSize; i++) {  
 //   dataMappedForMotorisedPosition[i]=(int) newPosF[i]+ (rev[i]*numberOfStep);  // map motor with countrevs doesn't work
    
     dataMappedForMotorisedPosition[i]=(int) newPosF[i]+ (revLfo[i]*numberOfStep)+ (int) recordLastDataOfMotorPosition[i];
    }
   }

   if (keyMode == " trigEventWithAbletonSignal " && formerKeyMetro =='*') { 

 for (int i = 0; i < networkSize; i++) {

    //*******************************  ASSIGN MOTOR WITH POSITION
    //   pos[i]= pos[i]-numberOfStep/4; // The positions 0 of my motors in real are shifted of - half_PI  

    if (rev[i]!=0  && (net.phase[i] >  0) ) { // number of revolution is even and rotation is clock wise   
     dataMappedForMotorisedPosition[i]= int (map (net.phase[i], 0, TWO_PI, 0, numberOfStep))+ rev[i]*numberOfStep;
    }

    //   if (rev[i]!=0  && (net.phase[i] <  0)) { // number of revolution is even and rotation is Counter clock wise   
    if (rev[i]!=0  && (net.phase[i] <  0)) { // number of revolution is even and rotation is Counter clock wise   

     dataMappedForMotorisedPosition[i]= int (map (net.phase[i], 0, -TWO_PI, numberOfStep, 0))+ rev[i]*numberOfStep;
    }

    if (rev[i]==0 && (net.phase[i] < 0) ) { //  number of revolution is 0 and rotation is counter clock wise 
      dataMappedForMotorisedPosition[i]= int (map (net.phase[i], 0, -TWO_PI, numberOfStep, 0));        
      //    print ("pos "); print (i); print (" CCW rev=0");println (pos[i]);
    }         
    if  (rev[i]==0 && (net.phase[i] > 0) ) {  //  number of revolution is 0 and rotation is clock wise     
      dataMappedForMotorisedPosition[i]= int (map (net.phase[i], 0, TWO_PI, 0, numberOfStep));         
    }
   }
  }

     //*******************  SWITCH MODE oTHER SoLUTION

  if (formerKeyMetro == '$') {
    for (int i = 0; i < networkSize; i++) {
    dataMappedForMotorisedPosition[i]+= lastPositionFromCircularMode[i];  // lastPositionFromCircularMode[i] comes with key k too
    }
  }

   if (formerKeyMetro == '*' ) {
    for (int i = 0; i < networkSize-0; i++) { // 
     lastPositionFromCircularMode[i]=dataMappedForMotorisedPosition[i];  
    } 
  }


  if ( keyMode == " propagationBallRotationBis " ) {
    for (int i = 0; i < networkSize-0; i++) { // 
    dataMappedForMotorisedPosition[i]+= lastPositionFromCircularMode[i];
  //  actualisePositionDataFromCircular = false; //
    }  
   }


  if (formerKeyMetro == '*' && actualisePositionDataFromCircular == true) {
    for (int i = 0; i < networkSize-0; i++) {
  //   recordLastDataOfMotorPosition[i]=dataMappedForMotorisedPosition[i];  // add recordLastDataOfMotorPosition[i] to motor position in  when switching to propagationBallRotationBis
    } 
  }
//---------------------------------------------------------------
//************************ SetAcceleration with measure and position from the song

  if (keyMode == " trigEventWithAbletonSignal ") {
    if (modeStartKeyToFollow!= " samplingModeInternal "){
         if (modeStartKeyToFollow!= " followSignalSampledOppositeWay(frameRatio) "){
     if (positionMov != " troisieme " && measure<17) {
      send24DatasToTeensy6motors(6, 3, -3, -1);
  }

     if (measure>=17 && measure<=41){
       send24DatasToTeensy6motors(7, 3, -3, -1);
         }
        if (measure>41 && measure<=100){
       send24DatasToTeensy6motors(8, 3, -3, -1);
         }
       }
      } 
     }
  
   if ( modeStartKeyToFollow== " samplingModeInternal " || modeStartKeyToFollow== " followSignalSampledOppositeWay(frameRatio) ")
   {  if (measure<=3 )
     { 
      send24DatasToTeensy6motors(5, -3, -3, -1);
     }
    }

   if (keyMode == " propagationBallRotationBis ") {

     send24DatasToTeensy6motors(10, -10, -3, -1);
   
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
   //  dataMappedForMotorisedPosition[i] = dataMappedForMotorisedPosition[i]+ recordLastDataOfMotorPosition[i];
   }

  
}
