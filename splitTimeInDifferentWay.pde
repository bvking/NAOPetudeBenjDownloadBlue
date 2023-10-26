void  splitTimeWithTrigSignalFromAudioAbleton(float trigedSignFromAbleton) { 
    
    trigedWithAnySign = trigedSignFromAbleton;
    
    text("trigedSignFromAbleton " + trigedSignFromAbleton, 500, 900);
    print("trigedSignFromAbleton " + trigedSignFromAbleton);
    print("trigedSignFromAbleton " + trigedSignFromAbleton);
    
    // trigedWithAnySign = (0*PI + (frameCount / propagationSpeed) * cos (1000 / 500.0)*-1); //%1 IF NO SIGNAL FROM ABLETON LIVE
    
    propagationTrigged = false;
    oscillatorChanged = false;
    
    
    
    
    if (doZ ==  false && 
       ((trigedWithAnySign > 0.5 && oldTrigedWithAnySign < 0.5) || (trigedWithAnySign<0.5 && oldTrigedWithAnySign>0.5))
   ) {  
        
        oscillatorChanged = propagationTrigged = true;
        oldOscillatorChange = oscillatorChange;
        oscillatorChange = oscillatorChange + 1;
        
        
        oscillatorChange = oscillatorChange % networkSize;
        if (oscillatorChange <=  0) {
            oscillatorChange = 0;
            oldOscillatorChange = networkSize - 1;
        } 
    }
    
    if (doZ ==  true  && trigedWithAnySign ==  1) { 
        
        
        oscillatorChanged = propagationTrigged = true;
        oldOscillatorChange = oscillatorChange;
        oscillatorChange = oscillatorChange - 1;
        
        if (oscillatorChange <= -1) {
            oldOscillatorChange = 0;
            oscillatorChange = networkSize - 1;
        }
    }
    
    oldTrigedWithAnySign = trigedWithAnySign;       
    
}





void  splitTimeLfoScaleBis() {  // change de sens de propagagtion.   ATTENTION dans ce reglage le signalToSplit de propgation est UP continue de 0 à TWO_PI
    
    lfoPhase[1] = (frameCount / 10.0 * cos(1000 / 500.0) *-  1) % TWO_PI;  // continue 0 to TWO_PI;
    lfoPhase[3] = map((((cos(frameCount / 30.0)) *-  1) % 2), -1, 1, -TWO_PI, TWO_PI);  // sinusoidale lente
    lfoPhase[2] = map((((cos(frameCount / 50.0)) *-  1) % 2), -1, 1, -TWO_PI, TWO_PI); // sinusoidale rapide
    
    println(" formed'onde lfoPhase[1] ", lfoPhase[1], "lfoPhase[2] ", lfoPhase[2], "lfoPhase[3]= signalTosplit ", lfoPhase[3]); 
    
    oldSignalToSplit = signalToSplit;
    signalToSplit = lfoPhase[3];
    
    if (oldSignalToSplit > signalToSplit) {
        key = 'q'; // when signal goes down --> propagation FRONT SIDE
        timeLfo = map(signalToSplit, TWO_PI, -TWO_PI, 0, 1000);  //  if we have an oscillation as  lfoPhase[3]
    }
    else if (oldSignalToSplit < signalToSplit) { // on est dans cette configuration avec  signalToSplit= lfoPhase[1]
        key = 'z';  //  when signal goes down --> propagation BEHIND SIDE 
        //   key = 'q';  // propagation in on the same way
        timeLfo = map(signalToSplit, -TWO_PI, TWO_PI, 0, 1000);  // if we have an oscillation  lfoPhase[3]
        //**   timeLfo = map(signalToSplit, 0, TWO_PI, 0, 1000);  // if we have a continuois from 0 to TWO_PI 
        //   timeLfo = map(signalToSplit, 0, 1, 0, 1000); //  if we have a continuois from 0 to TWO_PI from an other software
        
    }
    
    int splitTimeLfo = int(timeLfo % 100);   // 100 is the size of the gate trigging the change of the ball  
    
    println(" oldSignalToSplit " + oldSignalToSplit + " signalToSplit " + signalToSplit);
    print(" timeLfo "); print(timeLfo);   print(" splittimeLfo "); println(splitTimeLfo);
    
    
    if (doZ ==  false) {  // case q
        if (oldSplitTimeLfo > splitTimeLfo) {
            
            oldOscillatorChange = oscillatorChange;
            oscillatorChange = oscillatorChange + 1;
        } 
        oscillatorChange = oscillatorChange % networkSize;
        
        if (oscillatorChange <= 0) {
            //    oscillatorChange = 0;
            oldOscillatorChange = networkSize - 1;
        } 
    }
    
    if (doZ == true) { // case z
        if (oldSplitTimeLfo > splitTimeLfo) {
            
            oldOscillatorChange = oscillatorChange;
            oscillatorChange = oscillatorChange - 1;
        } 
        if (oscillatorChange <= - 1) {
            
            oldOscillatorChange = 0;
            oscillatorChange = networkSize - 1;
        }
    }  
    
    if (oldOscillatorChange!= oscillatorChange)
        {
        oscillatorChanged = true;
    } 
    oldSplitTimeLfo = splitTimeLfo;
    
}

