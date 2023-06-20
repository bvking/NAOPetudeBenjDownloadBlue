
void phasePatternBase() { // trigged with $ or *
  //************************************ DONT TOUCH
   textSize (150);
    if (key == 'i' || key == 'm' ) {
       text ("  phasePatternBase " + key + " "  + deltaOldPhaseActualPhase[networkSize-1]  , width/2 , height/2);
       println  (" phasePatternBase " + " key " + key);
      }
     
 if  ( keyMode == " propagationBallRotationExp " || keyMode == " trigEventWithAbletonSignalExp " || keyMode == " trigEventWithAbletonSignal " ) {


     for (int i = 0; i < (networkSize); i++) {       
            OldFrequency[i]=  net.naturalFrequency[i];  //************************************ SET LAST FREQUENCIES as OLD FREQUENCIES
      }
   
     if (key == 'W') { // follow mode. What is w?  (formerKey=='w')
        formerW();
        key ='#';
      }
 
                                                                                                                                                                                                                                                                                                                                                                                                                               

  //********** ********** ********** ********** ********** ********** ********** INCREASE FREQUENCIES in $ mode PENDULAR PATTERN
   

  if (key=='t') {  
    print ("EXPERIMENTAL t$");

    float delaPhase    = map ((float (mouseY)/width*1), 0, 1, 0, QUARTER_PI );                
    for (int i = 0; i < (networkSize-0); i++) {          
      {
        netPhaseBase[i]= averagePhase;  
        //    netPhaseBase[i]= netPhaseBase[i]%PI/2; 
        netPhaseBase[i]= netPhaseBase[i]%TWO_PI;
      } 
      printSummary(i);
    }
  }
             println (" motorBase "+  dataMappedForMotorisedPosition[networkSize-1] + " " + (networkSize-1) + " "  +  oldDataMappedForMotorisedPosition[networkSize-1] , 0, -400 );
             println (" motorBase "+  dataMappedForMotorisedPosition[networkSize-1] + " " + (networkSize-1) + " "  +  oldDataMappedForMotorisedPosition[networkSize-1] , 0, -400 );
             println (" motorBase "+  dataMappedForMotorisedPosition[networkSize-1] + " " + (networkSize-1) + " "  +  oldDataMappedForMotorisedPosition[networkSize-1] , 0, -400 );


   if (key == 'i') {
           println (" iiiiiiiiiiiii Trigged ? ");  println (" iiiiiiiiiiiii Trigged ? ");
           println (" iiiiiiiiiiiii Trigged ? ");
           println (" iiiiiiiiiiiii Trigged ? ");
              
    /*
      if (memoryi>=0) {
           oldMemoryi=memoryi;
            memoryi=(memoryi-1);
       }
      
       if ( memoryi<=-1) {
          memoryi=networkSize-1;
          oldMemoryi=0;
           println (" your herreeeeeee iiiiiiiiiiiii ");
           text (" your herreeeeeee iiiiiiiiiiiii ", 200, 200);
       }
    */    
        
                
                  deltaOldPhaseActualPhase[0]=abs ( dataMappedForMotorisedPosition[networkSize-1]-oldDataMappedForMotorisedPosition[0]);
                  positionFromShiftedOscillator[0]=(int) deltaOldPhaseActualPhase[0];
                for (int i = 1; i < (networkSize-0); i++) {  
	                deltaOldPhaseActualPhase[i] =abs ( dataMappedForMotorisedPosition[i-1]-oldDataMappedForMotorisedPosition[i]);
                  print ( " netOldPhaseBase[i] "  + netOldPhaseBase[i]); 
                    //   netPhaseBase[i-1]= netOldPhaseBase[i] ;//+ deltaOldPhaseActualPhase[i];
                     //   dataMappedForMotorisedPosition[i] = (int)  deltaOldPhaseActualPhase[i];
                  positionFromShiftedOscillator[i] = (int)  deltaOldPhaseActualPhase[i];
                  println ( "  deltaOldPhaseActualPhase[i] "  +  deltaOldPhaseActualPhase[i]); 
                  net.naturalFrequency[i-1]= net.naturalFrequency[i];      
                }
      
    }     


  if (key == '%') {  // formerkeyi
           println (" iiiiiiiiiiiii Trigged ? ");  println (" iiiiiiiiiiiii Trigged ? ");
           println (" iiiiiiiiiiiii Trigged ? ");
           println (" iiiiiiiiiiiii Trigged ? ");
      if (memoryi>=0) {
           oldMemoryi=memoryi;
            memoryi=(memoryi-1);
    }
      
    if ( memoryi<=-1) {
          memoryi=networkSize-1;
          oldMemoryi=0;
           println (" your herreeeeeee iiiiiiiiiiiii ");
           text (" your herreeeeeee iiiiiiiiiiiii ", 200, 200);
    }
         textSize(250);
        for (int i = 0; i < (networkSize-0); i++) {   
   //   lastPositionFromCircularMode[i]= dataMappedForMotorisedPosition[i];
    //  netOldPhaseBase[i]=lastPositionFromCircularMode[i];
   
    //   netOldPhaseBase[i]=netPhaseBase[i];
   //    netPhaseBase[i]= 800* (i+1);
   //    net.oldPhase[i]=net.phase[i];
   //    net.phase[i]= TWO_PI/16* (i+1);
   //   netPhaseBase[i]=dataMappedForMotorisedPosition[i];

         text (" netOld " + netOldPhaseBase[i] + " netPhaseBase[i] " + netPhaseBase[i] , 200, 200+100*i);
         println ( " netOldPhaseBase[i] "  + netOldPhaseBase[i] + " netPhaseBase[i] " + netPhaseBase[i] ); 
   }
       net.phase[networkSize-1]=net.oldPhase[0];


       for (int i = 1; i < (networkSize-0); i++) {  
    //  netPhaseBase[i-1]= netOldPhaseBase[i]
    //    netOldPhaseBase[i]= dataMappedForMotorisedPosition[i];
       net.phase[i-1]=net.oldPhase[i];
       text (" netOld ", netOldPhaseBase[i], 200, 200+100*i);
       println ( " netOldPhaseBase[i] "  + netOldPhaseBase[i]); 
     }
     //  netOldPhaseBase[networkSize-1]=  lastPositionFromCircularMode[0];
	   //  netOldPhaseBase[networkSize-1]=  netOldPhaseBase[networkSize-1];
   
  
                  netPhaseBase[networkSize-1]=  netOldPhaseBase[0];
                  deltaOldPhaseActualPhase[0]= netPhaseBase[networkSize-1]+netOldPhaseBase[0];
                 for (int i = 1; i < (networkSize-0); i++) {  
	                deltaOldPhaseActualPhase[i] = netPhaseBase[i-1]+netOldPhaseBase[i];
                  print ( " netOldPhaseBase[i] "  + netOldPhaseBase[i]); 
                  netPhaseBase[i-1]= netOldPhaseBase[i] ;//+ deltaOldPhaseActualPhase[i];
                  dataMappedForMotorisedPosition[i] = (int)  deltaOldPhaseActualPhase[i];
                  println ( "  deltaOldPhaseActualPhase[i] "  +  deltaOldPhaseActualPhase[i]); 
                  net.naturalFrequency[i-1]= net.naturalFrequency[i];      
        
  
                  }
        

                  
                 //  net.naturalFrequency[networkSize-1]= OldFrequency[0];
       
  }

    if (key == 'u'  ) { 

              deltaOldPhaseActualPhase[0]=abs ( dataMappedForMotorisedPosition[networkSize-1]-oldDataMappedForMotorisedPosition[0]);
                  positionFromShiftedOscillator[0]=(int) deltaOldPhaseActualPhase[0];
                for (int i = 1; i < (networkSize-0); i++) {  
	                deltaOldPhaseActualPhase[i] =abs ( dataMappedForMotorisedPosition[i-1]-oldDataMappedForMotorisedPosition[i]);
                  print ( " netOldPhaseBase[i] "  + netOldPhaseBase[i]); 
                    //   netPhaseBase[i-1]= netOldPhaseBase[i] ;//+ deltaOldPhaseActualPhase[i];
                     //   dataMappedForMotorisedPosition[i] = (int)  deltaOldPhaseActualPhase[i];
                  positionFromShiftedOscillator[i] = (int)  deltaOldPhaseActualPhase[i];
                  println ( "  deltaOldPhaseActualPhase[i] "  +  deltaOldPhaseActualPhase[i]); 
                  net.naturalFrequency[i-1]= net.naturalFrequency[i];  

           }

  /*
  if (key == 'u'  ) { 
    println ("U$=85  Shift frequencies <- one by one by keeping last position switched"); // && circularMov == false
    oldMemoryi=memoryi;
    memoryi=(memoryi+1)%networkSize;

    if ( memoryi<=0) {
      memoryi=0;
    }

    for (int i = 1; i < (networkSize-1); i++) {
      netPhaseBase[i+1]= netOldPhaseBase[i];// netOldPhaseBase[i] keep phase at 0
      net.naturalFrequency[i+1]= OldFrequency[i];
      netPhaseBase[i]= netOldPhaseBase[i-1];// // useless
      net.naturalFrequency[i]= OldFrequency[i-1]; // useless

      printSummary(i);
    }
    netPhaseBase[0]=  netOldPhaseBase[networkSize-1];
    net.naturalFrequency[0]= OldFrequency[networkSize-1];
    netPhaseBase[networkSize-1]=  netOldPhaseBase[networkSize-1-1]; // useless
    net.naturalFrequency[networkSize-1]= OldFrequency[networkSize-1-1];// // useless
  } 
*/

  if (key == 'U' && formerKeyMetro == '<') { 

    println ("U$<  add phase from the previous oscillator"); // && circularMov == false
    print (" U$< oldActualVirtualPosition2 ");
    println (oldActualVirtualPosition[2]);
    print (" U$< ActualVirtualPosition2 ");
    println (ActualVirtualPosition[2]);

    print (" U$< oldVirtualPosition2 ");
    println (oldVirtualPosition[2]);
    print (" U$< virtualPosition[2] ");
    println (VirtualPosition[2]);

    oldMemoryi=memoryi;
    memoryi=(memoryi+1)%networkSize;

    if ( memoryi<=0) {
      memoryi=0;
    }
    for (int i = 0; i < (networkSize-1); i++) {

      netPhaseBase[i]=  netOldPhaseBase[i+1];
      net.naturalFrequency[i+1]= net.naturalFrequency[i];
      //**   net.naturalFrequency[2]= OldFrequency[networkSize-1];
      //  VirtualPosition[i]=VirtualPosition[i+1];
      ActualVirtualPosition[i]=VirtualPosition[i];
      // ActualVirtualPosition[i+1]= ActualVirtualPosition[i+1]+1600;
      //  

      printSummary(i);
    }

    //   ActualVirtualPosition[2]= ActualVirtualPosition[networkSize-1];
    //   net.naturalFrequency[2]= net.naturalFrequency[networkSize-1];

    netPhaseBase[0]=  netOldPhaseBase[networkSize-1];
    net.naturalFrequency[0]= OldFrequency[networkSize-1];
    //  VirtualPosition[2]=VirtualPosition[networkSize-1];
    ActualVirtualPosition[0]=VirtualPosition[0];
    // netPhaseBase[networkSize-1]=  netOldPhaseBase[networkSize-1-1]; // useless

    // net.naturalFrequency[networkSize-1]= OldFrequency[networkSize-1-1];// // useless
  } 

  if (key == 'J') { 
    println ("J$  Shift frequencies -> one by one by keeping last position switched and divide /2");// based on i
    for (int i = 0; i < (networkSize-0); i++) {    

      netPhaseBase[i]+= QUARTER_PI/(10);
      printSummary(i);
    }
  }  

  if (key =='K') { //K$ invisible
    println ("I$ Shift frequencies -> one by one by keeping last position switched and divide /2");// based on i
    for (int i = 0; i < (networkSize-0); i++) {    

      //     netPhaseBase[i]-= QUARTER_PI/(10);
          netPhaseBase[i]-=HALF_PI;
       // netPhaseBase[i]=netPhaseBase[i]-QUARTER_PI;
     // ActualVirtualPosition[i]+=0;  

      /*
        ActualVirtualPosition[i]=ActualVirtualPosition[i]+numberOfStep/3*i;
       ActualVirtualPosition[i]=ActualVirtualPosition[i]%numberOfStep;
       ActualVirtualPosition[i]+=ActualVirtualPosition[i];
       
       //*****
       
       ActualVirtualPosition[i]=ActualVirtualPosition[i]+numberOfStep/3*i;// less conventional than numberOfStep/6*i
       ActualVirtualPosition[i]+=ActualVirtualPosition[i]%numberOfStep;
       ActualVirtualPosition[i]=ActualVirtualPosition[i]%numberOfStep*5;
       */

      ActualVirtualPosition[i]=ActualVirtualPosition[i]+numberOfStep/8;

      printSummary(i);
    }
  } 


  if (key == 'L') { 
    println ("L$  Shift frequencies -> one by one by keeping last position switched and divide /2");// based on i
    for (int i = 0; i < (networkSize-0); i++) {    
      //   netPhaseBase[i]+= PI/(20+i);
      //    netPhaseBase[i]+= PI/(i+1)/10; // good
      //  automatiseWithNote();
      printSummary(i);
    }
  }    



  if (key =='l') { 
                        println ("l$  Shift frequencies <- one by one by keeping last position switched and multipied *2"); // based on u || key == 'L'

    // autoNote1();
    for (int i = 0; i < (networkSize-0); i++) { 
       deltaOldPhaseActualPhase[i]+=100*i;
       netOldPhaseBase[i]=netPhaseBase[i];
       netPhaseBase[i]+=1500+100*i;

      //   netPhaseBase[i]+= PI/(20+(networkSize-1-i));
      //   netPhaseBase[i]+= PI/(networkSize-0-i)/10; // good
      //   automatiseWithNote();
    }
  }     

  if (key == 'c') { 
    println ("c$  Shift frequencies <- one by one by keeping last position switched and multipied *2"); // based on i$ || key == 'L'
    // net.shiftFrequencies(1);  net.shiftPhases(-1);
    formerKey = 'c';
  }
 
  if (key == 'X') { //trigx
    println (" Shift phase and frequencies  as a upstairx, based on x RECORD interphase when x Keyreleased"); // based on i$ || key == 'L'
    //   interPhase[memoryi]= metroPhase[memoryi];
    interPhase[memoryi]= netPhaseBase[memoryi];

    interPhaseCircular[memoryi]= netPhaseBase[memoryi];
    interFrequency[memoryi]= net.naturalFrequency[memoryi]; 
    formerKey='X'; // to trig directly, before the next frame
  } 
  if (key == 'x') { //trigx
    println (" Shift phase and frequencies  as a DOWNSTAIRx, based on w RECORD interphase when w Keyreleased"); // based on i$ || key == 'L'
    //   interPhase[memoryi]= metroPhase[memoryi];
    interPhase[memoryi]= netPhaseBase[memoryi];

    interPhaseCircular[memoryi]= netPhaseBase[memoryi];
    interFrequency[memoryi]= net.naturalFrequency[memoryi]; 
    formerKey='x'; // to trig directly, before the next frame
  } 
  if (key == 'W') { //trigW
    println (" Shift phase and frequencies  as a upstairW, based on x RECORD interphase when x Keyreleased"); // based on i$ || key == 'L'
    //   interPhase[memoryi]= metroPhase[memoryi];
    interPhase[memoryi]=  (netPhaseBase[memoryi]);

    interPhaseCircular[memoryi]=  (netPhaseBase[memoryi]);
    interFrequency[memoryi]= net.naturalFrequency[memoryi]; 
    formerKey='W'; // to trig directly, before the next frame
  } 
  if (key == 'w' ) { //trigw   || key== 'O'
    println (" Shift phase and frequencies  as a DOWNSTAIRw, based on w RECORD interphase when w Keyreleased"); // based on i$ || key == 'L'
    //   interPhase[memoryi]= metroPhase[memoryi];
    interPhase[memoryi]=  (netPhaseBase[memoryi]);

    interPhaseCircular[memoryi]= abs (netPhaseBase[memoryi]);
    interFrequency[memoryi]= net.naturalFrequency[memoryi]; 
    formerKey='w'; // to trig directly, before the next frame
  } 


  if (key == 'v') { //TRIGGERV
    println ("v$  Shift OSCILLATOR WHEN POSITION MATCH   "); // based on i$ || key == 'L'
    formerKey='v';
    ///    formerKeyv();
  } 

  if (key == 'V'  ) { //&& keyCode== SHIFT
    println ("V$  Shift frequencies <- Two by one by keeping last position switched and multipied *2"); // based on i$ ||
    formerKey = 'V';
    //    formerKeyv();
  }

  /*
    if (key == 'x') { 
   println ("x$  FOLLOW OSCILLATOR 11"); // based on  ||
   //if ( formerKey == 'l') { println ("L$  Shift frequencies <- one by one by keeping last position switched and multipied *2"); // based on u || key == 'L'
   formerKey = 'x';
   //    formerKeyL();
   } 
   */

  if (key == 'i') { 
    println ("= phaseBase c$+I$  Shift frequencies -> one by one by keeping last position switched");
   // formerKey = 'i';
  }  

  //**************************************************PLAY WITH PHASES

  if (key == 'k') { //  Shift frequencies one by one.  //  2 to 11,  3 to 10, 4 to 9.....11 to 2 

    println (" MIROR ? k$ Shift phase one by one 9 <-- 0. ");

    for (int i = (networkSize-1); i > 1; i--) {

      print (i); 
      println ( (networkSize-1)-i);

      netPhaseBase[i]=netOldPhaseBase[(networkSize+1)-i];
      net.naturalFrequency[i]=OldFrequency[(networkSize+1)-i];
    }   

    netPhaseBase[0]=netOldPhaseBase[(networkSize-1)];
     net.naturalFrequency[0]=OldFrequency[(networkSize-1)];
    
  }

    if (key == 'A') { //A$  Shift frequencies one by one. 
    float speeed    = map ((float (mouseY)/width*1.0), 0, 1, -4.34, 4.34); 
    for (int i = 0; i < networkSize; i++) {
      net.naturalFrequency[i]=OldFrequency[i]; 
      printSummary(i);
    }
    memoryi=0;
    net.naturalFrequency[memoryi]= speeed;//4.68/2; // 124 bpm
  }

  if (key == 'a') { //A$  Shift frequencies one by one. 
    float speeed    = map ((float (mouseY)/width*1.0), 0, 1, -4.34, 4.34); 
    for (int i = 0; i < networkSize; i++) {    
      net.naturalFrequency[i]=OldFrequency[i]; 
      printSummary(i);
    }
    memoryi=0;
    net.naturalFrequency[0]= speeed;//4.68/2; // 124 bpm  4=108 bpm

  }


  
 
  if (key == 'e') { 
    println ("Incremente positions  12/3 hit");  //e$
    for (int i = 0; i < networkSize; i++) {    
      //    netPhaseBase[i] -= (QUARTER_PI/(networkSize-0))*(i+1); // TRES BIEN

      netPhaseBase[i] = netPhaseBase[i] + ((TWO_PI/(networkSize/1))*(i+1)); // TRES BIEN  ==     netPhaseBase[i] += (i+1)*TWO_PI/4; //4hit  ==   netPhaseBase[i] +=  (i+1)*3.5*PI; 
    //  netPhaseBase[i] = netPhaseBase[i] % TWO_PI; // TRES BIEN

      printSummary(i);
      key ='#'; keyReleased();
    }
  }  



  if (key == 'E') {   
    print ("Add 2PI/3: PENDULAR $ 3 HIT TO COME BACK" );  print (" Add 2PI/3: PENDULAR $ 3 HIT TO COME BACK" ); //e$
    print ("FormerkeyMetro"); 
    print (char(formerKeyMetro));
    print ("keyNow"); 
    println (char(key));
    for (int i = 0; i < networkSize; i++) {
      //  netOldPhaseBase[i] += (i+1)*4%TWO_PI; 
      //   netPhaseBase[i] +=  (i+1)*3*PI;  // one on two move an offset of PI
      
     // netPhaseBase[i] += (i+1)*TWO_PI/3; //3hit  <=>   netPhaseBase[i] += (i+1)*TWO_PI/1.5; 
     
        netPhaseBase[i] = netPhaseBase[i] + (i+1)*TWO_PI/3; //3hit  <=>   netPhaseBase[i] += (i+1)*TWO_PI/1.5; 
     

    //  netPhaseBase[i]=  netPhaseBase[i]%TWO_PI;
        key ='#';// keyReleased();
    }
  }



  /*
     if (key == 'w')  {   println ("Add PI/3 : 12HIT : Clock Wise"); //w$
   
   for (int i = 0; i < networkSize; i++) {
   
   netPhaseBase[networkSize-1-i] -= (i*TWO_PI/10)%PI/3;    //PAS TOUCHER 
   netPhaseBase[i]=  netPhaseBase[i]%TWO_PI;
   }     
   }
   */
  if (key == 'r') {
    println ("Soubstract PI/6 PENDULAR $"); // R$ +1.5*HALF_PI; 


    for (int i = 0; i < networkSize; i++) {
      //   netPhaseBase[i] += (i+1) *(TWO_PI/12); // 12 hit


      //    netPhaseBase[i] +=  -(i+2)%PI/6; // mieux
    
      netPhaseBase[i] += (i*TWO_PI/5)%PI/10; // 

      //    netPhaseBase[i] -=  +(i+1)%PI/6; 

     // netPhaseBase[i]=  netPhaseBase[i]%(TWO_PI/1) ; // bien en pendulaire?
 
      printSummary(i);
    }
  }


  if (key == 'R') {
    println ("Add PI/6 PENDULAR $ without move 11, 8, 5"); // R$
    for (int i = 0; i < networkSize; i++) {
      //   netPhaseBase[i] += (i+1) *(TWO_PI/12); // 12 hit
      // if (  net.naturalFrequency[networkSize-1]>=0 ) {
      print (" Avant ");    
      print (netPhaseBase[networkSize-1-i]); 
      print ("  ");
      //   netPhaseBase[networkSize-1-i] += (i*TWO_PI/3)%PI/11;    //PAS TOUCHER
      netPhaseBase[i] -= (i*TWO_PI/5)%PI/5;
      //   netPhaseBase[networkSize-1-i] += (i*TWO_PI/3)%PI/10;    //PAS TOUCHER
      //    netPhaseBase[networkSize-1-i] += (i*TWO_PI/3)%TWO_PI/10;    //PAS TOUCHER // ne va pas avec P
      //     netPhaseBase[networkSize-1-i] += (i*TWO_PI/3)%TWO_PI/11;    //PAS TOUCHER


      //   netPhaseBase[i] += (1*TWO_PI/(11-i+1))%PI/6;
      //   netPhaseBase[i]  += ((PI/(networkSize/6))*(i+1))%PI/3; // OK
      //   netPhaseBase[i]  +=  netPhaseBase[i] +(PI/((networkSize-i/12))*(i+1))%PI/12; // OK


      print (" ApresR ");  
      print (netPhaseBase[networkSize-1-i]); 
      print ("  "); 
      netPhaseBase[i]=  netPhaseBase[i]%TWO_PI;
      //   netOldPhaseBase[i]=  netPhaseBase[i];
      printSummary(i);
    }
    // }
  }
  
   else if (key == 's') {
    println(" s$s: Reduce the gap between phases by f0 "); //S$
    for (int i = 0; i < networkSize-0; i++) {

      //  netPhaseBase[i] -=(9-i)*0.05;
      //   netPhaseBase[i] -=(networkSize-1-i)*0.05; // oscillator 11 do not move
      netPhaseBase[i] -= (networkSize- oscillatorBlocked-i)*0.05;
    //  netPhaseBase[i]=  netPhaseBase[i]%TWO_PI;

      printSummary(i);
    }
  }
  
   else if (key == 'S') { 
    println(" S$: Reduce the gap between phases by f0  ");    
    for (int i = 0; i < networkSize; i++) {      
      //   netPhaseBase[i] -=(networkSize-1-i)*0.1;
      //   netPhaseBase[i]=  netPhaseBase[i]%TWO_PI;
         netPhaseBase[i] -= (networkSize- oscillatorBlocked-i)*0.01;
      //***    netPhaseBase[i]=  netPhaseBase[i]%TWO_PI;
      printSummary(i);
    }
  }

  else if (key == 'd') {
    println(" d$: INCREASE (clock way) the gap between phases of 5% from the oscillator " + oscillatorBlocked + " called with the same number as memoryi " + memoryi );
    for (int i = 0; i < networkSize; i++) {

      netPhaseBase[i] +=(oscillatorBlocked-i)*0.05; // oscillator 10 do not nove
    //        netPhaseBase[i] +=(5-i)*0.1; // oscillator 10 do not nove
   //   netPhaseBase[i] +=(networkSize-oscillatorBlocked)*0.05;
    //%%  netPhaseBase[i] = netPhaseBase[i]-(i)*0.05; //oscillatorBlocked;      //     netPhaseBase[i] += (oscillatorBlocked+i)*0.05; reciproque de f ne fonctionne pas
      netPhaseBase[i] =  netPhaseBase[i]%TWO_PI;
      key='#';
      printSummary(i);
    }
  }
  
  else if (key == 'D') { 
    println(" D$: Increase the gap between phases by f0  ");    
    for (int i = 0; i < networkSize; i++) {

      netPhaseBase[i] +=(oscillatorBlocked-i)*0.1;
      netPhaseBase[i] =  netPhaseBase[i]%TWO_PI;
      printSummary(i);
    }
  }
  /*
    else if (key == 'x') {//x$
   formerKey= 'x';
   fmemory+=f;
   for (int i = 0; i < networkSize-1; i++) {
   
   print ("f: "); 
   println (f);
   
   abstractPhase[networkSize-2-i] += netOldPhaseBase[networkSize-1]+(i*TWO_PI/3)%PI/12;
   
   netPhaseBase[i]=  abstractPhase[networkSize-2-i]%TWO_PI;
   
   //    printSummary(i);
   
   
   print ("fmemory: "); 
   println (fmemory);
   
   //  key='#';
   }
   
   println(" Increase the gap  fmemory between phases by f9 ");
   
   } 
   */
  else if (key == 'f') { 
    println(" F: Increase the gap between phases by f9 ");    
    for (int i = 0; i < networkSize; i++) {

      //  netPhaseBase[i] +=(i+1)*0.05;
      //    netPhaseBase[i] +=(i+1)*0.005;
      //  netPhaseBase[i] += (oscillatorBlocked+i)*0.05;  // l'oscillateur ne se bloque pas
      netPhaseBase[i] -= (networkSize- oscillatorBlocked-i)*0.05;

   //   netPhaseBase[i]=  netPhaseBase[i]%TWO_PI;
      key='#';
      print ( " netPhaseBase[i] " + netPhaseBase[i]);
    }
  } else if (key == 'F') { 
    println(" F: Increase the gap between phases by f9 ");    
    for (int i = 0; i < networkSize; i++) {

      netPhaseBase[i] +=(i+1)*0.1;
   //   netPhaseBase[i]=  netPhaseBase[i]%TWO_PI;
      key='#';
      printSummary(i);
    }
  } else if (key == 'g') { 
    println(" Decrease the gap between phases of 5% from the oscillator " + oscillatorBlocked + " called with the same number as memoryi " + memoryi   );  
    for (int i = 0; i < networkSize; i++) {
      //       netPhaseBase[i] -=i*0.01;
      //         netPhaseBase[i] -=i*0.05;

      netPhaseBase[i] -=      (oscillatorBlocked+i)*0.05;
      netPhaseBase[i]=  netPhaseBase[i]%TWO_PI;
      key='#';
      printSummary(i);
    }
  } else if (key == 'G') { 
    println(" G: Decrease the gap between phases by f9 ");  
    for (int i = 0; i < networkSize; i++) {
      //       netPhaseBase[i] -=i*0.01;
      netPhaseBase[i] -=i*0.1;
    //  netPhaseBase[i]=  netPhaseBase[i]%TWO_PI;
      printSummary(i);
    }
  }

    //****************** To TEST when frequencies are set at 0
    
 
  else if (key == 'P') { 
    println("INCREASE phases with special modulo P$   "); //P$ 
    for (int i = 0; i < networkSize; i++) {
      netPhaseBase[i]+=   (TWO_PI/(networkSize-2))*(1*(networkSize-1-i))%PI/3; // TWOPI/10--> 10 hit * 3%PI/3 with and oscillator11 not affected  // if networkSize-networkSize-i))%PI/3; --> oscillator 0 not affected
    //  lastPositionFromCircularMode[i] += (TWO_PI/(networkSize-2))*(1*(networkSize-1-i))%PI/3;
      //     netPhaseBase[networkSize-1-i] += (i*TWO_PI/10)%PI/3;  // 10*3 hit//same effect as above 
    //  netPhaseBase[i]=  netPhaseBase[i]%TWO_PI;
      key='#';
      printSummary(i);
    }
  }
  
  
   else if (key == 'M') { 
    println("INCREASE phases with 0.5   "); //
    for (int i = 0; i < networkSize; i++) {
      //       netPhaseBase[i] += QUARTER_PI/2 * netPhaseBase[1*(networkSize-1-i)] ;//
      netPhaseBase[i] += QUARTER_PI/2 * netPhaseBase[i] ;//

      //      netPhaseBase[i] = netPhaseBase[i] - QUARTER_PI  i;
   //   netPhaseBase[i]=  netPhaseBase[i]%TWO_PI;
      key='#';
      printSummary(i);
    }
  } else if (key == 'p') {
    println("DECREASE  phases with special modulo    "); // UTILISE SI ELLES ONT deja un ecart equidistant
    for (int i = 0; i < networkSize; i++) {  

      netPhaseBase[i]-= ((TWO_PI/(networkSize-2))*(1*(networkSize-1-i)))%PI/6; // 
      netPhaseBase[i]=  netPhaseBase[i]%TWO_PI;
      key='#';
      printSummary(i);
    }
  } else if (key == 'm') {
    println(" enregistre phase et decale les  "); // UTILISE SI ELLES ONT deja un ecart equidistant

    text (" enregistre phase et decale les  " + char (key), width/2 + 300, height/2-100) ;
    for (int i = 0; i < networkSize; i++) {  

       //   netPhaseBase[i] -=netPhaseBase[i]- PI/8;
         netPhaseBase[i] =net.phase[i];
   
  /*   
      if  (netPhaseBase[i]<PI/2) { 
        netPhaseBase[i] = PI/10*netPhaseBase[i];// effet torune à l'envers? 

        //      netPhaseBase[i] =-  (netPhaseBase[i]-QUARTER_PI/2 )+ PI/2;// effet torune à l'envers?
        netPhaseBase[i]=  netPhaseBase[i]%-PI/2- PI/2;// COME BACK TO MIDDLE
      } else if (netPhaseBase[i]>PI/2) { 
        netPhaseBase[i] = PI/10*netPhaseBase[i];// effet torune à l'envers? 

        //      netPhaseBase[i] =-  (netPhaseBase[i]-QUARTER_PI/2 )+ PI/2;// effet torune à l'envers?
        netPhaseBase[i]=  netPhaseBase[i]%-PI/2+ PI/2;// COME BACK TO MIDDLE
      }
   */   
      //      netPhaseBase[i] -= averagePhase* netOldPhaseBase[i] ;// 
      //  netPhaseBase[i] -= PI/8 * netPhaseBase[i]* averagePhase ;//
      printSummary(i);
      key='#';
    } 
  }   
  // ****************** ALIGNEMENT of PHASES --- thus, phases alignement depend of coupling.

  else if (key == '9')//9$

  { 
    println(" Align oscillator vertically to the top  ");
    for (int i = 0; i < networkSize; i++) {
      netPhaseBase[i]= 0-PI/2; 
      //      netPhaseBase[i]= 0; 
      printSummary(i);
    }
  }


  else if (key == 'ç') {
    if (circularMov==true) {

      for (int i = 0; i < networkSize; i++) {
        netPhaseBase[i]= 0;
      }
    }
    if (circularMov==false) {
      println(" Align oscillator vertically to the down  ");
      formerKey = 'o';
      for (int i = 0; i < networkSize; i++) {
        //   netPhaseBase[i]=-PI+0.5*PI+PI/12; // position 0+PI/2  
        netPhaseBase[i]= 0+PI/2  ; // position 0+PI/2  

        //     netPhaseBase[i]=netPhaseBase[i]+PI/3;    // position 0+PI/2   add 90° turning in CW
        printSummary(i);
      }
    }
  } 
  ///******************************==================================================== MODULATE SPEED of ALL FREQUENCIE MORE OR LESS FASTLY in PENDULAR $
  /// ****************************  How could i modulate the couple?

  else if (key == 'y') { 
    println("y= Increase last frequencies + 0.05*i ");
    for (int i = 0; i < networkSize; i++) {   
      net.naturalFrequency[i] = net.naturalFrequency[i]*(1.05);
      printSummary(i);
    }
  } else if (key == 'h') { 
    println(" Decrease last frequencies - 0.05*i"); 
    for (int i = 0; i < networkSize; i++) { 
      net.naturalFrequency[i] = net.naturalFrequency[i]*(.95);            
      printSummary(i);
    }
  } else if (key == 'Y') { 
    println("y= Increase last frequencies + 0.05*i ");
    for (int i = 0; i < networkSize; i++) {   
      net.naturalFrequency[i] = net.naturalFrequency[i]*(1.10);
      key='#';
      printSummary(i);
    }
  } else if (key == 'H') { 
    println(" Decrease last frequencies - 0.05*i"); 
    for (int i = 0; i < networkSize; i++) { 
      net.naturalFrequency[i] = net.naturalFrequency[i]*(.90);   
      key='#';
      printSummary(i);
    }
  } 


  //************************** CHANGE THE WAY OF ROTATION O$
  else if (key == 'o') 
  { 
    if ( keyMode != " phasePattern "){
  // for (int i = 0; i < networkSize; i++) {
   //  net.naturalFrequency[i]=signal[2]; 
     signal[2]= - signal[2]; 
   //  } 
     }  
    println("  Changes way of rotation  "); 
    for (int i = 0; i < networkSize; i++) {
      background(120, 20, 20);
      net.naturalFrequency[i] = -1* net.naturalFrequency[i];

      // interFrequency[memoryi] = -1* net.naturalFrequency[i];
      printSummary(i);
    }
  }
  
   else if (key == '0') {//Set all frequencies at 2.0");
    for (int i = 0; i < networkSize-0; i++) {   
      //  net.naturalFrequency[i]=2.0; 
      net.naturalFrequency[i]=1.0;
    }
    //  printSummary(i);
  }
   else if (key == '°') {//Set all frequencies at 2.0");
    for (int i = 0; i < networkSize; i++) {   
      //  net.naturalFrequency[i]=2.0; 
      net.naturalFrequency[i]=0;
    }
    //  printSummary(i);
  }
  
   else if (keyCode == CONTROL) {  
    println(" RECORD COUPLING "); 

    text ( coupling, - 400, height - 1000); // coupling appears on screen and is recorded on the file data.txt
    net.setCoupling(coupling);
  } 
 // key ='#';
  //************************************ ENDPENDULARPATTERN  //************************************ END OF PENDULARRRRRRR  $
  //************************************ DONT TOUCH  //************************************ END OF PENDULARRRRRRR  $
  //************************************ DONT TOUCH  //************************************ END OF PENDULARRRRRRR  $
 }
}