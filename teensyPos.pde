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

  if ( music_from_ableton_live != " controlDr ")
   { 
    if ( music_from_ableton_live != " Dessine ")
    { 
     if ((keyMode == " trigEventWithAbletonSignal "  || keyMode == " null " ) && formerKeyMode == " samplingModeWithLive ") 
     { 
       //  revLfo=rev;
       // rev+=revLfo;
      }

     if  ((keyMode == " propagationBallRotationBis " || keyMode == " propagationSampleBall  ") && formerKeyMode == " trigEventWithAbletonSignal ")
      { 
        revLfo=rev; // actualise counter revLfo from " normal mode"  from rev 
      }

     if ( modeStartKeyToFollow == " followSignalSampledOppositeWay(frameRatio) " && formerKeyMode == " trigEventWithAbletonSignal ")
      { 
       revLfo=rev; // actualise counter revLfo from " normal mode"  from rev 
      }
     if ( measure <= 635) // to avoid machine blocked 
     { 
        
     if ( keyMode == " propagationBallRotationBis " || keyMode == " propagationSampleBall  " )  // || keyMode == " addSignalOneAndTwo "      
     {  
      for(int i = 0; i < networkSize; i++) {

        //  dataMappedForMotorisedPosition[i]=(int) newPosF[i]+ (rev[i]*numberOfStep);  // map motor with countrevs doesn't work. Try to adapt rev with revLfo method
          dataMappedForMotorisedPosition[i]=(int) positionToMotor[i]+ (revLfo[i]*numberOfStep);//+ (int) recordLastDataOfMotorPosition[i];

      if (keyMode == " propagationSampleBall  " ){
          dataMappedForMotorisedPosition[i]=(int) positionToMotor[i]+ (revLfo[i]*numberOfStep);//+ (int) recordLastDataOfMotorPosition[i];
         }
          dataMappedForMotorisedBigMachine[i]=dataMappedForMotorisedPosition[i];//+readPositionEncoder[i];
     }
      }

   



      if ((keyMode == " trigEventWithAbletonSignal " || keyMode == " propagationBallRotationNOBisTest ") && formerKeyMetro =='$') {  // record is from  '*' last position is from k      
          for (int i = 0; i < networkSize; i++)
           {
                  // oldDataMappedForMotorisedPosition[i]= dataMappedForMotorisedPosition[i];

                dataMappedForMotorisedPosition[i] = (int) map ( metroPhase[i], -PI/2, PI/2, 0, numberOfStep/2) + 1*rev[i]*numberOfStep;
                dataMappedForMotorisedBigMachine[i]=dataMappedForMotorisedPosition[i];//+readPositionEncoder[i]; // put it lower in the program
                 //recordLastDataOfMotorPosition[i]=dataMappedForMotorisedPosition[i];
              }
          }
      if ( (keyMode == " trigEventWithAbletonSignalNo " || keyMode == " propagationSampleNOBall  " )   // propagationBallRotationNOBisTest
                                                     && formerKeyMetro =='*')
      { 

          if ( keyMode == " propagationBallRotationNOBisTest " ) 
          { 
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
         }
      
     }

      //******************* ADD POSITION FROM  SWITCHED MODE 

       if (formerKeyMetro == '$')
        {
         for (int i = 0; i < networkSize; i++)
          {  dataMappedForMotorisedPosition[i]+=lastActualPosition[i];// RENAME good with k only
             dataMappedForMotorisedBigMachine[i]=dataMappedForMotorisedPosition[i];//+readPositionEncoder[i];        
           }
        }
   
       if (formerKeyMetro == '*' )
        {
        for (int i = 0; i < networkSize-0; i++)
         {  
           //  recordLastDataOfMotorPosition[i]=dataMappedForMotorisedPosition[i]; // NO NEED with followSignalSampledOppositeWay(frameRatio)
            dataMappedForMotorisedBigMachine[i]=dataMappedForMotorisedPosition[i]+lastActualPosition[i];//+lastActualPosition[i];//+readPositionEncoder[i];  
          } 
        }

     }   // end mesure 635
        //---------------------------------------------------------------
        //************************ SetAcceleration with measure and position from the song

      if (keyMode == " trigEventWithAbletonSignalNO " || keyMode == " nullNO " )
      { 
       if (keyMode != " propagationBallRotationBis " )
       {
    
        if (modeStartKeyToFollow!= " samplingModeInternal ")
        {
         if (measure<=203 ){
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
         }

         if (measure>67 && measure<=90){
            send24DatasToTeensy6motorsToLittleMachine( 3, 2, -3, -1, 2, 1000);
         }
         if (measure>=105 ){
            send24DatasToTeensy6motorsToLittleMachine( 3, 2, -3, -1, 2, 1000);
         //   send24DatasToTeensy10motorsToBigMachine(4, 3, -3, -1);
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
     

     if  (keyMode == " samplingModeWithLive "   )  //
     
      { 
       //  revLfo=rev; // actualise counter revLfo from " normal mode"  from rev 
       if ( keyMode == " samplingModeWithLive "  ) 
       {    // actualise counter of normal mode from revLfo from method  not here
        //***   ableton[5]= map (ableton[5], 0, 1, 0, TWO_PI) ;  
        /*
        net.phase[0] = newPosF[networkSize-1]; 
        mapPropagationSampledBall(); // usefull?
        */

        revLfo=rev; // actualise counter revLfo from " normal mode"  from rev 
        
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
      }

      if (keyMode == " samplingModewithLive " || keyMode == " trigEventWithAbletonSignal ")
      {

        if (modeStartKeyToFollow != " followSignalSampledOppositeWay(frameRatio) " || modeStartKeyToFollow == " followSignalSampledOppositeWay(frameRatio) " )
        {
         if (measure>241 || measure <=241 )
         {
          print (" to change Mode and still runing to LITTLE ONLY ");
          // int accelerationRatio, int driver0_On_Off, int computeData, int eraseProcessingData, int driverNetWorkSizeOnOff, int timeElapsedBackingPosition
         // send24DatasToTeensy6motorsToLittleMachine( 6, 2, -3, -1, 2, 1000);
         }
        }
      }
     }
    }

     // end != music controlDr

     if (keyMode == " trigEventWithAbletonSignal " && measure < 635 && music_from_ableton_live == " pleasureKraft ") 
      {         
        send24DatasToTeensy10motorsToBigMachine(4, 3, -3, -1);
      }
    
     if (music_from_ableton_live == " madRush ") 
     { 
      rotate (PI);
      for (int i = 0; i < networkSize; i++)
       {   
         text (dataMappedForMotorisedBigMachine[i], width, -2000-100*i) ; 
       }
       print (" SEND24DATAS_____END_OF _FUNCTIONS____") ;      
        send24DatasToTeensy10motorsToBigMachine(4, 3, -3, -1);
      rotate (-PI);
     }

      if (music_from_ableton_live == " mouvement ") 
     { 
      rotate (PI);
      for (int i = 0; i < networkSize; i++)
       {   
         text (dataMappedForMotorisedBigMachine[i], width, -2000-100*i) ; 
       }       
        send24DatasToTeensy10motorsToBigMachine(4, 3, -3, -1);
      rotate (-PI);
     }

      if (music_from_ableton_live == " DessineOld " ) 
     { 
      rotate (PI);
      for (int i = 0; i < networkSize; i++)
       {   
         text (dataMappedForMotorisedBigMachine[i], width, -2000-100*i) ; 
       }       
        send24DatasToTeensy10motorsToBigMachine(4, 3, -3, -1);
      rotate (-PI);
     }





      if ( music_from_ableton_live == " controlDr " || music_from_ableton_live == " Dessine "  ) 
      {    // actualise counter of normal mode from revLfo from method  not here
    
      
       if (formerKeyMetro == '$')
           {
           for (int i = 0; i < networkSize; i++)
            {
             dataMappedForMotorisedPosition[i]=lastActualPosition[i]+recordLastDataOfMotorPosition[i];// RENAME good with k only
             dataMappedForMotorisedBigMachine[i]=dataMappedForMotorisedPosition[i];//+readPositionEncoder[i];        
             }
          }
   
       if (formerKeyMetro == '*' )
           {
           for (int i = 0; i < networkSize-0; i++)
            { // 
            //  recordLastDataOfMotorPosition[i]=dataMappedForMotorisedPosition[i]; // NO NEED with followSignalSampledOppositeWay(frameRatio)
              dataMappedForMotorisedPosition[i]=lastActualPosition[i]+countControlDr[i]*numberOfStep ;// RENAME good with k only
              dataMappedForMotorisedBigMachine[i]=dataMappedForMotorisedPosition[i];//+lastActualPosition[i];//+readPositionEncoder[i];  
              recordLastDataOfMotorPosition[i]=dataMappedForMotorisedPosition[i]; 
               //   text (dataMappedForMotorisedBigMachine[i], width, -2000-100*i) ; 

          } 
        }  
      }
      
        if (music_from_ableton_live == " controlDr " || music_from_ableton_live == " Dessine "  ) 
        { 
         rotate (PI);
       
         text (" formerK  " + formerKeyMetro , width-200, -2000-100*(networkSize+4)) ; 
         text (" beatPrecise   " +beatPrecised + " measure  " + measure, width-200, -2000-100*(networkSize+3)) ;
         text (" shapeLfo   " + shapeLfo + " " + shapeLfoMode, width-200, -2000-100*(networkSize+2)) ; 

        if (!systemForBigMachine) 
         {    
          for (int i = 0; i < networkSize; i++)
          {  
          text ( (networkSize-1-i) + " Ro " +numberOfRota[networkSize-1-i]  + " Tr " + numberOfTrig[networkSize-1-i]  + " Mu " + instrumentToMute[networkSize-1-i] +
               " timeToWaitToEnableNextMovement " + timeToWaitToEnableNextMovement +   " enablingPara " + enablingParametersChangesToLive

               // " enaChangeS " + enablingChangeSound[networkSize-1-i] + " instChanged " + instrumentChangedToAddPulse + " enabToL " + enablingChangeToSpecificInstrument[networkSize-1-i] +
               , width+200, -2000-100*(networkSize-1-i)) ; 
           }
         }

         for (int i = 0; i < networkSize; i++)
         { 
           text (dataMappedForMotorisedBigMachine[networkSize-1-i] + " "+ (networkSize-1-i) + " coun " + countControlDr[networkSize-1-i], width+600, -2500-100*(networkSize-1-i)) ;   // phasePatternFollow[networkSize-1-i]
         }

        if ( keyMode!= " samplingModeWithLive ") 
        {   
             if ( modeStartKeyToFollow != " followSignalSampledOppositeWay(frameRatio) ") 
          {   

            if (music_from_ableton_live == " controlDr " )   
            {    
            send24DatasToTeensy6motorsToLittleMachine (6, 2, -3, -1, 2, 1000);
            }
          }
        }

        if ( modeStartKeyToFollow == " followSignalSampledOppositeWay(frameRatio) " 
        )
        {  
          revLfo=rev;// useless here // actualise counter revLfo from " normal mode"  from rev 
          for(int i = 0; i < networkSize; i++)
          {       
           //dataMappedForMotorisedPosition[i]=(int) positionToMotor[i]+ (revLfo[i]*numberOfStep);//+ (int) recordLastDataOfMotorPosition[i];
           dataMappedForMotorisedPosition[i]=(int) positionToMotor[i]+ (rev[i]*numberOfStep);//+ (int) recordLastDataOfMotorPosition[i];
           dataMappedForMotorisedBigMachine[i]=dataMappedForMotorisedPosition[i];//+readPositionEncoder[i];
          }

         if ( measure>=measureRecordStop )
          { 
          int disableFirstDriver=15;
          int driverLast=15;
          int timeElapsedBackingPosition = 4000;
          int dataNoComputed=-4;
             send24DatasToTeensy6motorsToLittleMachine( 3, disableFirstDriver, dataNoComputed, -1, driverLast, timeElapsedBackingPosition); // 
           //  send24DatasToTeensy10motorsToBigMachine(5, disableDriver, dataNoComputed, -1); // 
          }
       }
         



        if (music_from_ableton_live == " Dessine "  ) 
        {     
          send24DatasToTeensy10motorsToBigMachine(4, 3, -3, -1);
        }

       // special to test chor with little machine
        if (music_from_ableton_live == " Dessine "  ) 
        {     
          send24DatasToTeensy6motorsToLittleMachine (10, 2, -3, -1, 2, 1000);
        }


        rotate (-PI);
        }

       rotate(-PI/2);   
 
}

     


