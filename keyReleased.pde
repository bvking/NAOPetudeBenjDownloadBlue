void keyReleased() {

  if ( music_from_ableton_live == " Dessine " || music_from_ableton_live == " controlDr" ) 
   {
         key=char (Key);
     //   phaseDirectToMotor();

    // automationForMusicMouvement();
       
     }

   recordFrame();  // record event only when they are released

   if (keyCode == ALT){
    moveKeys[8]=false;
   }

  

   switch(keyCode) { // to modulate Knob
 
        //  case(DOWN): valueOfKnobA-=1; myKnobA.setValue( valueOfKnobA);break;
        //  case(UP):   valueOfKnobA+=1; myKnobA.setValue( valueOfKnobA);break;


      case('5'):myKnobB.setConstrained(false).hideTickMarks().snapToTickMarks(false);break;
      case('6'):myKnobA.shuffle();myKnobB.shuffle();break;
   }

   

  if ( keyMode == " propagationBallRotationBis " )
    {
      if (keyCode == UP ) {    
        propagationSpeed=propagationSpeed+5;
        propagationSpeed=propagationSpeed%205;
       }
       if (keyCode == DOWN ) {    
         propagationSpeed=propagationSpeed-5;       
       } 

       if (propagationSpeed==0){
         propagationSpeed=5;
      } 
     
       if (keyCode == LEFT && modulePhaseAmountWithArrow) {  
       levelFromArrow = levelFromArrow-0.1;
         if (levelFromArrow<=0) {
           levelFromArrow=1;
        }
       }

       if (keyCode == RIGHT && modulePhaseAmountWithArrow) {  
       levelFromArrow = levelFromArrow+0.1;
         if (levelFromArrow<=0) {
           levelFromArrow=1;
        }
       }
   }


    textSize (100);

    if (key == 'n') {
    oldFaz=faz;
    faz+=1;
    getOldPositionOfActiveOscillator(faz);
    }
  
    if (key == '=' &&  (formerKeyMetro == '$' || formerKeyMetro == '*') )
     {  // realignement
     if (networkSize ==6){
     
        ActualVirtualPosition[0]=(dataMappedForMotorisedPosition[0]+dataMappedForMotorisedPosition[1]+dataMappedForMotorisedPosition[2]+dataMappedForMotorisedPosition[3]+
        dataMappedForMotorisedPosition[4]+dataMappedForMotorisedPosition[5])/(networkSize-0);
      }

     if (networkSize ==10){
       
        ActualVirtualPosition[0]=(dataMappedForMotorisedPosition[0]+dataMappedForMotorisedPosition[1]+dataMappedForMotorisedPosition[2]+dataMappedForMotorisedPosition[3]+
        dataMappedForMotorisedPosition[4]+dataMappedForMotorisedPosition[5]+

        dataMappedForMotorisedPosition[6]+dataMappedForMotorisedPosition[7]+dataMappedForMotorisedPosition[8]+dataMappedForMotorisedPosition[9]      
        )/(networkSize-0);
      }

     for (int i = 0; i < networkSize; i++) {
     //  CircularVirtualPosition[i]=0;
        dataMappedForMotorisedPosition[i]=ActualVirtualPosition[0];
      // lastActualPosition[i]= lastActualPosition[0];
      dataMappedForMotorisedBigMachine[i]=dataMappedForMotorisedPosition[i];
       }     
    } // end realignement


  if (key == '=')
  {  
    if (networkSize ==6){ 
    for (int i = 0; i < 1; i++) {      
      lastActualPosition[i]=(dataMappedForMotorisedPosition[0]+dataMappedForMotorisedPosition[1]+dataMappedForMotorisedPosition[2]+dataMappedForMotorisedPosition[3]+
      dataMappedForMotorisedPosition[4]+dataMappedForMotorisedPosition[5])/(networkSize-1);
      text ( lastActualPosition[i], 100, 100*i); 
     }
    }
    if (networkSize ==10){ 
    for (int i = 0; i < 1; i++) {      
      lastActualPosition[i]=(dataMappedForMotorisedPosition[0]+dataMappedForMotorisedPosition[1]+dataMappedForMotorisedPosition[2]+dataMappedForMotorisedPosition[3]+
                             dataMappedForMotorisedPosition[4]+dataMappedForMotorisedPosition[5]+dataMappedForMotorisedPosition[6]+dataMappedForMotorisedPosition[7]+
                             dataMappedForMotorisedPosition[8]+dataMappedForMotorisedPosition[9])/(networkSize-1);
      text ( lastActualPosition[i], 100, 100*i); 
     }
    }
     for (int i = 0; i < networkSize; i++) {
         CircularVirtualPosition[i]=0;
         ActualVirtualPosition[i]=lastActualPosition[0];
         lastActualPosition[i]= lastActualPosition[0];
     }    
  }



  if (keyCode == UP && formerKey == 's' )
  {  
    if (key!='#')
     { 
        if ( keyMode == " phasePattern " || modeStartKeyToFollow == " followDistribueAddLfoPattern "
             || modeStartKeyToFollow == " trigEventWithAbletonSignal " || keyMode == " trigEventWithAbletonSignal "
            )
        {
          speedDelta++;
          speedDelta%=12;
          if (speedDelta==0)
          { speedDelta+=1;}
         

         //   key='#'; // to trig only once
         /*
         oscillatorBlocked++;
         oscillatorBlocked%=networkSize; 
          key='#'; // to trig only once  
          */
       }
     }
  }

  if (keyCode == DOWN && formerKey == 's' )
  {  
     if (key!='#')
      {  
       if ( keyMode == " phasePattern " || modeStartKeyToFollow == " followDistribueAddLfoPattern "
           || modeStartKeyToFollow == " trigEventWithAbletonSignal " || keyMode == " trigEventWithAbletonSignal "
        )
       {
        speedDelta--;
        if (speedDelta <= 1) { 
          speedDelta=1;
           }
         key='#'; // to trig only once
     /*
      oscillatorBlocked--;
      if (oscillatorBlocked < 0) { 
      oscillatorBlocked=networkSize-1;    
     

      key='#'; // to trig only once
    */
       }
      }
   }
   
   

   //***** TIME and PHASE SHIFTING of repetition_mouvement_mike

  if (modeStartKeyToFollow == " followSignalSampledOppositeWay(frameRatio) " || modeStartKeyToFollow == " samplingModeInternal ")
   {  
     if (keyCode == LEFT) 
      { // followSignal right INCREASE timeOffset
         //  float timeReleased= (millis()/5)%1000;
          delayTimeFollowPhase11=delayTimeFollowPhase11+2;
          delayTimeFollowPhase11=delayTimeFollowPhase11%66;  
      }

     if (keyCode == RIGHT)
      { // right INCREASE timeOffset
         delayTimeFollowPhase11=delayTimeFollowPhase11-2;
        //  delayTimeFollowPhase11=delayTimeFollowPhase11%(-66);  
      if (delayTimeFollowPhase11<0)
        {
          delayTimeFollowPhase11=60;
        }
      }

     if (keyCode == UP ) //&& key == 'q'
      {
        preStartSpeedOfRepetitionUP=true;
      }
       

     if (keyCode == DOWN ) //&& key == 'q'
      {
        preStartSpeedOfRepetitionDOWN=true;
      }
     keyCode = 0;
    }

/*
  if (modeStartKeyToFollow == " followSignalSampledOppositeWay(frameRatio) " )
  {
   if (keyCode == UP){
     
     factorSynchro%=33;
     factorSynchro+=1;
  }
     
      
   if (keyCode == DOWN){
     
     factorSynchro%=-33;
     factorSynchro-=1;
  }

  }

 */ 
     
  

      
    
   
 
 

  // Choose TimeSpace of Sampling with Sculdy Sampling Method


  // ADJUST DATA TO CONTROL MOTOR with TEENSYJO

  if (key == '?'&& millis()>=millisRatio+1000  ) { //&& frameCount%10==0
    speedDelta-= 1;
    if ( speedDelta<=2) {
      speedDelta=1;
    }
    print(speedDelta);  
    text (" slow down acceleration in Teensy Duino == PCTer0 " + speedDelta, 500, 500);
    millisRatio=millis();
  }

  if (key == '.' && millis()>=millisRatio+1000 ) { //&& frameCount%10==0 && frameCount <=3999

    speedDelta+= 1;  // decompte is always positive, here it is the signal to control acceleration in Teensy Duino
    if ( speedDelta>=8) {
      speedDelta=8;
    }
    print(speedDelta);  
    text  ("up acceleration in Teensy Duino == PCTer0 " + speedDelta,  500, 500);
    millisRatio=millis();
  }
  
  if (key == ')') {
    // song.play();
    /*
    float rate = map(mouseX, 0, width, 0.5f, 1f);
     rate = 1; //rateSong
     rateControl.value.setLastValue(rate);
     */
    filePlayer.loop();
  }

  if ( (key == '°') )
  {
    filePlayer.pause();
  }       
  if (key == 'J') { 
    formerKeyMetro = key;
    print ("KEY LFO MODE "); 
    print ("FormerkeyMetro"); 
    print (char(formerKeyMetro));
    print ("key"); 
    println (char(key));
  }

  /*
  if (key == '<') { 
    formerKeyMetro = key;
    print ("KEY CIRCULAR FOLLOW MODE "); 
    print ("FormerkeyMetro"); 
    print (char(formerKeyMetro));
    print ("key"); 
    println (char(key));
  }
  */
  
  // ***********************************************************************************************  
  // ***********************************************************************************************  
  //********************* SWICTH PROJECTION MODE
  
  if (key == '$' ||key == '*' ) {//|| key == '£') {
    formerKeyMetro = key;
    print ("KEY PENDULAR "); 
    print (" FormerkeyMetro"); 
    print (char(formerKeyMetro));
    print (" key"); 
    println (char(key));
  }

 // handleKeyPressToChoosemodeCircularementOrNot();

  if (formerKeyMetro == 'à') {  
    println ("Frequencie adatped to PENDULAR way WITH OTHER PATTERN trigged with à");
    //  pendularOtherPattern ();
  }

  //*********************************************CIRCULAR


  if ( keyMode == " trigEventWithAbletonSignal " && measure <=635 ) //  && music_from_ableton_live = " Dessine " 
    {  
    if (modeStartKeyToFollow != " followSignalSampledOppositeWay(frameRatio) ")
     {
           phasePattern(); // enable to change configuration, but program go away:
     } 
    if (modeStartKeyToFollow == " followSignalSampledOppositeWay(frameRatio) ")
     {
        //   phasePatternBase(); // enable to change configuration, but program go away
     }
     key= '#'; 

   } 


    else if ( keyMode == " trigEventWithAbletonSignal " && measure < 635 )  // USELESS
   {  
     if ( formerKeyMetro == '*' || formerKeyMetro == '<' || formerKeyMetro == '$') {   // formerKeyMetro == 'J'  
          text (" trigEventWithAbletonSignal ", 0, 200 );
        //  displayDebugWhenKeyReleased (eventToTrig[]);

          for (int i = 0; i < 3; i++)  {  
        //  String valueText[] =  displayEventFromKeyReleased (keyEvent);
         
     } 
       //  phasePattern(); //same as $
     } 
   }

    // keyCode = TAB; // to stop speedDelta
    //key= '#'; 

 }


    /*
   if (keyCode == UP) {
       println(" left INCREASE phase shifting"); //
       phaseShiftingFollowPhase11= phaseShiftingFollowPhase11+QUARTER_PI/8;
       phaseShiftingFollowPhase11= phaseShiftingFollowPhase11%(8*QUARTER_PI/2);   
        
   if (phaseShiftingFollowPhase11>=8*QUARTER_PI/2) { 
      phaseShiftingFollowPhase11=-phaseShiftingFollowPhase11;
    }   
       print ("phaseShiftingFollowPhase11 Ratio ");
       println (degrees (phaseShiftingFollowPhase11));
       keyCode = SHIFT;
   }
  
   if (keyCode == DOWN)
     {
       println(" left INCREASE phase shifting"); //
       phaseShiftingFollowPhase11= phaseShiftingFollowPhase11-QUARTER_PI/8;
       phaseShiftingFollowPhase11= phaseShiftingFollowPhase11%(8*QUARTER_PI/2);   
        
       if (phaseShiftingFollowPhase11<=-8*QUARTER_PI/2)
         { 
           phaseShiftingFollowPhase11=-phaseShiftingFollowPhase11;
         }   
          print ("phaseShiftingFollowPhase11 Ratio ");
          println (degrees (phaseShiftingFollowPhase11));
     }
    */
