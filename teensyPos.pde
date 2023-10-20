void teensyPos()
{
   rotate(PI/2);
   textSize (75);
   translate (0, -1000, 0);
   rotate(PI);
   text ( " modeCircular " + modeCircular , 200, -300) ; //
   rotate(-PI);
   int j=1;
   text  (
                  
                   " MotorisedP " + j + " "  +  dataMappedForMotorisedPosition[j]+
                   " deltaOld  " +deltaOldPhaseActualPhase[j] +  " readPositionEncoder " + readPositionEncoder[j]+
                   " MotorisedBig[j] " +  dataMappedForMotorisedBigMachine[j] + " speedDelta " + speedDelta + " old " + oldMemoryi + " mem " + memoryi +
                   " net.pha " +  net.phase[j] + " metro " + metroPhase[j]+ " recordFromCir " + recordLastDataOfMotorPosition[j]
                                    
                   , -300 , -height-300, -500);
    


    //  oldDataMappedForMotorisedPosition=dataMappedForMotorisedPosition; 

    if  (keyMode == " samplingModeWithLive " && formerKeyMode == " trigEventWithAbletonSignal "  )
     { 
     //  revLfo=rev; // actualise counter revLfo from " normal mode"  from rev 
     }

    if ((keyMode == " trigEventWithAbletonSignal "  || keyMode == " null " ) && formerKeyMode == " samplingModeWithLive "  ) 
    { 
    //   revLfo=rev;
     }

    if  ((keyMode == " propagationBallRotationBis " || keyMode == " propagationSampleBall  ") && formerKeyMode == " trigEventWithAbletonSignal "  )
     { 
       revLfo=rev; // actualise counter revLfo from " normal mode"  from rev 
    }

    if ( modeStartKeyToFollow == " followSignalSampledOppositeWay(frameRatio) " && formerKeyMode == " trigEventWithAbletonSignal "  ) { 
       revLfo=rev; // actualise counter revLfo from " normal mode"  from rev 
    }


  if ( measure <= 635) // to avoid machine blocked 
  {
      
    if ( keyMode == " propagationBallRotationBis " || keyMode == " propagationSampleBall  " )  // || keyMode == " addSignalOneAndTwo "
         
    {  
      for(int i = 0; i < networkSize; i++) {

        //  dataMappedForMotorisedPosition[i]=(int) newPosF[i]+ (rev[i]*numberOfStep);  // map motor with countrevs doesn't work. Try to adapt rev with revLfo method
         // dataMappedForMotorisedPosition[i]=(int) newPosF[i]+ (revLfo[i]*numberOfStep);//+ (int) recordLastDataOfMotorPosition[i];
          dataMappedForMotorisedPosition[i]=(int) positionToMotor[i]+ (revLfo[i]*numberOfStep);//+ (int) recordLastDataOfMotorPosition[i];

      if (keyMode == " propagationSampleBall  " ){
          dataMappedForMotorisedPosition[i]=(int) positionToMotor[i]+ (revLfo[i]*numberOfStep);//+ (int) recordLastDataOfMotorPosition[i];
         }
          dataMappedForMotorisedBigMachine[i]=dataMappedForMotorisedPosition[i];//+readPositionEncoder[i];
     }
    }

    if ( modeStartKeyToFollow == " followSignalSampledOppositeWay(frameRatio) " //&& modeCircular    // || keyMode == " addSignalOneAndTwo "
        )   
        {  
        revLfo=rev; // actualise counter revLfo from " normal mode"  from rev 
        for(int i = 0; i < networkSize; i++) {  
        dataMappedForMotorisedPosition[i]=(int) positionToMotor[i]+ (revLfo[i]*numberOfStep);//+ (int) recordLastDataOfMotorPosition[i];
        dataMappedForMotorisedBigMachine[i]=dataMappedForMotorisedPosition[i];//+readPositionEncoder[i];
     }
    }

   if ( keyMode == " propagationBallRotationNOBisExperimental "  ) 
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
       recordLastDataOfMotorPosition[i]= dataMappedForMotorisedPosition[i];
       dataMappedForMotorisedBigMachine[i]= dataMappedForMotorisedPosition[i];//+readPositionEncoder[i];
     }
   }

           if ((keyMode == " trigEventWithAbletonSignal " || keyMode == " propagationBallRotationNOBisTest ") && formerKeyMetro =='$') {  // record is from  '*' last position is from k      
            for (int i = 0; i < networkSize; i++) {
                  // oldDataMappedForMotorisedPosition[i]= dataMappedForMotorisedPosition[i];

                dataMappedForMotorisedPosition[i] = (int) map ( metroPhase[i], -PI/2, PI/2, 0, numberOfStep/2) + 1*rev[i]*numberOfStep;
                dataMappedForMotorisedBigMachine[i]=dataMappedForMotorisedPosition[i];//+readPositionEncoder[i]; // put it lower in the program
                 //recordLastDataOfMotorPosition[i]=dataMappedForMotorisedPosition[i];
              }
            }



    if ( (keyMode == " trigEventWithAbletonSignal " || keyMode == " propagationSampleNOBall  " )   // propagationBallRotationNOBisTest
                                                     && formerKeyMetro =='*')
    { 

     if ( keyMode == " propagationBallRotationNOBisTest " ) { 
             // rev=revLfo; // actualise counter of normal mode from revLfo from method mapNewPosX() but net.phase i is good?
             //   revLfo=rev;
              text ( " revLfo "  + revLfo[2]  + " rev " + rev[2] +  "keyMode " + keyMode + " phase2 " + net.phase [2] , 0, 100) ; //
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

           //  recordLastDataOfMotorPosition[i] = dataMappedForMotorisedPosition[i];
              dataMappedForMotorisedBigMachine[i]=dataMappedForMotorisedPosition[i]+lastActualPosition[i]; // RENAME;//+readPositionEncoder[i];

              //  recordLastDataOfMotorPosition[i]=dataMappedForMotorisedPosition[i];
              //  print ( " record * " + recordLastDataOfMotorPosition[i] );
           
         }
      
     }

      //******************* ADD POSITION FROM  SWITCHED MODE 

       if (formerKeyMetro == '$') {
         for (int i = 0; i < networkSize; i++) {
          // dataMappedForMotorisedPosition[i]+= lastActualPosition[i];  // lastActualPosition[i] comes with key k too

             dataMappedForMotorisedPosition[i]+=lastActualPosition[i];// RENAME good with k only

             dataMappedForMotorisedBigMachine[i]=dataMappedForMotorisedPosition[i];//+readPositionEncoder[i];

              print ( " record $ " + recordLastDataOfMotorPosition[i] + " lastPos " + lastActualPosition [i] );
             //dataMappedForMotorisedBigMachine[i]=dataMappedForMotorisedPosition[i]; // // doesn' t work
             }
          }
            /*
           if (formerKeyMetro == '*' ) {
            for (int i = 0; i < networkSize-0; i++) { // 
            lastActualPosition[i]=dataMappedForMotorisedPosition[i]; 
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
          //  recordLastDataOfMotorPosition[i]=dataMappedForMotorisedPosition[i]; // NO NEED with followSignalSampledOppositeWay(frameRatio)
            dataMappedForMotorisedBigMachine[i]=dataMappedForMotorisedPosition[i]+lastActualPosition[i];//+lastActualPosition[i];//+readPositionEncoder[i];  
             //   dataMappedForMotorisedPosition[i]+= positionFromShiftedOscillator[i];// useless but find something to make i and u working in circular movement
             //   dataMappedForMotorisedBigMachine[i]=dataMappedForMotorisedPosition[i]+readPositionEncoder[i];  // doesn' t work

             //   print ( " add Encodeur To Processing Position In Pendular Mode" + readPositionEncoder[i]); 
             //   dataMappedForMotorisedBigMachine[i]=dataMappedForMotorisedPosition[i];// +readPositionEncoder[i]

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
    
       if (keyMode == " propagationBallRotationBis " || keyMode == " propagationSampleBall  " )  {
         for (int i = 0; i < networkSize-0; i++) { // 
          // recordLastDataOfMotorPosition[i]+= lastActualPosition[i];
          //  actualisePositionDataFromCircular = false|| dol==true; //
          //  recordLastDataOfMotorPosition[i]=recordLastDataOfMotorPosition[i];
          dataMappedForMotorisedBigMachine[i]=dataMappedForMotorisedPosition[i]+recordLastDataOfMotorPosition[i]; // +readPositionEncoder[i]
          }  
        }


       if (formerKeyMetro == '*' && actualisePositionDataFromCircular == true) {
         for (int i = 0; i < networkSize-0; i++) {
         //   recordLastDataOfMotorPosition[i]=dataMappedForMotorisedPosition[i];  // add recordLastDataOfMotorPosition[i] to motor position in  when switching to propagationBallRotationBis
         } 
       }
          /*
            print ("newPosShifted "); showArrayF (newPosShifted);
            print ("oldPosShifted "); showArrayF (oldPosShifted);

            print ("net.phase "); showArrayF (net.phase);
            print ("old.phase "); showArrayF (net.oldPhase);

            print (" dataMappedForMotorisedBigMachine "); showArray (dataMappedForMotorisedBigMachine);
          */
          if (formerFormerKey=='I' ){
         for (int i = 0; i < (networkSize-0); i++) {  

           oldOldPosShifted[i]=oldPosShifted[i];
           oldPosShifted[i]=newPosShifted[i];
           newPosShifted[i]=net.phase[i];

            if (net.oldPhase[i]%TWO_PI<net.phase[i]){ 
        //if (newPosShifted[i]>oldPosShifted[i]  && (oldPosShifted[i]<=oldOldPosShifted[i])) { // turnCCW

              //  net.phase[i]-=TWO_PI;
              //   rev[i]-=1;
              }
          }
     }

    //if ( formerFormerKey=='I' || formerKey=='I'|| key=='I') { // utiliser return

      /*
     
       if ( formerFormerKey=='U' || formerKey=='U'|| key=='U') { //U--> +1   utiliser return
              
              textSize (500);
              text ( " here in TeensyPos ", 400, height/2);

            print ( "oldPos ");      showArray (oldDataMappedForMotorisedPosition); 
            print ( "updPos ");      showArray (dataMappedForMotorisedPosition);


        for (int i = 0; i < networkSize-0; i++) {
          println (" here U in TeensyPos", formerKey,  " " ,key);
              //if (oldDataMappedForMotorisedPosition[i]>dataMappedForMotorisedPosition[i]) {
                  if (net.oldPhase[i]%TWO_PI<net.phase[i]) {
     
             int [] update;
               println ( "old " + i + " " + oldDataMappedForMotorisedPosition[i]);
               println ( "bef " + i + " " + dataMappedForMotorisedPosition[i]);
                //  println ( "upd " + i + " " + update[i]) ;
                // update = upDateMotorisedPosition(dataMappedForMotorisedPosition);
                // dataMappedForMotorisedPosition=update;
                // net.phase[i]+=TWO_PI;
        //**   rev[i]+=1;
               println ( "UPA " + i + " " + dataMappedForMotorisedPosition[i]);
          //     println ( "updA " + i + " " + update[i]) ;          
            }
         } 
          key='#';
          formerFormerKey='#';
          formerKey='#';
       }


      */



    /*
       if ( formerFormerKey=='U' || formerKey=='U'|| key=='U') { // utiliser return
             
              textSize (500);
              text ( " here I in TeensyPos ", 400, height/2);

            print ( "oldPos ");      showArray (oldDataMappedForMotorisedPosition); 
            print ( "updPos ");      showArray (dataMappedForMotorisedPosition);


          for (int i = 0; i < networkSize-0; i++) {
               println (" here   in TeensyPos", formerKey,  " " ,key);

             
           
              oldOldPosShifted[i]=oldPosShifted[i];
              oldPosShifted[i]=newPosShifted[i];
              newPosShifted[i]=phaseMapped[i];


             if (newPosShifted[i]>oldPosShifted[i]  && (oldPosShifted[i]<=oldOldPosShifted[i])) { // turnCCW
     
                 int [] update;
                 println ( "old " + i + " " + oldDataMappedForMotorisedPosition[i]);
                 println ( "bef " + i + " " + dataMappedForMotorisedPosition[i]);
                  //  println ( "upd " + i + " " + update[i]) ;
                  // update = upDateMotorisedPosition(dataMappedForMotorisedPosition);
                 // dataMappedForMotorisedPosition=update;
                 // net.phase[i]+=TWO_PI;
                 rev[i]+=1;
                 println ( "UPA " + i + " " + dataMappedForMotorisedPosition[i]);
                 //     println ( "updA " + i + " " + update[i]) ;          
               }
             } 
                 key='#';
                 formerFormerKey='#';
                 formerKey='#';
        }

    */  


         




  } // end mesure 635
      //---------------------------------------------------------------
        //************************ SetAcceleration with measure and position from the song

