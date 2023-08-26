//boolean doQ, doZ, doB; 

boolean propagationTrigged;
boolean doo = false;
boolean dol = false;
boolean doC = false;
boolean doRotation = false;
/*
String modeStartKeyToFollow, keyMode;

float phaseMapped [] =  new float  [networkSize]; 
float newPosFollowed  [] =  new float  [networkSize]; 
float phaseMappedFollow  [] =  new float  [networkSize]; 
*/


void propagationBallRotationBis(float speedOfPropagationFromLiveOrNot) { // as addSignalOneAndTwoQuater() in NAOP 
    keyMode = " propagationBallRotationBis ";
    modeStartKeyToFollow = " null ";
    //formerKeyMetro = '*';
    
    // propagationSpeed = speedOfPropagationFromLiveOrNot - 10;
    // propagationSpeed =100.0;
    
    if (music_from_ableton_live == " pleasureKraft " && measure > 245 && measure < 635) {       
        propagationSpeed = speedOfPropagationFromLiveOrNot - 10; // in signal[2] goto line 191
    }
    
    
    if (measure == 58 && beatPrecised == 2 && beatPrecisedTrigged ==  true && music_from_ableton_live == " pleasureKraft ") { 
        modeCircular = true;// doesn't work
        formerKeyMetro = '*';
    
        propagationSpeed = 15.0; // 30.0;
        modulePhaseAmountWithArrow = true; // to adjust phase in propa2way
        keyCode = LEFT; keyReleased();
        keyCode = DOWN; keyReleased();
        keyCode = LEFT; keyReleased();
        keyCode = DOWN; keyReleased();
        // propagation2wayRotationBis(); 
    } 
    
    if ((measure == 60 || measure == 62 || measure == 64 || measure == 66) && beatPrecisedTrigged ==  true) { 
        modulePhaseAmountWithArrow = true;
        keyCode = RIGHT; keyReleased();
    } 
    
    //---------- come back to trigEventWithAbletonSignal ------- 
    if (measure == 66 && beatPrecised == 4 && beatPrecisedTrigged ==  true) { 
        //keyMode = " trigEventWithAbletonSignal ";
        textSize(1000);         
    } 
    
    textSize(50);
    displayPropagationControl();
    
    letter = key;   
    
    switch(letter) {
        case'r' : // way of rotation
        doRotation = true;
        key = '#';
        
        break;
        
        case'R' : // way of rotation
        doRotation = false;
        key = '#';
        
        case'o' : // way of rotation
        doo = true;
        
        break;
        
        case'O' : // way of rotation
        doo = false;
        
        break;
        
        case'c' : 
        doC = true;
        
        break;
        
        case'C' : 
        doC = false;
        
        break;
        
        
        case'l' : // enable propagation or lock
        dol = true;
        key = '#';
        
        break;
        case'L' : // disable propagation
        dol = false;
        
        break;
        case'q' : // way of propagation
        doQ = true;
        doZ = false;
        break;
        
        case'b' : 
        doQ = false;
        doZ = false;
        doB = doB;
        key = '#';
        break;
        
        case'B' : 
        doQ = false;
        doZ = false;
        doB = false;
        
        break;
        case'z' : // change way of propagation
        doZ = true;
        doQ = true;
        break;
        
        case'Z' : // change way of propagation
        doZ = false;
        doQ = true;
        break;
        
        case'#' : // change way of propagation
        break;
        
    }
    
    
    if (formerFormerKey == '#' || modeStartKeyToFollow == " null ") { // formerFormerKey == '#' || 
        
        println(" modeStartKeyToFollow " + modeStartKeyToFollow);
        if (doRotation == true) {
            //signal[2]=- signal[2] ;
            for (int i = 0; i < networkSize - 0; i += 1) { 
                // newPosFollowed[i]+=0.1;
                // phaseAmount=-phaseAmount;
            }
        }
        
        for (int i = 0; i < networkSize - 0; i += 1) {             
            //   newPosFollowed[i]=map (signal[2], 0, 1, 0, TWO_PI); // signals to follow
            //    newPosFollowed[i]=newPosFollowed[i]%TWO_PI;  // signals to follow
            phaseMapped[i] = newPosFollowed[i] + phaseMappedFollow[i]; // new signal is a composition 
            
            if (phaseMapped[i] < 0) {
                dataMappedForMotorisedPosition[i] = int(map(phaseMapped[i], 0, -TWO_PI, numberOfStep, 0)); 
                phaseMapped[i] = map(dataMappedForMotorisedPosition[i], numberOfStep, 0, 0, -TWO_PI);  
            }   
            else{              
                dataMappedForMotorisedPosition[i] = (int) map(phaseMapped[i], 0, TWO_PI, 0, numberOfStep); 
                phaseMapped[i] = map(dataMappedForMotorisedPosition[i], 0, numberOfStep, 0, TWO_PI);
            }
            
            if (doo)  {  // in propagation2wayRotationBis();
                // phaseMapped[i]=-phaseMapped[i];:            
            }
            //  newPosXaddSignal[i]=phaseMapped[i];  // realign Balls        
        }
    }
    //lockOscillatorToPositionFromPreviousProagedBall();
    //******** Lock last oscillator to the lastPhase
    
    if (dol) {
        //  lockOscillatorToPositionFromPreviousProagedBallTest();
        for (int i = 0; i < networkSize - 0; i += 1) { 
            //  phaseMappedFollow[i] = netPhaseBase[i];
            //  phaseMappedFollow[i] = phaseMappedFollow[i]%TWO_PI; 
        }
    }
    /*
    if (  propagationTrigged==true && dol==true) {
    //  lockOscillatorToPositionFromPreviousProagedBallTest();
    for (int i = 0; i < networkSize-0; i+=1) { 
    phaseMappedFollow[i] = netPhaseBase[i];
    phaseMappedFollow[i] = phaseMappedFollow[i]%TWO_PI; 
}
}
    */  
    
    if (key != '#') {
        if (modeStartKeyToFollow == " null ") {
            phasePatternBase();
            
            for (int i = 0; i < networkSize - 0; i += 1) {
                phaseMappedFollow[i] = netPhaseBase[i];
            }
        }
    } 
    
    // modality of spltted time
    
    if (measure == 635) {
        
        propagationSpeed = 30.0; // useless if propagation comes from ableton Live
        signal[2] = map((((cos(frameCount / propagationSpeed)) *-  1) % 1), -1, 1, -1, 1);  // COMMENT if Ableton gives signal2
        splitTimeScaleRotation(signal[2]);  // ascendant vs descendant => changement de sens de propagation
        
    }
    
    if (music_from_ableton_live == " pleasureKraft " && measure < 635) { //measure < 245
        signal[2] = map((((cos(frameCount / propagationSpeed)) *-  1) % 1), -1, 1, -1, 1);  // COMMENT if Ableton gives signal2
        splitTimeScaleRotation(signal[2]);  // ascendant vs descendant => changement de sens de propagation
    } 
    
    // splitTimeSinusoidaleScale(trigedSignFromAbleton[3]);
    // splitTimeWithTrigSignalFromAudioAbleton(trigedSignFromAbleton[0]); // wit z false need triangular if not need signal == 1
    
    
    if (music_from_ableton_live == " pleasureKraftNO " && measure > 245 && measure < 635) {
        trigedSignFromAbleton[3] = 0;  
        if ((note1 == 60 || note2 == 60) && (velocity1 != 0  || velocity2!= 0) &&  millis()>= formerEvent[3]) {  //note 60 = HI TOM
            textSize(200);    
            formerEvent[3] = millis() + 25;
            text(" formerEvent[3] " + formerEvent[3] , 200, 200);
            trigedSignFromAbleton[3] = 1;
            splitTimeWithTrigSignalFromAbletonSquare(trigedSignFromAbleton[3]);// with signal ==1
        }
        
        if ((note1 == 42 || note2 == 42) && (velocity1 == 96 || velocity2 == 96) &&  millis()>= formerEvent[3]) {  //note 42 = HI TOM
            textSize(200);    
            // formerEvent[3] = millis()+25;
            // text ( " formerEvent[3] " + formerEvent[3] , 200, 200 );
            //trigedSignFromAbleton[3] = 1;
            // splitTimeWithTrigSignalFromAbletonSquare(trigedSignFromAbleton[3]);// with signal ==1
        }
    }
    
    modulePhaseAmountWithArrow = true; // in Trig Event
    propagation2wayRotationBis(); 
    
    actualisePositionDataFromCircular = false; //    lastRecordData of motors positiond were stocked when the circular Mode was true as formerKeyMetro == '#'
    // mapNewPosX(); // counter actived
    mapPropagationSampledBall(); // mapPropagationTomanageCounter
    
    
    // COMEBACK to other function
    if (measure == 66 && beatPrecised == 4 && beatPrecisedTrigged ==  true && music_from_ableton_live == " pleasureKraft ") { 
        addSignalOneAndTwoTer();
        // positionMov = " troisieme " ;  
        textSize(500);         
    } 
    
    // MODULATION of phase and propagation in MadrusH
    if (music_from_ableton_live == " madRush ") { 
        
        if (measure ==  122 && beatPrecised ==  1 && beatPrecisedTrigged) {// measure>=41 && measure<=42                 
            levelFromArrow = (PI / (1 * networkSize - 1)); // set 
            //phaseAmount=  (PI / (1 * networkSize - 1)); // set 
            modulePhaseAmountWithArrow = true; // enable pahseAmout = levelFromArrow
        }
        
        if (measure ==  124 && beatPrecised ==  1 && beatPrecisedTrigged) {// measure>=41 && measure<=42        
            keyCode = RIGHT; keyReleased();
            keyCode = DOWN; keyReleased();
            // phaseAmount=  (PI / (1 * networkSize - 1)); // set 
            modulePhaseAmountWithArrow = true;
        }
        
        if (measure ==  126 && beatPrecised ==  1 && beatPrecisedTrigged) {// measure>=41 && measure<=42            
            levelFromArrow = (PI / (1 * networkSize - 1)); // set 
            //phaseAmount=  (PI / (1 * networkSize - 1)); // set 
            modulePhaseAmountWithArrow = true;
        }
        if (measure ==  126 && beatPrecised ==  1 && beatPrecisedTrigged) {// measure>=41 && measure<=42     
            //propagationSpeed= 90.0;
        }
        if (measure ==  130 && beatPrecised == 1 && beatPrecisedTrigged) {// measure>=41 && measure<=42     
            //propagationSpeed= 60.0;
            //  keyMode = " trigEventWithAbletonSignal ";
        }      
        if (measure ==  134 && beatPrecised ==  1 && beatPrecisedTrigged) {// measure>=41 && measure<=42      
            //  keyMode = " trigEventWithAbletonSignal ";
        }
    } // end madRush
    
}


