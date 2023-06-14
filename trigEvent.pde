int delayTimeToTrig4; //ms
float signalToSplit4;
String positionMov;  // Original?

void trigEventWithAbletonSignal() {  // change de sens de propagagtion.   ATTENTION dans ce reglage le signalToSplit de propgation est UP continue de 0 à TWO_PI


     splitTimeLfo= int  (timeLfo%1000); 
         //  text (" splittimeLfo "  +  splitTimeLfo +   " oldSplitTimeLfo " + oldSplitTimeLfo, 300, -300);

             textSize (100);
                text (" oldOscillatorChange " + oldOscillatorChange + " oscillatorChange " + oscillatorChange + " j " + nf (phaseKeptAtChange[oscillatorChange]/TWO_PI*360%360, 0, 2), -width-200, -height- 400-1000);
                text (" oscillatorChangingPropagation " +  oscillatorChangingPropagation  +  nf (phaseKeptAtChange[oldOscillatorChange]/TWO_PI*360%360, 0, 2), -width-200, -height- 500-1000);

                signalToSplit = map ( signal[5], 0, 1, 0, 1);
                signalToSplit4 = map ( signal[4], 0, 1, 0, 1);

                delayTimeToTrig=120; //ms
                delayTimeToTrig4=120;

            if  (music_from_ableton_live == " madRush " ) { 
                 autmationWithMeasureAndNote();
            }




     if (music_from_ableton_live == " pleasureKraft ") {
          
            if (measure < 58 ){
                positionMov = " premierePartie ";
             }

            if (measure == 58 && beatPrecised == 1 && beatPrecisedTrigged==true ) {
            //   if ( measure < 66   )  {  //&& beatPrecised <= 4 )// go to propaBis
                positionMov =  " seconde " ; 
            //   }
            }

            if (measure == 66 && beatPrecised == 4  ) { // comeBack from alt y
        //      keyMode = " trigEventWithAbletonSignal ";
          //   positionMov = " troisieme " ;
           //   keyCode = ALT; key = 'v'; // key 
            }
      
             if (measure == 82 && beatPrecised == 4 && beatPrecisedTrigged==true && measure <=100) {
            positionMov = " quatrieme " ;
            textSize(500);
            }
              //------ end distribution of measure to specific movement -------------------- 

         
             if (measure==1 && beatTrigged==true){
             delayTimeToTrig4=120;    
             }

             if (measure==1 && beatPrecised==1  && beatPrecisedTrigged==false){
               formerKeyMetro = '$';
               key='°';
              }
     
              if (beatPrecised==1 && measure==1 && beatPrecisedTrigged==true){
                  keyCode=CONTROL;
               }
              if (beatPrecised==2 && measure==1 && beatPrecisedTrigged==true){
                  //   key= 'F';
               }
          
                 //------------end intro

                  
               

                 // disply specifics values: instrument, phase, frequency of  effect and ball
 
              if (measure>=52 && beatPrecised == 2 || beatPrecised == 6 && beatPrecisedTrigged==true  ){
                  text ( " SNARE ", -800, -800)   ;  
                  if ( positionMov == " premierePartie ") {
                          // key = 'F';
                         // key= 'k';  // motor only
                 }
               }

               


        //---------------------- 
       
              
          if (  positionMov == " premierePartie "){ 
             if (measure<58){




            if (measure<41  || measure>=42 ){
              if (beatPrecised%2==0 && beatPrecisedTrigged==true  ){ // signalToSplit>0.5 && // && millis()> timeToTrig+delayTimeToTrig
               
                  propagationLevel=1;
                  oscillatorChangingPropagation=true;

               if (measure<17){ 
                   key = 'i'; keyReleased();
                   //  keyCode = CONTROL;keyReleased();
                }
              }

            if (measure == 1 ){ 
             if (beatPrecised==2 && beatPrecisedTrigged==true  ){
            //  key='k'; keyReleased();
              key='f'; keyReleased();
              key='f'; keyReleased();
              key='f'; keyReleased();
              key='f'; keyReleased();
          

                    for (int i = 0; i < networkSize-0; i++) {  
                           net.naturalFrequency[i]= 0.25; // pow(2, -10);
                          
                     }
              }
             }
       

            if (measure>17 && measure<41 ){ 
             if (beatTrigged==true){ 
                oscillatorBlocked=0;
                propagationLevel=1;
                oscillatorChangingPropagation=true;
                    key = 'F'; keyReleased();  //
             }
            }
      
            if (measure==17){ 
               if (beatPrecised==4 && beatPrecisedTrigged==true  ){
                key = 'ç'; keyReleased(); // align
                key = 'a'; keyReleased(); // start oscBlocked 
                key = '0'; keyReleased(); // same speed for all osc
                key = 't'; keyReleased(); // bring osc to the same speed

                       float valToRoot = 2.0;
                       float rootedFloat = squaredRootOccurrence(valToRoot,4);
                       text (  " rootFloat " + rootedFloat, -200, 200); 

                    for (int i = 0; i < networkSize-0; i++) {  
                           net.naturalFrequency[i]= rootedFloat-0.1; // pow(2, -10);
                     }

                   for (int i = 0; i < networkSize; i++) { 
                    key='y';keyReleased();
                  
                   } 
                }
             }

            if (measure>16 && measure<42){ 
               if (beatPrecised%4==0 && beatPrecisedTrigged==true){ 
                   oscillatorBlocked=0;
                  propagationLevel=1;
                  oscillatorChangingPropagation=true;
                  //  key = 'D'; keyReleased();
                   //   key = 'D'; keyReleased();
                  key = 'F'; keyReleased();

                   text ("beatPrecised%4" +  key , 0, 0);
              }
            }

            if (measure>16){ 
             if ((beatPrecised+2)%4==0 && beatPrecisedTrigged==true){ 
              //    oscillatorBlocked=0;
                  propagationLevel=1;
                  oscillatorChangingPropagation=true;
               //   key = 'F'; keyReleased();
               //    key = 'F'; keyReleased();
                text ("beatPrecised+2%4" +  key , 0, 100);
              }
            }
      
            if (measure==33){ 
              if (beatPrecised==3 && beatPrecisedTrigged==true  ){
                //  key = 'ç'; keyReleased();
                 key = '°'; keyReleased(); // STOP?
                 keyCode = CONTROL; keyReleased();
                //    key = 'f'; keyReleased();
               }
             }

            if (measure>=34 && measure<42){ 
              if (beatPrecised%1==0 && beatPrecisedTrigged==true  ){
               //  key = 'ç'; keyReleased();
               key = 'i'; keyReleased();
                text ( " key = 'i'; keyReleased()0 " , 200, 200);
                //  keyCode =ALT; key = 'r';
              }
            }

               // TRANSITION
            if (measure>40  && measure<=42 ){
               if (beatPrecised==0 && measure==40  ){
                   key= '0'; keyReleased(); // no frequency
               if (beatPrecised!=0 && beatPrecisedTrigged==true  ){
                   key= 'r'; keyReleased();
                }
               }
             }
           // end transition
                
                

           if (measure==42){ 
             if (beatPrecised==4 && beatPrecisedTrigged==true  ){
              key = 'ç'; keyReleased();
             }
           }
              textSize(100);

           //-------measure 42


               if  (measure%2==0 && measure>=42  &&  beatPrecised != 0 && beatPrecisedTrigged==true) {
                  oscillatorBlocked=0;   text ( " oscillatoBlocked=0" , -800, -700);
                   key = 's'; keyReleased(); 
                   key = 's'; keyReleased();             
                 }

               if  ((measure+1)%2==0 && measure>=42 &&  beatPrecised != 0 && beatPrecisedTrigged==true){
                  oscillatorBlocked=0;   text ( " oscillatoBlocked=5" ,  -800, -700);
                   key = 'g'; keyReleased();      // g0 s0
                   key = 'g'; keyReleased();                         
                }

               if (measure==50){ 
             if (beatPrecised==4 && beatPrecisedTrigged==true  ){
              key = 'E'; keyReleased();
             }
           }


   
        }  // end >= 42
       } // end mesure 58
     } // end premiere partie

      if (positionMov == " seconde " ){    // 58 to 68
        
            keyMode = " propagationBallRotationBis ";
           //  switchFonctionDependingKeyMode();
          // propagationBallRotationBis();
   
          // keyMode = " addSignalOneAndTwo ";
         
  
                      if (beatPrecised%2==0 && beatPrecisedTrigged==true  ){ // signalToSplit>0.5 && // && millis()> timeToTrig+delayTimeToTrig
     
                        oscillatorBlocked=0;
                        timeToTrig=millis();
                        propagationLevel=1;
                        oscillatorChangingPropagation=true;
                        //  key = 'D'; keyReleased();
                       }   


                       if (signalToSplit4>0.5 && millis()> timeToTrig+delayTimeToTrig4+80 ){  // faire .pde avec les differentes manieres d'utiliser le signal audio comme trigger
                       oscillatorBlocked=0;
                       timeToTrig=millis();
                       oscillatorChangingPropagation=true;
                      //  key = 'd'; keyReleased();
                       oscillatorBlocked=oscillatorBlocked%networkSize; 
                        }
         // end second partie
       }



     if ( positionMov == " troisieme "  ){ // à partir de 66.4   from   keyMode = " propaBis "; 
   
           float valToRoot = networkSize*1.0;
           float rootedFloat = squaredRootOccurrence(valToRoot, networkSize);
           text (  " rootFloat " + rootedFloat, -200, 200); 


      if (measure == 66 && beatPrecised == 4 && beatPrecisedTrigged==true){ // useless?
          formerKeyMetro = '*';
          key = 'ç'; keyReleased();
          key = 'E'; keyReleased();
         
            for (int i = 0; i < networkSize-0; i++) {  
            net.naturalFrequency[i]= rootedFloat; // pow(2, -10);
      } 
            memoryi=5;  // set switch function trigged with key 'i'
         //   net.naturalFrequency[5]=0;           
      }

      if (measure >=66 && measure < 82) {
              textSize (110);
            text (" memoryi " + memoryi + " frequency 2 " + net.naturalFrequency[2], width/2, height);


        if (measure == 76 && beatPrecised == 7 && beatPrecisedTrigged==true){ // && frameCount>formerFrameTrigging+1
            keyCode = CONTROL;keyReleased();
        } 

        if (measure == 66  && beatPrecised == 4 && beatPrecisedTrigged==true ){ // && frameCount>formerFrameTrigging+1      
         textSize (210);      
        }

        if (measure%2==0 && measure > 66 && measure <= 84 && beatPrecised == 4 && beatPrecisedTrigged==true ){ // &measure%2==0 each two measure

              for (int i = 0; i < networkSize; i++) {              
                   key = 'y'; keyReleased();
               //    key = 'y'; keyReleased();
                }
                   key = 'i'; keyReleased(); // switch frequencies and phase upside :  position and frequency from oscillator 0 go to 1, 1 to 2, and on 
        }

        if ( measure%1==0 && beatTrigged==true ){ // && frameCount>formerFrameTrigging+1
           // textSize(400);
           
         } 
      } // end measure<82
     }// end troisieme


       
       
       if (measure == 82 && beatPrecised == 4  && beatPrecisedTrigged==true ) {
 
          positionMov = " quatrieme " ;
          println ( " positionMov " + positionMov );  
          textSize(500);

           }
    

        if ( positionMov == " quatrieme "  ){ // 82.4

             if (measure == 82 && beatPrecised == 4 && beatPrecisedTrigged==true ){ // 
               key = 'ç'; keyReleased();
               memoryi+=1;
               key='0'; keyReleased();
               key = 'p'; keyReleased();
               key = 'p'; keyReleased();
               key = 'p'; keyReleased();
           //    key = 'E'; keyReleased();
             } 

          if (measure >= 84 && measure <=100 && beatPrecisedTrigged==true  && (beatPrecised== 2 || beatPrecised== 6)) { // follow snare, trigged with snare        
             key = 'r';  keyReleased(); 
             key = 'r';  keyReleased(); 
           }  

          if (measure == 84 && beatTrigged==true ){ // && frameCount>formerFrameTrigging+1
              key = 'ç'; keyReleased();
      
          } 

          if (measure == 90 && beatTrigged==true ){ // && frameCount>formerFrameTrigging+1
              key = 't'; keyReleased();
      
          } 

          if (measure >= 90 && measure <= 100 && beatPrecised == 4 && beatPrecisedTrigged==true  ){ // && frameCount>formerFrameTrigging+1
              key = 'h'; keyReleased(); 
              key = 'h'; keyReleased();
              key = 'h'; keyReleased();
              key = 'h'; keyReleased();
              key = 'h'; keyReleased();
              key = 'h'; keyReleased();    
              key = 'h'; keyReleased();
              key = 'h'; keyReleased();  
           } 

          if (measure >= 100 && beatPrecised !=0 && beatPrecisedTrigged==true  ){ // && frameCount>formerFrameTrigging+1
                key = 'r';  keyReleased(); 
                 
          } 

           if (measure >= 100 && beatPrecised ==1 && beatPrecisedTrigged==true  ){ // && frameCount>formerFrameTrigging+1
                key = 'f';  keyReleased(); 
                 
          } 

     } // // end quatrieme
 }  //  end of  pleasureKraft Arrangement
   
   

        textSize (50);

          for (int i = 0; i < networkSize-0; i++) {  
           text  ( " oscillatorBlocked " + oscillatorBlocked + " memoryi " + memoryi + " frequency " + i + " "  + net.naturalFrequency[i]+
                   " oldMotorisedPosition " + oldDataMappedForMotorisedPosition[i] + " MotorisedPosition[i] " +  dataMappedForMotorisedPosition[i]+
                   " net " +  net.phase[i] + " oldPhaseBase[i] " +  net.oldPhase [i] + " netPhaseBase[i] " +  netPhaseBase[i]+ " netOld " +  netOldPhaseBase[i] + 
                   " deltaOldPhaseActualPhase [i] " +deltaOldPhaseActualPhase[i], -1500 , 500 +(i*50));
            } 
 
  
            //  text  ( " oscillatorBlocked " + oscillatorBlocked + " memoryi " + memoryi + " frequency 0 " + net.naturalFrequency[0], 300, 1000);
               text  ( "  beginMeasure " +  beginMeasure +  " beatTrigged " + beatTrigged + " measure " +  measure, 300, 1100);
               text  ( " trigEffect " + trigEffect + " enco " +  abs ((int)map (encodeur[0], 0, 800, 0, 127)), 300, 1200);
               text  ( " encodeur[1]" + encodeur[1] +  " trigEffectBis " + trigEffectBis +  " encO " +  abs ((int)map (oldEncodeur[0], 0, 800, 0, 127)), 300, 1300);

              oldSplitTimeLfo = splitTimeLfo; 
 }    
  











    /*
        if (formerKeyMetro == '$' && key == '='){
       for (int i = 0; i < networkSize; i=+1 ){
         AlternativeVirtualPositionFromOtherMode[i]=dataMappedForMotorisedPosition[i]- lastPositionFromCircularMode[i];
         text ( "   AlternativeVirtualPositionFromOtherMode[i] " + i + " " +  lastPositionFromCircularMode[i] , -800, 800-10*i );
       } 
    } 
    */



     /* 
    if (oldSplitTimeLfo-splitTimeLfo>150){  // if previous signal is upper of 15%
      oscillatorChangingPropagation=true;
      oldOscillatorChange=oscillatorChange;
      oscillatorChange=oscillatorChange+1;
      }
     else  oscillatorChangingPropagation=false;
      oscillatorChange=oscillatorChange%networkSize;
     if (oscillatorChange<=0) {
      oldOscillatorChange=networkSize-1;
     }

    if (splitTimeLfo-oldSplitTimeLfo>150){  // if previous signal is downer of 15%
      oscillatorChangingPropagation=true;
      oldOscillatorChange=oscillatorChange;
      oscillatorChange=oscillatorChange+1;
      }
     else  oscillatorChangingPropagation=false;
      oscillatorChange=oscillatorChange%networkSize;
     if (oscillatorChange<=0) {
      oldOscillatorChange=networkSize-1;
     } 
  */

    /*
     if (splitTimeLfo-oldSplitTimeLfo>150){ // if previous signal is upper of 15%
      oscillatorChangingPropagation=true;
      oldOscillatorChange=oscillatorChange;
      oscillatorChange=oscillatorChange-1;
     } 
      if (oscillatorChange<=-1) {
      oldOscillatorChange=0;
      oscillatorChange=networkSize-1;
    }
    */