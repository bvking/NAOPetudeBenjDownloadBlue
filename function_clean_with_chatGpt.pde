void setMovement(int k, boolean b) {//azeqsdwxcrty
  switch (k) {
  case 'a':
    moveKeys[0] = b;
    break;
  case 'z':
    moveKeys[1] = b;
    break;
  case 'e':
    moveKeys[2] = b;
    break;
  case 'q':
    moveKeys[3] = b;
    break;
  case 's':
    moveKeys[4] = b;
    break;
  case 'd':
    moveKeys[5] = b;
    break;
  case 'w':
    moveKeys[6] = b;
    break;
  case 'x':
    moveKeys[7] = b;
    break;
  /*       if (keyCode == CONTROL){ // .. in Keypressed =true, inKeyRelesed == false  // moveKeys[8]=true; }   */
  case 'c':
  moveKeys[9] = b;
  break;
  case 'r':
  moveKeys[10] = b;
  break;
  case 'f':
  moveKeys[11] = b;
  break;
  case 'v':
  moveKeys[12] = b;
  break;
  case 't':
  moveKeys[13] = b;
  break;
  case 'g':
  moveKeys[14] = b;
  break;
  case 'b':
  moveKeys[15] = b;
  break;
  case 'y':
  moveKeys[16] = b;
  break;
  case 'h':
  moveKeys[17] = b;
  break;
  case 'n':
  moveKeys[18] = b;
  break;
  case 'u':
  moveKeys[19] = b;
  break;
   
  }
}

void handleKeyPressToChooseCircularMovementOrNot() {
  if (key == '*') {
    circularMov = true;
  }
  
  if (key == '$') {
    circularMov = false;
  }
  
  String[] valueText = displayEventFromKeyReleased(keyEvent);
}

void displayArrays() {
  print("encodeur "); showArray(encodeur);
  print("countRev "); showArray(rev);
 // print  (" encodeurTouched " + encoderTouched[0]+ "  " + encoderTouched[1]+ "  " + encoderTouched[2]+ "  " +
   //                             encoderTouched[3]+ "  " + encoderTouched[4]+ "  " + encoderTouched[5]);
 // print("keyEvent "); showArray(keyEvent); showArray work with int only
  
  textSize(50);
  for (int i = 0; i < networkSize; i++) {
    text("rev " + i + rev[i] + " enc " + i + " " + encodeur[i], -width * 2, 0 - 50 * i);
  }
}

void computePhaseSum() {
  if (circularMov=true) {
  for (int i = 0; i < networkSize; i++) {
    addPhaseAllMode += net.phase[i];
  }
    }
   if (circularMov=false) {
  for (int i = 0; i < networkSize; i++) {
    addPhaseAllMode += metroPhase[i];
  }
    }
  addPhaseAllMode/=networkSize;
  print("average phase is with order");
  print (addPhaseAllMode);
  addPhaseAllMode = map(addPhaseAllMode, -(networkSize - 1) * TWO_PI, (networkSize - 1) * TWO_PI, 0, 1);
  print("averagemapped ");
  println(addPhaseAllMode);
}

void setMeasureAndBeatPrecised() {  
    if (modeStartKeyToFollow != " followSignalSampledOppositeWay(frameRatio) ") {
      measure = (int) map(automation4 * 10, 0, 7.874016, 1, 1000);
      print("measure ");
      print(measure);
      print("AUTOMATION 5 = beatPrecised ");
      beatPrecised = (int) map(automation5 * 10, 0, 7.874016, 1, 1000);
      println(beatPrecised);
}
}

