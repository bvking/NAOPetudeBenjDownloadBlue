   void samplingModeWithDessine()
    {

     //--------------- START SAMPLING with  " Dessine " " samplingModeWithLive "
     if (measure ==  6 && beatPrecised == 16 && beatPrecisedTrigged ==  true && music_from_ableton_live == " Dessine ")
     {
        
        key = '0'; // align
        phaseDirectFromSeq();
        modeCircular = true; // not work
        formerKeyMetro = '*'; // not work
        keyMode = " samplingModeWithLive ";
        // mousePressed(); 
        mouseRecorded = true;
        overDub = false;
     }
    
     //  ------------- startSamplingWithLive -  trigged from autoMationWithMeasure from TrigEvent  ---------------------------
    
     if (overDub == false && keyMode == " samplingModeWithLive " && music_from_ableton_live == " Dessine ") // madRush
     { 
        modeStartKeyToFollow = " truc "; // tres important pour le reste des balles
        if (mousePressed ==  true || mousePressed!= true) // if (mouseRecorded == true )     //                  
        {
            mouseRecorded = true;  // add to trig record 
            readyToRecord = true; 
            text(" PRESTART SAMPLING  ", 200, 200);
        }
        
        if (music_from_ableton_live == " Dessine  ") // 
        {
            specialMeasureToStartRecording = 7;
             samplingWithMouse = false;
        }
        
         measureRecordStop = specialMeasureToStartRecording + 4;
        //measureRecordStop = specialMeasureToStartRecording + numberOfMeasureToRecord;
        
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
        
        if (measure ==  measureRecordStop && beatPrecised == 1 && beatPrecisedTrigged ==  true
            || (measure ==  measureRecordStop && beatTrigged)) // go to follow made in Trigevent
        { // repetition and trigging
            // net.phase[0]+=PI/2;
            
            // mouseRecorded = false;
            keyMode = " trigEventWithAbletonSignal "; // doesn't work correctly. Now it works from autoMationWithMeasure
            modeStartKeyToFollow = " followSignalSampledOppositeWay(frameRatio) ";   
            //keyCode = LEFT; keyReleased(); // shift delay of following ball
        }
     }
    } 