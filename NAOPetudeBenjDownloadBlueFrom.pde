import interfascia.*;

// END SETUP
void mouseXY()
{  // MODULATION OF SIGMA and FREQ into GRAPHIC chimera state. No effect
    
    sigma = (map((float(mouseX) / width * 1), 0, 1, 0.0, 1.0));
    print("Sigma");
    println(sigma);
    Freq  = (map((float(mouseY) / width * 1), 0, 1, 0.0, 0.05));
}

void mousePressed()
{
    mouseRecorded = true;
    measure = 0;
}

void draw()
    { 
    for (int i = 0; i < networkSize; i++) {
       
        oldDataMappedForMotorisedPosition[i] = dataMappedForMotorisedPosition[i];
    } 
    println(" MUSIC " + music_from_ableton_live + " spelPropKey " +  specialPropagationKey);
    //handleKeyPressToChoosemodeCircularementOrNot(); // Gestion des touches * et $ pour definir mode circulaire ou non
    displayArrays(); // Affichage des tableaux compte tours et triggeurs de tours
    background(0);
    
    if (frameCount <=  1)  noLoop(); // check setPort()
    //printDataOnScreen();
    
    if (music_from_ableton_live == " controlDr " || music_from_ableton_live == " Dessine ")// DOESN'T EXIST ANYORE
    {
        //automationForMusicControlDr();   //automationForMusicDessine();
    }
    
    if (keyMode == " truc " && music_from_ableton_live == " madRush " && measure <=  120)
    {
        setKeyModeByTappingKeyPadOnce();
    }
    
    setMovement(key, false);  // to reset function just above
    
    println(" modeStartKey " +  modeStartKeyToFollow + " keyMode " + keyMode + " kMRed" +  keyModeRed + " fKeyMetro " + formerKeyMetro + " cTrigLfoPattern " + controlTrigLfoPattern);
    
    keyModeRed = keyMode; // don't read keyMode in file.txt
    
    switchFonctionDependingKeyMode(); //keyMode: trigEvent   modeStartKey: followwSignal
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
    computeSpeedAndAcceleration();
    //printDataOnScreen();
    //rotate( -HALF_PI);
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
        checkKeyModeToFollowIfALTisJustReleased(); // ->  To change Mode of speed, shift, propagation with internal or from Live datas is DISABLE inside this function....
    }  


     //--------------- START SAMPLING with  " controlDr " " samplingModeWithLive "
    samplingModeWithControlDr();
    
    //---------------  START SAMPLING with  " MADRUSH or PleasureKraft "'
    //samplingModeWithMadRushOrPlezasureKraft();
    if (measure ==32 && beatTrigged)
     {
         if (overDub == true)
        { 
        overDub();      
         }
    } 
    
    
    if (modeStartKeyToFollow == " samplingModeInternal ")
    { 
        updateInternalClock();
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
    //trigFollowSignalSampled();
    if (modeStartKeyToFollow ==  " followSignalSampledOppositeWay(frameRatio) ")
    {
        //println( "frame " + frameCount%numberOfSample+1 + " m " + measure + " degrée " + nf (degrees(movementInterpolated), 0, 1) + " ms " + millis());
        // frameRatio= 60;
        //frameRate (frameRatio);
        followSignalSampledOppositeWay(frameRatio);// with millis()    
    }
    
    //rect(80,40,140,320);
    //print(measureRecordStop + " measureRecordStop dataPMpret + keyMode " + keyMode);
    showArray(positionToMotor);
    displayModePendulaireModeCirculaire();
    //displayKeyModeNull();
    //print(" dataPMpost + keyMode " + keyMode);
   
    println();
    
    net.step(); // actualise step in sync library ==> actualise net.phase[i]
    netG.step(); //actualise step for chimera state, not use yet
    
    //if (modeCircular==true) { // why it doesn' t work?
    if (formerKeyMetro ==  '*')  // case != to get trigModPos enabled         formerKeyMetro ==  '*' ||
    {
        if (modeStartKeyToFollow != " followSignalSampledOppositeWay(frameRatio)NO ")
        {
            if (keyMode != " propagationSampleBall ")
            {
                if (keyMode != " propagationBallRotationBis ")
                { 
                    if (keyMode != " samplingModeWithLiveNO ")
                        {
                        if (music_from_ableton_live != " controlDr ")
                        {
                            if (music_from_ableton_live != " Dessine ")
                            {
                                countRevs(); // below modePendular to compute revolution
                            }
                        }
                    }
                }
            }
        }   
    }
    textSize(200);
    
    // -------------------------------------     MANAGE CONTROLDR  
    // DISPLAY GAP, trig, ... midPos 
    sendPositionToLiveFromTouchedEncodeurNetworkSizeOnly();
    // data From serial computed to trig middle position and trig just touched 
    //trigMiddlePositionFromEncodeur();  // trigMidPos en focntion encoder // ern fondtion position encodeur reel et encodeurTouched, pas sur
    //print(" midPos ");
    //showArray(midPos);
    computeMidPosToSend();
    // -------------------------------------     MANAGE CONTROLDR  //END  data From serial computed to trig middle position and trig just touched 
    
    print(" sendMid ");
    showArray(sendMiddleInt);
    println();
    
    //mapEncodeurToNumberOfStepsMotor(); // enabling send position à finir
    
    teensyPos();   // INSIDE <-- send24DatasToTeensy10motorsToBigMachine   // attention si mesure =635 Live  placé ici, la machine bloque si live n'est pas lancé
    //print(" dataMP + keyMode " + keyMode);
    send6dataToTest();
    
    if (keyMode == " propagationBallRotationBis ") 
    {
        // dataMappedForMotorisedPosition=positionToMotor; // do it just in abletonPos
    }
    showArray(dataMappedForMotorisedPosition);
    
    // rotate(PI);
    // arduinoPos(); // just to TRIGMODPOS TIMER and DATA to live when particular position of phase or pattern are created by the hole balls (oscillator)
    //abletonPos(); // Pos with net.phase[i]
    print(" showPos ");
    showArrayF(Pos);
    println("memoryi " + memoryi);
    print(" encoder_due ");
    showArray(dataFromArduinoDue);
    
    
    
    if (encoderTouched[5] ==  true) {
        
        //  keyMode = " samplingModeInternal ";
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
    
    if (key ==  'j')
    {   // senda trig to start record in Ableton live
        background(255);
        // startStop = 3;//
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
    if (formerSartKey == '!' &&  TrigmodPos[networkSize - 1] ==  0)
    {
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
    //println(cohesionTrig);
    
    //***** automatise Oscillator Movingwith a former Key
    //*+*+* +* +* +*  arduinoPos(); // // carefull with arduinoPos and function after arduinopos
    
    if (formerKeyMetro != 'J') { //countRevolutions when it is not the mode J
        //  countRevs();
        //  countRevsContinue();
    }
    
    //****** * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
    //STARTERCASE with formerKey
    //starterCaseUsedorNot();
    //ENDSTARTERCASE
    //end check
    
    //****** * * * * * * arduinoPos(); // to control Pos of motor and Trigging note and computing pulsation
    //countPendularTrig();
    //frameStop();
    formerFormerKey = formerKey;
    
    if (key!= ':')
    {
        if (key < 65535) { // if there is no SHIFT but the other key
            formerKey = key;
        }
    }
    
    if (keyCode != 0) 
    {
        formerKeyCodeAzerty = keyCode;
        formerKeyCode = keyCode;
    }
    
    if (keyCode == 17)  // CONTROL
    {
        //keyCode = 32; // BARSPACE
    }
    formerKeyMode = keyMode;
    printModeAndKey();
    textSize(100);
    keyReleased();
    
    for (int i = 0; i < networkSize - 0; i++)
    {
        Pos[i] = abs((float) map(dataMappedForMotorisedPosition[i] % numberOfStep, 0, numberOfStep, 0, 254));
        //  print ( " slider " + i + " " + slider[i] + " vel " + velocityBis[i]);
    }
    println(""); 
    //  trigMiddlePositionFromEncodeur();    
    if (millis()>timeTosendData + 20)
    {
        oscSend();
        timeTosendData = millis();
     }


  
      for (int i = 0; i <  networkSize - 0; i += 1)
    { 
        oldLastActualPosition[i] = lastActualPosition[i];
      //  oldOldPositionToMotor[i] = oldPositionToMotor[i]; // begin
      //  oldOldPositionToMotor[i] = oldPositionToMotor[i];
      //  oldPositionToMotor[i] =  positionToMotor[i];
    

        oldOldPosF[i] = oldPosF[i];
        oldPosF[i] = newPosF[i];
        oldOldPhaseMapped[i] = oldPhaseMapped[i];
        oldPhaseMapped[i] = phaseMapped[i];
    }

    bpmAsPulsationFunction();

        println( " PULSAT " + pulsation ); 
  

    //== = = = = = = = = = = = == == = = = = = = = = = = = = = == = = = = = = = = = = = = = == = = = = = = = = = = = = = == = = = = = = = = = = = = = == = = = = = = = = = = = = = == = = = = = = = = = = = = = END OF MAIN LOOP
}