void checkKeyModeToFollow() {

 if ( key =='a'||  key =='b' ||  key =='c' ||  key =='d' || key =='e' || key =='f' || key =='s' || key =='z' || key =='j'  ) // 
   {
     if ( formerKeyCode == ALT){
    modeStartKey = key;   // press l to change formerKeyMetro Mode
     }
    }
   
       
    switch( modeStartKey) {
    case 'a': 
    modeStartKeyToFollow = " followSignalSampledLPF ";
    print ( " modeStartKeyToFollow " );
    followSignalSampledLPF(frameRatio);
    break;
    case 'b': 
    modeStartKeyToFollow = " followDistribueAddLfoPatternLPF ";
        print ( " modeStartKeyToFollow " );

    text ( " followDistribueAddLfoPatternLPF ", width/4, -height/4);  
    followDistribueAddLfoPatternLPF();
    break;
    case 'c':  
    formerKeyMetro = '@';       
    modeStartKeyToFollow = " followDistribueAddLfoPatternControl ";
        
   // text ( modeStartKeyToFollow, width/2, -height/4);  
    followDistribueAddLfoPatternControl();  
    //if (formerFormerKey!='#'){
          if (Key!='#'){
   // controlTrigLfoPattern = millis();
   // text (  controlTrigLfoPattern, 200, 300 );
  
    //}
    }
    break;
    case 'f':   
    // formerKeyMetro = '@';  
    modeStartKeyToFollow = " followSignalfo ";
        print ( " modeStartKeyToFollow " );

    text ( modeStartKeyToFollow + " follow  signal " + (networkSize-1)+ " "  + signal[networkSize-1], width/4, -height/4); 
    followSignalLfo(frameRatio, signal[networkSize-1]);
    break;

    case 'd': 
    //formerKeyMetro = '@';    
    modeStartKeyToFollow = " followDistribueAddLfoPattern ";
      //  print ( " followDistribueAddLfoPattern in KeyMode null " );

    text ( modeStartKeyToFollow, width/4, -height/4); 
  
    followDistribueAddLfoPattern();
    break;


    case 's':  
    // formerKeyMetro = '*';    
    modeStartKeyToFollow = " samplingModeInternal ";
     //   print ( " modeStartKeyToFollow " );

    // keyMode = " samplingModeInternal " ;
    text ( modeStartKeyToFollow, width/4, -height/4); 
    break;

    case 'j': 
    
    modeStartKeyToFollow = " followSignalSampledOppositeWay(frameRatio) ";
    

    text ( modeStartKeyToFollow + " not good ? " , width/4, -height/4); 
    text ( keyMode, width/4, -height/4); 
   // samplingMovementPro();
   // followSignalSampledOppositeWay(frameRatio);

    break;
/*
     case 'j': 
    
    modeStartKeyToFollow = " followSignalSampled ";
    

    text ( modeStartKeyToFollow + " not good ? " , width/4, -height/4); 
    text ( keyMode, width/4, -height/4); 
    followSignalSampled(frameRatio);

    break;
*/
    case 'z':     
 //   modeStartKeyToFollow = " samplingMode ";
 //   text ( modeStartKeyToFollow, width/4, -height/4); 
     keyMode = " addSignalOneAndTwoTer " ;
     text ( keyMode, width/4, -height/4); 
     addSignalOneAndTwoTer();
    break;
   }
  }

void SamplingModeMayBeUsefull() {

     beginSample=millis();
    text (keyMode + " samplingMode LFOdecay ", width/4, - height - 100);  
     
 //    mouseY=(int) map (automationLFO[1], 0, 1, 0, 400);  // position from Ableton LFOdecay

    
     //  mouseY=mouseY+10;
       mouseX=mouseX+20;
/*
      oldMov = movementRecording;
      
      movementRecording= mouseY;
      
           
       if (oldMov>=  movementRecording){
      
    movementRecording= map (y, 0, 400, 0 , TWO_PI); 
      }
    else  
    movementRecording= map (y, 400, 0, TWO_PI, 0);
     
 */   
     
    
 
    //****  mouseY=(int) map (automation1, 0, 1, 0, 400);  //POSITION MOTOR  
        //  mouseY = (int) map (signal[3], 0, 1, 0, 400);   // POSITION from ABLETON 
        //  mouseY=(int) map (Movement/1000.0, 0, 1, 0, 400);  // to do WHAT?

    //***** */   activeSamplingMeasure(3);
     //***** */    stopSamplingMeasure(4);
    
   //      activeSamplingInternalClock(7); //do not work
   //      stopSamplingInternalClock(8);  //do not work
      //   samplingMovement(2);
   //***** */     samplingMovementPro();
    }

