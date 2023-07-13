void samplingMovementPro() {
   // currTime = millis() * 0.001;  // seconds since app started
  //  float polarToCartesionX= displacement*cos(newPosF[0]);
  //  float polarToCartesionY= displacement*sin(newPosF[0]);
   if( bRecording ) {
  //  circle( polarToCartesionX,polarToCartesionY, 10 );
    sampler.addSample( newPosF[0], newPosF[0] ); // polar Version
  //  sampler.addSample( polarToCartesionX, polarToCartesionY ); // cartesian version

 
  //**   samplers.get(samplers.size()-1).addSample( currTime, mouseX, v1InMainLoop );

 //net.phase[networkSize-1]=  map (mouseY, 0, height/2, 0, TWO_PI);
  //*** */  newPosF[0]=  map (mouseY, 0, height/2, 0, TWO_PI);// uncomment doesn't change anything

  }
 else {
    if( sampler.fullTime() > 0 )
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
      //  newPosF[0]=  map (encodeur[0], 0, 4000, 0, TWO_PI)%TWO_PI;  // tourner CCW

     //==================== sampling from MOUSE_Y
         float radianTorec;
           radianTorec=(float) map (mouseY, 0, 200, 0, TWO_PI)%TWO_PI;  // position from Processing mouseY    
           newPosF[0]= radianTorec;

      sphere(side*3);
      sphereDetail( 4*5); 
      //==================== 

      float rayon=displacement;
      float polarToCartesionX= displacement*cos(newPosF[0]);
      float polarToCartesionY= displacement*sin(newPosF[0]);

    //  mouseX= (int) polarToCartesionX; // to draw circle with end
    //  mouseY= (int) polarToCartesionY; // to draw circle with end


         activeSamplingInternalClock(1); //start sampling
         stopSamplingInternalClock(3);  //stop sampling
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