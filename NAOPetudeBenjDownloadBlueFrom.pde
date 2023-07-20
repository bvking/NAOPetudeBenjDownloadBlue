
// END SETUP
void mouseXY() {  // MODULATION OF SIGMA and FREQ into GRAPHIC chimera state. No effect
    sigma = (map((float(mouseX) / width * 1), 0, 1, 0.0, 1.0));
    print("Sigma"); 
    println(sigma);
    Freq  = (map((float(mouseY) / width * 1), 0, 1, 0.0, 0.05));
}

void mousePressed() {  
    mouseRecorded = true;
    measure = 0;
}

void draw() {
    
    println(" BEGIN OF MAIN " + "                                                               specialPropagationKey " +  specialPropagationKey);
    
    //handleKeyPressToChooseCircularMovementOrNot(); // Gestion des touches * et $ pour definir mode circulaire ou non
    displayArrays(); // Affichage des tableaux compte tours et triggeurs de tours
    background(0);
    
    if (frameCount <=  1)  noLoop(); // check setPort()
    //  printDataOnScreen();
    
    setKeyModeByTappingKeyPadOnce();   
    setMovement(key, false);  // to reset function just above
    
    println(" music_from_ableton_live " + music_from_ableton_live + " modeStartKeyToFollow " +  modeStartKeyToFollow + " keyModeRed" +  keyModeRed +
        " keyMode " + keyMode + " formerKeyMetro " + formerKeyMetro + " controlTrigLfoPattern " + controlTrigLfoPattern);
    
    keyModeRed = keyMode; // don't read keyMode in file.txt
    
    switchFonctionDependingKeyMode();
    computePhaseSum(); // to improve
    
    //--- discriminate position from time line of Ableton
    formerBeatPrecised = beatPrecised;
    formerMeasure = measure;
    formerBeatOnMeasure = beatOnMeasure;
    //---
    
    if (modeStartKeyToFollow != " samplingModeInternal ") // if we are not in samplingMode we use clock from Ableton Live
    { 
        setMeasureAndBeatPrecised();
    } 
    
    
    trigBeatWithMeasure();
    //  printDataOnScreen();
    
    //  rotate( -HALF_PI);
    printMidiNoteVelocity();
    rotate(HALF_PI);
    
    
    if (keyMode != " phasePattern ")
    {   
        if (key ==  'B' ||  key ==  'c' ||  key ==  '>' ||  key ==  '<' || key ==  'd' || key ==  'e') // 
            {
            //switch (key) : different mode of speed, shift, propagation ....
        }
    }
    
    if (keyMode == " null ")
        { 
        checkKeyModeToFollowIfALTisJustReleased();  
    }
    
    
    if (beatTrigged ==  true && modeStartKeyToFollow == " samplingModeInternal ") { // 
        measureRecordStart = measure;
        //  beginSample=millis();
        text(" START SAMPLING  ", 200, 200); 
    }
    
    
    if (modeStartKeyToFollow == "samplingMode") {
        SamplingModeMayBeUsefull();
    }
    
    updateInternalClock();
    
    if (modeStartKeyToFollow == " samplingModeInternal ") { // || formerKeyMetro == 'J'
        handleInternalSamplingMode(); 
    }
    
    //trigEffectToAbletonLive();  // add Size to Text
    //**************END MODE SETTING   *************************
    
    formerAuto = frameCount - 1;
    //see storeinputexample to create sample
    
    //Display with strings midi note (pitch and duration).  Display with  ellipse cyclicals and continues datas (potar, fader, lfo). from Ableton Live 
    displaySignalFromAbleton();
    
    computeAngularTimeSpeed(); 
    //**printDataOnScreen();
    differentFunction();
    displayOscillatorSpheres();
    
    //****************************
    
    trigFollowSignalSampled();
    
    //rect(80,40,140,320);
    
    displayModePendulaireModeCirculaire();
    //  displayKeyModeNull(); 
    
    
    net.step(); // actualise step in sync library ==> actualise net.phase[i]
    netG.step(); //actualise step for chimera state, not use yet
    
    
    // if (circularMov==true) { // why it doesn' t work?
    if (formerKeyMetro ==  '*') {
     //   countRevs(); // below modePendular to compute revolution
    } 
    
    
    sendPositionToLiveFromTouchedEncodeurNetworkSizeOnly();
    mapEncodeurToNumberOfStepsMotor(); // enabling send position à finir
    
    teensyPos();   // INSIDE <-- send24DatasToTeensy10motorsToBigMachine   // attention si mesure =635 Live  placé ici, la machine bloque si live n'est pas lancé
    rotate(PI);
   // arduinoPos(); // just to trig TIMER and DATA to live when particular position of phase or pattern are created by the hole balls (oscillator)
    abletonPos();
    print (" showPos " ); showArray(Pos);
    
    
    if (encoderTouched[5] ==  true) { 
        
        //   keyMode = " samplingModeInternal ";
        
    } 
    
    
    
    
    //== = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = 
    
    
    //print(" before arduinoPos "); countRevs();   
    println(frameCount + ": " + Arrays.toString(rev));
    //== = = = = = = = = = = = = = = = = fonction not used
    //devant_derriere();
    //manageCoupling();
    //mouseMovedPrinted();
    //SoundmouseMoved(); // to automatise sound with speed. In the setup uncomment the out1, out2 ...
    
    if (formerKey == '!') {
        // formerSartKey = formerKey;
    }
    
    if (key ==  'j') {// senda trig to start record in Ableton live 
        background(255);
        startStop = 3;//
        key = '='; 
        keyPressed();
        print("startStop from the beginning: "); 
        println(startStop);
        key = '#'; // reset key to akey doing nothing
    }
    else
        {
        startStop = 2;
    }
    
    
    //option to control sound in Live when the animation is stopped then started again and when oscillator 11 touches the left  
    if (formerSartKey == '!' &&  TrigmodPos[networkSize - 1] ==  0) { 
        println("TRIG LIVE WITH oscillator 11 on LEFT"); //
        startStop = 1;  
        print("MOVEMENT AND TIMER is already started, now START LIVE: "); 
        println(startStop);
        
        formerKey = '#'; //reset formerkey to not trigging LIVE
        formerSartKey = formerKey;
    }
    
    textSize(100);
    rotate( -HALF_PI - PI);
    bpmAsPulsationFunction(); // function works only ont a period of 750 ms. under it bugs due to low resolution
    rotate(HALF_PI + PI);
    
    
    cohesionTrig = int(map(LevelCohesionToSend, 0, 1, 0, 100));
    println(cohesionTrig);
    
    //***** automatise Oscillator Movingwith a former Key
    //*+*+* +* +* +*  arduinoPos(); // // carefull with arduinoPos and function after arduinopos
    
    
    if (formerKeyMetro != 'J') { //countRevolutions when it is not the mode J
        //  countRevs();
        //    countRevsContinue();
    }
    
    //****** * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *    
    // STARTERCASE with formerKey
    //  starterCaseUsedorNot();
    // ENDSTARTERCASE
    // end check   
    
    
    //****** * * * * * * arduinoPos(); // to control Pos of motor and Trigging note and computing pulsation
    //countPendularTrig();
    //frameStop();
    formerFormerKey = formerKey; 
    handleKeyPressToChooseCircularMovementOrNot(); // in keyReleased?
    
    if (key!= ':') {
        if (key < 65535) { // if there is no SHIFT but the other key
            formerKey = key;   
        }
    }
    if (keyCode != 0) {
        formerKeyCodeAzerty = keyCode;
        formerKeyCode = keyCode;
    }
    printModeAndKey();
    
    oscSend();
    //====== = = = = = = = = = == = = = = = = = = = = = = = == = = = = = = = = = = = = = == = = = = = = = = = = = = = == = = = = = = = = = = = = = == = = = = = = = = = = = = = == = = = = = = = = = = = = = END OF MAIN LOOP   
    
}