void updateInternalClock(){
   print( " INTERNAL CLOCK lastSec " ) ; print( lastSec ) ; print( " actual " ) ; print( actualSec ) ; print( " measure " ) ; println( measure ) ;


      if  (actualSec!=lastSec){
         lastSec=actualSec;
      if (modeStartKeyToFollow == " samplingModeInternal "  || modeStartKeyToFollow ==  " followSignalSampledOppositeWay(frameRatio) "  ){    
          measure ++;
       }
      }

         actualSec =(int) (millis()*0.001); 

   }

void handleInternalSamplingMode(){
       println ( " samplingModeInternal  ");
    
     beginSample=millis();
     text ( " encodeur[0] " + encodeur[0] +  " newPosF[0] " + newPosF[0] + modeStartKeyToFollow + " mouseY " +  mouseY  + " mouseX " +  mouseX  +  measure , -width/4, - height + 100);   

     //==================== sampling from encoder
     if (measure <=3){
        send24DatasToTeensy6motorsToLittleMachine(5, -3, -3, -1);
      }
        newPosF[0]=  map (encodeur[0], 0, 800, 0, TWO_PI)%TWO_PI;  // tourner CCW
        text  ( " newPosF[0] " + newPosF[0] + " encodeur[0] " +  abs ((int)map (encodeur[0], 0, 800, 0, 800)%800), 300, -1200);

     //==================== sampling from mouseY
         float radianTorec;
        //   radianTorec=(float) map (mouseY, 0, 200, 0, TWO_PI)%TWO_PI;  // position from Processing mouseY    
        //   newPosF[0]= radianTorec;

      sphere(side*3);
      sphereDetail( 4*5); 
      //==================== 

      text ( " newPosF " + newPosF[0], 0, 600);
 
      float rayon=displacement;
      float polarToCartesionX= displacement*cos(newPosF[0]);
      float polarToCartesionY= displacement*sin(newPosF[0]);

    //  mouseX= (int) polarToCartesionX;
    //  mouseY= (int) polarToCartesionY;

      println ( " polarToCartesionX " + polarToCartesionX + " polarToCartesionY " + polarToCartesionY + " newPosF[networkSize-1] " + newPosF[networkSize-1] );

         activeSamplingInternalClock(1); //do not work
         stopSamplingInternalClock(3);  //do not work
         samplingMovementPro(); 

   }

void computeAngularTimeSpeed(){
   if (running_Timer == false) return;

  int m = millis();
  timeFrame += float(m - lastMillis) * 0.001;
  lastMillis = m;
  }

