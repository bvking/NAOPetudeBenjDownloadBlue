void  modePendulaireModeCirculaire() {

  for (int i = 0; i <networkSize-0; i++) {
   
   

    // ***************************************DATA TO MANAGE SOUND in Processing USELESS
    j[i]= rev[i]%2; // if j==0 the number of revolution is pair, j==1 -->impair, j==-1--> impair and negative
    if (net.naturalFrequency[i] < 0) {
   //   freqi[i] = constrain( map( net.naturalFrequency[i], 0, -5, 200, 16000 ), freqMin, 12000 );
    } else {
   //   freqi[i]=  constrain( map( net.naturalFrequency[i], 0, 5, 200, 16000 ), freqMin, 12000 );
    }

    //**************** TRANSFORM CIRCULAR PHASE INTO METRO PHASE ********* SET AMPLITUDE
    if (formerKeyMetro == '$'  ) { // || trigFollowSampling == true//&& formerSartKey == 'x'//|| formerKeyMetro == 'J'
     text ( " mapped GENERAL pendular way $ ", 400, 600);
      //  println (" you are in $ et non x ");
      //   net.phase[i]=net.phase[i]%TWO_PI;//
      /*
      if (net.phase[i] >= PI ) { 
        metroPhase[i]= map( net.phase[i], 0, TWO_PI, 1.5*PI, -0.5*PI);
      //      metroPhase[i]= map( net.phase[i], 0, TWO_PI, PI/2, -PI/2);

      }
      if (net.phase[i] >= 0 && net.phase[i] < PI ) {
        metroPhase[i]= map( net.phase[i], 0, TWO_PI, -0.5*PI, 1.5*PI);
      //  metroPhase[i]= map( net.phase[i], 0, TWO_PI, -PI/2, PI/2);
      }
      if (net.phase[i] <= -PI) { 
        metroPhase[i]= map( net.phase[i], 0, -TWO_PI, 1.5*PI, -0.5*PI);
     //  metroPhase[i]= map( net.phase[i], 0, -TWO_PI, PI/2, -PI/2);

      }  
      if (net.phase[i] < 0  && net.phase[i] > -PI) {   
        metroPhase[i]= map( net.phase[i], 0, -TWO_PI, -0.5*PI, 1.5*PI );
     // metroPhase[i]= map( net.phase[i], 0, -TWO_PI, -0.5*PI/2, PI/2 );

      }
*/


         if (net.phase[i] >= 0 && net.phase[i] <= PI ) {
        metroPhase[i]= map( net.phase[i], 0, PI, -HALF_PI, HALF_PI);
      }

      if (net.phase[i] >= PI  && net.phase[i] <= TWO_PI) {   
        metroPhase[i]= map( net.phase[i], PI, TWO_PI, HALF_PI, -HALF_PI );
      }

      if (net.phase[i] <= 0 && net.phase[i] >= -PI ) {
        metroPhase[i]= map( net.phase[i], 0, -PI, HALF_PI, -HALF_PI);
      }

      if (net.phase[i] >= -PI  && net.phase[i] <= -TWO_PI) {   
        //    metroPhase[i]= map( net.phase[i], -PI, -TWO_PI, -HALF_PI, HALF_PI );
      }


        metroPhase[i]=  metroPhase[i]-PI/2;
       //   metroPhase[i]%=TWO_PI;
       if (keyMode != " propagationBallRotation ")  {  
        if (keyMode != " propagationBallRotationBis ")  {  
           x = displacement*cos(metroPhase[i]);
           y = displacement*sin(metroPhase[i]);
           } 
           } 
       } 


      metroPhaseMappedToBeUsedWithFunction_with_Starter();

  
    if (formerKeyMetro == 'J') { //USELLL play sample recorded with s
     text ( " mapped to J CIRCULAR or PENDULAR way 2$ ", 400, 1000);

    if (keyMode != " propagationBallRotation ")  {  
     if (keyMode != " propagationBallRotationBis ")  {  
      x = displacement*cos(metroPhase[i]);
      y = displacement*sin(metroPhase[i]);
      } 
     } 
    } 
  
  

    if (formerKeyMetro == '<') { //experimental pattern of phases

      //  abstractPhase[networkSize-0-i]=((net.phase[networkSize-0-i+1])+(TWO_PI/(40+i)*net.phase[networkSize-0-i+1])); // faucille
      //***     abstractPhase[networkSize-2-i]=((net.phase[networkSize-2-i+1])+(TWO_PI/(40+i)*net.phase[networkSize-2-i+1])); // faucille      
      //***     net.phase[networkSize-0-i]= abstractPhase[networkSize-0-i];

    }

      // end MAPPING circular vs pendular

   }
 
    translate(-w2, -h2, -1000); // Set the perspective 3D with two fingers on the trackpad
    line (250, 250, 250, 250);  // line showing how ball will behang by the motor's axe.
    fill (123);
    //line (0,0,0,0,0, 11*250+200+250); //axe helping the 3D representation. axe qui relie les pendules
   // noFill (); 

  //  sphere(side*3); // this sphere serves as a reference
   

    // Color sphere and Draw them, depending of acceleration or later with "chimera state"
    // mapAcceleration[i]= constrain ((int (map (abs(net.acceleration[i] *100), 0, 150, 0, 255))), 0, 255); 
      // mapAccelerationinversed[i]= abs (int (map ((net.acceleration[i] *100), -200, 200, 0, 255)));
    //********************************************************* BEGIN GRAPHIC CHIMERA STATE
    colorMode(HSB, TWO_PI, 100, 100);
    noStroke();
    // chimera state
    // mouseXY (); // no effect
    // initializeCoupling(net.coupling, sigma);
    /* 
     for (int k = 0; k < numRows; k++) {
     for (int l = 0; l < numCols; l++) {
     int x = l * gridSize;
     int y = k * gridSize;
     int index = k * numCols + l;
     fill(netG.phase[index], 100, 100);
     rect(x, y, gridSize, gridSize);
     }
     } 
     */
    //********************************************************* END GRAPHIC CHIMERA STATE



   // display trigEventWithAbletonSignal
       colorMode(RGB, 255, 255, 255);
      rotate ( -PI/2);
     for (int i = 0; i < networkSize; i++) {
       pushMatrix();
          translate (x*1, y*1, 200+(50*5*(i+1)));  //*-1 go in clockwise, *1 go in CCW     
             //    fill( mapAccelerationinversed[i], 255, 0 ); // Sepheres are all modulated with the same color. depending of acceleration
          fill( 175, 175, 255 );
       if (keyMode == " trigEventWithAbletonSignal " && formerKeyMetro == '$' ) {
               text (  " IIIIII ", -width/4, -height/4 ) ;  
          // metroPhase[i]= metroPhase[i];     
         println ( " metro " + metroPhase[i]  + " net " + net.phase[i] + " formerKeyMetro " + " " + i + " " + char (formerKeyMetro) ); 
         //  metroPhase[i] %= TWO_PI;  // in arduinoPos?
          x = displacement*cos(metroPhase[i]+PI/2);
          y = displacement*sin(metroPhase[i]+PI/2);
   
         sphere(side*3);
         sphereDetail( 4*5);
         }
     popMatrix();
     }

        for (int i = 0; i < networkSize; i++) {
        pushMatrix();
          translate (x*1, y*1, 200+(50*5*(i+1)));  //*-1 go in clockwise, *1 go in CCW     
             //    fill( mapAccelerationinversed[i], 255, 0 ); // Sepheres are all modulated with the same color. depending of acceleration
          fill( 175, 175, 255 );
        if (keyMode == " trigEventWithAbletonSignal " && formerKeyMetro == '*' ) {

               text (  " iiiiii ", -width/4, -height/4 ) ;  

           // metroPhase[i]= metroPhase[i];     
                       
            println ( " metro " + metroPhase[i] + " net " + net.phase[i]  + " formerKeyMetro " + " " + i + " " + char (formerKeyMetro) ); 
            //    net.phase[i]+=net.phase[i]+PI;
           x = displacement*cos(net.phase[i]-PI/2); //
           y = displacement*sin(net.phase[i]-PI/2); // attention  la presentation
  
        sphere(side*3);
        sphereDetail( 4*5);
      }
     popMatrix();
     }

  // displayKeyModeNull(); 

  
  rotate (HALF_PI);
         for (int i = 0; i < 3; i++)  {  
       String valueText[] =  displayEventFromKeyReleased (keyEvent);     
    } 
       if ( keyMode  ==  " propagationBallRotation " || keyMode  ==  " propagationBallRotationBis "  ) { //drive ball with lfo
     //  displayPropagationControl();
  }  
  rotate (-HALF_PI); 
        if ( keyMode  ==  " propagationBallRotation " || keyMode  ==  " propagationBallRotationBis "  ) { //drive ball with lfo
    //   net.step(); 
    //  netG.step(); //Does it make any meaning?
  } 
    // net.step(); 
    // netG.step(); //Does it make any meaning?
  
} 
   