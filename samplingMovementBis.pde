void samplingMovementProBis()
{
   if (bRecordingBis) {  // draw circle
                     //   circle( mouseX, mouseY, 10 );
                     //   sampler.addSample( mouseX, mouseY );
    textSize(100);
    fill(0, 255, 0);
    text(measure, 200, 100);
    samplerBis.addSample(angleToInterpolateBis);
    text ( " angleToInterpolateBis " + angleToInterpolateBis + " movBis " + movementInterpolatedBis, 200, 200+100);
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
    textSize (100); 
    text 
     ( "OVERDUB enc[0] " + encodeur[0] + " ableton[5] " + ableton[5] + " newPosF[ne-1] " + newPosF[networkSize-1] + " " + // synchroOnMeasure + " " + (formerMeasure != measure) + " " +
       "samplingM " + samplingWithMouse + " mouseY " +  mouseY + " measure "  +  measure + " actualSec " + actualSec, -width/4, - height-300 );

       if (measure>=measureRecordStartBis && measure<=measureRecordStopBis ) { 
        // int disableDriver=-5;
          int disableDriver=15;

          int driverNetWorkSizeOnOff=-5; // disable
         // int driverNetWorkSizeOnOff=15; // notdisable
          int timeElapsedBackingPosition = 8000;
          int dataNoComputed=-4;
             send24DatasToTeensy6motorsToLittleMachine( 3, disableDriver, dataNoComputed, -1, driverNetWorkSizeOnOff, timeElapsedBackingPosition); // 
             send24DatasToTeensy10motorsToBigMachine(5, disableDriver, dataNoComputed, -1); // 
       }

       if ( measure>=measureRecordStopBis ) { 
          int disableDriver=15;
          int driverNetWorkSizeOnOff=15;
          int timeElapsedBackingPosition = 1000;
          int dataNoComputed=-4;
             send24DatasToTeensy6motorsToLittleMachine( 3, disableDriver, dataNoComputed, -1, driverNetWorkSizeOnOff, timeElapsedBackingPosition); // 
             send24DatasToTeensy10motorsToBigMachine(5, disableDriver, dataNoComputed, -1); // 
       }
     //====================DIFFERENT  OVERDUBBING

      if (samplingWithMouse==false  && abletonLFO==true && music_from_ableton_live == " pleasureKraftNo " && overDub == true) //madRush
    {   
         angleToInterpolateBis = (float) map(movementInterpolated, 0, TWO_PI , TWO_PI, 0); 
    }
 
     //======================

      if (samplingWithMouse==false  && abletonLFO==true && music_from_ableton_live == " pleasureKraft " && overDub == true)
    {    
       
       float angleFromTeensy = (float) map (abs(encodeur[0]), 0, 4000, 0, TWO_PI)%TWO_PI;  // tourner CCW  // encoder[0] normaly follow movementInterpolated /
       // find a solution in teensyPos and may mapPropagation :    angleFromTeensy is a perfect circular at this point
       angleToInterpolateBis = (float) map(angleFromTeensy, 0, TWO_PI , 0, TWO_PI); 
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
     activeSamplingInternalClockBis(measureRecordStartBis);  //start
     stopSamplingInternalClockBis(measureRecordStopBis);  //stop sampling  
     samplingMovementProBis(); 

     // rotate (HALF_PI);
}