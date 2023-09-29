void samplingMovementPro() {
   // currTime = millis() * 0.001;  // seconds since app started
  //  float polarToCartesionX= displacement*cos(newPosF[0]);
  //  float polarToCartesionY= displacement*sin(newPosF[0]);
   if (bRecording) {  // draw circle
                     //   circle( mouseX, mouseY, 10 );
                     //   sampler.addSample( mouseX, mouseY );
    textSize(100);
    fill(0, 255, 0);
    text(measure, 200, 100);
    sampler.addSample(angleToInterpolate);
    text ( " angleToInterpolate " + angleToInterpolate + " mov " + movementInterpolated, 200, 200);
  }

  else {
    if (sampler.fullTime() > 0)
      sampler.draw();
        textSize(50);
        text ( " do the sample " , 100, 400);

  }
}

void handleSamplingModeWithAbletonLive(){
 
     boolean synchroOnMeasure=false;
     if ((formerMeasure != measure)) { 
          synchroOnMeasure=true;
         // (actualSec!=sec)=true;
     }
     beginSample=millis();
     rotate (-HALF_PI);
     textSize(50);

     if (actualSec == 1 && formerMeasure != measure) // 
     { textSize (300); 
     // mouseY = 200 ; 
     }  

     text ( " encodeur[0] " + encodeur[0] +  " newPosF[networkSize-1] " + newPosF[networkSize-1] + " " + synchroOnMeasure + " " + (formerMeasure != measure) + " " +
            " mouseY " +  mouseY  + " formerMeasure "  +  formerMeasure + " measure "  +  measure + " actualSec " + actualSec, -width/4, - height + 300);   

     // if (measure>=measureRecordStart && measure<=(measureRecordStart+4) ) { 

       if (measure>=measureRecordStart && measure<=measureRecordStop ) { 
          int disableDriver=-5;
          int dataNoComputed=-4;
             send24DatasToTeensy6motorsToLittleMachine(5, disableDriver, dataNoComputed, -1); // 
           //  send24DatasToTeensy10motorsToBigMachine(5, disableDriver, disableDriver, -1); // 
       }

       if ( measure>=measureRecordStop ) { 
          int disableDriver=15;
          int dataNoComputed=-4;
          send24DatasToTeensy6motorsToLittleMachine(5, disableDriver, dataNoComputed, -1); // 
          //   send24DatasToTeensy10motorsToBigMachine(5, disableDriver, disableDriver, -1); // 
       }

     //==================== sampling from ENCODER_due
      //angleToInterpolate = (float) map (dataFromArduinoDue[1], 0, 4000, 0, TWO_PI);//%TWO_PI;  // tourner CCW
      //newPosF[networkSize-1]= angleToInterpolate;

     //==================== sampling from ENCODER_teensy
      angleToInterpolate = (float) map (encodeur[0], 0, 4000, 0, TWO_PI)%TWO_PI;  // tourner CCW
      newPosF[networkSize-1]= angleToInterpolate;

     //==================== sampling from MOUSE_Y
         
     //  angleToInterpolate = (float)map(mouseY, 0, 200, 0, TWO_PI) % TWO_PI; 
     //  newPosF[networkSize-1]= angleToInterpolate;

      sphere(side*3);
      sphereDetail( 4*5); 
      //==================== 

      float rayon=displacement;
      float polarToCartesionX= displacement*cos(newPosF[networkSize-1]);
      float polarToCartesionY= displacement*sin(newPosF[networkSize-1]);

    //  mouseX= (int) polarToCartesionX; // to draw circle with end
    //  mouseY= (int) polarToCartesionY; // to draw circle with end
     activeSamplingInternalClock(measureRecordStart);  //start
     stopSamplingInternalClock(measureRecordStop);  //stop sampling  
     samplingMovementPro(); 

      rotate (HALF_PI);
   }