void  splitTimeWithTrigSignalFromAbletonSquare(float propagationSpeedWithSquareSignal) { 
    text(" Z to change Propagation Way trigedSignFromAbleton3 ou 2 " + trigedSignFromAbleton[2] + " 3 " + trigedSignFromAbleton[3],  500, 900);
    
    // signal[2] = (0*PI + (frameCount / propagationSpeed) * cos (1000 / 500.0)*-1); //%1 IF NO SIGNAL FROM ABLETON LIVE
    
    propagationTrigged = false;
    if (doZ ==  false && trigedSignFromAbleton[3] ==  1) { 
        //  propagationTrigged = true; 
    }
     
    if (doZ ==  false && trigedSignFromAbleton[3] ==  1) {  // propagationSpeedWithSquareSignal==1    
        propagationTrigged = true;
        oldOscillatorChange = oscillatorChange;
        oscillatorChange = oscillatorChange + 1;     
        oscillatorChange = oscillatorChange % networkSize;
        if (oscillatorChange <=  0) {
            oscillatorChange = 0;
            oldOscillatorChange = networkSize - 1;
        } 
    }
    
    
    if (doZ ==  true  &&  trigedSignFromAbleton[3] ==  1) {  //     if (doZ==true  && propagationSpeedWithSquareSignal==1 ){    
        propagationTrigged = true;
        oldOscillatorChange = oscillatorChange;
        oscillatorChange = oscillatorChange - 1;    
        if (oscillatorChange <= -1) {
            oldOscillatorChange = 0;
            oscillatorChange = networkSize - 1;
        }
    }
}
