void addSignalOneAndTwoLock(){ 
 //---------- come back to trigEventWithAbletonSignal ------- work only with $
     if (measure == 66 && beatPrecised == 4 && beatPrecisedTrigged==true) {      
        keyCode = ALT; keyPressed(); key = 'v'; keyPressed(); // key 
        keyMode = " trigEventWithAbletonSignal ";
        trigEventWithAbletonSignal();
        positionMov = " troisieme " ;
          } 

    text ( " One And Two Original oscillatorChange " + oscillatorChange , 0, height-800);
    text ( " special Lock doQ=true " + doQ , 0, height-700);
      text ( " trigedSignFrom" + trigedSignFromAbleton[3] , 0, height-600);
      text (" lock " + dol + " oWay " + doo + " doC " + doC , -width, -height- 500 );
     text (" QpropWay " + doQ + " doZ " + doZ + " BlargerPhase " + doB , -width, -height -400 );
   // lfoPattern()
     letter = key;   
  
  switch(letter) {

       case 'o': // way of propagation
    doo=true;
    break;
    case 'O': // way of propagation
    doo=false;
    break;


    case 'l': // way of propagation
    dol=true;
    break;
    case 'L': // way of propagation
    dol=false;
    break;



    case 'q': // way of propagation
    doQ=true;
    doZ=false;
    break;
    case 'b': 
   
    doB=true;
    key = '#';
    break;
   
    case 'B': 
    doB=false;
    key = '#';
    break;

    case 'Z': // change way of propagation
    doZ=true;
   // doZ=!doZ;
    doQ=true;
    break;
     case 'z': // change way of propagation
    doZ=false;
   // doZ=!doZ;
    doQ=true;
    break;
    case '#': // change way of propagation
    
    break;
    }

  splitTime(); 
  addSignalLfoPattern(); 
  mapNewPosX(); // counter actived

  
 }
 
 void addSignalLfoPattern()  {
   
    if (doQ==true ){ // to change speed of propagtion in split time
  //   pendularPattern(); // offset with lfo oscillator by osillator
     print ("  case q phaseFollowLFO " + oscillatorChange + " "  + phaseFollowLFO[oscillatorChange] + " "); print ("  LFOoscillatorChange  "); print (oscillatorChange); print ("   ") ;  print (LFO[oscillatorChange]  ); 
     print (" newPosXaddSignal[oscillatorChange] " + newPosXaddSignal[oscillatorChange]);
     
   //   phaseFollowLFO[oscillatorChange]= lfoPhase[2];  
     signal[4] = (0*PI + (frameCount / 20.0) * cos (1000 / 500.0)*-1)%1;
   // phaseFollowLFO[oscillatorChange]= map (signal[4], 0, 1, 0, TWO_PI);    // speed of rotation
  // phaseFollowLFO[oscillatorChange]= map (0.01, 0, 1, 0, TWO_PI); //   ..DON4T WORK

   }


   if (formerFormerKey  == '#' ) { //  != '#'
 
    int i;
    i= oscillatorChange;

 
 //********POURQUOI DIFFERENT AU DEMARRAGE DE lA FONCTION
  //  signal[2] = (0*PI + (frameCount / 41.0) * cos (1000 / 500.0)*-1);//%1; //NO vitesse roat
   // signal[2] = 0.08; 
   //   LFO[i] =  map (signal[2], 0, 1, 0, TWO_PI);        
      LFO[i] =  map (0.01, 0, 1, 0, TWO_PI);  // CONSTANT

  }
    
  if (oscillatorChanged==true )  { 
     LFO[oscillatorChange]-=QUARTER_PI/2;   //  RECORD on oscillatorChange the postion of oscillatorChange where it 's changing
     phaseKeptAtChange[oscillatorChange]=LFO[oscillatorChange]; 
   
   }
   
 
   int j;  
  j= (oscillatorChange-1);
  if (j<= 1){
  j= networkSize-1;
    }
   int k;  
  k= (j-1);
  if (k<= 1){
  k= networkSize-1;
  }

        LFO[k]= LFO[j];
        LFO[oscillatorChange] = phaseKeptAtChange[oscillatorChange];//*1
     //   LFO[j] = phaseKeptAtChange[k]; //pas mal
       if (oscillatorChanged==true )  { 
    //*****   LFO[j] = phaseKeptAtChange[oscillatorChange];
       LFO[j] = LFO[oscillatorChange];
      }
      //  LFO[j] = LFO[j]%TWO_PI;
    
       dataMappedForMotor[oscillatorChange]= (int) map (LFO[oscillatorChange], 0, TWO_PI, 0, numberOfStep);
       dataMappedForMotor[j]= (int) map (LFO[j], 0, TWO_PI, 0, numberOfStep);
       dataMappedForMotor[k]= (int) map (LFO[k], 0, TWO_PI, 0, numberOfStep);
       println (" phaseKeptAtChange[oscillatorChange] ", oscillatorChange, " " ,  phaseKeptAtChange[oscillatorChange]);
 
       newPosXaddSignal[oscillatorChange]= map (dataMappedForMotor[oscillatorChange], 0, numberOfStep, 0, TWO_PI);
  //     newPosXaddSignal[j]= map (dataMappedForMotor[j], 0, numberOfStep, 0, TWO_PI);
     //  newPosXaddSignal[j]= map (dataMappedForMotor[j], 0, numberOfStep, 0, TWO_PI);

       

///////////////////// 

}

void  splitTime() { 

      oscillatorChanged=false;
  if (formerDecayTimeLfo>decayTimeLfo){
     oscillatorChanged=true;
      oldOscillatorChange=oscillatorChange;
      oscillatorChange=oscillatorChange+1; 
  } 

       formerDecayTimeLfo = decayTimeLfo; 

//   int splitTimeLfo = millis()%150; // linear time  to change " oscillator " each 200 ms

     //  signal[0] = (0*PI + (frameCount / 20) * cos (1000 / 500.0)*-1)%1;  // speed of split 

 int  timeLfo = (int ) map (trigedSignFromAbleton[3], 0, 1, 0, 1000); // linear time  to change " oscillator " each 200 ms
 


 int   splitTime= int  (timeLfo%100);   
  
         oscillatorChange=oscillatorChange%networkSize;
     if (oscillatorChange<=0) {
         oscillatorChange=0;
         }
         decayTimeLfo = splitTime;
    //     print (" oscillatorChange "); println ( oscillatorChange ); 
      
}