void handleInternalSamplingMode(){
     boolean synchroOnMeasure=false;
     if ((formerMeasure != measure)) { 
          synchroOnMeasure=true;
     }
     beginSample=millis();
     rotate (-HALF_PI);
     textSize(50);
     if (measure == 1 && actualSec!=lastSec) // formerMeasure != measure
     { textSize (300); 
      mouseY = 200 ;
     }  

     text ( " encodeur[0] " + encodeur[0] +  " newPosF[networkSize-1] " + newPosF[networkSize-1] + " " + synchroOnMeasure + " " + (formerMeasure != measure) + " " +
            " mouseY " +  mouseY  + " measure "  +  measure , -width/4, - height + 300);   

     
     if (measure>=measureRecordStart && measure<=(measureRecordStart+4)) {
       int disableDriver=-4;
        send24DatasToTeensy6motorsToLittleMachine(5, -3, disableDriver, -1); // 
      }

      //==================== sampling from arduinoDue

      angleToInterpolate = map (dataFromArduinoDue[1], 0, 4000, 0, TWO_PI)%TWO_PI;
      newPosF[networkSize-1]= angleToInterpolate;

     //==================== sampling from ENCODER
     // angleToInterpolate =  map (encodeur[0], 0, 4000, 0, TWO_PI)%TWO_PI;  // tourner CCW
     // newPosF[networkSize-1]= angleToInterpolate;

     //==================== sampling from MOUSE_Y
         
      //  angleToInterpolate = (float)map(mouseY, 0, 200, 0, TWO_PI) % TWO_PI; 
      //  newPosF[networkSize-1]= angleToInterpolate;

      sphere(side*3);
      sphereDetail( 4*5); 
      //==================== 

      float rayon=displacement;
      float polarToCartesionX= displacement*cos(newPosF[networkSize-1]);
      float polarToCartesionY= displacement*sin(newPosF[networkSize-1]);

    //  mouseX= (int) polarToCartesionX; // to draw circle with end
    //  mouseY= (int) polarToCartesionY; // to draw circle with end

     activeSamplingInternalClock(1); //start sampling
     //activeSamplingMeasure(1);
     stopSamplingInternalClock(5);  //stop sampling
     //stopSamplingMeasure(5);
     samplingMovementPro(); 
      


      rotate (HALF_PI);


   }


void activeSamplingSecond() { 
   if (actualSec<=0 && actualSec!=lastSec && mouseRecorded == true) {
  bRecording = true;
 //*** samplers.add( new Sampler( nextSamplePeriod, currTime, mouseX, mouseY ) );
 // net.phase[networkSize-1]= (float) map (mouseY, 0, 400, 0, TWO_PI);
//  newPosF[networkSize-1]= (float) map (mouseY, 0, 400, 0, TWO_PI);
  
  
}
}


void activeSamplingMeasure(int beginMeasure) {    
  if (measure==beginMeasure && beatTrigged == true && mouseRecorded == true){   //  && measure>=beginMeasure
    println (" BEGINTRACK ");      println (" BEGINTRACK ");        println (" BEGINTRACK ");
    // net.phase[networkSize-1]= (float) map (mouseY, 0, 400, 0, TWO_PI);
   //*** */    newPosF[networkSize-1]= (float) map (mouseY, 0, 400, 0, TWO_PI);

  bRecording = true; 
  sampler.beginRecording();
  text ( " mouseY " + mouseY + " encodeur0 " + encodeur[0], 300, 300);
  }
}
void stopSamplingMeasure(int endMeasure) { 
    
   if (measure==endMeasure  && beatTrigged == true) { // && measure>=endMeasure
     println (" ENDTRACK ");     println (" ENDTRACK ");       println (" ENDTRACK ");
    //  net.phase[networkSize-1]= (float) map (mouseY, 0, 400, 0, TWO_PI);
    //    newPosF[networkSize-0]= (float) map (mouseY, 0, height/2, 0, TWO_PI);

  mouseRecorded = false;
  bRecording = false;
  sampler.beginPlaying();
  }
}


void activeSamplingInternalClock(int beginMeasure)
{ 
   if (measure==beginMeasure  && formerMeasure != measure && mouseRecorded == true)
    { 

  bRecording = true;
  sampler.beginRecording();
  }
}

void stopSamplingInternalClock(int endMeasure)
 { 
   if (measure==endMeasure && formerMeasure != measure) { // && actualSec!=lastSec
   text(" END SAMPLING  AT "  + measure, 200, 300);

      //  net.phase[networkSize-1]= (float) map (mouseY, 0, 400, 0, TWO_PI);
      //    newPosF[networkSize-1]= (float) map (mouseY, 0, 400, 0, TWO_PI);

  mouseRecorded = false;
  bRecording = false;
  sampler.beginPlaying();
  }
}

void activeSamplingAbletonLiveClock(int beginMeasure)
{ 
   if (actualSec==beginMeasure  && formerMeasure != measure && mouseRecorded == true) { // && actualSec!=lastSec

      //  net.phase[networkSize-1]= (float) map (mouseY, 0, 400, 0, TWO_PI);
        //  newPosF[networkSize-1]= (float) map (mouseY, 0, 400, 0, TWO_PI);

  bRecording = true;
  sampler.beginRecording();
  }
}

void stopSamplingAbletonLiveClock(int endMeasure)
 { 
   if (actualSec==endMeasure && formerMeasure != measure) { // && actualSec!=lastSec

      //  net.phase[networkSize-1]= (float) map (mouseY, 0, 400, 0, TWO_PI);
      //    newPosF[networkSize-1]= (float) map (mouseY, 0, 400, 0, TWO_PI);

  mouseRecorded = false;
  bRecording = false;
  sampler.beginPlaying();
  }
}
