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
  print("average phase ");
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