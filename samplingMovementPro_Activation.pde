void samplingMovementPro()
{
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
    if (sampler.fullTime() > 0){
    
     if (sampler.draw()){

     //** TrigmodPos[networkSize-1]=0;     
        textSize(50);
        text ( " do the sample " , 100, 400);
      }
     }
  }
}

void handleSamplingModeWithAbletonLive()
{
    rotate (-HALF_PI);
    textSize (100); 

     text 
     ( "FIRST enc[0] " + encodeur[0] + " ableton[5] " + ableton[5] + " newPosF[ne-1] " + newPosF[networkSize-1] + " " + // synchroOnMeasure + " " + (formerMeasure != measure) + " " +
       "samplingM " + samplingWithMouse + " mouseY " +  mouseY + " measure "  +  measure + " actualSec " + actualSec, -width/4, - height - 300);

       if (measure>=measureRecordStart && measure<=measureRecordStop ) { 
        // int disableDriver=-5;
          int disableDriver=15;  // ENABLE FIRST

           int driverNetWorkSizeOnOff=15; // ENALBLE ALL expect first driver
          //int driverNetWorkSizeOnOff=-5; // DISABLE ALL expect first driver
          int timeElapsedBackingPosition = 8000; 
          int dataNoComputed=-4;
             send24DatasToTeensy6motorsToLittleMachine( 3, disableDriver, dataNoComputed, -1, driverNetWorkSizeOnOff, timeElapsedBackingPosition); // 
             send24DatasToTeensy10motorsToBigMachine(5, disableDriver, dataNoComputed, -1); // 
       }

       if ( measure>=measureRecordStop ) { 
          int disableDriver=15;
          int driverNetWorkSizeOnOff=15;
          int timeElapsedBackingPosition = 1000;
          int dataNoComputed=-4;
             send24DatasToTeensy6motorsToLittleMachine( 3, disableDriver, dataNoComputed, -1, driverNetWorkSizeOnOff, timeElapsedBackingPosition); // 
             send24DatasToTeensy10motorsToBigMachine(5, disableDriver, dataNoComputed, -1); // 
       }

     //==================== sampling from ENCODER_due
     if (systemForBigMachine && !samplingWithMouse && abletonLFO==false)
     {
      angleToInterpolate = (float) map (dataFromArduinoDue[1], 0, 4000, 0, TWO_PI);//%TWO_PI;  // tourner CCW
     }

     //==================== sampling from ENCODER_teensy
     // angleToInterpolate = (float) map (encodeur[0], 0, 4000, 0, TWO_PI)%TWO_PI;  // tourner CCW
     

     //==================== sampling from MOUSE_Y
    if (samplingWithMouse==true &&  abletonLFO==false && music_from_ableton_live == " madRush ")
    {   
       angleToInterpolate = (float) map(mouseY, 0, 200, 0, TWO_PI) % TWO_PI; 
    }

     //==================== sampling with ableton[5] && madRush

     if (samplingWithMouse==false  && abletonLFO==true && music_from_ableton_live == " madRush " && overDub == false)
    {   
       angleToInterpolate = (float) map(ableton[5], 0, 1 , 0, TWO_PI); 
    }

     //==================== sampling with ableton[0]

    if (samplingWithMouse==false && samplingWithTeensy3_5 == false && abletonLFO==true && music_from_ableton_live == " pleasureKraft " && measure <=260)
    {   
       angleToInterpolate = (float) map(ableton[0], 0, 1 , 0, TWO_PI); 
    }

    if (!systemForBigMachine && samplingWithTeensy3_5  && music_from_ableton_live == " pleasureKraft ") //  && measure >260
    {   
       angleToInterpolate = (float) map (abs(encodeur[0]), 0, 4000, 0, TWO_PI)%TWO_PI;  // tourner CCW 
    }

    if (!systemForBigMachine && samplingWithTeensy3_5  && music_from_ableton_live == " controlDr " && measure <17)
    {   
       angleToInterpolate = (float) map (abs(encodeur[0]), 0, 4000, 0, TWO_PI)%TWO_PI;  // tourner CCW 
    }



      newPosF[networkSize-1]= angleToInterpolate;
      text (" angle "+   newPosF[networkSize-1]  , 200, 200 ); 

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
     //beginSample=millis();
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
        send24DatasToTeensy6motorsToLittleMachine( 5, -3, 5, -3, disableDriver, -1); // 
      }

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
      textSize(200);
  text(" BEGIN SAMPLING  AT " + measure, 200, 300);

  bRecording = true;
  sampler.beginRecording();
  }
}

void stopSamplingInternalClock(int endMeasure)
 { 
   if (measure==endMeasure && formerMeasure != measure) { // && actualSec!=lastSec
     textSize(200);
   text(" END SAMPLING  AT "  + measure, 200, 300);

      //  net.phase[networkSize-1]= (float) map (mouseY, 0, 400, 0, TWO_PI);
      //    newPosF[networkSize-1]= (float) map (mouseY, 0, 400, 0, TWO_PI);

  mouseRecorded = false;
  bRecording = false;
  sampler.beginPlaying();
  }
}

void activeSamplingInternalClockBis(int beginMeasure)
{ 
   if (measure==beginMeasure  && formerMeasure != measure && mouseRecorded == true)
    { 
      textSize(200);
  text(" BEGIN SAMPLING OVERDUB  AT " + measure, 200, 300);

  bRecordingBis = true;
  samplerBis.beginRecording();
  }
}

void stopSamplingInternalClockBis(int endMeasure)
 { 
   if (measure==endMeasure && formerMeasure != measure) { // && actualSec!=lastSec
     textSize(200);
   text(" END SAMPLING  OVERDUBAT "  + measure, 200, 300);

      //  net.phase[networkSize-1]= (float) map (mouseY, 0, 400, 0, TWO_PI);
      //    newPosF[networkSize-1]= (float) map (mouseY, 0, 400, 0, TWO_PI);

  mouseRecorded = false;
  bRecordingBis = false;
  samplerBis.beginPlaying();
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
