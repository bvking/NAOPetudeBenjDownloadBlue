void addSignalOneAndTwo(){ 
 //---------- come back to trigEventWithAbletonSignal ------- work only with $
     if (measure == 66 && beatPrecised == 4 && beatPrecisedTrigged==true) {      
        keyCode = ALT; keyPressed(); key = 'v'; keyPressed(); // key 
        keyMode = " trigEventWithAbletonSignal ";
        trigEventWithAbletonSignal();
        positionMov = " troisieme " ;
          } 

    text ( " One And Two Original oscillatorChange " + oscillatorChange , 0, height-800);
    text ( " doQ=true " + doQ , 0, height-700);
   // lfoPattern()
     letter = key;   
  
  switch(letter) {
    case 'q': 
    doQ=true;
    doZ=false;
    break;
    case 'Q': 
    doQ=false;
    doZ=false;
    break;
    case 'b': 
    doQ=false;
    break;
    case 'z': // change way of propagation
    doZ=true;
    doQ=true;
    break;
    }
    

//  splitTimeLfo(); 
 // splitTimeLfoWithAbleton(); 
 
  splitTime(); 
  addSignalLfoPattern(); 

  formerKey  = '#';
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
  //  signal[2] = 0.08;
   
      LFO[i] =  map (signal[2], 0, 1, 0, TWO_PI);        
   //    LFO[i] =  map (0.01, 0, 1, 0, TWO_PI);  // CONSTANT

  }
    
  if (oscillatorChanged==true )  { 
     phaseKeptAtChange[oscillatorChange]=LFO[oscillatorChange];    //  RECORD on oscillatorChange the postion of oscillatorChange where it 's changing
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
   //     LFO[oscillatorChange] = phaseKeptAtChange[oscillatorChange];
     //   LFO[j] = phaseKeptAtChange[k]; //pas mal
       if (oscillatorChanged==true )  { 
       LFO[j] = phaseKeptAtChange[oscillatorChange];
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


     for (int i = 0; i <  networkSize-0; i+=1) { // la premiere celle du fond i=2,  la derniere celle du devant i=11
 //   drawBall(i, newPosXaddSignal[i] );
     print (" newPosXaddSignalAFTERDB " + newPosXaddSignal[i]);
   
    positionToMotor[i]= ((int) map (newPosXaddSignal[i], 0, TWO_PI, 0, numberOfStep)%numberOfStep); //
    
    newPosF[i]=positionToMotor[i]%6400;
    //net.phase[i]=newPosF[i];
    net.phase[i]=newPosXaddSignal[i]; // to display to screen
    positionToMotor[i]= positionToMotor[i]%6400;
    
     TrigmodPos[i]=1;
    
    if ( oldPosF[i]>newPosF[i]){
         revLfo[i]++;
         TrigmodPos[i]=0;
     
    }
  /*  
     if ( oldPosF[i]<newPosF[i]){
         revLfo[i]--;
         TrigmodPos[i]=0;
     
    }
*/
     print (" TrigmodPos[i" , TrigmodPos[i] , " newPosF " + newPosF[i]);
     oldPositionToMotor[i]=  positionToMotor[i];
     oldPosF[i]=newPosF[i];
     oldPosX[i]=newPosF[i];

     text (" revoLFO " + revLfo[i], -1600, height-500 - 75*i);
 
     }
     text (" restart ALT Z , cf signal[2] )" + signal[2], -1600, height+800 );  
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

       signal[2] = (0*PI + (frameCount / 42.0) * cos (1000 / 500.0)*-1)%1;  // speed of split 

 int  timeLfo = (int ) map (signal[2], 0, 1, 0, 1000); // linear time  to change " oscillator " each 200 ms
 


 int   splitTime= int  (timeLfo%100);   
  
         oscillatorChange=oscillatorChange%networkSize;
     if (oscillatorChange<=0) {
         oscillatorChange=0;
         }
         decayTimeLfo = splitTime;
    //     print (" oscillatorChange "); println ( oscillatorChange ); 
      
}
