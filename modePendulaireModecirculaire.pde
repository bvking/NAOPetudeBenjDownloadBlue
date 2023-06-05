void  modePendulaireModeCirculaire() {

  for (int i = 0; i <networkSize-0; i++) {
   
    pushMatrix();

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
 //  metroPhase[i]=  metroPhase[i]-PI/2;
  //   metroPhase[i]%=TWO_PI;
  if (keyMode != " propagationBallRotation ")  {  
     if (keyMode != " propagationBallRotationBis ")  {  
      x = displacement*cos(metroPhase[i]);
      y = displacement*sin(metroPhase[i]);
      } 
     } 
    } 


    if (formerKeyMetro == '$' && (formerSartKey == 'X' || formerSartKey == 'x' ) ) {  // circular to pendular) //|| formerSartKey == 'w' || formerSartKey == 'W'
    if (keyMode != " truc ")  {  
  text ( " mapped SECOND pendular way $ ", 400, 700);
     

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

      for (int n = 0; n < (1); n++) {// pendular from -800 to 800
 /*
        print (" interPhas "); 
        print (memoryi); 
        print (" "); 
        print (interPhase[memoryi]); 
        print (" interPCia "); 
        print (memoryi); 
        print (" "); 
        print (interPhaseCircular[memoryi]);

        print (" metroPhas "); 
        print (memoryi); 
        print (" "); 
        print (metroPhase[memoryi]); 
        print (" meOldPhas "); 
        print (memoryi); 
        print (" "); 
        print (metroOldPhase[memoryi]);

        print (" net.phase "); 
        print (memoryi); 
        print (" "); 
        print (net.phase[memoryi]); 
        print (" netOphase "); 
        print (memoryi); 
        print (" "); 
        println (net.oldPhase[memoryi]);

        print (" interPhas "); 
        print (oldMemoryi); 
        print (" "); 
        print (interPhase[oldMemoryi]); 
        print (" interPCia "); 
        print (oldMemoryi); 
        print (" "); 
        print (interPhaseCircular[oldMemoryi]);

        print (" metroPhas "); 
        print (oldMemoryi); 
        print (" "); 
        print (metroPhase[oldMemoryi]); 
        print (" meOldPhas "); 
        print (oldMemoryi); 
        print (" "); 
        print (metroOldPhase[oldMemoryi]);

        print (" net.phase "); 
        print (oldMemoryi); 
        print (" "); 
        print (net.phase[oldMemoryi]); 
        print (" netOphase "); 
        print (oldMemoryi); 
        print (" "); 
        println (net.oldPhase[oldMemoryi]);
        */
      }  

     if (keyMode != " propagationBallRotation ")  {  
     if (keyMode != " propagationBallRotationBis ")  {  
      x = displacement*cos(metroPhase[i]);
      y = displacement*sin(metroPhase[i]);
      } 
     } 
    } 
    }
   

    if ((formerKeyMetro == '$' || formerKeyMetro == '*' || formerKeyMetro == '@'  ) && (formerSartKey == 'w' || formerSartKey == 'W' ) ) {  // circular to pendular) //|| formerSartKey == 'w' || formerSartKey == 'W'
    if (keyMode != " truc " ) {   
    
     text ( " mapped to THIRD pendular way 2$ ", 400, 800);
      if (net.phase[i] <= 0 && net.phase[i] >= -PI ) {   
        metroPhase[i]= (map( net.phase[i], 0, -PI, HALF_PI, -HALF_PI));
      }

      if (net.phase[i] <= -PI && net.phase[i] >= -TWO_PI ) {   
        metroPhase[i]= (map( net.phase[i], -PI, -TWO_PI, -HALF_PI, HALF_PI ));
      }

      if (net.phase[i] >= 0 && net.phase[i] <= PI ) {
        metroPhase[i]= (map( net.phase[i], 0, PI, -HALF_PI, HALF_PI));
      }

      if (net.phase[i] >= PI  && net.phase[i] <= TWO_PI) {   
        metroPhase[i]= (map( net.phase[i], PI, TWO_PI, HALF_PI, -HALF_PI ));
      }


      /*  
       if (net.phase[i] <= 0 && net.phase[i] >= -PI ) {
       metroPhase[i]=abs (map( net.phase[i], 0, -PI, HALF_PI, -HALF_PI));
       }
       */
      if (net.phase[i] >= -PI  && net.phase[i] <= -TWO_PI) {   
        //    metroPhase[i]= map( net.phase[i], -PI, -TWO_PI, -HALF_PI, HALF_PI );
      }

      for (int n = 0; n < (1); n++) {// pendular from -800 to 800
 /*
        print (" interPhas "); 
        print (memoryi); 
        print (" "); 
        print (interPhase[memoryi]); 
        print (" interPCia "); 
        print (memoryi); 
        print (" "); 
        print (interPhaseCircular[memoryi]);

        print (" metroPhas "); 
        print (memoryi); 
        print (" "); 
        print (metroPhase[memoryi]); 
        print (" meOldPhas "); 
        print (memoryi); 
        print (" "); 
        print (metroOldPhase[memoryi]);

        print (" net.phase "); 
        print (memoryi); 
        print (" "); 
        print (net.phase[memoryi]); 
        print (" netOphase "); 
        print (memoryi); 
        print (" "); 
        println (net.oldPhase[memoryi]);

        print (" interPhas "); 
        print (oldMemoryi); 
        print (" "); 
        print (interPhase[oldMemoryi]); 
        print (" interPCia "); 
        print (oldMemoryi); 
        print (" "); 
        print (interPhaseCircular[oldMemoryi]);

        print (" metroPhas "); 
        print (oldMemoryi); 
        print (" "); 
        print (metroPhase[oldMemoryi]); 
        print (" meOldPhas "); 
        print (oldMemoryi); 
        print (" "); 
        print (metroOldPhase[oldMemoryi]);

        print (" net.phase "); 
        print (oldMemoryi); 
        print (" "); 
        print (net.phase[oldMemoryi]); 
        print (" netOphase "); 
        print (oldMemoryi); 
        print (" "); 
        println (net.oldPhase[oldMemoryi]);
  */       
      }  

       if (keyMode != " propagationBallRotation ")  {  
     if (keyMode != " propagationBallRotationBis ")  {  
      x = displacement*cos(metroPhase[i]);
      y = displacement*sin(metroPhase[i]);
      } 
     } 
    } 
    }
  


    

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
 
    translate(-w2, -h2, -1000); // Set the perspective 3D with two fingers on the trackpad
    line (250, 250, 250, 250);  // line showing how ball will behang by the motor's axe.
    fill (123);
    //line (0,0,0,0,0, 11*250+200+250); //axe helping the 3D representation. axe qui relie les pendules
   // noFill (); 

  //  sphere(side*3); // this sphere serves as a reference
   

    // Color sphere and Draw them, depending of acceleration or later with "chimera state"
    mapAcceleration[i]= constrain ((int (map (abs(net.acceleration[i] *100), 0, 150, 0, 255))), 0, 255); 
    mapAccelerationinversed[i]= abs (int (map ((net.acceleration[i] *100), -200, 200, 0, 255)));
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
    translate (x*1, y*1, 200+(50*5*(i+1)));  //*-1 go in clockwise, *1 go in CCW
    colorMode(RGB, 255, 255, 255);
  //    fill( mapAccelerationinversed[i], 255, 0 ); // Sepheres are all modulated with the same color. depending of acceleration
      fill( 175, 175, 255 );
    if (keyMode == " trigEventWithAbletonSignal " && formerKeyMetro == '$' ) {

               text (  " IIIIII ", -width/4, -height/4 ) ;  

   // metroPhase[i]= metroPhase[i];     
                       
    println ( " metro " + metroPhase[i]  + " net " + net.phase[i] + " formerKeyMetro " + " " + i + " " + char (formerKeyMetro) ); 
    //  metroPhase[i] %= TWO_PI;  // in arduinoPos?
      x = displacement*cos(metroPhase[i]);
      y = displacement*sin(metroPhase[i]);
   
  
    sphere(side*3);
    sphereDetail( 4*5);
    }

     if (keyMode == " trigEventWithAbletonSignal " && formerKeyMetro == '*' ) {

               text (  " iiiiii ", -width/4, -height/4 ) ;  

   // metroPhase[i]= metroPhase[i];     
                       
    println ( " metro " + metroPhase[i] + " net " + net.phase[i]  + " formerKeyMetro " + " " + i + " " + char (formerKeyMetro) ); 

      x = displacement*cos(net.phase[i]);
      y = displacement*sin(net.phase[i]);
  
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
   