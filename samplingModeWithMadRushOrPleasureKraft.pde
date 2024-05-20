void samplingModeWithMadRushOrPlezasureKraft()
{
    if (measure ==  40 && beatPrecised == 16 && beatPrecisedTrigged ==  true && music_from_ableton_live == " madRush ") // madRush
        //if(measure ==  40 && beatPrecised == 3 && beatPrecisedTrigged ==  true && music_from_ableton_live == " pleasureKraft " ) // madRush)
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
    if (overDub == false && keyMode == " samplingModeWithLive " && (music_from_ableton_live == " pleasureKraft " || music_from_ableton_live == " madRush ")) // madRush
    { 
        modeStartKeyToFollow = " truc "; // tres important pour le reste des balles
        if (mousePressed ==  true || mousePressed!= true) // if (mouseRecorded == true )     //                  
        {
            mouseRecorded = true;  // add to trig record 
            readyToRecord = true; 
            text(" PRESTART SAMPLING  ", 200, 200);
        }
        
        if (music_from_ableton_live == " madRush ") // madRush  / WITH pleasurKraft specialMeasureToStartRecording comes from trigEvent
        {
            specialMeasureToStartRecording = 41;
        }
        
        if (music_from_ableton_live == " pleasureKraft ") // useless because it is in trigEvent
        {
            specialMeasureToStartRecording = 231;
            samplingWithMouse = false;
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
    } 
}      //  // end measure & repetiton