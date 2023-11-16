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
    
     if (keyMode == " truc " && music_from_ableton_live == " madRush " && measure <=  120)
     {
        setKeyModeByTappingKeyPadOnce();
     }
    
     setMovement(key, false);  // to reset function just above
    
     println(" modeStartKey " +  modeStartKeyToFollow + " keyMode " + keyMode + " kMRed" +  keyModeRed + " fKeyMetro " + formerKeyMetro + " cTrigLfoPattern " + controlTrigLfoPattern);
    
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
       
            //---------------  ARM " samplingModeWithLive "
      if (measure ==  40 && beatPrecised == 16 && beatPrecisedTrigged ==  true && music_from_ableton_live == " madRush " ) // madRush
      // if(measure ==  40 && beatPrecised == 3 && beatPrecisedTrigged ==  true && music_from_ableton_live == " pleasureKraft " ) // madRush)
        {    // prepare record
         key = '9'; // align
         keyReleased();
         modeCircular = true; // not work
         formerKeyMetro = '*'; // not work
         keyMode = " samplingModeWithLive ";
         // mousePressed(); 
         mouseRecorded = true;
         overDub = false;
        }
        
          //  ------------- startSamplingWithLive -  trigged from autoMationWithMeasure from TrigEvent  ---------------------------
       if (overDub == false && keyMode == " samplingModeWithLive " && ( music_from_ableton_live == " pleasureKraft " || music_from_ableton_live == " madRush ") ) // madRush
       { 
             modeStartKeyToFollow = " truc "; // tres important pour le reste des balles
            if (mousePressed ==  true || mousePressed!= true) // if (mouseRecorded == true )     //                  
           {
            mouseRecorded = true;  // add to trig record 
            readyToRecord = true; 
            text(" PRESTART SAMPLING  ", 200, 200);
           }
        
           if (music_from_ableton_live == " madRush ") // madRush
           {
            specialMeasureToStartRecording = 41;
           }
        
           if (music_from_ableton_live == " pleasureKraftNo " ) // resultMidPosWithEncoder
           {
            specialMeasureToStartRecording = 241;
            samplingWithMouse=false;
           }
        
           //measureRecordStop = specialMeasureToStartRecording + 4;
           measureRecordStop = specialMeasureToStartRecording + numberOfMeasureToRecord;
        
        
           if (readyToRecord == true &&  specialMeasureToStartRecording == measure && beatTrigged) // synchronise recording with beatTrigged == true &&
           { 
            formerKeyMetro = '*';          
            measureRecordStart = measure; //            
            readyToRecord = false;
            }
           if (readyToRecord ==  false)
           {
            text(" START SAMPLING with MOUSE or NOT  " + samplingWithMouse + " at "  + measureRecordStart, 200, 300);
           
           } 

           handleSamplingModeWithAbletonLive(); //when measure==measureRecordStop --> trig modeStartKeyToFollow = followSignalSampledOppositeWay(frameRatio) 
           //  ------------- endSamplingWithLive -  trigged from draw()  ---------------------------
        
          if (measure ==  measureRecordStop && beatPrecised == 1 && beatPrecisedTrigged ==  true) // go to follow made in Trigevent
           { // repetition and trigging
             // net.phase[0]+=PI/2;
        
            // mouseRecorded = false;
             keyMode = " trigEventWithAbletonSignal "; // doesn't work correctly. Now it works from autoMationWithMeasure
             modeStartKeyToFollow = " followSignalSampledOppositeWay(frameRatio) ";   
             //keyCode = LEFT; keyReleased(); // shift delay of following ball
            }
        }      //  // end measure & repetiton



        if (overDub == true)
        { 
          overDub();

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
      showArray(positionToMotor);
    
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
                        countRevs(); // below modePendular to compute revolution
                    }
                }
            }
        }   
     }
     textSize(200);
    
     sendPositionToLiveFromTouchedEncodeurNetworkSizeOnly();
     //mapEncodeurToNumberOfStepsMotor(); // enabling send position à finir
    
     teensyPos();   // INSIDE <-- send24DatasToTeensy10motorsToBigMachine   // attention si mesure =635 Live  placé ici, la machine bloque si live n'est pas lancé
     //print(" dataMP + keyMode " + keyMode);

      if (keyMode == " propagationBallRotationBis ") 
     {
        // dataMappedForMotorisedPosition=positionToMotor; // do it just in abletonPos
     }
     showArray(dataMappedForMotorisedPosition);
    
     // rotate(PI);
     // arduinoPos(); // just to TRIGMODPOS TIMER and DATA to live when particular position of phase or pattern are created by the hole balls (oscillator)
     abletonPos();
     print(" showPos ");
     showArray(Pos);
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
    println(cohesionTrig);
    
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
    
    formerKeyMode = keyMode;
    printModeAndKey();
    
    // data From serial computed to trig middle position and trig just touched 

    trigMiddlePositionFromEncodeur();
    
    result = multiMatchData(0, 1, TrigmodPos.clone());
    TrigmodPos = result;
    print(" showResul ");showArray(result);
    textSize(150);
    
    if (networkSize ==  6) 
    {
      char resultString[] = {'A', 'A', 'A', 'A', 'A', 'A'};
            
     for (int i = 0; i < networkSize; i++)
      {
       if (result[i] ==  0) {
       resultString[i] = 'B';
        }
       }

     char data[] = {resultString[0], resultString[1], resultString[2],resultString[3], resultString[4], resultString[5]};
     String str2 = new String(data);
     text(" showTrig " + str2, 300, -850);
        
        //- --------------- middle pos sent
        
     text(" midPos[0] " + midPos[0], 300, -450);
     char midPosString[] = {'F', 'F', 'F', 'F', 'F', 'F'};
        
        // resultString='A';
        for (int i = 0; i < networkSize; i++) {
            if (midPos[i] ==  true) {
                midPosString[i] = 'T';
                sendMiddle[i] = 0;  // to trig something in M4Live
                }
            else {
                sendMiddle[i] = 1; 
                }
            }
        char middlePos[] = {midPosString[0], midPosString[1], midPosString[2],midPosString[3], midPosString[4], midPosString[5]};
        String strMiddle = new String(middlePos);
        text(" showMid " + strMiddle, 300, -1000);

      //midPos  but not aligned  covertir en int puis float

        for (int i = 0; i < networkSize; i++) {
           sendMiddleInt[i]= (int)  sendMiddle[i];
            
                }

         resultMidPosWithEncoderInt = multiMatchData(1, 0, sendMiddleInt.clone());

           for (int i = 0; i < networkSize; i++) {
           
             sendMiddle[i]= (float) resultMidPosWithEncoderInt[i];
                }

        
        println(" sendMiddle ");showArrayF(sendMiddle);
        println(" sendMiddle ");showArrayF(sendMiddle);

        /*
        resultMidPosWithEncoderF = multiMatchDataF(1, 0, sendMiddle.clone());
        sendMiddle = resultMidPosWithEncoder;
        println(" sendMiddle ");showArrayF(sendMiddle);
        println(" sendMiddle ");showArrayF(sendMiddle);
        */


     }
    
    
    
    
     textSize(100);
     //----
    
      oscSend();
      //== = = = = = = = = = = = == == = = = = = = = = = = = = = == = = = = = = = = = = = = = == = = = = = = = = = = = = = == = = = = = = = = = = = = = == = = = = = = = = = = = = = == = = = = = = = = = = = = = END OF MAIN LOOP
 }
