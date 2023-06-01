void lockOscillatorToPositionFromPreviousProagedBallTest() { 
  int i;
  i= oscillatorChange;

  int j;  
  j= (oscillatorChange-1);
  if (j<= -1){
  j= networkSize-1;
  }


  text ( " > phaseKeptAtChange[j] " + j + " " +  phaseKeptAtChange[j], -200, 200);
  text ( " > phaseKeptAtChange[i] " + i + " " +  phaseKeptAtChange[i], -200, 300);

  if (propagationTrigged==true ) { //  works always ?  formerFormerKey  == '#'
//   oscillatorChanged=true;
    


  int h;
  h= oscillatorChange+1;
  h%=networkSize;
  

  
  int k;  
  k= (j-1);
  if (k<= -1){
  k= networkSize-1;
  }
  
  int l;  
  l= (k-1);
  if (l<= -1){
  l= networkSize-1;
  }
  
  int m;  
  m= (l-1);
  if (m<= -1){
  m= networkSize-1;
  }
      
 // if (oscillatorChanged==true )  {  // just one frame to change
    if (propagationTrigged==true )  { 
    
  //  if (  LFO[i]<0){  
   if ( newPosXaddSignal[i]%TWO_PI<0){ 

       phaseKeptAtChange[j]=phaseKeptAtChange[i];
       phaseKeptAtChange[i]=newPosXaddSignal[i]%TWO_PI;
      

    phaseKeptAtChange[j]=newPosXaddSignal[j]%TWO_PI;  // the position of the actual changing ball is at the position of the prevous propaged ball
    dataMappedForMotor[j]= int (map ( phaseKeptAtChange[j], 0, -TWO_PI, numberOfStep, 0)); 
    
              println (" < phaseKeptAtChange[oscillatorChange]  i ", i , " " , oscillatorChange, " " ,  phaseKeptAtChange[oscillatorChange]);


       netPhaseBase[j]= map (dataMappedForMotor[j], numberOfStep, 0, 0, -TWO_PI);

   
  }
       
   else
       phaseKeptAtChange[j]=phaseKeptAtChange[i];
       phaseKeptAtChange[i]=newPosXaddSignal[i]%TWO_PI;
                       

       //       text (" > phaseKeptAtChange[j] " + j + " " +  phaseKeptAtChange[j], 200, 200);
       //       text (" > phaseKeptAtChange[i] " + i + " " +  oscillatorChange + " " +  phaseKeptAtChange[i], 200, 300);

     //  LFO[j] = LFO[j]%TWO_PI;
       dataMappedForMotor[j]= (int) map (phaseKeptAtChange[j], 0, TWO_PI, 0, numberOfStep);

       netPhaseBase[j]= map (dataMappedForMotor[j], 0, numberOfStep, 0, TWO_PI);
 
  
   }
    
 //   phaseMappedFollow[i]=netPhaseBase[i];    //  RECORD on oscillatorChange-1 the postion of oscillatorChange where it has just changed   //  phaseMappedFollow[oscillatorChange]= phaseKeptAtChange[oscillatorChange]; 



/*
         for (int p = 0; i < networkSize-0; i+=1) { 
   // phaseMappedFollow[i]= net.phase[i];// add offset given by pendularPattern   
  //  phaseMappedFollow[i] = netPhaseBase[i];
    phaseMappedFollow[p]= phaseMappedFollow[p]%TWO_PI;  
    }

       LFO[l] = LFO[l]%TWO_PI;
       dataMappedForMotor[l]= (int) map (LFO[l], 0, TWO_PI, 0, numberOfStep);
            
       netPhaseBase[l]= map (dataMappedForMotor[l], 0, numberOfStep, 0, TWO_PI);
 


       LFO[k] = LFO[k]%TWO_PI;
       dataMappedForMotor[k]= (int) map (LFO[k], 0, TWO_PI, 0, numberOfStep);
 
      
       netPhaseBase[k]= map (dataMappedForMotor[k], 0, numberOfStep, 0, TWO_PI);
  */
  //netPhaseBase[k] = netPhaseBase[k]-QUARTER_PI*0; // %TWO_PI;
  //     netPhaseBase[k] %=TWO_PI;

  //     netPhaseBase[j] = netPhaseBase[j]-QUARTER_PI*0; // %TWO_PI;
  //     netPhaseBase[j] %=TWO_PI;
       
   //    dataMappedForMotor[j]= (int) map (netPhaseBase[j], 0, TWO_PI, 0, numberOfStep);
  //     println (" phaseKeptAtChange[oscillatorChange] ", oscillatorChange, " " ,  phaseKeptAtChange[oscillatorChange]);
  //     netPhaseBase[j]= map (dataMappedForMotor[j], 0, numberOfStep, 0, TWO_PI);

  //   oscillatorChanged=false;
 
   
       println ("  phaseKeptAtChange[oscillatorChange] ", oscillatorChange, " " ,  phaseKeptAtChange[oscillatorChange]);
       println ("  phaseKeptAtChange[oldOscillatorChange] ", oldOscillatorChange, " " ,  phaseKeptAtChange[oldOscillatorChange]);
     }
   
}  