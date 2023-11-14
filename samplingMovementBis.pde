void samplingMovementProBis()
{
  
   if (bRecording) {  // draw circle
                     //   circle( mouseX, mouseY, 10 );
                     //   sampler.addSample( mouseX, mouseY );
    textSize(100);
    fill(0, 255, 0);
    text(measure, 200, 100);
    samplerBis.addSample(angleToInterpolateBis);
    text ( " angleToInterpolate " + angleToInterpolateBis + " mov " + movementInterpolatedBis, 200, 200+100);
  }

  else {
    if (samplerBis.fullTime() > 0){
    
     if (samplerBis.draw()){

     //** TrigmodPos[networkSize-1]=0;     
        textSize(50);
        text ( " do the sampleBis " , 100, 400);
      }
     }
  }
}


void handleSamplingModeWithAbletonLiveBis()
{
 
     beginSample=millis();
//     rotate (-HALF_PI);

    textSize (200); 

     text 
     ( " enc[0] " + encodeur[0] + " ableton[5] " + ableton[5] + " newPosF[ne-1] " + newPosF[networkSize-1] + " " + // synchroOnMeasure + " " + (formerMeasure != measure) + " " +
       "samplingM " + samplingWithMouse + " mouseY " +  mouseY + " measure "  +  measure + " actualSec " + actualSec, -width/4, - height + 300+100);

       if (measure>=measureRecordStartBis && measure<=measureRecordStopBis ) { 
        // int disableDriver=-5;
          int disableDriver=15;

          int driverNetWorkSizeOnOff=-5;
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
     //==================== OVERDUBBING

     if (samplingWithMouse==false  && abletonLFO==true && music_from_ableton_live == " madRush " && overdub == true)
    {   
       angleToInterpolateBis = (float) map(angleToInterpolate, 0, TWO_PI , 0, TWO_PI); 
    }


      newPosF[networkSize-1]= angleToInterpolateBis;

      sphere(side*3);
      sphereDetail( 4*5); 
      //==================== 

      float rayon=displacement;
      float polarToCartesionX= displacement*cos(newPosF[networkSize-1]);
      float polarToCartesionY= displacement*sin(newPosF[networkSize-1]);

      //  mouseX= (int) polarToCartesionX; // to draw circle with end
      //  mouseY= (int) polarToCartesionY; // to draw circle with end
     activeSamplingInternalClock(measureRecordStartBis);  //start
     stopSamplingInternalClock(measureRecordStopBis);  //stop sampling  
     samplingMovementProBis(); 

      rotate (HALF_PI);
  }