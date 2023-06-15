
// END SETUP
void mouseXY () {  // MODULATION OF SIGMA and FREQ into GRAPHIC chimera state. No effect
  sigma =  (  map ((float (mouseX)/width*1), 0, 1, 0.0, 1.0 ));
  print ("Sigma"); 
  println (sigma);
  Freq  =  (  map ((float (mouseY)/width*1), 0, 1, 0.0, 0.05 ));
}
public void settings() {
  size(600, 600, P3D);
//  windowRatio(600, 600);
} 

void mousePressed() {  
  mouseRecorded = true;
  measure = 0;
  }
// before draw


void draw() {
  //setPort();

 handleKeyPressToChooseCircularMovementOrNot(); // Gestion des touches * et $ pour definir mode circulaire ou non
 displayArrays(); // Affichage des tableaux
 background(0);

   if (frameCount ==5) noLoop();
//  printDataOnScreen();
   print (" BEGIN OF MAIN KEYCODE  ");   
 
  printModeAndKey();
  setKeyModeByTappingKeyPadOnce();

  setMovement(key, false);

  println ( " music_from_ableton_live " + music_from_ableton_live + " modeStartKeyToFollow " +  modeStartKeyToFollow + " keyModeRed" +  keyModeRed + "keyMode" +  keyMode + "formerKeyMetro " + formerKeyMetro + " controlTrigLfoPattern " + controlTrigLfoPattern );
  keyModeRed = keyMode; // dont read keyMode in file.txt

  switchFonctionDependingKeyMode();

  computePhaseSum();

  formerBeatPrecised=beatPrecised;
  formerMeasure=measure;
  formerBeatOnMeasure=beatOnMeasure;

  if (modeStartKeyToFollow != " samplingModeInternal " )
     { 
     setMeasureAndBeatPrecised();
      }  

        trigBeatWithMeasure();
        //     printDataOnScreen();
        //     printMidiNoteVelocity();
    

  if (keyMode != " phasePattern ")
     {   
        if ( key =='B'||  key =='c' ||  key =='>' ||  key =='<' || key =='d' || key =='e'  ) // 
             {
               //  formerKeyMetro = key;   // press l to change formerKeyMetro Mode
         }
    }
  
  if (keyMode == " null ")
     { 
       checkKeyModeToFollow();  
    }
   
   
    if (beatTrigged==true && formerKeyMetro == 's'){ // formerBeatOnMeasure>=4 && beatOnMeasure<=1 && 
        measureRecordStart=measure;
       //    beginSample=millis();
        print ("*****************************************************************************++++++++++++++++++++++ START SAMPLING  "); 
  
      //  formerKeyMetro = 'S';  // back to normal Mode with formerKeyMetro = '$';
     }
     
 
    if (formerKeyMetro == 'B' ){
    lfoPattern();
    splitTimeLfo();
      //   splitWithTime();
    addSignal(); 

    } 

   if (modeStartKeyToFollow == "samplingMode") {
    SamplingModeMayBeUsefull();
  }

  updateInternalClock();

   if (modeStartKeyToFollow == " samplingModeInternal "     ){ // || formerKeyMetro == 'J'
   handleInternalSamplingMode(); 
   }

   //trigEffectToAbletonLive();  // add Size to Text
  //**************   END MODE SETTING   *************************

  formerAuto= frameCount-1;
  // see storeinput example to create sample

  //Display with strings midi note (pitch and duration).  Display with  ellipse cyclicals and continues datas (potar, fader, lfo). from Ableton Live 
  displayNoteandPotarFromAbleton();
   
  computeAngularTimeSpeed(); 
//**  printDataOnScreen();
  differentFunction();
  displayOscillatorSpheres();

  //****************************

  trigFollowSignalSampled();


  modePendulaireModeCirculaire();
  displayKeyModeNull(); 


  net.step(); // actualise step insync library ==> actualise net.phase[i]
  netG.step(); //Does it make any meaning?
  

   // if (circularMov==true) { // why it doesn' t work?
    if (formerKeyMetro=='*') {
    countRevs(); // below modePendular to compute revolution
     } 

   teensyPos(); 


    sendPositionFromTouchedEncodeurNetworkSizeOnly();
    sendPositionToBigMachine();
       


       if ( encoderTouched[5]==true){ 

   //     keyMode = " samplingModeInternal ";
     
        } 


//   arduinoPos(); // just to trig data to live when particular position of phase or pattern are created by the hole balls (oscillator)
   
     
  // ================================= 


  //print (" before arduinoPos "); countRevs();   
  println(frameCount + ": " + Arrays.toString(rev));
  // ================== fonction not used
  // devant_derriere();
  // manageCoupling();
  // mouseMovedPrinted ();
  // SoundmouseMoved(); // to automatise sound with speed. In the setup uncomment the out1, out2 ...

  if (formerKey== '!') {
   // formerSartKey = formerKey;
  }

  if (key=='j') {// send a trig to start record in Ableton live 
    background(255);
    startStop= 3;//
    key='='; 
    keyPressed();
    print ("startStop from the beginning: "); 
    println (startStop);
    key='#'; // reset key to a key doing nothing
  } else {
    startStop= 2;
  } 

  // option to control sound in Live when the animation is stopped then started again and when oscillator 11 touches the left  
  if (formerSartKey == '!' &&  TrigmodPos[networkSize-1]==0) { 
    println ("TRIG LIVE WITH oscillator 11 on LEFT" ); //
    startStop= 1;  
    print ("MOVEMENT AND TIMER is already started, now START LIVE: "); 
    println (startStop );

    formerKey = '#'; //reset formerkey to not trigging LIVE
    formerSartKey = formerKey;
  }

  textSize (100);
  rotate (HALF_PI);
  bpmAsPulsationFunction();
  rotate (-HALF_PI);


  cohesionTrig = int (map (LevelCohesionToSend, 0, 1, 0, 100));
  println (cohesionTrig);

  // ***** automatise Oscillator Moving with a former Key
 //*+*+*+*+*+*  arduinoPos(); // // carefull with arduinoPos and function after arduinopos


   if (formerKeyMetro != 'J') { //countRevolutions when it is not the mode J
 //  countRevs();
 //    countRevsContinue();
  }
       
   //**********************************************************************    
   // STARTERCASE with formerKey
   //  starterCaseUsedorNot();
   // ENDSTARTERCASE
   // end check   
   

  //************ arduinoPos(); // to control Pos of motor and Trigging note and computing pulsation
  // countPendularTrig ();
  //frameStop();
  formerFormerKey=formerKey; 
  handleKeyPressToChooseCircularMovementOrNot(); // in keyReleased?
  
  printModeAndKey();

  oscSend();
  // =============== =============== =============== =============== =============== =============== =============== END OF MAIN LOOP   
 
}

