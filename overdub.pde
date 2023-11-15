int addNumberOfMesureToStartOverDub=8;

void overDub()
{

    //if (measure ==  40+addNumberOfMesureToStartOverDub && beatPrecised == 16 && beatPrecisedTrigged ==  true && music_from_ableton_live == " madRush " )
     if(measure ==  241+addNumberOfMesureToStartOverDub && beatPrecised == 1 && beatPrecisedTrigged ==  true && music_from_ableton_live == " pleasureKraft " )
    {// prepare record
        overDub=true;
        key = '9'; // align
        keyReleased();
        modeCircular = true; // not work
        formerKeyMetro = '*'; // not work
        keyMode = " samplingModeWithLive ";
        // mousePressed(); 
        mouseRecorded = true;
    }
        
    //  ------------- startSamplingWithLive -  trigged from autoMationWithMeasure from TrigEvent  ---------------------------
    if (keyMode == " samplingModeWithLive " && overDub==true) // || keyMode == " null "
    { 
        modeStartKeyToFollow = " truc "; // tres important pour le reste des balles
        if (mousePressed ==  true || mousePressed!= true)
        {
            mouseRecorded = true;  // add to trig record 
            readyToRecord = true; 
            text(" PRESTART SAMPLING  ", 200, 200);
        }
        
        if (music_from_ableton_live == " madRush ")
        {
            specialMeasureToStartRecordingBis = 41+addNumberOfMesureToStartOverDub;
        }
        
        if (music_from_ableton_live == " pleasureKraft ")
        {
            specialMeasureToStartRecordingBis = 241+addNumberOfMesureToStartOverDub;
        }
        
        //measureRecordStop = specialMeasureToStartRecording + 4;
        measureRecordStopBis = specialMeasureToStartRecordingBis + numberOfMeasureToRecord;
        
        
        if (readyToRecord == true &&  specialMeasureToStartRecordingBis == measure && beatTrigged) // synchronise recording with beatTrigged == true &&
        { 
            formerKeyMetro = '*';          
            measureRecordStartBis = measure; //            
            readyToRecord = false;
        }
        if (readyToRecord ==  false)
        {
            text(" START SAMPLING OVERDUB ?  " + samplingWithMouse + " at "  + measureRecordStartBis, 200, 300);
        } 

        samplingMovementPro(); // followPreviousSample/ 
        handleSamplingModeWithAbletonLiveBis(); //  CAREFULL with pleasureKraft add encoder 0 to angleToInterpolate //when measure==measureRecordStop --> trig modeStartKeyToFollow = followSignalSampledOppositeWay(frameRatio) 
        //  ------------- endSamplingWithLive -  trigged from draw()  ---------------------------
        
        if (measure ==  measureRecordStopBis && beatPrecised == 1 && beatPrecisedTrigged ==  true)
         {// repetition and trigging
          // net.phase[0]+=PI/2;
          speedOfrepetition=1;
          keyMode = " trigEventWithAbletonSignal "; // doesn't work correctly. Now it works from autoMationWithMeasure
          modeStartKeyToFollow = " followSignalSampledOppositeWay(frameRatio) ";   
          //keyCode = LEFT; keyReleased(); // shift delay of following ball
         
         }
    } //  // end measure & repetiton
}
