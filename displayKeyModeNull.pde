void displayKeyModeNull() {

   for (int i = 0; i <networkSize-0; i++) {

    pushMatrix();

     if (formerKeyMetro !='B' ) { //drive ball with lfo
          if (formerKeyMetro != '<' ) {
             if (formerKeyMetro != '@' ) {
                     if (keyMode != " addSignalOneAndTwo " ) {
                         if (keyMode != " addSignalOneAndTwoBis " ) {
                             if (keyMode != " addSignalOneAndTwoTer " ) {
                               if (keyMode != " followDistribueAddLfoPattern " ) {
                                 if (keyMode != " followDistribueAddLfoPatternControl " ) {
                                    if ( keyMode != " trigEventWithAbletonSignal " ) {  // keyMode == " trigEventWithAbletonSignal " &&   metroPhase[i]=
                                         if ( modeStartKeyToFollow  != " followSignalSampledOppositeWay(frameRatio) "  ) {
                                            if ( modeStartKeyToFollow  != " samplingModeInternal "   ) {
                                              if ( modeStartKeyToFollow  != " null "   ) {

           
                       text (  " ENDENDEND ", -width/4, -height/4 ) ;           
                       
         println ( net.phase[i]  + " modePendulaire? formerKeyMetro " + " " + i + " " + char (formerKeyMetro) ); 
      x = displacement*cos(net.phase[i]);
      y = displacement*sin(net.phase[i]);
  
    sphere(side*3);
    sphereDetail( 4*5);
      }
     }
    }
     }
     }
     }
     }
     }
    }
       }
      }
    } 
    
       if (formerKeyMetro == 'B' ) { //drive ball with lfo
     fill( 255, 255, 0 ); // Spheres are all modulated with the same color. depending of acceleration
   //   followLFO();  // better to repare
   //  followLFObis(); // same as below
         println (" formerKeyMetro  ", i, " ",  formerKeyMetro );    

      x = displacement*cos(newPosX[i]);
      y = displacement*sin(newPosX[i]);   
      sphere(side*3);
      sphereDetail( 4*5);
  //    followMovementAll();
  //    displayfollowMovementAll();
      }

         if (keyMode == " addSignalOneAndTwoQuater "  ) { //drive ball with lfo
     fill( mapAccelerationinversed[i], 255, 255 ); // Sepheres are all modulated with the same color. depending of acceleration
     fill (100, 155, 100);
    //  x = displacement*cos(net.phase[i]);
    //  y = displacement*sin(net.phase[i]); 
     x = displacement*cos(newPosXaddSignal[i]);   
     y = displacement*sin(newPosXaddSignal[i]);   
      
 //      print (" keyMode ", i, " ",  newPosXaddSignal[i] );    
      sphere(side*3);
      sphereDetail( 4*5);
      }
          
       if (keyMode == " addSignalOneAndTwoTer "  ) { //drive ball with lfo
     fill( mapAccelerationinversed[i], 255, 255 ); // Sepheres are all modulated with the same color. depending of acceleration
     fill (100, 155, 255);
      x = displacement*cos(net.phase[i]);
      y = displacement*sin(net.phase[i]);    
 //      print (" keyMode ", i, " ",  newPosXaddSignal[i] );    
      sphere(side*3);
      sphereDetail( 4*5);
      }

         if (keyMode == " addSignalOneAndTwoBis "  ) { //drive ball with lfo
     fill( mapAccelerationinversed[i], 255, 255 ); // Sepheres are all modulated with the same color. depending of acceleration
     fill (255, 0 , 255);
    //  x = displacement*cos(newPosXaddSignal[i]);
    //  y = displacement*sin(newPosXaddSignal[i]); 
       x = displacement*cos(net.phase[i]);
       y = displacement*sin(net.phase[i]);    
  //      print (" keyMode ", i, " ",  newPosXaddSignal[i] );    
      sphere(side*3);
      sphereDetail( 4*5);
      }
       
       if (keyMode == " addSignalOneAndTwo "  ) { //drive ball with lfo
     fill( mapAccelerationinversed[i], 255, 255 ); // Sepheres are all modulated with the same color. depending of acceleration
    // fill (100, 255, 255);
    //   net.phase[i]=newPosF[i];
      x = displacement*cos(net.phase[i]);
      y = displacement*sin(net.phase[i]); 

 //     print (" keyMode ", i, " ",  newPosXaddSignal[i] );    
      sphere(side*3);
      sphereDetail( 4*5);
      }
      
       if (keyMode == " samplingModeBis "  ) { //drive ball with lfo
     fill( mapAccelerationinversed[i], 255, 255 ); // Sepheres are all modulated with the same color. depending of acceleration
     fill (100, 110, 120);
     samplingMovementPro();
      x = displacement*cos(net.phase[i]); //);
      y = displacement*sin(net.phase[i]);      // display ball in blue lagub
      print (" keyMode ", i, " ",  newPosXaddSignal[i] );    
      sphere(side*3);
      sphereDetail( 4*5);
      }

   if ( keyMode  ==  " propagationBallRotation " || keyMode  ==  " propagationBallRotationBis "  ) { //drive ball with lfo
  
      println ( "****************************** DISPLAY ", keyMode ); 
      text ( char (formerKeyMetro), 100,100);
      fill (175, 100 , 175);  
      x = displacement*cos(newPosXaddSignal[i]);  
      y = displacement*sin(newPosXaddSignal[i]);
    //  x = displacement*cos(newPosF[i]);
    //  y = displacement*sin(newPosF[i]);
    //  x = displacement*cos(net.phase[i]);
    //  y = displacement*sin(net.phase[i]);   
      sphere(side*3);
      sphereDetail( 4*5);     
     }
     
  /*
    if (  keyMode  ==  " propagationBallRotationBis "  ) { //drive ball with lfo
  
      println ( "****************************** DISPLAY ", keyMode ); 
      text ( char (formerKeyMetro), 100,100);
      fill (175, 75 , 75);    
   //   x = displacement*cos(newPosF[i]);
   //   y = displacement*sin(newPosF[i]);
      x = displacement*cos(net.phase[i]);
      y = displacement*sin(net.phase[i]);   
      sphere(side*3);
      sphereDetail( 4*5); 
      
     }
   */  
    
 if ( keyMode == " null " ) {      
    if ( keyMode == " methodAbleton " ) { //drive ball with lfo   
  
    println ( "****************************** DISPLAY ", keyMode );   
    fill (255, 0, 255);
      x = displacement*cos(phaseAbleton[i]); //);
      y = displacement*sin(phaseAbleton[i]);    
      sphere(side*3);
      sphereDetail( 4*5);
      }
      
    if ( keyMode == " signal " ) { //drive ball with lfo
    println ( "****************************** DISPLAY ", keyMode );    
    fill (100, 100 , 255);
      x = displacement*cos(net.phase[i]);
      y = displacement*sin(net.phase[i]);    
      sphere(side*3);
      sphereDetail( 4*5); 
      }
      
    if ( keyMode == " followDirectLfo " ) { //drive ball with lfo    
      println ( "****************************** DISPLAY ", keyMode );    
      fill (255, 100 , 255);    
      x = displacement*cos(newPosF[i]);
      y = displacement*sin(newPosF[i]);
      net.phase[i]=newPosF[i];   
      sphere(side*3);
      sphereDetail( 4*5);
      } 
      
    if ( modeStartKeyToFollow == " trigEventWithAbletonSignalBis " ) { //drive ball with lfo    
      println ( "****************************** DISPLAY ", keyMode );   
       text ( formerKeyMetro, 100,100); 
         println ( " formerKeyMetro "  + formerKeyMetro); 
      fill (100, 255 , 255);    
      x = displacement*cos(net.phase[i]);
      y = displacement*sin(net.phase[i]);    
      sphere(side*3);
      sphereDetail( 4*5); 
      }
      
    if ( modeStartKeyToFollow == " followDistribueAddLfoPattern "  ) { //drive ball with lfo
     if ( keyMode != " trigEventWithAbletonSignal " ) {
      println ( "****************************** DISPLAY ", keyMode ); 
      text ( char (formerKeyMetro), 100,100);
      fill (100, 255 , 150);    
      x = displacement*cos(newPosF[i]);
      y = displacement*sin(newPosF[i]);
    //  x = displacement*cos(net.phase[i]);
    //  y = displacement*sin(net.phase[i]);   
      sphere(side*3);
      sphereDetail( 4*5); 
      }
     }

    if ( modeStartKeyToFollow == " followDistribueAddLfoPatternControl " ) { //drive ball with lfo
    
   
      println ( "****************************** DISPLAY ", keyMode, controlTrigLfoPattern ); 
    //  text ( " CRL ", 100,100);
      text ( char (formerKeyMetro) , 100,100);
      fill (127, 127 , 255);    
      x = displacement*cos(newPosF[i]);
      y = displacement*sin(newPosF[i]);    
      sphere(side*3);
      sphereDetail( 4*5); 
      }  


    if ( modeStartKeyToFollow  == " followSignalSampledOppositeWay(frameRatio) " || modeStartKeyToFollow  == " samplingModeInternal " 
      || modeStartKeyToFollow  == " followSignalSampled " ) {
        println ( " display modeStartKeyToFollow " + modeStartKeyToFollow + " " + newPosF[i] + " " + i + " check " +  sampledModifiedChecking[i] );

      text ( char (formerKeyMetro) , 100,100);

    
      x = displacement*cos(newPosF[i]);
      y = displacement*sin(newPosF[i]);

     fill (255 /(networkSize-i+1), 255, 255 /(25*(i+1)));    
      circle ( 100* cos ( newPosF[i])+400, 100*sin ( newPosF[i])+400, 50);


   //    circle ( 100* cos ( interpolatedAngle[0])+400, 100*sin ( interpolatedAngle[0])+400, 200);
   //    circle ( 100* cos ( interpolatedAngle[1])+400, 100*sin ( interpolatedAngle[1])+400, 200);
      sphere(side*3);
      sphereDetail( 4*5); 
    } 

  }
  popMatrix();
 }
}