void differentFunction(){



  //* ************************ manage strobe with light()
  //  spotLight(102, 153, 100, mouseX, mouseY,cameraZ, 0, 0, -1, PI/2, 1000); 
  //  pointLight(51, 102, 126, mouseX, mouseY, cameraZ);
  if (1000/pulsation*60>=50 && 1000/pulsation*60<=200) { // pulsation of oscillator 11, at the front of the screen; transformed in BPM
    lights();
    if (frameCount%6==0) {
      noLights();
    }
  }
  //************************* end of manage light

  //   doNothing ();// to not repeat case with key
  //==============================TAKE ON BELOW TO RECORD COUPLING

  if (mousePressed != true) {
  //  coupling = map ((float (mouseX)/width*1), 0, 1, -5, 5 ); //SET COUPLING
    //   key= '#'; keyReleased();
    // keyCode =CONTROL; keyReleased();
   //   net.setCoupling(coupling);
  }


  text(couplingRed, -400, height - 20); 
  //  *********** TAKE ON BELOW TO HAVE THE COUPLING RECORDED RED. AND TAKE OFF ABOVE 
  /*
    couplingRecorded= float (couplingRed)/1000;
   coupling= couplingRecorded;
   net.setCoupling(coupling);
   
   text(couplingRecorded, 400, height - 20);
   */
  //******************************** 

  //======================== TAKE OFF BELOW TO RECORD DATA //======================== TAKE OFF TO RECORD DATA
  if (frameCount == nextFrame) {
    readOneLine();  
    keyReleased(); 
    keyPressed();
  }
  //****************************
  // BEAT_DETECT ();
  //****************************
  print ("FRAMERATIO "); 
  print ((1*frameRatio)); // utilise map (de 1 à 60);
  print ("  ******   FRAMERATIO "); 

  // Calculate the overall order (cohesion) in the network
  PVector order = net.getOrderVector();

  // DATA of cohesion and acceleration of the first and last oscillator
  orderParameter = net.getOrderParameter();

   averagePhase = order.heading();
 // averagePhase= (net.phase[11]+net.phase[10]+net.phase[9]+net.phase[8]+net.phase[7]+net.phase[6]+net.phase[5]+
 //   net.phase[4]+net.phase[3]+net.phase[2])/(networkSize-2);
  print ("AVERGE PHASE "); 
  print (averagePhase);

 // averageFrequency= (net.naturalFrequency[11]+net.naturalFrequency[10]+net.naturalFrequency[9]+net.naturalFrequency[8]+net.naturalFrequency[7]+net.naturalFrequency[6]+net.naturalFrequency[5]+
 //   net.naturalFrequency[4]+net.naturalFrequency[3]+net.naturalFrequency[2])/(networkSize-2);


  print ("                                   AVERGE FREQUENCY ");  
  print (averageFrequency);

  float deltaPhase = map ((float (mouseY)/width*1), 0, 1, 0, QUARTER_PI ); // option not used
   
//**   averageDeltaPhase=  TWO_PI/ ((net.phase[11]+net.phase[10]+net.phase[9]+net.phase[8]+net.phase[7]+net.phase[6]+net.phase[5]+
// **  net.phase[4]+net.phase[3]+net.phase[2])/ (networkSize-2))*360;
   
  //   averageDeltaPhase=                    (abs((net.phase[11]+net.phase[10])))/TWO_PI*360;
 // averageDeltaPhase=                    (((abs (metroPhase[11])+ abs(metroPhase[10]))))/TWO_PI*360;
//  averageDeltaPhase= map (averageDeltaPhase, 0, TWO_PI, 0, 180);
  print ("                                    averageDeltaPhase ");  
  println (averageDeltaPhase);

  // SHOW_DATA ();
   }

void displayOscillatorSpheres() {
   translate(width/2, -height/2, -1000);// To set the center of the perspective
   rotate(-HALF_PI ); //TO change the beginning of the 0 (cercle trigo) and the cohesion point to - HALF_PI 

  // Draw  spheres corresponding to the phase of each oscillator
  colorMode(RGB, 255, 255, 255);
   rotate(HALF_PI ); 
 }
void trigFollowSignalSampled() {

 if (actualSec==lastSec) {  // trigged on internal clock
      trigRatio = true;
    //  background(127, 40, 60);
   }
   
   else trigRatio = false;
   
   if (beatTrigged== true) {  // trigged with measure
      trigRatio = true;
    //  background(127, 40, 60);
   }
  
   else trigRatio = false;
   
  if (formerKeyMetro == 'J' ) { //drive ball with lfo ONCE //  && trigRatio == true
  trigFollowSampling=true;
  }
  
 if (formerKeyMetro != 'J' ) {
//   if (formerKeyMetro == 's' ||  formerKeyMetro ==  '@' || formerKeyMetro ==  'B' ) { //you can't distribuate data to others balls  //formerKeyMetro == '*' || formerKeyMetro == '$' ||
  trigFollowSampling=false;
  }

 if (trigFollowSampling == true || trigFollowSampling==false  ) {  // CHECK from old
 
  print (" trigFollowSampling ");   println (trigFollowSampling); 
 if ( modeStartKeyToFollow ==  " followSignalSampledOppositeWay(frameRatio) " ) { 
  //   followSignalSampled(frameRatio); //no WORK with frame
    followSignalSampledOppositeWay(frameRatio);// with millis()
  
    
    rotate(PI/2);
    printDataOnScreen();
    stroke(255);
    
    rect( (currTime % 2) / 2 * width, 10, 2, 8 );
    rect( (currTime % 4) / 4 * width, 20, 2, 8 );
    rect( (currTime % 8) / 8 * width, 30, 2, 8 );
    
    rotate(-PI/2);
 //  print (" in trig___(frameRatio) before and before arduinoPos "); countRevs();
      }
     }
}