void splitTimeScaleRotation(float propagationSpeed)  
  { 
    if (doo)
    {
        signal[2] = -signal[2];
    }
    
    if (doZ)
    { // option à mettre à l'ecran
        propagationTrigged = false;
        if (oldSplitTimeLfo > splitTimeLfo + 25) {
            text(" signal monte Z ", 200, 200);
            signalUpRise = true;
            oldOscillatorChange = oscillatorChange;
            oscillatorChange++;
            propagationTrigged = true;
        }
        
        oscillatorChange %= networkSize;
        if (oscillatorChange <= 0) {
            oscillatorChange = 0;
            oldOscillatorChange = networkSize - 1;
        }
        
        // propagtion opposite way
        
        if (splitTimeLfo > oldSplitTimeLfo + 25) {
            text(" signal descend Z ", 200, 200);
            signalUpRise = false;
            oldOscillatorChange = oscillatorChange;
            oscillatorChange--;
            propagationTrigged = true;
        }       
        if (oscillatorChange <= -1) {
            oldOscillatorChange = 0;
            oscillatorChange = networkSize - 1;
        }        
    }
    
    directionOfsignal = 4;
    boolean equal;
    simpleSignal2 = abs((int) map(signal[2], 0, 1, 0, 100000));
    
   // text(" signa " + simpleSignal2 + " " + oldSimpleSignal2 , 200, 300);
    
    if (!doZ) {
        propagationTrigged = false;
             
        if (oldSimpleSignal2 > simpleSignal2 && directionOfsignal >=  4) 
        {
            directionOfsignal = 6;
            text(" signalDOWN " + directionOfsignal +  " m " + memoryi, 200, 400);          
        }
        
        if (oldSimpleSignal2 < simpleSignal2  ) 
        {
            directionOfsignal = 2;
            text(" signalUPRI " + directionOfsignal +  " m " + memoryi, 200, 450);            
        }
        
        
        if (oldSimpleSignal2 == simpleSignal2) 
        { 
            equal = true;
            directionOfsignal = 4;
            text(" signalEQUAL " + directionOfsignal +  " m " + memoryi, 200, 350);   
        }    
    }
    oldSimpleSignal2 = simpleSignal2;
    
       
    if (!doZ) {
        propagationTrigged = false;
        
        if (oldSplitTimeLfo > splitTimeLfo + 50) {//+50 // only whe spliTimeLfois sliced timeLfo by 100
            text(" signal monte !z", 200, 200);
 
            oldOscillatorChange = oscillatorChange;
            oscillatorChange--;
            propagationTrigged = true;
            
            if (oscillatorChange <= -1) {
                oldOscillatorChange = 0;
                oscillatorChange = networkSize - 1;
            }
        }
        
        if (splitTimeLfo > oldSplitTimeLfo + 50) { //+50
            text(" signal descend !z", 200, 200);
            signalUpRise = false;
            
            oldOscillatorChange = oscillatorChange;
            oscillatorChange--;
            propagationTrigged = true;
                    
            if (oscillatorChange <= -1) {
                oldOscillatorChange = 0;
                oscillatorChange = networkSize - 1;
            }
        }
    }
        
    timeLfo = int(map(signal[2], 0, 1, 0, 1000));
    
    if (doo) {
        timeLfo = -timeLfo;
    }
    
 //   text("oldSplitIn splitTimeScaleRotation " + oldSplitTimeLfo + " split "  + splitTimeLfo + " timeLFO " + timeLfo + " propagationTrigged " + propagationTrigged, -width - 200, + height);
    
    oldSplitTimeLfo = splitTimeLfo;
    splitTimeLfo = int((timeLfo) % 100) + 0;
    
}

