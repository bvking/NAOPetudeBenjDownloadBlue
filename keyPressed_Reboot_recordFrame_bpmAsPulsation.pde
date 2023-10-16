void keyPressed() {
  
  // reBoot();
  // to modulate Knob with control controlIP5knob
  switch(keyCode) {
    case(DOWN):
    valueOfKnobA-=5;
    myKnobA.setValue( valueOfKnobA);
    break;
    case(UP):
    valueOfKnobA+=5;
    myKnobA.setValue( valueOfKnobA);
    break;
  }
  //------

  // set movement with good key and good keyCode
  setMovement(key, true);
  if (keyCode == ALT) { // .. in Keypressed
    moveKeys[8]=true;
  }
  //------


  if (key == '@'|| keyCode == ESC) {
    startStop=3;
    OscMessage myMessage15= new OscMessage("/startStop");
    myMessage15.add(startStop);
    oscP5.send(myMessage15, myRemoteLocation);
    reBoot();
  }

  frameResolution();

  if ((key == '!'  ) ) {
    text ("STOP MOVEMENT AND TIMER: and BPM ;) when restart slowly", 400, -400); //     // Toggle between sketch paused - running_Timer
    formerKey = '!'; // to prepare the next start. With the touch A you can trig play in live

    startStop= 3;
    println ( startStop ); // = STOP
    //stopboolean= true;

    String dataMarkedToDue  ="<"
      // + mapAcceleration[11]+","+ int  (bpmToSend)  +","+cohesionCounterHigh+","+ onOFF+","+nextScene+","
      + mapAcceleration[4]+","+ mapAcceleration[3]+","+mapAcceleration[2]+","+ mapAcceleration[1]+","+mapAcceleration[0]+","

      // +(VirtualPosition[11]) +","+VirtualPosition[2] +","+VirtualPosition[11] +","+VirtualPosition[0] +","+VirtualPosition[11] +","
      //  +int (phazi[11])+","+int (phazi[0])+","+int (phazi[11])+","+int (phazi[0])+","+int (phazi[11])+","

      //  +modPos[11]+","+modPos[10]+","+modPos[9]+","+modPos[8]+","+modPos[7]+","+modPos[6]+","+modPos[5]+","+modPos[4]+","+modPos[3]+","+modPos[2]+","+modPos[1]+","+modPos[0]+ "," // to manage 12 note

      +cohesionCounterLow +","+ cohesionCounterHigh +","+ int (map (LevelCohesionToSend, 0, 1, 0, 100))+ ","+ startStop + ">";

    print ("dataStop: ");
    println(frameCount + ": " +  " dataMarkedToDue" + ( dataMarkedToDue ));

    //      encoderReceiveUSBport101.write(dataMarkedToDue );

    running_Timer = false;


    if (isLooping()) {

      pause_start_time = millis();

      noLoop();
    }
  }
  // else if (keyCode == BACKSPACE) {
  else if (key == '!') {
    /*
      running_Timer = true; // TRIG the TIMER
     int m = millis();
     lastMillis = m;
     
     sketch_pause_interval = millis() - pause_start_time;
     
     println("Paused at " + millis() + " for " + sketch_pause_interval + "ms");
     */
    noLoop();
    lastMillis=0;// restart period  oscillation number 11 to 0 ms
    timeFrame=1;
    frameCount=1; // restart the begining of the program
  }
  if (key == ':'||key == '=') {
    if (key == ':') {
      //    frameRatio=30;
      //    frameRate(frameRatio);
    }
    if (key == '=') {
      //    frameRatio=frameRatio+30;;
      //   frameRate(frameRatio);
    }

    running_Timer = true; // TRIG the TIMER
    int m = millis();
    lastMillis = m;

    sketch_pause_interval = millis() - pause_start_time;

    println("Paused at " + millis() + " for " + sketch_pause_interval + "ms");

    loop();
  }


  if (key == '-'  ) //&& song.isPlaying()
  {
    //  song.pause();
  }
  if (key == '_')
  {
    // simply call loop again to resume playing from where it was paused
    //  song.rewind();
  }
}

