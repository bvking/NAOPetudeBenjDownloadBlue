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
    text ( "angleToInterpolate "  + angleToInterpolate, 400, 400);
  }

  else {
    if (sampler.fullTime() > 0)
      sampler.draw();
        textSize(50);
        text ( " do the sample " , 100, 400);

  }
}

void handleInternalSamplingMode(){

     beginSample=millis();
     rotate (-HALF_PI);
     textSize(50);
     text ( " encodeur[0] " + encodeur[0] +  " newPosF[0] " + newPosF[0] + " " +  
            modeStartKeyToFollow + " mouseY " +  mouseY  + " measure "  +  measure , -width/4, - height + 300);   

     //==================== sampling from ENCODER
     if (measure <=3){
      //  send24DatasToTeensy6motorsToLittleMachine(5, -3, -3, -1);
      }
         newPosF[0]=  map (encodeur[0], 0, 2000, 0, TWO_PI)%TWO_PI;  // display on screen
       //  angleToInterpolate = newPosF[0]; 

     //==================== sampling from MOUSE_Y  
      //   angleToInterpolate = (float)map(mouseY, 0, 200, 0, TWO_PI) % TWO_PI;  // display on screen
      //   newPosF[0] = angleToInterpolate;  // dataToInterpolate to compute with newPosF[0]

      //=================== assign dataToInterpolate

      sphere(side*3);
      sphereDetail( 4*5); 
      //==================== 

      float rayon=displacement;
      float polarToCartesionX= displacement*cos(newPosF[0]);
      float polarToCartesionY= displacement*sin(newPosF[0]);

    //  mouseX= (int) polarToCartesionX; // to draw circle with end
    //  mouseY= (int) polarToCartesionY; // to draw circle with end


         activeSamplingInternalClock(1); //start sampling
         stopSamplingInternalClock(5);  //stop sampling
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
    
   if (measure<=endMeasure  && beatTrigged == true) { // && measure>=endMeasure
     println (" ENDTRACK ");     println (" ENDTRACK ");       println (" ENDTRACK ");
    //  net.phase[networkSize-1]= (float) map (mouseY, 0, 400, 0, TWO_PI);
    //    newPosF[networkSize-0]= (float) map (mouseY, 0, height/2, 0, TWO_PI);

  mouseRecorded = false;
  bRecording = false;
  sampler.beginPlaying();
  }
}
void activeSamplingInternalClock(int beginMeasure) { 
   if (measure==beginMeasure  && actualSec!=lastSec && mouseRecorded == true) { // && measure>=beginMeasure

      //  net.phase[networkSize-1]= (float) map (mouseY, 0, 400, 0, TWO_PI);
        //  newPosF[networkSize-1]= (float) map (mouseY, 0, 400, 0, TWO_PI);

  bRecording = true;
  sampler.beginRecording();
  }
}
void stopSamplingInternalClock(int endMeasure) { 
   if (measure==endMeasure && actualSec!=lastSec) { // && measure>=endMeasure 

      //  net.phase[networkSize-1]= (float) map (mouseY, 0, 400, 0, TWO_PI);
      //    newPosF[networkSize-1]= (float) map (mouseY, 0, 400, 0, TWO_PI);

  mouseRecorded = false;
  bRecording = false;

  sampler.beginPlaying();
  }
}