if (keyMode == " trigEventWithAbletonSignal " || keyMode == " null " )
  { 
    if (keyMode != " samplingModeWithLive " )
     {
    
     if (modeStartKeyToFollow!= " samplingModeInternal "){
       // if (modeStartKeyToFollow= " followSignalSampledOppositeWay(frameRatio) "){
       //     if (allMachineConnected){
         if (measure<105 ){
            send24DatasToTeensy10motorsToBigMachine(4, 3, -3, -1);
          }

         if (positionMov != " troisieme " && measure<17) {
            send24DatasToTeensy6motorsToLittleMachine( speedDelta, 2, -3, -1, 2, 1000);
          }

         if (measure>=17 && measure<=41){
            send24DatasToTeensy6motorsToLittleMachine( 3, 2, -3, -1, 2, 1000);
         }
         if (measure>41 && measure<=67){
            send24DatasToTeensy6motorsToLittleMachine( 3, 2, -3, -1, 2, 1000);

         if (measure>67 && measure<=90){
            send24DatasToTeensy6motorsToLittleMachine( 3, 2, -3, -1, 2, 1000);
         }
         if (measure>=105 ){
            send24DatasToTeensy6motorsToLittleMachine( 3, 2, -3, -1, 2, 1000);


            send24DatasToTeensy10motorsToBigMachine(4, 3, -3, -1);
        }
      }
     }
    }
   }

     
    if (modeStartKeyToFollow == " samplingModeInternal ")
    {
      if (measure>=45 )
         {
        send24DatasToTeensy10motorsToBigMachine(4, 3, -3, -1);
         }
       
    }
  
   if ( (modeStartKeyToFollow== " samplingModeInternal " || modeStartKeyToFollow== " followSignalSampledOppositeWay(frameRatio) ")
                 && keyMode == " trigEventWithAbletonSignal "  )
     {
        if (measure<=5 )
         { 
           //             send24DatasToTeensy6motorsToLittleMachine( 3, 2, -3, -1, 2, 1000);

         }
    }

   if (keyMode == " propagationBallRotationBis " || keyMode == " propagationSampleBall " )
    {
            send24DatasToTeensy6motorsToLittleMachine( 3, 2, -3, -1, 2, 1000);

       send24DatasToTeensy10motorsToBigMachine(4, 6, -3, -1);
     }

    if (keyMode == " addSignalOneAndTwo ")
     {
            send24DatasToTeensy6motorsToLittleMachine( 3, 2, -3, -1, 2, 1000);
    }

    if (keyMode == " trigEventWithAbletonSignal " || keyMode == " followSignalSampledOppositeWay(frameRatio) ")
     {
      if (modeStartKeyToFollow != " samplingModeWithLive ")
      {
      if (measure>241 ){
        print (" to change Mode and still runing ");
        send24DatasToTeensy6motorsToLittleMachine( 6, 2, -3, -1, 2, 1000);
      }
     }
     }

     if (keyMode == " trigEventWithAbletonSignal " && measure < 635 && music_from_ableton_live == " pleasureKraft ") 
     {         
       // send24DatasToTeensy10motorsToBigMachine(4, 3, -3, -1);
      }
       rotate(-PI/2);   
 
}

     



