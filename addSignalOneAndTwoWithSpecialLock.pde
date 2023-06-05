void addSignalOneAndTwoLock(){ 
 //---------- come back to trigEventWithAbletonSignal ------- work only with $
     if (measure == 66 && beatPrecised == 4 && beatPrecisedTrigged==true) {      
        keyCode = ALT; keyPressed(); key = 'v'; keyPressed(); // key 
        keyMode = " trigEventWithAbletonSignal ";
        trigEventWithAbletonSignal();
        positionMov = " troisieme " ;
          } 

   text ( " One And Two Original oscillatorChange " + oscillatorChange , 0, -height-800);
   text ( " special Lock doQ=true " + doQ , 0, -height-900);
   text ( " trigedSignFrom" + trigedSignFromAbleton[3] , 0, -height-1000);
   text (" lock " + dol + " oWay " + doo + " doC " + doC , 0, -height- 1100 );
   text (" doZ " + doZ + " BlargerPhase " + doB , 0, -height -1200 );
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
   
    break;


    case 'Q': // way of propagation
    doQ=false;
   
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
   
    break;
     case 'z': // change way of propagation
    doZ=false;
 
    break;
    case '#': // change way of propagation
    
    break;
    }

 // splitTime();

  splitTimeWithTrigSignalFromAudioAbleton(trigedSignFromAbleton[0]);
  addSignalLfoPattern(); 
  mapNewPosX(); // counter actived

  
 }
 
 void addSignalLfoPattern()  {

   if (formerFormerKey  == '#' ) { //  != '#'
 
    int i;
    i= oscillatorChange;

 
 //********POURQUOI DIFFERENT AU DEMARRAGE DE lA FONCTION
  //  signal[2] = (0*PI + (frameCount / 41.0) * cos (1000 / 500.0)*-1);//%1; //NO vitesse roat
  // signal[2] = 0.08; 
 //   LFO[i] =  map (signal[2], 0, 1, 0, TWO_PI);        
  //    LFO[i] =  map (0.01, 0, 1, 0, TWO_PI);  // CONSTANT

  }

  
    
  if (oscillatorChanged==true && doo)  { 

      float phaseAmount=trigedSignFromAbleton[1];
      phaseAmount= map (phaseAmount, 0, 1, 0, 1);     
      phaseAmount = map (phaseAmount, 0, 1, 0, TWO_PI/networkSize);
      text ( "phaseAmount " + phaseAmount, 500, 1000);

      LFO[oscillatorChange] = LFO[oldOscillatorChange]; //     
      LFO[oscillatorChange] -=  (phaseAmount/(1*networkSize-1));
      text ( "  LFO[oscillatorChange] " +   LFO[oscillatorChange], 500, 1100);

     phaseKeptAtChange[oscillatorChange]=LFO[oscillatorChange];  
   }

     if (!oscillatorChanged && !doo)  { 
     float phaseAmount=trigedSignFromAbleton[1];
      phaseAmount= map (phaseAmount, 0, 1, 0, 1);     
      phaseAmount = map (phaseAmount, 0, 1, 0, TWO_PI/networkSize);
      text ( "phaseAmount " + phaseAmount, 500, 1000);

      LFO[oscillatorChange] = LFO[oldOscillatorChange]; //  //  RECORD on oscillatorChange the postion of oscillatorChange where it 's changing    
      LFO[oscillatorChange] +=  (phaseAmount/(1*networkSize-1));
      text ( "  LFO[oscillatorChange] " +   LFO[oscillatorChange], 500, 1100);
 
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

     

      // MAP depends of the way of rotation


      if (LFO[oscillatorChange] <0){
      dataMappedForMotorisedPosition[oscillatorChange]= int (map (LFO[oscillatorChange], 0, -TWO_PI, numberOfStep, 0)); 
      phaseMapped[oscillatorChange]= map (dataMappedForMotorisedPosition[oscillatorChange], numberOfStep, 0, 0, -TWO_PI); 
      newPosXaddSignal[oscillatorChange]=phaseMapped[oscillatorChange]; 
       }
       
      else {
    
      dataMappedForMotorisedPosition[oscillatorChange]= (int) map (LFO[oscillatorChange], 0, TWO_PI, 0, numberOfStep); 
      phaseMapped[oscillatorChange]= map (dataMappedForMotorisedPosition[oscillatorChange], 0, numberOfStep, 0, TWO_PI);
      newPosXaddSignal[oscillatorChange]=phaseMapped[oscillatorChange]; 

       }

         // newPosXaddSignal[j]= map (dataMappedForMotorisedPosition[j], 0, numberOfStep, 0, TWO_PI);
  // newPosXaddSignal[k]= map (dataMappedForMotorisedPosition[k], 0, numberOfStep, 0, TWO_PI);

  
  // END MAP depends of the way of rotation



       

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
 


 //int   splitTime= int  (timeLfo%100); 

   int   splitTime=  timeLfo;   
  
         oscillatorChange=oscillatorChange%networkSize;
     if (oscillatorChange<=0) {
         oscillatorChange=0;
         }
         decayTimeLfo = splitTime;
    //     print (" oscillatorChange "); println ( oscillatorChange ); 
      
}
