void addSignalOneAndTwo(){
    print (formerKeyMetro);
    text ( " One And Two Original oscillatorChange " + oscillatorChange , 0, height-800);
    text ( " doQ=true " + doQ , 0, height-700);
   // lfoPattern();


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
    signal[2] = (0*PI + (frameCount / 41.0) * cos (1000 / 500.0)*-1);//%1; //NO vitesse roat
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
        LFO[oscillatorChange] = phaseKeptAtChange[oscillatorChange];
     //   LFO[j] = phaseKeptAtChange[k]; //pas mal
       if (oscillatorChanged==true )  { 
       LFO[j] = LFO[oscillatorChange];
      }
      //  LFO[j] = LFO[j]%TWO_PI;
    
       dataMappedForMotor[oscillatorChange]= (int) map (LFO[oscillatorChange], 0, TWO_PI, 0, numberOfStep);
       dataMappedForMotor[j]= (int) map (LFO[j], 0, TWO_PI, 0, numberOfStep);
       dataMappedForMotor[k]= (int) map (LFO[k], 0, TWO_PI, 0, numberOfStep);
       println (" phaseKeptAtChange[oscillatorChange] ", oscillatorChange, " " ,  phaseKeptAtChange[oscillatorChange]);
 
       newPosXaddSignal[oscillatorChange]= map (dataMappedForMotor[oscillatorChange], 0, numberOfStep, 0, TWO_PI);
       newPosXaddSignal[j]= map (dataMappedForMotor[j], 0, numberOfStep, 0, TWO_PI);
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
 
 
 void assignMotorWithPosition() {
  text (" assignMotorWithPositionTo " + keyMode , 500, 1000);
           for (int i = 0; i < networkSize; i++) {
      // rev[i]=rev[0];


      //*******************************  ASSIGN MOTOR WITH POSITION

      if (revLfo[i]!=0  && (positionToMotor[i] >  0) ) { // number of revLfoolution is even and rotation is clock wise   
        DataToDueCircularVirtualPosition[i]= int (map (positionToMotor[i], 0, numberOfStep, 0, numberOfStep))+ (revLfo[i]*numberOfStep);
      }

      if (revLfo[i]!=0  && (positionToMotor[i] <  0)) { // number of revLfoolution is even and rotation is Counter clock wise          // pos[i]= int (map (positionToMotor[i], 0, -numberOfStep, 0,  numberOfStep))+ (revLfo[i]*numberOfStep);
        DataToDueCircularVirtualPosition[i]= int (map (positionToMotor[i], 0, -numberOfStep, numberOfStep, 0)) +(revLfo[i]*numberOfStep);       //   print ("pos "); print (i); print (" ");println (pos[i]);
      }

      if (revLfo[i]==0 && (positionToMotor[i] < 0) ) { //  number of revLfoolution is 0 and rotation is counter clock wise 
        DataToDueCircularVirtualPosition[i]= int (map (positionToMotor[i], 0, -numberOfStep, numberOfStep, 0));        
      }         
      if  (revLfo[i]==0 && (positionToMotor[i] > 0) ) {  //  number of revLfoolution is 0 and rotation is clock wise     
        DataToDueCircularVirtualPosition[i]= int (map (positionToMotor[i], 0, numberOfStep, 0, numberOfStep));                //      print ("pos "); print (i); print (" CW revLfo=0 ");println (pos[i]);
      }
      
      recordLastDataOfMotorPosition[i]=  DataToDueCircularVirtualPosition[i];
    }
  
  }
  
  
  void assignMotorWithDataMapped() {
  
           for (int i = 0; i < networkSize; i++) {
      // rev[i]=rev[0];


      //*******************************  ASSIGN MOTOR WITH POSITION

      if (countFollowSignalLfo[i]!=0  && (dataMappedForMotor[i] >  0) ) { // number of countFollowSignalLfoolution is even and rotation is clock wise   
        DataToDueCircularVirtualPosition[i]= int (map (dataMappedForMotor[i], 0, numberOfStep, 0, numberOfStep))+ (countFollowSignalLfo[i]*numberOfStep);
      }

      if (countFollowSignalLfo[i]!=0  && (dataMappedForMotor[i] <  0)) { // number of countFollowSignalLfoolution is even and rotation is Counter clock wise          // pos[i]= int (map (dataMappedForMotor[i], 0, -numberOfStep, 0,  numberOfStep))+ (countFollowSignalLfo[i]*numberOfStep);
        DataToDueCircularVirtualPosition[i]= int (map (dataMappedForMotor[i], 0, -numberOfStep, numberOfStep, 0)) +(countFollowSignalLfo[i]*numberOfStep);       //   print ("pos "); print (i); print (" ");println (pos[i]);
      }

      if (countFollowSignalLfo[i]==0 && (dataMappedForMotor[i] < 0) ) { //  number of countFollowSignalLfoolution is 0 and rotation is counter clock wise 
        DataToDueCircularVirtualPosition[i]= int (map (dataMappedForMotor[i], 0, -numberOfStep, numberOfStep, 0));        
      }         
      if  (countFollowSignalLfo[i]==0 && (dataMappedForMotor[i] > 0) ) {  //  number of countFollowSignalLfoolution is 0 and rotation is clock wise     
        DataToDueCircularVirtualPosition[i]= int (map (positionToMotor[i], 0, numberOfStep, 0, numberOfStep));                //      print ("pos "); print (i); print (" CW countFollowSignalLfo=0 ");println (pos[i]);
      }
      
      recordLastDataOfMotorPosition[i]=  DataToDueCircularVirtualPosition[i];
    }
  
  }
 
 
 
 
void  splitTimeLfo() {  // signalToSplit = lfoPhase3
 
   if (doZ==false){ 
  if (formerDecayTimeLfo>decayTimeLfo){
 // frameCountBis=frameCountBis+1;
  
    oscillatorChange=oscillatorChange+1;

     }    
 // key='a';
  } 
   if (doZ==true){
  if (formerDecayTimeLfo>decayTimeLfo){
    oldMemoryi=memoryi;
    memoryi=(memoryi-1);
      oscillatorChange=oscillatorChange-1;
    } 
   } 
  
  if ( oldOscillatorChange!=oscillatorChange )
  {
       oscillatorChanged=true;
  } 
  
  formerDecayTimeLfo = decayTimeLfo;
  
    lfoPhase[3] = map ((((cos  (frameCount / 300.0))*-1) %2), -1, 1, -TWO_PI, TWO_PI);  // sinusoida
 
    signalToSplit= lfoPhase[3];
  
 // decayTime = millis()%500;// incremente frameCountBis+1 each 100 millisecondes  
  if (oldSignalToSplit> signalToSplit ) {
  timeLfo= map (signalToSplit, TWO_PI, -TWO_PI, 0, 1000);  // 0 to  
    }
  else if (oldSignalToSplit< signalToSplit ) {  
  timeLfo= map (signalToSplit, -TWO_PI, TWO_PI, 0, 1000);  // 0 to
   }
   
   
    
   oldSignalToSplit=signalToSplit;
   
//   timeLfo= map (signal[11], 0, 1, 0, 1000);
   
   int splitTimeLfo= int  (timeLfo%100);
   
   
   //  println ( " oldlfoPhase[3] " + oldLfoPhase[3] + " lfoPhase[2] " + lfoPhase[3] );
  println ( " oldSignalToSplit " + oldSignalToSplit + " signalToSplit " + signalToSplit );
  
  

      print (" timeLfo "); print ( timeLfo );   print (" splittimeLfo "); println ( splitTimeLfo );  

      if (doZ==false){   
         oscillatorChange=oscillatorChange%networkSize;
     if (oscillatorChange<=0) {
         oscillatorChange=0;
         }
       }
       
       
     if (doZ==true) {   
     if (oscillatorChange<=0) {
        memoryi=networkSize-1;
        oldMemoryi=0;
        oscillatorChange=networkSize-1;
         }
       } 
         
     
         decayTimeLfo = splitTimeLfo;
         print (" oscillatorChange "); println ( oscillatorChange ); 
        
         
}
 
 void  splitTimeLfoWithAbleton() { 
 
    
  if (formerDecayTimeLfo>decayTimeLfo+10){
 // frameCountBis=frameCountBis+1;
    oscillatorChange=oscillatorChange+1;

        
 // key='a';
  } 
  
  if ( oldOscillatorChange!=oscillatorChange )
  {
       oscillatorChanged=true;
  } 
  
  formerDecayTimeLfo = decayTimeLfo;
 // decayTime = millis()%500;// incremente frameCountBis+1 each 100 millisecondes  
 /*
  if (oldSignalToSplit> signalToSplit ) {
//  timeLfo= map (signalToSplit, TWO_PI, -TWO_PI, 0, 1000);  // 0 to  
    timeLfo= map (signalToSplit, 0, 100, 0, 1000);  // 0 to  
    }
  else if (oldSignalToSplit< signalToSplit ) {  
//  timeLfo= map (signalToSplit, -TWO_PI, TWO_PI, 0, 1000);  // 0 to
  timeLfo= map (signalToSplit, 100, 0, 0, 1000);  // 0 to  
  
   }
 */  
   
  //  println ( " oldlfoPhase[3] " + oldLfoPhase[3] + " lfoPhase[2] " + lfoPhase[3] );
//  print ( " oldSignalToSplit " + oldSignalToSplit + " signalToSplit " + signalToSplit );

  
  
  
   oldSignalToSplit=signalToSplit;

//_____   signalToSplit= map (automationAbleton[8], 0, 1, 0, 127);
   
//   if ( formerKeyMetro == '>' )  {
     
       if (oldSignalToSplit> signalToSplit ) { println (" SIGNAL DESCEND " );
   timeLfo= map (signalToSplit, TWO_PI, -TWO_PI, 0, 1000);  // 0 to  
 //_____   timeLfo= map (signalToSplit, 0, 127, 1000, 0);  // 0 to  
    }
    
    else   println (" SIGNAL MONTE " ); timeLfo= map (signalToSplit, 127, 0, 0, 1000);   
   
   
//  timeLfo= map (signalToSplit, 0, 100, 0, 1000); 

  //  timeLfo=   timeLfo;
  
  print (" timeLfo "); print ( timeLfo );   println (" splittimeLfo ");// println ( splitTimeLfo );  

  print (" timeLfo "); print ( timeLfo );   println (" splittimeLfo ");// println ( splitTimeLfo );  

  print (" timeLfo "); print ( timeLfo );   println (" splittimeLfo ");// println ( splitTimeLfo );  

  
//  int splitTimeLfo= (int) timeLfo; //  (timeLfo%100
 if (signalToSplit>15){
   // timeLfo= map (signalToSplit, 0, 100, 0, 1000);  // 0 to 
    
  print (" TIMELfo "); print ( timeLfo );   println (" splittimeLfo ");// println ( splitTimeLfo );  

 }
// int splitTimeLfo= int (timeLfo);
  
  
 //** float timeLfo= millis();  // 0 to
 //**  int splitTimeLfo= frameCountBis;
 
   //    print (" oldLfoPhase[2] "); print ( oldLfoPhase[2] ); print (" lfoPhase[2] "); print ( lfoPhase[2] );

       
         oscillatorChange=oscillatorChange%12;
     if (oscillatorChange<=0) {
         oscillatorChange=2;
         }
      //   decayTimeLfo = splitTimeLfo;
       decayTimeLfo = (int) timeLfo;
         print (" oscillatorChange "); println ( oscillatorChange ); 
        
         
}
 
