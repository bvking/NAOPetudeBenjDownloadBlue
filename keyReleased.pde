void keyReleased() {

    switch(keyCode) { // to modulate Knob
 
  //  case(DOWN): valueOfKnobA-=1; myKnobA.setValue( valueOfKnobA);break;
  //  case(UP):   valueOfKnobA+=1; myKnobA.setValue( valueOfKnobA);break;
    case('5'):myKnobB.setConstrained(false).hideTickMarks().snapToTickMarks(false);break;
    case('6'):myKnobA.shuffle();myKnobB.shuffle();break;
  }
  if ( keyMode == "propagationBallRotationBis " ) {

    if (keyCode == UP ) {  

     
   //  propagationSpeed=propagationSpeed+10;
        //  propagationSpeed=propagationSpeed%211;
    // if (propagationSpeed==210){
       //  propagationSpeed%=200 ;
   //    propagationSpeed=1;
   //  } 
   
   
      propagationSpeed=propagationSpeed+10;
   //   propagationSpeed%=10;


    } 
   } 

  if (keyCode == LEFT && modulePhaseAmountWithArrow) {  
    
      levelFromArrow = levelFromArrow-0.1;
       if (levelFromArrow<=0) {
           levelFromArrow=1;
        }
     keyCode= TAB; // to trig once 
  }


  if (keyCode == RIGHT  && modulePhaseAmountWithArrow) { 
           levelFromArrow = levelFromArrow+1;
           levelFromArrow = levelFromArrow%(1+0.1);   
       
     keyCode= TAB; // to trig once 
  }

  textSize (100);
   if (key == 'n') {
    oldFaz=faz;
    faz+=1;
    getOldPositionOfActiveOscillator(faz);
    }

     recordFrame();

   if (keyCode == ALT){
    moveKeys[8]=false;
   }
   
   

    if (key == '=' &&  (formerKeyMetro == '$' || formerKeyMetro == '*') ) { 
    

    if (networkSize ==6){
  
    
      
        ActualVirtualPosition[0]=(dataMappedForMotorisedPosition[0]+dataMappedForMotorisedPosition[1]+dataMappedForMotorisedPosition[2]+dataMappedForMotorisedPosition[3]+
        dataMappedForMotorisedPosition[4]+dataMappedForMotorisedPosition[5])/(networkSize-0);
 
          //   dataMappedForMotorisedPosition[i]= dataMappedForMotorisedPosition[i]+ ActualVirtualPosition[i];
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
      // lastPositionFromCircularMode[i]= lastPositionFromCircularMode[0];
      dataMappedForMotorisedBigMachine[i]=dataMappedForMotorisedPosition[i];
       } 
    
      }

   if (key == ';' ) {  //  && formerKeyMetro == '$'
    

    for (int i = 0; i < 1; i++) {
  
    
      
      lastPositionFromCircularMode[i]=(dataMappedForMotorisedPosition[0]+dataMappedForMotorisedPosition[1]+dataMappedForMotorisedPosition[2]+dataMappedForMotorisedPosition[3]+
      dataMappedForMotorisedPosition[4]+dataMappedForMotorisedPosition[5])/(networkSize-1);

      text ( lastPositionFromCircularMode[i], 100, 100*i);
  
    }

     for (int i = 0; i < networkSize; i++) {
         CircularVirtualPosition[i]=0;
         ActualVirtualPosition[i]=lastPositionFromCircularMode[0];
        lastPositionFromCircularMode[i]= lastPositionFromCircularMode[0];
    } 
    
  }


     if (keyCode == UP) {  
         if (key!='#') { 
     if ( keyMode == " phasePattern " || modeStartKeyToFollow == " followDistribueAddLfoPattern "
       || modeStartKeyToFollow == " trigEventWithAbletonSignal " || keyMode == " trigEventWithAbletonSignal "
      ){
         speedDelta++;
         speedDelta%=8;
       //   key='#'; // to trig only once
        /*
      oscillatorBlocked++;
      oscillatorBlocked%=networkSize;

    
      key='#'; // to trig only once
       
   */
   }
      }
   }
     if (keyCode == DOWN) {  
        if (key!='#') {  

      if ( keyMode == " phasePattern " || modeStartKeyToFollow == " followDistribueAddLfoPattern "
       || modeStartKeyToFollow == " trigEventWithAbletonSignal " || keyMode == " trigEventWithAbletonSignal "
      ){

        speedDelta--;
        if (speedDelta < 1) { 
          speedDelta=4;
           }
       //  key='#'; // to trig only once
/*
      oscillatorBlocked--;
      if (oscillatorBlocked < 0) { 
      oscillatorBlocked=networkSize-1;    
     

      key='#'; // to trig only once
    */
     }
         }
      }
   


    if (keyCode == LEFT && keyMode == " addSignalOneAndTwoQuater ") {  
    println( " LEFT INCREASE decay to splitIncomingSignal ")  ; 
     delayTimeToTrig= delayTimeToTrig-20;
      if (delayTimeToTrig<=0) {
        delayTimeToTrig=200;
     }
  
    text ( " delayTimeToTrig " + delayTimeToTrig, width/8, height-800 );
    key= '#'; // to trig once keyPressedLFO
  }

     if (keyCode == RIGHT && keyMode == " addSignalOneAndTwoQuater ") { 
    delayTimeToTrig= delayTimeToTrig+20;
    delayTimeToTrig=delayTimeToTrig%200;
    text ( " delayTimeToTrig " + delayTimeToTrig, width/8, height-800 );
    key= '#'; // to trig once keyPressedLFO
  }
   
    if (formerKeyMetro == 'B')  {

      if (keyCode == CONTROL) {
         oscillatorChange++;
         oscillatorChange=oscillatorChange%12;
      if (oscillatorChange<=0) {
         oscillatorChange=2;
     }
         keyCode =SHIFT; // to trig once keyPressedLFO
  }

     if (keyCode == LEFT) {  
    println( " LEFT INCREASE decay offseft shiftFollowMov ")  ; 
 //   decayshiftFollowMov=decayshiftFollowMov+50;
    decayshiftFollowMov+=1;
    decayshiftFollowMov=decayshiftFollowMov%200;
  
    println ("d= timeOffsetRatio: "); 
    println ( decayshiftFollowMov);
    textSize (100);


    keyCode=SHIFT; // to trig once keyPressedLFO
  }

     if (keyCode == RIGHT) { 

    println( " right INCREASE decay offseft shiftFollowMov")  ; 
     decayshiftFollowMov=decayshiftFollowMov-1;  
      println ("d= timeOffsetRatio: "); 
    println ( decayshiftFollowMov);
    textSize (100);
    text (" decayshiftFollowMov  ",  200,200);
    text ( decayshiftFollowMov,  200,300);
   keyCode=SHIFT; // to trig once keyPressedLFO
  }
  
   if (keyCode == UP) {
     println(" lfoPhase phase shifting"); 
        println(" lfoPhase INCREASE phase shifting"); 
           println(" lfoPhase INCREASE phase shifting"); //
    phaseShiftingFollowPhase11= phaseShiftingFollowPhase11+QUARTER_PI/8;
    phaseShiftingFollowPhase11=phaseShiftingFollowPhase11%PI;
    phaseShiftingFollowLFO= phaseShiftingFollowLFO+QUARTER_PI/8;  
    phaseShiftingFollowLFO= phaseShiftingFollowLFO%PI;
    
 /*       
  if (phaseShiftingFollowPhase11>=8*QUARTER_PI/2) { 
      phaseShiftingFollowPhase11=-phaseShiftingFollowPhase11;
    } 
    */
   
    print ("phaseShiftingFollowPhase11 Ratio ");
    println (degrees (phaseShiftingFollowLFO));
    key= '#';
  }
  
    if (keyCode == DOWN) {
     println(" lfoPhase DECREASE phase shifting"); //
      println(" lfoPhase DECREASE phase shifting"); //
       println(" lfoPhase DECREASE phase shifting"); //
     phaseShiftingFollowLFO= 0;   
     phaseShiftingFollowPhase11= phaseShiftingFollowPhase11-QUARTER_PI/8;
 //   phaseShiftingFollowPhase11= phaseShiftingFollowPhase11%(8*QUARTER_PI/2);   
   /*     
  if (phaseShiftingFollowPhase11<=-8*QUARTER_PI/2) { 
      phaseShiftingFollowPhase11=-phaseShiftingFollowPhase11;
    }   
    print ("phaseShiftingFollowPhase11 Ratio ");
    println (degrees (phaseShiftingFollowPhase11));
    */
    keyCode = SHIFT;
  }
  
   
  
 } 
 
 

  if (formerKeyMetro == 'J' || keyMode == " null ")  {
    
  
    if (keyCode == LEFT) {
      
  //   float timeReleased= (millis()/5)%1000;
    println(" followSignal right INCREASE timeOffset ")  ; // Incremente together without changing phases
    delayTimeFollowPhase11=delayTimeFollowPhase11+1;
    delayTimeFollowPhase11=delayTimeFollowPhase11%65;  
    print ("delayTimeFollowPhase11: ");
    println (delayTimeFollowPhase11);
    if ( delayTimeFollowPhase11<=0 && delayTimeFollowPhase11>=0){
      trigLfo=0;
       }
     else if (delayTimeFollowPhase11>0){   trigLfo=1;   }
      keyCode = SHIFT;
  }
  
  if (keyCode == RIGHT) {
    println(" right INCREASE timeOffset ")  ; // Incremente together without changing phases
    delayTimeFollowPhase11=delayTimeFollowPhase11-1;
    if (delayTimeFollowPhase11<0) {
      delayTimeFollowPhase11=60;
       }
 //   delayTimeFollowPhase11=delayTimeFollowPhase11%61;
    print ("delayTimeFollowPhase11: ");
    println (delayTimeFollowPhase11);
      if ( delayTimeFollowPhase11<=0 && delayTimeFollowPhase11>=0){
      trigLfo=0;
       }
     else if (delayTimeFollowPhase11>0){ trigLfo=1;  }    // 
    keyCode = SHIFT;
  }

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
  
    if (keyCode == DOWN) {
     println(" left INCREASE phase shifting"); //
    phaseShiftingFollowPhase11= phaseShiftingFollowPhase11-QUARTER_PI/8;
    phaseShiftingFollowPhase11= phaseShiftingFollowPhase11%(8*QUARTER_PI/2);   
        
  if (phaseShiftingFollowPhase11<=-8*QUARTER_PI/2) { 
      phaseShiftingFollowPhase11=-phaseShiftingFollowPhase11;
    }   
    print ("phaseShiftingFollowPhase11 Ratio ");
    println (degrees (phaseShiftingFollowPhase11));
    keyCode = SHIFT;
  }
  
  
  
  } 
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

 // handleKeyPressToChooseCircularMovementOrNot();

  if (formerKeyMetro == 'à') {  
    println ("Frequencie adatped to PENDULAR way WITH OTHER PATTERN trigged with à");
    //  pendularOtherPattern ();
  }

  //*********************************************CIRCULAR


  if ( keyMode == " trigEventWithAbletonSignal " && measure <=635 )  {  

   if (formerKeyMetro == '$' || formerKeyMetro == '*' ) {  
        println ("  Frequencies adatped to PENDULAR way trigged with $  > 54 ");
  
             phasePattern(); // enable to change configuration, but program go away
             // formerKey= char (key);
             for ( int i=0; i< networkSize; i++) {
              //   oldDataMappedForMotorisedPosition[i]= dataMappedForMotorisedPosition[i];
               }

            //   all below inside phasePattern
            
            // teensyPos();
            //  key=formerKey;
            // phasePatternBase(); // only with * ?

             for ( int i=0; i< networkSize; i++) {
                   oldDataMappedForMotorisedPosition[i]= dataMappedForMotorisedPosition[i];
              }

            
             rotate (HALF_PI);

            //  text (" NO trigEventWithAbletonSignal ", 0, -500 );
              textSize (200);

           

              rotate (-HALF_PI);
     } 
   } 


  else if ( keyMode == " trigEventWithAbletonSignal " && measure < 635 )  {  
  if ( formerKeyMetro == '*' || formerKeyMetro == '<' || formerKeyMetro == '$') {   // formerKeyMetro == 'J'  
          text (" trigEventWithAbletonSignal ", 0, 200 );
        //  displayDebugWhenKeyReleased (eventToTrig[]);

        for (int i = 0; i < 3; i++)  {  
     //  String valueText[] =  displayEventFromKeyReleased (keyEvent);
         
    } 
   //  phasePattern(); //same as $
   } 
  }

 //key= '#'; 

}
