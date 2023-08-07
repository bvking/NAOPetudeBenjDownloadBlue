void switchFonctionDependingKeyMode() {
       // boolean truc = true;
      // setMovement( key, truc);
    
    char lastKey;
    if (key!= '#') {
       // lastKey = char(key); 
    
        }
           lastKey = char(key); 
    
    translate(0, 0, 1000);
    text(" Acc " + speedDelta + " key " + lastKey + " beatP " + beatPrecised + " Ball " + memoryi +  " mode " + keyMode , -width, -height+200); 


    if (keyMode == " trigEventWithAbletonSignal " || keyModeRed == " trigEventWithAbletonSignal ") {
        
        trigEventWithAbletonSignal();
    text(" Alt v " + keyMode, -width * 2, -height * 3+100);

    }
    
    if (keyMode == " addSignalOneAndTwoQuater " || keyModeRed == " addSignalOneAndQuater ") { //drive ball with lfo      
        propagationMode();
    }
    
    if (keyMode == " addSignalOneAndTwoTer " || keyModeRed == " addSignalOneAndTwoTer ") { //drive ball with lfo
        //  PatternFollowLfo();
        addSignalOneAndTwoTer();
        text(" Alt a " + keyMode, -width * 2, -height * 3+100);
    }
    
    
    if (keyMode == " addSignalOneAndTwoBis " || keyModeRed == " addSignalOneAndTwoBis ") { //drive ball with lfo
        //  PatternFollowLfo();
        addSignalOneAndTwoBis();
        text(keyMode, -width, -height); 
    }  
    
    if (keyMode == " addSignalOneAndTwo " || keyModeRed == " addSignalOneAndTwo ") { //drive ball with lfo
        //  PatternFollowLfo();
        //  addSignalOneAndTwo();
        // doo=true;
        addSignalOneAndTwoOriginal();
        text(" Alt z " + keyMode, -width * 2, -height * 3+100);

    }
    
    if (keyMode == " methodAbleton " || keyModeRed == " methodAbleton ") { //drive ball with lfo
        methodAbleton();
        text(keyMode, -width, -height); 
        
    }
    
    if (keyMode == " followDirectLfo " || keyModeRed == " followDirectLfo ") { //drive ball with lfo
        followDirectLfo();
        text(keyMode, -width, -height); 
    }
    
    if (keyMode == " followDistribueAddphasePattern " || keyModeRed == " followDistribueAddphasePattern ") { //drive ball with lfo
        followDistribueAddphasePattern();
        text(keyMode, -width, -height); 
        }
    
    if (keyMode == " followDistribueAddLfoPatternBis " || keyModeRed == " followDistribueAddLfoPatternBis ") { //drive ball with lfo
        followDistribueAddLfoPattern();

       text(" Alt d? not used " + keyMode, -width * 2, -height * 3+100);

        }
    
    if (keyMode == " samplingMode " || keyModeRed == " samplingMode ") { //drive ball with lfo

        text(" Alt w not used " + keyMode, -width * 2, -height * 3+100);
        }
    
    
    
    if (keyMode ==  " followDistribueAddLfoPatternControl " || keyModeRed == " followDistribueAddLfoPatternControl ") { // drive with CONTROL & r
        if (key!= '#') {
            controlTrigLfoPattern = millis();
            }
        //  followDistribueAddLfoPatternControl();
        }
    
    
    if (keyMode == " propagationBallRotationTest " || keyMode == " propagationBallRotationTest ") { 
        propagationBallRotationTest();
        text(" Alt t " + keyMode, -width * 2, -height * 3+100);
        }
    
    if (keyMode == " propagationBallRotationBis " || keyModeRed == " propagationBallRotationBis ") { 
        propagationBallRotationBis(propagationSpeed);
        text(" Alt y " + keyMode, -width * 2, -height * 3+100);
        }
    
    if (keyMode == " propagationBallRotationBisTest " || keyModeRed == " propagationBallRotationBisTest ") { 
        propagationBallRotationBisTest();
        text(" Alt u " + keyMode, -width * 2, -height * 3+100);     
        }

    if (keyMode == " propagationSampleBall " || keyModeRed == " propagationSampleBall ") { 
        propagationSampleBall();
        text(" Alt j " + keyMode, -width * 2, -height * 3+100);     
        }
    
    
    
    if (keyMode == " null " || keyModeRed == " null ") { //drive ball with lfo
        text(" Alt x " + keyMode, -width * 2, -height * 3+100);
        
        }
    
    if (keyMode == " phasePattern ") { //drive ball with lfo
        text(keyMode + " " + signal[5] ,(width / 2),height / 2); 
        
        
        }
    
    if (keyMode == " abletonPattern ") { //driveball with lfo
        abletonPattern();
        text(keyMode,(width / 2), height / 2);         
        }
    
    
    if (keyMode == " signal ") { // || formerKeyMetro == 'J'
        text(keyMode, -width, -height); 
        for (int i = 0; i <  networkSize; i++) {
            net.oldPhase[i] =  net.phase[i]; 
            net.phase[i] =  map(signal[i], 0, 1, 0, TWO_PI);   //  
            println(" signalTo_net.phase ",(i), net.phase[i]);
            
            if (net.oldPhase[i] > net.phase[i]) {             
                dataMappedForMotorisedPosition[i] = int(map(net.phase[i], TWO_PI, 0, numberOfStep, 0)); 
                net.oldPhase[i] = net.phase[i];            
                }
            
            else
            dataMappedForMotorisedPosition[i] = (int) map(net.phase[i], 0, TWO_PI, 0, numberOfStep); 
            net.oldPhase[i] = net.phase[i];

            }
        }
    lastKey = '#';
    translate(0, 0, -1000);   
}
