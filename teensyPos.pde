
void teensyPos(){
  
  text ( " circularMov " + !circularMov , 200, 100) ; //
 
 if ( measure < 635)  {  

  if ( keyMode == " propagationBallRotationBis "  
    )  {   // || keyMode == " addSignalOneAndTwo "
     rev=revLfo; // actualise counter of normal mode  
   for(int i = 0; i < networkSize; i++) {  
   //  dataMappedForMotorisedPosition[i]=(int) newPosF[i]+ (rev[i]*numberOfStep);  // map motor with countrevs doesn't work
    
     dataMappedForMotorisedPosition[i]=(int) newPosF[i]+ (revLfo[i]*numberOfStep)+ (int) recordLastDataOfMotorPosition[i];
    }
  }

  if ( keyMode == " propagationBallRotationBis "  && formerKeyMetro=='*')
    {    // actualise counter of normal mode from revLfo from method  not here

      for (int i = 0; i < networkSize; i++) {
       
     
            
      //*******************************  ASSIGN MOTOR WITH POSITION

      if (revLfo[i]!=0  && (net.phase[i]>0) ) { // number of revLfoolution is even and rotation is clock wise   
        dataMappedForMotorisedPosition[i]= int (map (net.phase[i], 0, TWO_PI, 0, numberOfStep))+ (revLfo[i]*numberOfStep);
      }

      if (revLfo[i]!=0  && (net.phase[i] <  0)) { // number of revLfoolution is even and rotation is Counter clock wise          // pos[i]= int (map (positionToMotor[i], 0, -numberOfStep, 0,  numberOfStep))+ (revLfo[i]*numberOfStep);
        dataMappedForMotorisedPosition[i]= int (map (net.phase[i], 0, -TWO_PI, numberOfStep, 0)) +(revLfo[i]*numberOfStep);       //   print ("pos "); print (i); print (" ");println (pos[i]);
      }

      if (revLfo[i]==0 && (net.phase[i] < 0) ) { //  number of revLfoolution is 0 and rotation is counter clock wise 
        dataMappedForMotorisedPosition[i]= int (map (net.phase[i], 0, -TWO_PI, numberOfStep, 0));        
      }         
      if  (revLfo[i]==0 && (net.phase[i] > 0) ) {  //  number of revLfoolution is 0 and rotation is clock wise     
        dataMappedForMotorisedPosition[i]= int (map (net.phase[i], 0, TWO_PI, 0, numberOfStep));                //      print ("pos "); print (i); print (" CW revLfo=0 ");println (pos[i]);
      }
      
      recordLastDataOfMotorPosition[i]=  dataMappedForMotorisedPosition[i];
    }
  }

           if ((keyMode == " trigEventWithAbletonSignal " || keyMode == " propagationBallRotationBisTest ") && formerKeyMetro =='$') {  // record is from  '*' last position is from k
            for (int i = 0; i < networkSize; i++) {
               //   oldDataMappedForMotorisedPosition[i]= dataMappedForMotorisedPosition[i];
                     dataMappedForMotorisedPosition[i] = (int) map ( metroPhase[i], -PI/2, PI/2, 0, numberOfStep/2) + recordLastDataOfMotorPosition[i] +lastPositionFromCircularMode[i];
                println ( " dataMappedForMotorisedPosition[i] " + dataMappedForMotorisedPosition[i] );
              }
            }



    if ( (keyMode == " trigEventWithAbletonSignal " || keyMode == " propagationBallRotationBisTest ") && formerKeyMetro =='*') { 

         if ( keyMode == " propagationBallRotationBisTest " ) { 
        rev=revLfo; // actualise counter of normal mode from revLfo from method mapNewPosX() but net.phase i is good?
        text ( " keyMode " + keyMode + " phase2 " + net.phase [2] , 0, 100) ; //
       }


         for (int i = 0; i < networkSize; i++) {
  
     //*******************************  ASSIGN MOTOR WITH POSITION

         //   oldDataMappedForMotorisedPosition[i]= dataMappedForMotorisedPosition[i];

      if (rev[i]!=0  && (net.phase[i] >  0) ) { // number of revolution is even and rotation is clock wise   
      dataMappedForMotorisedPosition[i]= int (map (net.phase[i], 0, TWO_PI, 0, numberOfStep))+ rev[i]*numberOfStep;
      }
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

     //******************* ADD POSITION FROM  SWITCHED MODE 

       if (formerKeyMetro == '$') {
         for (int i = 0; i < networkSize; i++) {
        dataMappedForMotorisedPosition[i]+= lastPositionFromCircularMode[i];  // lastPositionFromCircularMode[i] comes with key k too
        dataMappedForMotorisedBigMachine[i]=dataMappedForMotorisedPosition[i];
            }
          }
        /*
         if (formerKeyMetro == '*' ) {
        for (int i = 0; i < networkSize-0; i++) { // 
        lastPositionFromCircularMode[i]=dataMappedForMotorisedPosition[i]; 
         //  dataMappedForMotorisedPosition[i]+= positionFromPropaBis[i];  
           } 
          }
          */
/*
            if (formerKeyMetro == '*' && encoderTouched[0]) {
              for (int i = 0; i < networkSize-0; i++) { // 
    
     dataMappedForMotorisedPosition[i]+= positionFromShiftedOscillator[i];
     dataMappedForMotorisedBigMachine[i]=dataMappedForMotorisedPosition[i]+readPositionEncoder[i]; 
        print ( " add Encodeur To Processing Position In Pendular Mode" + readPositionEncoder[i]); 
       } 
        }
*/

            if (formerKeyMetro == '*' ) {
              for (int i = 0; i < networkSize-0; i++) { // 
    
   //  dataMappedForMotorisedPosition[i]+= positionFromShiftedOscillator[i];
     dataMappedForMotorisedBigMachine[i]=dataMappedForMotorisedPosition[i]+readPositionEncoder[i]; 
        print ( " add Encodeur To Processing Position In Pendular Mode" + readPositionEncoder[i]); 
       } 
        }
    /*
      if (formerKeyMetro == '*' && (encoderTouched[0] || encoderTouched[1] || encoderTouched[2] || encoderTouched[3] || encoderTouched[4] || encoderTouched[5] ) ) {
      for (int i = 0; i < networkSize-0; i++) { // 
       readPositionEncoder[i] =(int) map (encodeur[i], 0, 800, 0, numberOfStep); 
     dataMappedForMotorisedPosition[i]+= positionFromShiftedOscillator[i];  
     
      dataMappedForMotorisedBigMachine[i] = dataMappedForMotorisedPosition[i]+readPositionEncoder[i];
    
       print ( " add Encodeur To Processing Position " + readPositionEncoder[i]);
        print ( " add Encodeur To Processing Position ");
         print ( " add Encodeur To Processing Position ");
          print ( " add Encodeur To Processing Position ");
      } 
    }
    */
    


      if ( keyMode == " propagationBallRotationBis " ) {
       for (int i = 0; i < networkSize-0; i++) { // 
       recordLastDataOfMotorPosition[i]+= lastPositionFromCircularMode[i];
        //  actualisePositionDataFromCircular = false|| dol==true; //
        //  recordLastDataOfMotorPosition[i]=recordLastDataOfMotorPosition[i];
       }  
      }


       if (formerKeyMetro == '*' && actualisePositionDataFromCircular == true) {
        for (int i = 0; i < networkSize-0; i++) {
         //   recordLastDataOfMotorPosition[i]=dataMappedForMotorisedPosition[i];  // add recordLastDataOfMotorPosition[i] to motor position in  when switching to propagationBallRotationBis
         } 
         }
        } // end mesure 635
      //---------------------------------------------------------------
        //************************ SetAcceleration with measure and position from the song

  if (keyMode == " trigEventWithAbletonSignal " && measure < 635) {
    if (modeStartKeyToFollow!= " samplingModeInternal "){
      if (modeStartKeyToFollow!= " followSignalSampledOppositeWay(frameRatio) "){
            if (allMachineConnected){
           send24DatasToTeensy10motorsToBigMachine(4, 3, -3, -1);
          }
        if (positionMov != " troisieme " && measure<17) {
            send24DatasToTeensy6motorsToLittleMachine(4, 3, -3, -1);
         }

        if (measure>=17 && measure<=41){
            send24DatasToTeensy6motorsToLittleMachine(4, 3, -3, -1);
        }
        if (measure>41 && measure<=67){
            send24DatasToTeensy6motorsToLittleMachine(4, 3, -4, -1);
        }
        if (measure>67 && measure<=120){
            send24DatasToTeensy6motorsToLittleMachine(3, 3, -4, -1);
        }
           if (measure>=635 ){
            send24DatasToTeensy6motorsToLittleMachine(635, 3, -4, -1);
        }
      }
    } 
  }
  
  if ( modeStartKeyToFollow== " samplingModeInternal " || modeStartKeyToFollow== " followSignalSampledOppositeWay(frameRatio) "
                 || keyMode == " trigEventWithAbletonSignal "  ) {
    if (measure<=3 )
     { 
      send24DatasToTeensy6motorsToLittleMachine(5, -3, -3, -1);
     }
    }

   if (keyMode == " propagationBallRotationBis " || keyMode == " propagationBallRotationBisTest " ) {
       send24DatasToTeensy6motorsToLittleMachine(5, -11, -3, -1);  
     }

    if (keyMode == " addSignalOneAndTwo ") {
       send24DatasToTeensy6motorsToLittleMachine(5, -10, -3, -1); 
    }

    if (keyMode == " trigEventWithAbletonSignal ") {
      if (measure>100 && measure<=124){
       send24DatasToTeensy6motorsToLittleMachine(4, 3, -12, -1);
     }
    }    
  
}

void mapNewPosX() {
  text ( " trigModPos[oscillatorChange] " + TrigmodPos[oscillatorChange]  +  " mapData From Key" +  keyMode + " modStart "  + modeStartKeyToFollow, 800, 800);
    for (int i = 0; i <  networkSize-0; i+=1) { 
    newPosXaddSignal[i]%=TWO_PI;
    net.phase[i]=newPosXaddSignal[i]; // to trig something with arduinoPos
    }
 // countRevs(); // doesn't work whit propagation function
     for (int i = 0; i <  networkSize-0; i+=1) {
     net.oldPhase[i]=net.phase[i];
    }


    // map depending way of rotation

      for (int i = 0; i <  networkSize-0; i+=1) { // la premiere celle du fond i=2,  la derniere celle du devant i=11
   
     positionToMotor[i]= ((int) map (newPosXaddSignal[i], 0, TWO_PI, 0, numberOfStep)%numberOfStep); //
     newPosF[i]=positionToMotor[i]%6400;
   
       if (net.oldPhase[i] > net.phase[i] ) {

     positionToMotor[i]= ((int) map (newPosXaddSignal[i], 0, -TWO_PI,  numberOfStep, 0)%numberOfStep); //
     newPosF[i]=positionToMotor[i]%6400;
    }
   } 
   // end map depending way of rotation
  
     textSize (50);

     for (int i = 0; i <  networkSize-0; i+=1) { 
         TrigmodPos[i]=1; 
      }

       
            
     for (int i = 0; i <  networkSize-0; i+=1) { 
       if ( doo==false && formerKeyMetro == '*') { //  work with propaBis in circularMode only

          if ( oldPosF[i]>newPosF[i] ) { //
            revLfo[i]++;
            TrigmodPos[i]=0;   
          }
        }
      }

        if (dol && !doo ) { // && TrigmodPos[oscillatorChange]!=0

            if ( propagationTrigged)  {    // set j as 2  
             int j; 
             j= (oscillatorChange-1);
              if (j<= -1){
            j= networkSize-1;
            TrigmodPos[j]=2;
        }
    
              text ( " cancel counting bug by minusing ", 400, 400);
             revLfo[oscillatorChange]--;  // cancel counter
            // revLfo[j]--;  // cancel counter
              TrigmodPos[j]=3;   
      
       }
     }

    
    
     for (int i = 0; i <  networkSize-0; i+=1) { 
      text (  " net.oldPhase[i] " + net.phase[i] + " " + newPosXaddSignal[i] + " oldOldPosF " + oldOldPosF[i] + " oldPosF " + oldPosF[i] + " newPosF " + newPosF[i], width*2, i*50);
 
      if ( doo==true && formerKeyMetro == '*' ){  // compteur pour propagation circulaire
  
        if (  newPosF[i]>oldPosF[i]  && (oldPosF[i]<=oldOldPosF[i]) ){  // voir dans quel sens la retropropagation oriente  i et j
     revLfo[i]--;
     TrigmodPos[i]=0;
      }
     }

       if (dol && doo  && TrigmodPos[i]!=0) {

        if ( propagationTrigged)  {    // set j as 2  
        int j; 
        j= (oscillatorChange-1);
         if (j<= -1){
         j= networkSize-1;
         TrigmodPos[j]=2;
        }

             text ( " cancel counting bug by adding ", 400, 400);
       //   revLfo[oscillatorChange]++;
       //  revLfo[j]++;  // cancel counter
         TrigmodPos[j]=4;   
      
       }
     }
   


     print (" TrigmodPos[i" , TrigmodPos[i]);

     oldPositionToMotor[i]=  positionToMotor[i];
     oldOldPosF[i]=oldPosF[i];
     oldPosF[i]=newPosF[i];
 
     text ("revLFO " + revLfo[i] + "metro " + metroPhase[i], -1600, height-500 - 75*i);
     } 
     text (" mode " + keyMode + " signal2 " + signal[2] +  " net " + net.phase[2] + " metro " +   metroPhase[2] , -1600, height-300 );  
}