//-
void teensyPosOri(){
  
  text ( " modeCircular " + !modeCircular , 200, 100) ; //
 
 if ( measure < 635)  {  // to avoid machine blocked 

  if ( keyMode == " propagationBallRotationBis "  
    )  {   // || keyMode == " addSignalOneAndTwo "
     rev=revLfo; // actualise counter of normal mode  
   for(int i = 0; i < networkSize; i++) {  
   //  dataMappedForMotorisedPosition[i]=(int) newPosF[i]+ (rev[i]*numberOfStep);  // map motor with countrevs doesn't work
    
      dataMappedForMotorisedPosition[i]=(int) newPosF[i]+ (revLfo[i]*numberOfStep)+ (int) recordLastDataOfMotorPosition[i];
      dataMappedForMotorisedBigMachine[i]=dataMappedForMotorisedPosition[i]+readPositionEncoder[i];
    }
  }

  if ( keyMode == " propagationBallRotationBis " || modeStartKeyToFollow == " followSignalSampledOppositeWay(frameRatio) "  && formerKeyMetro=='*')
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

      println ( modeStartKeyToFollow + " " + dataMappedForMotorisedPosition[i] );
      
    // recordLastDataOfMotorPosition[i]=  dataMappedForMotorisedPosition[i];
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


      dataMappedForMotorisedPosition[i]-=numberOfStep/2;

      dataMappedForMotorisedBigMachine[i]=dataMappedForMotorisedPosition[i]+readPositionEncoder[i];//+(int)deltaOldPhaseActualPhase[i];
      recordLastDataOfMotorPosition[i]=dataMappedForMotorisedPosition[i];
      print ( " record1 " + recordLastDataOfMotorPosition[i] );

     }
      
     }

        if ((keyMode == " trigEventWithAbletonSignal " || keyMode == " propagationBallRotationBisTest ") && formerKeyMetro =='$') {  // record is from  '*' last position is from k
            for (int i = 0; i < networkSize; i++) {
               //   oldDataMappedForMotorisedPosition[i]= dataMappedForMotorisedPosition[i];
                     dataMappedForMotorisedPosition[i] = (int) map ( metroPhase[i], -PI/2, PI/2, 0, numberOfStep/2) + recordLastDataOfMotorPosition[i] +lastActualPosition[i];

                     
                println ( " dataMappedForMotorisedPosition[i] " + dataMappedForMotorisedPosition[i] );
                dataMappedForMotorisedBigMachine[i]=dataMappedForMotorisedPosition[i]+readPositionEncoder[i];
            //    recordLastDataOfMotorPosition[i]=dataMappedForMotorisedPosition[i];
              }
            }

     //******************* ADD POSITION FROM  SWITCHED MODE 

       if (formerKeyMetro == '$') {
         for (int i = 0; i < networkSize; i++) {
      //  dataMappedForMotorisedPosition[i]+= lastActualPosition[i];  // lastActualPosition[i] comes with key k too
         dataMappedForMotorisedPosition[i]+= recordLastDataOfMotorPosition[i];

         print ( " record2 " + recordLastDataOfMotorPosition[i] );
        //dataMappedForMotorisedBigMachine[i]=dataMappedForMotorisedPosition[i]; // // doesn' t work
            }
          }
        /*
         if (formerKeyMetro == '*' ) {
        for (int i = 0; i < networkSize-0; i++) { // 
        lastActualPosition[i]=dataMappedForMotorisedPosition[i]; 
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

          dataMappedForMotorisedPosition[i]+= positionFromShiftedOscillator[i]; // from i or u
          dataMappedForMotorisedBigMachine[i]=dataMappedForMotorisedPosition[i]+readPositionEncoder[i];  // doesn' t work
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
         recordLastDataOfMotorPosition[i]+= lastActualPosition[i];
          //  actualisePositionDataFromCircular = false|| dol==true; //
          //  recordLastDataOfMotorPosition[i]=recordLastDataOfMotorPosition[i];
         dataMappedForMotorisedBigMachine[i]=dataMappedForMotorisedPosition[i]+readPositionEncoder[i]+recordLastDataOfMotorPosition[i];
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

  /*
  if (keyMode == " trigEventWithAbletonSignal " && measure < 635) {
    if (modeStartKeyToFollow!= " samplingModeInternal "){
      if (modeStartKeyToFollow!= " followSignalSampledOppositeWay(frameRatio) "){
       //     if (allMachineConnected){
            send24DatasToTeensy10motorsToBigMachine(4, 3, -3, -1);
      //    }
        if (positionMov != " troisieme " && measure<17) {
            send24DatasToTeensy6motorsToLittleMachine( 3, 34, 3, -3, -1);
         }

        if (measure>=17 && measure<=41){
            send24DatasToTeensy6motorsToLittleMachine( 3, 34, 3, -3, -1);
        }
        if (measure>41 && measure<=67){
            send24DatasToTeensy6motorsToLittleMachine( 3, 34, 3, -4, -1);
        }
        if (measure>67 && measure<=120){
            send24DatasToTeensy6motorsToLittleMachine( 3, 3speedDelta, 3, -4, -1);
        }
           if (measure>=635 ){
            send24DatasToTeensy6motorsToLittleMachine( 3, 3635, 3, -4, -1);
        }
      }
    } 
  }
  */

  if (keyMode == " trigEventWithAbletonSignal " && measure < 635 && music_from_ableton_live == " pleasureKraft ") {
  
            send24DatasToTeensy10motorsToBigMachine(4, 3, -3, -1);
        }
        

  /*
  if ( modeStartKeyToFollow== " samplingModeInternal " || modeStartKeyToFollow== " followSignalSampledOppositeWay(frameRatio) "
                 || keyMode == " trigEventWithAbletonSignal "  ) {
    if (measure<=3 )
     { 
      send24DatasToTeensy6motorsToLittleMachine( 3, 35, -3, -3, -1);
     }
    }

   if (keyMode == " propagationSampleBall " || keyMode == " propagationBallRotationBis " || modeStartKeyToFollow== " followSignalSampledOppositeWay(frameRatio) " ) {
       send24DatasToTeensy6motorsToLittleMachine( 3, 35, -11, -3, -1);  
     }

    if (keyMode == " addSignalOneAndTwo ") {
       send24DatasToTeensy6motorsToLittleMachine( 3, 35, -10, -3, -1); 
    }

    if (keyMode == " trigEventWithAbletonSignal ") {
      if (measure>82 && measure<=124){
       send24DatasToTeensy6motorsToLittleMachine( 3, 34, 3, -12, -1);
     }
    } 
*/
    
         
  
  
}