void reBoot() {

    if (formerFormerKey == '@' || keyCode == ESC) {
  
    if (millis()>= formerEvent[3]) {

    output.println("1999999:0:0:0:0");
    output.println("2000000:0:0:0:0");
    output.flush();
    output.close();
    // startStop= 3;
    exit();
    }
   }

   if (key == '@' || keyCode == ESC) {

    formerKeyMetro = '$';
    modeCircular  = true;
    key = '°'; keyPressed(); // stop ball

    for (int i = 0; i < networkSize; i++) {
         dataMappedForMotorisedPosition[i]=0;
    }
      // formerEvent[2]= millis();
    //if (millis()>formerEvent[2]+2000) {
       key = '9'; keyPressed (); // aligne les ballee

      text ( " send24datasFromRecordFrameFuncrtion?? circularMov " + modeCircular , 200, 200);
      send24DatasToTeensy10motorsToBigMachine(3,-3,3,-1); // 3,-3,3,°-3
    }
}
/*
      if (networkSize==10){

      dataFromMode = "<"

     + dataMappedForMotorisedPosition[7]+ ","+ dataMappedForMotorisedPosition[6]+ ","
     + dataMappedForMotorisedPosition[7]+ ","+ dataMappedForMotorisedPosition[6]+ ","
    
    + dataMappedForMotorisedPosition[5] + "," + dataMappedForMotorisedPosition[4] + "," + dataMappedForMotorisedPosition[3] + "," + dataMappedForMotorisedPosition[2] + ","
    + dataMappedForMotorisedPosition[1] + "," + dataMappedForMotorisedPosition[0] + ","      // 
    
   
    
    + 0 + "," + 0 + ","
    + 0 + "," + 0 + ","
    
    //+  accelerationRatio + "," + driver0_On_Off + "," + computeData + "," + eraseProcessingData + ","
    
    +0+","+0+","+0+","+0+","//+0+","+0+","
    
    + TrigmodPos[5] + "," + TrigmodPos[4] + "," + TrigmodPos[3] + "," + TrigmodPos[2] + "," + TrigmodPos[1] + "," + TrigmodPos[0] + "," // to manage 6 note or effect
    
    + 0 + "," + 0 + "," + 0 + "," + 0 + ">";

    }  
    
    int computeData = -2;
    if (computeData <-  1) {
        dataTransformed = " dataNotComputeInTeensy from mode ";
        println(frameCount + ": " + dataTransformed +  keyMode + " " +   dataFromMode);
        
    }
    
    else if (computeData >-  1) {
        dataTransformed = " dataComputeInTeensy from mode ";
        println(frameCount + ": " + dataTransformed +  keyMode + " " +   dataFromMode);
    }
    
    
    if (onlyLitteMachineWithSecondSerialPort)  {   // // If not null, then a match was found    
      //  teensyport.write(dataFromMode);
         
        if (frameCount <=  200)  { 
            text("Data port USB connected to port2" + portsUSBfrom2 + " ending with -0001 ", 0, 700); 
            println("Data port USB connected to port2" + portsUSBfrom2 + " ending with -0001 ");  
        }
    }
    
    if (portOfBigMachineConnected)  {   // // If not null, then a match was found
        
        if (frameCount <=  200)  { 
            text("port NOT USB connected to little with portUSBfrom2" + portsUSBfrom2 + " ending with 101 ", 0, 700); 
            println("port NOT USB connected to little with portUSBfrom2 " + portsUSBfrom2 + " ending with 101 ");   
        }
    }
    
    if (portsUSBfrom2 == "NC")  {   // // If  null, then a match was not found
        
        if (frameCount <=  200) { 
            text("NO port connected " + portsUSBfrom2 + " ", 0, 700); 
            println("NO port connected " + portsUSBfrom2);   
        }
        
        if (frameCount ==  1) noLoop();
        
    }
    rotate(PI / 2);

     // send24DatasToTeensy6motorsToLittleMachine (10, 3, -3, 2); // 2 means erase data in Teensy
    //  }
    formerEvent[3]= millis();
    
  }
 }
*/
void recordFrame() {
  // if (frameCount !=formerFrame && (key != '!' && key != ':')  ){// do not record ! && :   // (frameCount !=formerFrame && key != '!' && key != ':') do not record ! only
  //if (frameCount !=formerFrame || key != key || key != '!' || key != ':' || key != ',' || key != ';'|| key != '=') {// do not record ! && :   // (frameCount !=formerFrame && key != '!' && key != ':') do not record ! only
  if (2>=1 ) { // frameCount !=formerFrame  && ( key != '!' || key != ':' || key != ',' || key != ';'|| key != '=')
    recordBis();
    formerFrame= frameCount;
  }
}


void bpmAsPulsationFunction() {
  // MIDDLE if ((PendularOldLeftVirtualPosition[i]+800 <= 800 && PendularLeftVirtualPosition[i]+800 >=800) ||
  //     (PendularOldLeftVirtualPosition[i]+800 >= 800 && PendularLeftVirtualPosition[i]+800 <=800)) {

  // in pendular way, revolution trig 0 on the right and rev trig 0 on left side

 /// if ( revolution[networkSize-1]==0 ){  // work bad at frameRate(30)
  if ( TrigmodPos[networkSize-1]==0) {
    if (!ready) {
      ready = true;
      prev_time = millis();
    } else if ( revolution[networkSize-1]==1) { // TrigmodPos[networkSize-1]==1||  revolution[0]==1
      int curr_time = millis();
      pulsation = avgTimer.nextValue(curr_time - prev_time);
      prev_time = curr_time;
      textSize (100);
    }
  }
  textSize (200);
 
}