void lockOscillatorToPositionFromPreviousProagedBall() { // revoir lock
    if (propagationTrigged) {
        int i = oscillatorChange;
        int h = (oscillatorChange + 1) % networkSize;
        int j;  
        j = (oscillatorChange - 1);
        if (j <= -1) {
            j = networkSize - 1;
        }
        // int j = (oscillatorChange - 1 <= -1) ? networkSize - 1 : oscillatorChange - 1;
        int k = (j - 1 <= -1) ? networkSize - 1 : j - 1;
        int l = (k - 1 <= -1) ? networkSize - 1 : k - 1;
        int m = (l - 1 <= -1) ? networkSize - 1 : l - 1;
        
        if (propagationTrigged) {
            if (newPosXaddSignal[i] < 0) {
                phaseKeptAtChange[j] = newPosXaddSignal[i] % TWO_PI;
                dataMappedForMotor[i] = int(map(phaseKeptAtChange[i], 0, -TWO_PI, numberOfStep, 0));
                netPhaseBase[i] = map(dataMappedForMotor[i], numberOfStep, 0, 0, -TWO_PI);
            }
            else {
                phaseKeptAtChange[j] = newPosXaddSignal[i] % TWO_PI;
                dataMappedForMotor[i] = int(map(phaseKeptAtChange[i], 0, TWO_PI, 0, numberOfStep));
                netPhaseBase[i] = map(dataMappedForMotor[i], 0, numberOfStep, 0, TWO_PI);
            }
        }
        
        for (int p = 0; p < networkSize - 0; p += 1) {
            // phaseMappedFollow[i] = net.phase[i];// add offset given by pendularPattern
            //  phaseMappedFollow[i] = netPhaseBase[i]; // NO
            // phaseMappedFollow[p] = phaseMappedFollow[p] % TWO_PI;
        }
        
        /* //------- to add2 more locked ball
        LFO[l] = LFO[l] % TWO_PI;
        dataMappedForMotor[l] = int(map(LFO[l], 0, TWO_PI, 0, numberOfStep));
        netPhaseBase[l] = map(dataMappedForMotor[l], 0, numberOfStep, 0, TWO_PI);
        
        LFO[k] = LFO[k] % TWO_PI;
        dataMappedForMotor[k] = int(map(LFO[k], 0, TWO_PI, 0, numberOfStep));
        netPhaseBase[k] = map(dataMappedForMotor[k], 0, numberOfStep, 0, TWO_PI);
        //------- to add2 more locked ball
        // println("phaseKeptAtChange[oscillatorChange] ", oscillatorChange, " ", phaseKeptAtChange[oscillatorChange]);
        // println("phaseKeptAtChange[oldOscillatorChange] ", oldOscillatorChange, " ", phaseKeptAtChange[oldOscillatorChange]);
        */
    }
}
void  displayPropagationControl() {
    text(" oldOscillatorChange " + oldOscillatorChange + " oscillatorChange " + oscillatorChange + " j" + nf(phaseKeptAtChange[oscillatorChange], 0, 2), -width, -height -900 -300);
    text(" propagationTrigged " + propagationTrigged + " propagationSpeed " + propagationSpeed + " key" + key, -width, -height - 800 - 300);
    text(" signal2  " + nf(signal[2], 0, 2) + " QpropWay " + doQ + " doZ " + doZ + " BlargerPhase " + doB , -width, -height - 700 - 300);
    text(" lock " + dol + " oWay " + doo + " doC " + doC , -width, -height - 600 - 300);
    text(" QpropWay " + doQ + " doZ " + doZ + " BlargerPhase " + doB , -width, -height - 500 - 300);
    text(" oldSignalToSplit " + oldSplitTime + " splitTime " +  splitTime + " timeLFO " + timeLfo,  - width, -height - 400 - 300);
    text(" oldSignalToSplit " + nf(oldSignalToSplit, 0, 2) + " signalToSplit " +     nf(signalToSplit, 0, 2) + " timeLFO " + timeLfo,  - width, -height);
} 
