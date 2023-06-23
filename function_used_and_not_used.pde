void BEAT_DETECT () {
  // end beatdetect
}

void manageCoupling() {
 
  if (orderParameter<=0.01  ) { //  net.velocity[0]<0 && net.velocity[0]>-1.46c
    coupling= (-coupling);
    //  coupling = exp(abs(coupling));
    net.setCoupling(coupling);
  } else  if (orderParameter>=0.1  ) {
    coupling = map ((float (mouseX)/width*1), 0, 1, -10, 10 );
    net.setCoupling(coupling);
  } 
  print ("coupling_Managed");    
  println ( coupling);
} 

void  doSEVEN() {

  //  if (frequencyEnergy(k)>1.7 ) {
  if ((K>199 && H <200)&& S>150) {
    //   if ((H>199 && H <200)&& S>150){

    print (" doSEVEN()doSEVEN()doSEVEN()doSEVEN()doSEVEN()doSEVEN()doSEVEN()doSEVEN()doSEVEN()");

    //   key='M'; keyPressed();
    key='4'; 
    keyReleased(); // '6';
    // find something actualising or doing case 7 automatical when kick is upper than 1.7
  }
}
void devant_derriere() {
  //    if ( (net.phase[networkSize] && rev[networkSize])  > (net.phase[0] && rev[0])){//     (net.phase[0] >  (j[i]==0 && rev[i]<0))  { 

  if ( (net.phase[9]  > net.phase[0]) &&  ( rev[9]  > rev[0]+2)) {//     (net.phase[0] >  (j[i]==0 && rev[i]<0))  { 

    print (" net.phase[9] "); 
    print ( net.phase[9] );  
    print (" net.phase[0 "); 
    print ( net.phase[0] ); 
    key = '3'; 
    keyReleased();
  }

  if ( (net.phase[0]  > net.phase[9]) &&  ( rev[0]  > rev[9]+2)) {//     (net.phase[0] >  (j[i]==0 && rev[i]<0))  { 

    print (" net.phase[9] "); 
    print ( net.phase[9] );  
    print (" net.phase[0 "); 
    print ( net.phase[0] ); 
    //       key = 'O'; keyPressed ();   
    key = '4'; 
    keyReleased();
  }
}


void countRevs() { // ============================================= Ter NE PAS TOUCHER LE COMPTEUR ou Reduire l'espace avant et apres 0 pour eviter bug à grande vitesse

  onOFF=0;

  for (int i = 0; i < networkSize; i++) { 
//**    print (net.oldPhase[i]); print ("count rev ");   println (net.phase[i]); 
    // decrement caused by negative angular velocity
    // both positive angles || both negative angles || positive-to-negative angle
    //   if (//(net.oldPhase[i] < 0.25 * PI && net.phase[i] > 1.75 * PI) ||//
    if (
      ((net.oldPhase[i] < 0.25 *PI && net.oldPhase[i]>0)  && (net.phase[i] > -0.25* PI && net.phase[i] <0))  || 
      (net.oldPhase[i] < -1.75 * PI && net.phase[i] > -0.25 * PI)// ||
      // (net.oldPhase[i] < 0.25 * PI && net.phase[i] > -0.25 * PI)
      ) {
      onOFF = 1;
      //    TrigmodPos[i]=0;
      rev[i]--;
      //      print (" revultion negative  "); println (revolution[i]=i+1);
      //   revolution[i]=i+1;
      revolution[i]=0; // trig 0 to sent 0 in Max4Live
  //**    memoryi=i;


      decompte[i] = -1; // // RESET COUNTER AT 0 (i know it's strange, otherwise with 0 it begin at 1, not 0)
    } else { // if you do twice there is a funny bug
      //    decompte[i]  ++; 
      //   revolution[i]=0;
    }


    // increment caused by positive angular velocity
    // both positive angles || both negative angles || negative-to-positive angle

    if (
      ((net.oldPhase[i] > -0.25 *PI && net.oldPhase[i]<0)  && (net.phase[i] < 0.25* PI && net.phase[i] >0))  || 
      (net.oldPhase[i] > 1.75 * PI && net.phase[i] < 0.25*PI)
      ) {
      onOFF = 1;
      //   TrigmodPos[i]=0;
      rev[i]++;
      //   revolution[i]=i+1;
      revolution[i]=0;   // trig 0 to sent 0 in Max4Live
  //**    memoryi=i;
      decompte[i] = 0;  // RESET COUNTER AT 0
    } else {

      decompte[i]  ++; //START COUNTER when a REVOLUTION START OR FINISH

      revolution[i]=1;
    }
     if (  revolution[i]<1) {
  print (" revolution[i] "); print ( memoryi); print ("  "); println (revolution[memoryi]);
    }
  }
  
  /*
  if (

    (net.oldPhase[memoryi] < -1.75 * PI && net.phase[memoryi] >= -0.25*TWO_PI) || ( net.phase[memoryi]<=-TWO_PI+0.23  && net.phase[memoryi] >= -0.25*TWO_PI ) 
    ) {
    onOFF = 1;
    //   background (27,59,78);
    //    TrigmodPos[i]=0;
    rev[memoryi]--;

    // memoryi=i;


    decompte[memoryi] = -1; // // RESET COUNTER AT 0 (i know it's strange, otherwise with 0 it begin at 1, not 0)
  }
 */
}  

void printSummary(int i) {
  /*
    print("oldphase "); print(i); print(" ");
   print(net.oldPhase[i]); print(" ");
   print("phase "); print(i); print(" ");
   print(net.phase[i]); print(" ");
   print("velocity"); print(i); print(" ");
   print(net.velocity[i]); print(" ");  
   print("frequency "); print(i); print(" "); 
   print(net.naturalFrequency[i]);
   print("OldFrequency "); print(i); print(" "); 
   println(OldFrequency[i]);
   */
}
  
void readOneLine() { // read data from recordBis()

  String[] current = split(lines[index], ':');
  frameCountRed = int (current[1]);
    print ("  frameCountRed ");  println (  frameCountRed);
 
  keyCode =  int (current[2]);
     print ("  keyCode ");  println ( char(keyCode) );
  couplingRed= int(current[3]);
  Movement= int(current[4]);
  keyModeRed= (current[5]);
  print ("  MovementRed ");  println (  Movement );
 // movement=  Movement/1000;
  if (++index == lines.length - 1) {
    exit();
  }
  nextFrame = int(split(lines[index], ':')[0]);
}   
void recordBis() {
  
if (frameCount>=0) { 
  if (formerFrame!=frameCount) {
  //  if (formerKey!=key  || formerKeyCode!=keyCode) {
   
 //       if (formerCoupling!=coupling) {
      //    if (formerAutomation1!=automation1) { 
       //     if (formerKeyMode!=keyMode) { 
            
    output.println(frameCount +  ":" + int (keyCode) + ":" + int (coupling*1000) + ":" + int (automation1*1000) + ":" + keyMode);
    //    } }  } }
   //   }
    }
  }
}

void recordTer() {
  
if (frameCount>=0) { 
  if (formerFrame!=frameCount) {
    if (formerKey!=key) {
      if (formerKeyCode!=keyCode) {
        if (formerCoupling!=coupling) {
          if (formerAutomation1!=automation1) { 
       //     if (formerKeyMode!=keyMode) { 
            
    output.println(frameCount + ":" + (int)key + ":" + (int)keyCode + ":" + int (coupling*1000) + ":" + int (automation1*1000) + ":" + keyMode);
        } }  } //}
      }
    }
  }
}

void bpmAsPulsationFunctionOscillator_networkSize() {

  if (formerKeyMetro == '$' || formerKeyMetro == 'à') { 

    if (decompte[11]>=0 && decompte[11]<1 && isLooping()) {    
      println ("TEST OK");   // if oscillator 11 is at his position 0
      //    if (TrigmodPos[11]>=0 && TrigmodPos[11]<1 && isLooping()){    println ("TEST OK");   // if oscillator 11 is at his position 0
      if (!ready) {
        ready = true;
        prev_time = millis();
      } else {
        int curr_time = millis();

        avgTimer.nextValue(curr_time - prev_time - sketch_pause_interval);

        sketch_pause_interval = 0;

        println("'a' key pressed at " + curr_time);

        prev_time = curr_time;
      }
    }
  }

  if (formerKeyMetro == '£' || formerKeyMetro == '*') { 

    if (decompte[11]>=0 && decompte[11]<1 && isLooping()) {    
      println ("TEST OK");   // if oscillator 11 is at his position 0
      //  if (TrigmodPos[11]>=0 && TrigmodPos[11]<1 && isLooping()){    println ("TEST OK");   // if oscillator 11 is at his position 0

      if (!ready) {
        ready = true;
        prev_time = millis();
      } else {
        int curr_time = millis();

        avgTimer.nextValue(curr_time - prev_time - sketch_pause_interval);

        sketch_pause_interval = 0;

        println("'a' key pressed at " + curr_time);

        prev_time = curr_time;
      }
    }
  }
}

MovingAverage avgTimer = new MovingAverage(2);



/**
 
 * Use  a circular array to store generation step impl. times
 
 * and calculate a moving average.
 
 * 
 
 * Specify the number of values to include in the moving average when
 
 * using the constructor. 
 
 * 
 
 * The implementation time is O(1) i.e. the same whatever the number 
 
 * of values used it takes the same amount of time to calculate the
 
 * moving average.
 
 * 
 
 * @author Peter Lager 2021
 
 */

private class MovingAverage {

  private float[] data;

  private float total = 0, average = 0;

  private int idx = 0, n = 0;



  /**
   
   * For a moving average we must have at least remember the last 
   
   * two values.
   
   * @param size the size of the underlying array
   
   */

  public MovingAverage(int size) {

    data = new float[Math.max(2, size)];
  }



  // Include the next value in the moving average

  public float nextValue(float value) {

    total -= data[idx];

    data[idx] = value;

    total += value;

    idx = ++idx % data.length;

    if (n < data.length) n++;

    average = total / (float)n;

    return average;
  }



  public void reset() {

    for (int i = 0; i < data.length; i++)

      data[i] = 0;

    total = n = 0;
  }


  public float average() {

    return average;
  }
}


void frameratio() { 
  //**************************FRAME RATE    ***********CONTROL FRAME RATIO SPEED

  if ((key == ',')) {
    if (frameRatio>4 ) {// frameRatio !=0 || 
      frameRatio=frameRatio-5;  
      frameRate(frameRatio);
      text((frameRatio), -width/2, -height );
    } else {
      println ("CAREFULLLLLLLLLLLLLLLLLLLLLLLLLLL");
      frameRatio =0; 
      frameRate(frameRatio);
      text((frameRatio), -width/2, -height );
    }
  }

  if ((key == ';')) {

    //int frameRation

    frameRatio +=5;
    if ( frameRatio >=180) {
      frameRatio=60;
    }
    frameRate(frameRatio);
    text((frameRatio), -width/2, -height );
  }
  /*
   if (key == ':') {
   //  frameRatio=30;frameRate(frameRatio); // 30/5 = 6 frameRate ==> 124/5 = 24.8 BPM record. 124/3
   text((frameRatio), -width/2, -height ); 
   if (key == '='){
   frameRatio=30;frameRate(frameRatio);
   text((frameRatio), -width/2, -height ); 
   } 
   
   }
   */
  if (key == '=') {
    //  frameRatio=45;
    frameRatio=30;
    frameRate(frameRatio);
    text((frameRatio), -width/2, -height ); 
    //processingnodata
  } 



  //***********CONTROL FRAME RATIO SPEED
  if (key == '+') {
    frameRatio=120;
    frameRate(frameRatio);
    println ("MAXIMMMMMMMMMMUMMMMMMM");
    text((frameRatio), -width/2, -height );
  }
} 
void keyPressed() {
  // to modulate Knob with control controlIP5knob
  switch(keyCode) { 
  case(DOWN): valueOfKnobA-=5; myKnobA.setValue( valueOfKnobA);break;
  case(UP):   valueOfKnobA+=5; myKnobA.setValue( valueOfKnobA);break;
  }
  //------

  // set movement with good key and good keyCode
   setMovement(key, true); 
   if (keyCode == ALT){ // .. in Keypressed
    moveKeys[8]=true;
   }
  //------
  
 
  if (key == '@'|| keyCode == ESC) {
    startStop=3;
    OscMessage myMessage15= new OscMessage("/startStop");
    myMessage15.add(startStop);
    oscP5.send(myMessage15, myRemoteLocation);
  }   

  frameratio();

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
   else if (key == '!')  {
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

void recordFrame() { 

  if (key == '@' || keyCode == ESC) {

    keyMode = " phasePattern ";
    key = '9'; // aligne les ballee
     for (int i = 0; i < networkSize; i++)  {
     // dataMappedForMotorisedPosition[i]=0;
    println ( " send24datasFromRecordFrameFuncrtion?? ");
    send24DatasToTeensy6motorsToLittleMachine (10,3,-3,1); // 1 means erase data in Teensy
  
  }
 
    //  key='j'; keyReleased();
    output.println("1999999:0:0:0:0");
    output.println("2000000:0:0:0:0");
    output.flush();
    output.close();
    // startStop= 3;
    exit();
  }

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

  //   if ( revolution[networkSize-1]==0 ){  // work bad at frameRate(30)
   if ( TrigmodPos[networkSize-1]==0){ 
    if (!ready) {
      ready = true;
      prev_time = millis();
    } else if (TrigmodPos[0]>0 ||  revolution[0]>0 ) {
      int curr_time = millis();
      pulsation = avgTimer.nextValue(curr_time - prev_time);
      prev_time = curr_time;
      textSize (100);
    }
  }
     rotate (-PI/2);
     text("Average time between two pulsation = " + pulsation + "ms", -2200, -500 );
     rotate (PI/2);

}

void bpmAsfrequencyfunction () { 
  for (int i = 0; i < networkSize; i++) {
    //  bpmFrequency[i]= net.naturalFrequency[i]*60/4.608*4; // frequencey=1 ==> 1 round in 4.68 sec // *4 is to give an good beat scale
    bpmFrequency[i]= net.naturalFrequency[i]*54.54;
  }          
  if (abs (bpmFrequency[networkSize-1])>= abs (bpmFrequency[0])) {
    bpmToSend= abs(bpmFrequency[networkSize-1]);
  } else  bpmToSend= abs(bpmFrequency[0]);

  print (" bpmToSend");    
  print (" "); 
  print (bpmToSend); 
  println (" ");
}

void SoundmouseMoved()
{

  //      rez= constrain( map( orderParameter, 0, 1, -1, 1), 0, 1 );  
  //       rez= abs (constrain( map( orderParameter, 0, 1, -1, 1), -1, 1 ));

  //   volumei[0]= abs (speedi[0])*vol; // when vol = -1 && speed (0, 10)--> vol decrease.

  //    volumei[0]= abs (-speedi[0])*vol; // when vol = -1 && speed (0, 10)--> vol decrease.

  // volume to go from -50 to 0


  for (int i = 0; i < networkSize; i++) {

    speedi[i]=  (map ((net.velocity[i]*10000), -1000, 1000, -1, 1));
    //         print ("speedi[i "); print (i); print (" "); print  ( speedi[i]); // with this map until case 4 we go from -60 to 60
    //   speedi[i]= map ( (phazi[i]), 0, 14000, -1, 1); // Chnager d'echelle
    //     print ("velocity9 "); print (i);  print (" "); print ( net.velocity[i]); print (" ");  
    print ("speedi "); 
    print (i);  
    print (" "); 
    print ( speedi[i]);         


    volumei[i]= map ((speedi[i]), -1, 35, -50, 6); // 35 is the speed max.
    //       print ("volumei "); print (i); print (" "); print ( volumei[i]);  
    //**************************************************************   SET     VOLUME   WITH SPEED     
    /*
           out0.setGain(volumei[0]);
     out1.setGain(volumei[1]);
     out2.setGain(volumei[2]);
     out3.setGain(volumei[3]);
     out4.setGain(volumei[4]);
     out5.setGain(volumei[5]);
     out6.setGain(volumei[6]);
     out7.setGain(volumei[7]);
     out8.setGain(volumei[8]);
     out9.setGain(volumei[9]);
     
     */
  }

  float RealVelocity9 =   net.velocity[9]/20*2.4; // round*s-1
  float RealVelocity0 =   net.velocity[0]/20*2.4; // round*s-1

  float   bPM_Boundary9 = map (  RealVelocity9, 0, 0.5, 0, 120);// Half a round is the tempo.
  float   bPM_Boundary0 = map (  RealVelocity0, 0, 0.5, 0, 120);// Half a round is the tempo.

  if (bPM_Boundary9 >= bPM_Boundary0) { 
    bPM9= abs(bPM_Boundary9);
  } else  bPM9= abs(bPM_Boundary0);

  print ("velocityReel9 ");    
  print (" "); 
  print ( RealVelocity9); 
  println (" ");  

  print ("BPM9  ");    
  print (" "); 
  print ( bPM9); 
  println (" ");  

  //     constrainedBPM = int (map (bPM9, 0, 400, 20, 200));

  constrainedBPM = int (bPM9);

  print ("constrainedBPM");    
  print (" "); 
  print ( constrainedBPM); 
  println (" ");  




  for (int i = 0; i < networkSize; i++) {

    volumei[i]=-50;
  }
  println ();
}

void devant_derriereAutre() {
  if ( (net.phase[9]  > net.phase[0]) &&  ( rev[9]  > rev[0]+1)) {//     (net.phase[0] >  (j[i]==0 && rev[i]<0))  { 

    print (" net.phase[9] "); 
    print ( net.phase[9] );  
    print (" net.phase[0 "); 
    print ( net.phase[0] ); 
    key = 'O'; 
    keyPressed ();
  }

  if ( (net.phase[0]  > net.phase[9]) &&  ( rev[0]  > rev[9]+1)) {//     (net.phase[0] >  (j[i]==0 && rev[i]<0))  { 

    print (" net.phase[9] "); 
    print ( net.phase[9] );  
    print (" net.phase[0 "); 
    print ( net.phase[0] ); 
    key = '3'; 
    keyReleased ();
  }
}

void SHOW_DATA () {

  // float orderParameter = net.getOrderParameter();
  orderParameter = net.getOrderParameter();

  stroke(100);
  fill(100);


  // float ordometer=  net.orderParameter;  //float ordometer=  orderParameter;
  String ordometer = String.format("Order: %.2f", orderParameter);
  text(ordometer, -width*1.5, 0);

  String couplingFormat = String.format("Coupling: %.2f", coupling);
  text(couplingFormat, -width*-1, 0);


  float ordoMapped= map (orderParameter, 0, 1, 1, 0);



  float orderToexpOpp= 1- exp(-ordoMapped); // ( 0 to 0.632)
  text (orderToexpOpp, -width*1.5, -100);

  //******* THIS ONE (opposed and exponentionalised)?
  float orderToexpOppNormalised = map ( orderToexpOpp, (1-exp(-1)), 0, 1, 0); //( 0 to 1)
  text ( orderToexpOppNormalised, -width*1.5, -200);

  int orderToexpOppNormalisedLive = int (map ( orderToexpOpp, (1-exp(-1)), 0, 127, 0)); //( 0 to 1)
  text ( orderToexpOppNormalisedLive, -width*1.5, -300);



  float orderToexp= 1- exp(-orderParameter); //(0 to 0.632***
  text (orderToexp, -width*1.5, 100);


  float orderToexpMapped = map (orderToexp, 0, (1-exp(-1)), 0, 1);
  text (orderToexpMapped, -width*1.5, 200);

  //******* THIS SECOND ONE    
  float orderToexpMappedBis = map (orderToexp, 0, (1-exp(-1)), 1, 0); // map order from "orderexponnentionnalised scale 0 to 0.640" to linear 1 to 0 
  text (orderToexpMappedBis, -width*1.5, 300);  

  orderToexpMappedOpposedLive =int  (map (orderToexpMappedBis, 0, 1, 0, 127)); // map "order exp and linearised from 0 to 127 to use it in Ableton
  text (orderToexpMappedOpposedLive, -width*1, -300); // BEST MAPPING

  int  orderParameterLiveSimple  =int  (map (orderParameter, 0, 1, 127, 0));
  text (orderParameterLiveSimple, -width*0.5, -300);


  // ********************    
  //    mapAcceleration[i]= constrain ((int (map (abs(net.acceleration[i] *100), 0, 1000, 0, 255))), 0, 255); 

  text (map (mapAcceleration[0], 0, 255, 0, 127), -width*2, -1000); 
  text (map (mapAcceleration[9], 0, 255, 0, 127), -width*0, -1000); 


  float normalizeAcc0 = map ( mapAcceleration[0], 0, 255, 0, 1); 

  float acc0Toexp= 1- exp(-normalizeAcc0);
  text (acc0Toexp, -width*1.5, -700); 

  float acc0ToexpMappedBis = map (acc0Toexp, 0, (1-exp(-1)), 0, 1); // map acceleration0 from "orderexponnentionnalised scale 0 to 0.640" to linear 1 to 0 
  text (acc0ToexpMappedBis, -width*1, -700);  

  acc0ToexpMappedBisLive =int (map ( acc0ToexpMappedBis, 0, 1, 0, 127));
  text (acc0ToexpMappedBisLive, -width*1, -1000); // BEST MAPPING

  float normalizeAcc9 = map ( mapAcceleration[9], 0, 255, 0, 1);
  float acc9Toexp= 1- exp(-normalizeAcc9);

  float acc9ToexpMappedBis = map (acc9Toexp, 0, (1-exp(-1)), 0, 1);
  text (acc9ToexpMappedBis, -width*-0.5, -700);  

  acc9ToexpMappedBisLive=int (map (acc9ToexpMappedBis, 0, 1, 0, 127)); // it stay no too long between 0 and 60, more 60 to 127
  text (acc9ToexpMappedBisLive, -width*-1, -1000); // BEST MAPPING

  print ("acc0 & acc9 exp "); 
  print (acc9ToexpMappedBisLive); 
  print (" ");  
  println (acc9ToexpMappedBisLive);

  /* 
   float orderToexpOpposed= 1- exp(-ordoMapped);
   text (orderToexpOpposed,  -width*1.5, 200);
   */
}

void record() {

  // to STOP record touch @

  if (key == '@') {
    output.flush();
    output.close();
    exit();
  }// else { 
  //   else if (((formerCoupling != coupling) && frameCount %2==0 )|| ((formerCoupling == coupling) && frameCount %2==1)) { // tester l'ancien couple 
  // 
  //      else if (frameCount !=formerFrame){

  if (((((coupling <0 && formerCoupling <0) && coupling < formerCoupling-0.1) || ((coupling >0 && formerCoupling>0) && coupling>formerCoupling+0.1 )) || 
    (((coupling >0 && formerCoupling >0) && coupling < formerCoupling-0.1) || ((coupling <0 && formerCoupling<0) && coupling>formerCoupling+0.1 ))) 

    //  
    //&& (frameCount !=formerFrame )

    // ||  ((formerKey < Key))

    //||(formerKeyCode == int (keyCode)))))


    )
  {

    output.println(frameCount + ":" + (int)key + ":" + (int)keyCode + ":" + int (coupling*1000));
  }
}

void pendularPatternLFO(){ // trigged with J
    println( "pendularPatternLFO right DECREASE phase shifting  witch formerStartKey ")  ; // Incremente together without changing phases   

       
 //   if ((formerSartKey == 'X' || formerSartKey == 'x' || formerSartKey == 'W' || formerSartKey == 'w' || formerKeyMetro  == 'J')) {
       if (keyCode == RIGHT) { 
        k=k-QUARTER_PI/8;
     
   /*  
     if (k<=-8*QUARTER_PI/2) { 
         k = 8*QUARTER_PI;
      }
   */   
  
    }
//  }
  if (keyCode == LEFT) { 
//    println(" pendularPatternLFO left INCREASE phase shifting"); // Incremente together without changing phases  
    if ((formerSartKey == 'X' || formerSartKey == 'x' || formerSartKey == 'W' || formerSartKey == 'w' || formerKeyMetro == 'J')) {
      k= k+QUARTER_PI/8;
      k= k%(8*QUARTER_PI/8);
    }
    if (k>=9*QUARTER_PI/8) { 
   //   k=-k;
    }    
   
  } 

  if (keyCode == DOWN) { 
    println("pendularPatternLFO UP by 2 and change way of LFO2 "); //   TAB -
    for (int i = 2; i < 3; i++) { 
      LFO[i]= map (LFO[i], 0, 1, 0, TWO_PI);
      /*
         if (LFO[i]>=0 && LFO[i]<=1 ) {  
       LFO[i]= map (LFO[i], 0, 1, 0, TWO_PI);
       }
       if (LFO[i]<=1 && LFO[i]>=0) {  
       LFO[i]= map (LFO[i], 1, 1, 0, -TWO_PI);     
       }
       */
    } 
    d=d-25;
    d=d%525;
    keyCode =SHIFT; // to trig only once
  } 
  if (keyCode == UP) { 
    d=d+25;
    d=d%525;
    println("pendularPatternLFO UP by 2 and change way of LFO2 "); //   TAB -
    for (int i = 2; i < 3; i++) { 
      //   LFO[i]= automation3;
      LFO[i]= map (LFO[i], 0, 1, 0, PI);
      printSummary(i);
    }
     keyCode =SHIFT; // to trig only once
  }

  if (keyCode == CONTROL) { 
    println("pendularPatternLFO INCREASE phases with special modulo   "); //P$ 
    //else if (key == 'π') { println("INCREASE phases with special modulo   "); //P$ 
    //  LFO[2]= automation3;
    for (int i = 0; i < networkSize; i++) {

      LFO[i]+= (HALF_PI/(networkSize-2))*(1*(networkSize-1-i)); //
      LFO[i] = LFO[i]%(TWO_PI/1);

      net.phase[i]=  LFO[i]%(TWO_PI/1);

      interPhase[i]= LFO[i]%(TWO_PI/1);
      printSummary(i);  
      keyCode =SHIFT; // to trig only once
    }
  }
  
   keyCode = SHIFT; // to trig only once
   print ("k= shiftingPhaseRatio ");println (k);
   
      text ( " k "+ (k*360) + " delay " + d, -width+800, - height+400);

}

void abletonPattern()
{
    for (int i = 0; i < (networkSize); i++) { 
    {
     oscillator[i]= map (oscillator[i], 0,1, 0, TWO_PI);  //************************************ SET LAST FREQUENCIES as OLD FREQUENCIES
     net.phase[i]= oscillator[i];
    }
  }
  
  /*
 if (formerKey == 'A') { //A$  Shift frequencies one by one. 
    float speeed    = map ((float (mouseY)/width*1.0), 0, 1, -1, 1); 
    speeed=1;
    for (int i = 0; i < networkSize; i++) {
      net.naturalFrequency[i]=OldFrequency[i]; 
      printSummary(i);
    }
    memoryi=11;
//    net.naturalFrequency[memoryi]= speeed;//4.68/2; // 124 bpm
    net.phase[memoryi]= speeed*oscillator[11];//4.68/2; // 124 bpm
  }

  if (formerKey == 'a') { //A$  Shift frequencies one by one. 
    float speeed    = map ((float (mouseY)/width*1.0), 0, 1, -1, 1); 
    for (int i = 0; i < networkSize; i++) {    
      net.naturalFrequency[i]=OldFrequency[i]; 
      printSummary(i);
    }
    memoryi=2;
   net.phase[memoryi]= speeed*oscillator[memoryi];    //4.68/2; // 124 bpm
  }
*/

 }

void circularWay () {
  //************************************ DONT TOUCH  //************************************ RESET OLD FREQUENCIES 
  
  ///******************************============================================================SHIFT SEVERAL OSCILLATOR AT THE SAME TIME

  if (key == 'i') { 
    print("  Shift frequencies one by one, or 5 by five ");
    // net.shiftPhases(5);   
    net.shiftPhases(1);
  }

  if (key == 'u') { //ucircular  Shift frequencies one by one. 
    //  net.shiftPhases(2); 
    net.shiftPhases(-1);
  } 

  if (key == 'I') { //  Shift frequencies one by one, or 5 by five
    // net.shiftPhases(5);   
    net.shiftPhases(1);
  }

  if (key == 'U') { //  Shift frequencies one by one. 
    //  net.shiftPhases(2); 
    net.shiftPhases(-1);
  } 


  // key ='#';  
} 


void formerx () {
  float k = 0.25;
  print ("char formerFormerKey x?  ");  
  println (char (formerFormerKey));
  print ("circularMov  ");  
  println (circularMov);
  if (circularMov==true ) {
    for (int i = 0; i < (networkSize-1); i++) {  
      PendularLeftVirtualPosition[i]= CircularVirtualPosition[i];
      PendularOldLeftVirtualPosition[i]= CircularOldVirtualPosition[i];
      PendularLeftVirtualPosition[i+1]= CircularVirtualPosition[i+1];
      PendularOldLeftVirtualPosition[i+1]= CircularOldVirtualPosition[i+1];
      print ("PendularLeftVirtualPosition "); 
      print (i); 
      print (" ");   
      print (PendularLeftVirtualPosition[i]); 
      print ("CircularVirtualPosition "); 
      print (i); 
      print (" ");   
      print (CircularVirtualPosition[i]);
    }
  } 
  for (int i = 0; i < networkSize-1; i++) {
    //  net.phase[i]=net.phase[11];

    print ("f: "); 
    println (f);

    net.phase[i]=(net.phase[11]+abstractPhase[i])%(TWO_PI/1);
    // net.phase[i] += (i+1)*0.05;
    net.phase[i]=  net.phase[i]%(TWO_PI);

    //    printSummary(i);


    print ("fmemory: "); 
    println (fmemory);

    //  key='#';
  }
  if (fmemory==k) {

    fmemory=0;
  }
} 

// Mexican-Hat spatial coupling
void initializeCoupling(float[][] Coupling, float sigma) {
  float[][] distance = distanceMatrix();
  for (int i = 0; i < networkSizeGraphic; i++) {
    for (int j = 0; j < networkSizeGraphic; j++) {
      float d = pow(distance[i][j] / sigma, 2);
      float c = (1 / (PI * pow(sigma, 4))) * (1 - 0.5 * d) * exp(-0.5 * d);
      Coupling[i][j] = c;
    }
  }
}

// Calculate the distance between oscillators
float[][] distanceMatrix() {
  float[][] distance = new float[networkSizeGraphic][networkSizeGraphic];
  for (int i = 0; i < networkSizeGraphic; i++) {
    int i1 = i % numCols;
    int j1 = int(floor(i / numCols));
    for (int j = 0; j < networkSizeGraphic; j++) {
      int i2 = j % numCols;
      int j2 = int(floor(j / numCols));
      distance[i][j] = dist(i1, j1, i2, j2);
    }
  }

  return distance;
}

// Set initial phases randomly
void initializePhase(float[] phase) {
  for (int i = 0; i < numRows; i++) {
    for (int j = 0; j < numCols; j++) {
      int index = i * numCols + j;
      phase[index] =  (QUARTER_PI*i);//FREQ ;//
    }
  }
}

// Set natural frequencies to the same random value
void initializeNaturalFrequency(float[] naturalFrequency, float freq) {
  for (int i = 0; i < numRows; i++) {
    for (int j = 0; j < numCols; j++) {
      int index = i * numCols + j;
      naturalFrequency[index] = freq;
    }
  }
} 

void printDataOnScreen() { 
   noStroke();
//**   /*
  text(formerFormerKey, -300, height +300); 
  text(formerKeyCodeAzerty, -100, height + 300);
  text(char (key), 100, height + 300);
  text(char (keyCode), 200, height +300)  ; 
  
    for (int i = 0; i < networkSize; i++) {
      
        text ("trig", -1200, height-500 - 75*i);
        text (TrigmodPos[i], -1000, height-500 - 75*i);
    
    }
  
  text ("mem", -800, height +300+100);
  text (memoryi, -600, height +300+100);
  if (TrigmodPos[networkSize-1]==0) {
   // counter11++;
    counter[networkSize-1]++;
  }  
  if (TrigmodPos[0]==0) {
    counter[0]++;
  } 
  text ( counter[networkSize-1], -600, height +300); 
  text ( counter[networkSize-1], -800, height +300); 
  text ("old", -1200, height +300+100);
  text (oldMemoryi, -1000, height +300+100);
  text ("mem", -800, height +300+100);
  text (memoryi, -600, height +300+100);
  text ("Ratio", -400, height +300+100);
  text (speedDelta, -200, height +300+100);
  text ("block", 0, height +300+100);
  text (oscillatorBlocked, 200, height +300+100);
  String Kratio = nf (k, 0, 1);
  text ("K phi", 0, height +300+200);
  text (Kratio, 200, height +300+200);
  text ("Fratio", 400, height +300+100);
  text (frameRatio, 600, height +300+100);
  text ("D btw case", 600, height +300+200);
  text (d, 1000, height +300+200);
//** */ 
  text ("FrameOffsetPhase11", -1000, height +400+200);
  text (delayTimeFollowPhase11, -200, height +400+200);
  text ("SpacephaseOffset11", 400,  height +400+200);
  text (degrees (phaseShiftingFollowPhase11), 1200, height +400+200);
  text ("measure ", -1000, height +800+200);
//  text (measure , -200, height +800+200);

  text ("Rec ", 800, height +300+0);
  text (measureRecordStart, 1000, height +300+0);
  
  text ("Llast ", 1200, height +300+0);
  text (lastLastSec, 1400, height +300+0);
  text ("last ", 1600, height +300+0);
  text (lastSec, 1800, height +300+0);
  text ("act ", 2000, height +300+0);
  text (actualSec, 2200, height +300+0);
  
  

  /// text (formerFrame, 700, height +300+100);
  text (frameCount, 1000, height +300+100);

  text(coupling, 400, height +300);
  text (frameCount, width/8, -height-200);
  String ONE_DEC = nf (timeFrame, 0, 1); 
  text(ONE_DEC, width/2+100, -height-200);
  String PULSATION = nf (pulsation, 0, 2); 
  text ("W", -width-800, -height -200);
  text (PULSATION, -width-550, -height -200);


  String BPM_PULSATION = nf (1000/pulsation*60, 0, 0); // transform time elapsed betwween two pulsation in BPM
  text ("BPM-W", -width-200, -height );
  text (BPM_PULSATION, -width+200, -height );

  String BPM = nf (bpmToSend, 0, 2); 
  text ("BPM", -width-200, -height -200);
  text (BPM, -width+100, -height-200);
 
  //********
  textSize (50);
  
    text ("BOTT F0", -width-900, height -100);
   text ("XXXX F9", -width-900, height -820);
   text ("FRON F11", -width-900, height -964);
   
  textSize (75);

  for (int i = 0; i < networkSize; i++) {
    if ( factorWay[i]==false) {
      FactorWay[i]=-1;
    } else  FactorWay[i]=1; 
    String FW= nf (FactorWay[i], 0, 0);
    text(FW, -width-800, height -20 - (i+1)*80);
  }

  textSize (75);

  for (int i = 0; i < networkSize; i++) {
    if ( clockWay[i]==false) {
      ClockWay[i]=-1;
    } else  ClockWay[i]=1;     
    String CW = nf (ClockWay[i], 0, 0); 
    text((CW), -width-700, height -20 - (i+1)*80);
  }
/*
  if ( oldClockWay[memoryi]==false) {
    oldC = -1;
  } else 

  oldC = 1;

  String oldClock = nf (oldC, 0, 3); 
  int k = 12;

  text((oldClock), -width-700, height -20 - (k+1)*80);
*/
  /* 
   textSize (50);
   for (int i = 0; i < networkSize; i++) {
   
   String REV = nf (rev[i], 0, 0); 
   //  text(  (net.naturalFrequency[i]), -width-200, height -20 - (i+1)*80); 
   text((REV), -width-700, height -20 - (i+1)*80);
   }
   */
   
 //************** REMETRRE
 
  textSize (50);
  for (int i = 0; i < networkSize; i++) {
    String TWO_DEC = nf (net.naturalFrequency[i], 0, 2); 
    //  text(  (net.naturalFrequency[i]), -width-200, height -20 - (i+1)*80); 
    text((TWO_DEC), -width-400, height -20 - (i+1)*80);
  }  
  textSize (50);

  for (int i = 0; i < 1; i++) {  // metroPhaseOnScreen

    String om = nf (metroPhase[oldMemoryi]-  metroPhase[memoryi], 0, 3); 
    //  text(  (net.naturalFrequency[i]), -width-200, height -20 - (i+1)*80); 
    text(("om " ), -width-300, height -20 - (i+1)*80);
    text((om), -width-200, height -20 - (i+1)*80);
  }

  for (int i = 1; i < 2; i++) {  // metroPhaseOnScreen

    String om = nf (metroPhase[networkSize-1]-  metroPhase[networkSize-1-1], 0, 3); 
    text(("10 "), -width-300, height -20 - (i+1)*80);
    text((om), -width-200, height -20 - (i+1)*80);
  }

  String inter = nf (interPhase[memoryi], 0, 3); 
  int j = networkSize;
  text(("i" ), -width-300, height -20 - (j+1)*80);
  text((inter), -width-200, height -20 - (j+1)*80);

  for (int i = 2; i < networkSize; i++) {  // metroPhaseOnScreen

    String m = nf (metroPhase[i], 0, 3); 
    text(("m" ), -width-300, height -20 - (i+1)*80);
    text((m), -width-200, height -20 - (i+1)*80);
  }

  textSize (50);

  String interCircular = nf (interPhaseCircular[memoryi], 0, 3); 
  int l = networkSize;
  text(("iC" ), -width-100, height -20 - (j+1)*80);
  text((interCircular), -width-0, height -20 - (j+1)*80);

  for (int i = 0; i < networkSize; i++) {  // netPhaseOnScreen

    String n = nf (net.phase[i], 0, 3); 
    text(("n" ), -width-100, height -20 - (i+1)*80);
    text((n), -width-0, height -20 - (i+1)*80);
  }

  for (int i = 2; i < networkSize; i++) {  // metroPhaseOnScreen

    String interPhaseM = nf (interFrequency[i], 0, 3); 
    text(("iF" ), -width+100, height -20 - (i+1)*80);
    text((interPhaseM), -width+200, height -20 - (i+1)*80);
  }
  
}


void formerW() {
   print  (" ACTUAL POSITION ");  print  (" ACTUAL POSITION ");  print  (" ACTUAL POSITION ");
    print  (" ACTUAL POSITION ");
    
  println  ("wwwwwwwwwwwwwwww");
  for (int i = 0; i < networkSize; i++) {    
    ActualVirtualPosition[i]+=0;  
    /*
        ActualVirtualPosition[i]=ActualVirtualPosition[i]+numberOfStep/3*i;
     ActualVirtualPosition[i]=ActualVirtualPosition[i]%numberOfStep;
     ActualVirtualPosition[i]+=ActualVirtualPosition[i];
     */
    //*****

    //***  ActualVirtualPosition[i]=ActualVirtualPosition[i]+numberOfStep/3*i;// less conventional than numberOfStep/6*i
    //**   ActualVirtualPosition[i]+=ActualVirtualPosition[i]%numberOfStep;
    //**  ActualVirtualPosition[i]=ActualVirtualPosition[i]%numberOfStep*5;

    //    ActualVirtualPosition[i]=+3200;
    ActualVirtualPosition[i]=ActualVirtualPosition[i]+numberOfStep/3*i;
    //VirtualPosition[i]= VirtualPosition[i]+(1600); 

    key='#';
    //formerKey='#';
  }
}



void formerKeyL() {
  if ( formerSartKey!='@') {

    float tempo= 1000/pulsation*60;

    print ("tempo ");  
    println (tempo);
    float ratioTempo= (oscillatorBlocked-1)%8.0 ;

    // float tempo108= (27*ratioTempo)+27;// pianophase
    float tempo108= (30*ratioTempo);// madrush
    float tempo109= (27*ratioTempo)%108;
    print ("ratioTempo ");  
    println (ratioTempo);
    print ("tempo108 ");  
    println (tempo108);
    print ("tempo109 ");  
    println (tempo109);

    //   if ( TrigmodPos[9]>=0 && TrigmodPos[9]<1 ||  revolution[9]>=0 && revolution[9]<1) {
    if ( TrigmodPos[0]>=0 && TrigmodPos[0]<1 ||  revolution[0]>=0 && revolution[0]<1) {

      if (tempo>tempo108+1.0) {
        key='h'; 
        keyReleased();
      }
      if (tempo<tempo108-1.0) {
        key='y'; 
        keyReleased();
      }
    }
  }
}


void keyPressedLFO() {

  float PhaseDecay=d*QUARTER_PI/8;

  if (keyCode == LEFT) {  
    println( " LEFT INCREASE decay offseft in  keyPressedLFO ")  ; // Incremente together without changing phases   
    d+=50;
    d=d%1000;
    println ("d= timeOffsetRatio: "); 
    println (d);

    keyCode=SHIFT; // to trig once keyPressedLFO
  }


  if (keyCode == RIGHT) { 

    println( " right INCREASE timeOffset    from F0 (the behind one  the fastest) F1 very slow =0.021 ")  ; // Incremente together without changing phases   
    d+=50;
    d=d%1000;
    println ("d= timeOffsetRatio: "); 
    println (d);

    keyCode=SHIFT; // to trig once keyPressedLFO
  }

  if (keyCode == UP) { 

    oscillatorBlocked++;
    print (" oscillatorBlocked ");     
    println (oscillatorBlocked); 
    if (oscillatorBlocked > (networkSize-1)) { 
      oscillatorBlocked=1;
    }
    keyCode=SHIFT; // to trig once keyPressedLFO
  }

  if (keyCode == DOWN) { 

    oscillatorBlocked--;
    // keyCode = LEFT; 
    print ("  oscillatorBlocked ");     
    println (oscillatorBlocked); 
    if (oscillatorBlocked < 2) { 
      oscillatorBlocked=11;
    }

    keyCode=SHIFT; // to trig once keyPressedLFO
  }
} 
void followMadTrack1bis() {
  //    pendularPatternLFO();
  //    phasePattern();
  if (millis()>formerEvent[200+3]+d) {
    formerEvent[200+3]= millis();
    //***    if (key!='K' || key!='K'){  
    LFO[11]= (LFO[10]+k)%TWO_PI;
    LFO[10]= (LFO[9]+k)%TWO_PI;
    LFO[9]= (LFO[8]+k)%TWO_PI;
    LFO[8]= (LFO[7]+k)%TWO_PI;
    LFO[7]= (LFO[6]+k)%TWO_PI;
    LFO[6]= (LFO[5]+k)%TWO_PI;
    LFO[5]= (LFO[4]+k)%TWO_PI;
    LFO[4]= (LFO[3]+k)%TWO_PI;
    LFO[3]= (LFO[2]+k)%TWO_PI;


    for (int i =3; i < 12; i++) {
      if (millis()>formerEvent[200+0]+0) {        
        net.phase[i]=LFO[i];
      }
    }
  }
  for (int i =2; i < 3; i++) {
    if (millis()>formerEvent[200+0]+0) {

      LFO[i]= map (automation3, 0, 1, 0, TWO_PI); // gauche droite vers le hau.t CIRCULAR MODE usefull ?
      formerEvent[200+0]= millis(); 
      net.phase[i]=LFO[i];

      print ("automation3 " );  
      print (automation3);
    }
  }       

  pendularPatternLFO();
  if (key=='u' || key=='U') {   
    for (int i =2; i < 12; i++) {
      if (millis()>formerEvent[200+0]+0) {        
        //   net.phase[i]=net.phase[i];
      }
    }
  }
}




void drawBall(int n, float phase) {
//  println ( "*************************** drawBall " );
  pushMatrix();
  translate(-w2, -h2, -1000);
  noStroke();
  float side = height*0.15*1/nbBall;
  float rayon = width/2;

  a = rayon*cos(phase); //-300 à 300
  b = rayon*sin(phase);
  
//   print (" phaseinDB" + phase);

  translate (a, b, 200+(50*5*n)); // on voit la vague comme j'aimerais si on fait ce qui est dit ligne 153
  translate (100, 100, 200+(50*5*n));
  colorMode(RGB, 255, 255, 255);
  fill( 0, 255, 0 );
  sphere(side*3);
  popMatrix();
}

float [] phaseReturnedBis(float[] netPhase) { 
  //if former
  for (int i = 2; i < networkSize; i++) {
    //   netPhase[i] = net.phase[i];
    netPhase[i] = netPhase[i];
  }
  return netPhase;  // Returns an array of 3 ints: 20, 40, 60
}

void follow( int target, int follower, int delais, float deltaphase) {
  int step = frameCount % nbMaxDelais;
  int followedStep = (step + nbMaxDelais - delais) % nbMaxDelais;
  phases[follower][step] = diffAngle(phases[target][followedStep] + deltaphase, 0);
}

float diffAngle(float angle1, float angle2) { // return the difference angle1 - angle2 between two angle between -PI PI
  float result = angle1 - angle2;
  while (result > PI) {
    result -= 2 * PI;
  }
  while (result < -PI) {
    result += 2 * PI;
  }
  return result;
}

void drawBallOppositeWay(int n, float phase) {
//  println ( "*************************** drawBallOPPOO " );
  pushMatrix();
  translate(-w2, -h2, -1000);
  noStroke();
  float side = height*0.15*1/nbBall;
  float rayon = width/2;

  a = rayon*cos(phase+PI); //-300 à 300
  b = rayon*sin(phase+PI);

//  translate (a, b, 200+(75*5*n)); // on voit la vague comme j'aimerais si on fait ce qui est dit ligne 153
  translate (a, b, 200+(50*5*n));
  colorMode(RGB, 255, 255, 255);
  fill( 255, 0, 0 );
  sphere(side*3);  // redsphere
  popMatrix();
}

void followOppositeWay( int target, int follower, int delais, float deltaphase) {
  int step = frameCountBis % nbMaxDelais;
  int followedStep = (step + nbMaxDelais - delais) % nbMaxDelais;
  phases[follower][step] = diffAngle(phases[target][followedStep] + deltaphase, 0);
}

float diffAngleOppositeWayOppositeWay(float angle1, float angle2) { // return the difference angle1 - angle2 between two angle between -PI PI
  float result = angle1 - angle2;
  while (result > PI) {
    result -= 2 * PI;
  }
  while (result < -PI) {
    result += 2 * PI;
  }
  return result;
}



void arduinoPosJO() { // envoyer les informations aux moteurs

  for (int i = 2; i < nbBall; i++) {

    //  phaseToMotor[i]= (int) map (phaseMapped[i], -PI, PI, 0, 6400);
    phaseToMotor[i]= (int) map (phaseMapped[i], 0, TWO_PI, 0, 6400);
  }

 // teensyport.write(dataToControlMotor); // Send data to Teensy. only the movement
  println(frameCount + ": " +  " dataToControlMotor " + ( dataToControlMotor ));
}

void keyReleasedfollowSignal() {
   if (keyCode == RIGHT) {
  phaseShiftingFollowPhase11++;  // ici, le temps que les points attendent pour se suivre est de 5 frames, et il faut un espace entre eux de QUARTER_PI/6
  phaseShiftingFollowPhase11=phaseShiftingFollowPhase11%20;
  key='#';}

    if (keyCode == LEFT) {
  delayTimeFollowPhase11++;  // ici, le temps que les points attendent pour se suivre est de 5 frames, et il faut un espace entre eux de QUARTER_PI/6
  delayTimeFollowPhase11= delayTimeFollowPhase11%20;
  key='#';}
}

void keyReleasedfollowSignalPerfect() {
  if (keyCode == RIGHT) {
    print ("keyReleasedfollowSignalPerfect right INCREASE timeOffset ")  ; // Incremente together without changing phases
  //  d++;
    timeFrameOffsetFollowing++;
//    d=d%20;
    timeFrameOffsetFollowing=timeFrameOffsetFollowing%20;
    print (" keyReleasedfollowSignalPerfect d= timeOffsetRatio: ");
    println (timeFrameOffsetFollowing);
    keyCode = SHIFT;
  }

  if (keyCode == LEFT) {
    print ("keyReleasedfollowSignalPerfect  left INCREASE phase shifting"); //
    k= (k+QUARTER_PI/4);
    k= k%(8*QUARTER_PI/2);   

    if (k>=8*QUARTER_PI/2) { 
      k=-k;
    }   
    print ("k= shiftingPhaseRatio ");
    println (k);
    keyCode = SHIFT;
  }
}
void followSignal() {
  keyReleasedfollowSignalPerfect();

  println(frameCount + ": " + ( debug ));
 // background(0);

  //  rotate(- TWO_PI+ HALF_PI  ); //TO change the beginning of the 0 (cercle trigo) and the cohesion point to - HALF_PI
  //  translate(width/2-400, -height/2, -1000);// To set the center of the perspective

  if (!firstFollowingStarted) {
    float angle = diffAngle(PI + (frameCount / 4.0) * cos (1000 / 500.0), 0);

    print ("angle ");
    println ( angle );

    LFO[2]= map (automation3, 0, 1, 0, TWO_PI);

    if (angle > 0 )
      phases[0][frameCount % nbMaxDelais]= LFO[2];  // gauche droite vers le hau.t CIRCULAR MODE usefull ?// diffAngle(angle, HALF_PI);//% TWO_PI  // position du point de depart + vitesse * phi constant  ==> ici vitesse du point phases[0] est constante
    else
      phases[0][frameCount % nbMaxDelais]= LFO[2];
      drawBall(0, phases[0][frameCount % nbMaxDelais]); // affiche le point 0. NE PAS AFFICHER SINON IL APPARAIT EN DOUBLE
  }

  float deltaFollow = PI/180;

  for (int i = 1; i < nbBall; i++) {
    debug ="Normal follow ";
    //   follow( i-1, i, 20 * i, 0);  // Modifier les deux derniers paramètres : délais et phase
    follow( i-1, i, d, k);  // ici, le temps que les points attendent pour se suivre est de 5 frames, et il faut un espace entre eux de QUARTER_PI/6

    //*****   drawBall(i, phaseMapped[i] );
    drawBall(i, phases[i][frameCount % nbMaxDelais] );
  }

  /*
     for(int i = 0; i < nbBall; i++) { //Animation brute sans suivi, juste avec une formule
   //drawBall(i, PI + (i * frameCount / 50.0) * cos (frameCount / 500.0) );
   }*/  // A COMPRENDRE

  if (frameCount > nbMaxDelais/10 && firstFollowingLast == true && abs(diffAngle(phases[0][frameCount % nbMaxDelais], phases[nbBall-1][frameCount % nbMaxDelais])) < deltaFollow ) {
    colorMode(RGB, 255, 255, 255);
    fill( 0, 0, 255 );
    println("diffangle" + ": " + diffAngle(phases[0][frameCount % nbMaxDelais], phases[nbBall-1][frameCount % nbMaxDelais]));
    //    firstFollowingStarted = true;
    debug ="First follow last";
    //   firstFollowingLast = false;
    println (debug);
  }

  if (firstFollowingStarted) {
    colorMode(RGB, 255, 255, 255);
    fill( 255, 0, 0 );
    debug ="firstFollowingStarted";
    follow(nbBall-1, 0, d, k);  // Modifier les deux derniers paramètres : délais et phase
    drawBall(0, phases[0][frameCount % nbMaxDelais]);
    //   println ("PHASE MAPPED firstFollowing ");
    //   println("diffangle" + ": " + diffAngle(phases[0][frameCount % nbMaxDelais], phases[nbBall-1][frameCount % nbMaxDelais]));
  }

  arduinoPosJO();
}  



void samplingMovement(float timeSec) {
  
    keyReleasedfollowSignal(); // useless here, but if you sample with a decay of 100ms, each oscillator will have the movement of 11 each new cycle of 11
    frameSampling=frameSampling+1;
    Timer= (millis()%1000*timeSec)*restartTimer;
    Timer2 = (millis()%2000*timeSec)*restartTimer;
     print ("             Timer  "); print (Timer);
     print ("             Timer2  "); print ( Timer2);
     print ("             frameSampling160  "); print ( frameSampling%(num*timeSec)); // each x frameSampling record new datas
    int i = int(frameSampling%(num*timeSec)); // datas record from 0 to 40*number of secondes
    
    if(frameSampling>=0 && frameSampling<=num*timeSec  ) // && lastSec==actualSec
    {
    if(frameSampling<=0) { 
     int timeElapsed= endTime-beginTime; 
     print (" timeElapsed"); println (timeElapsed);
     beginTime=millis();
     background(255);     
    } 
    if(frameSampling>=1 && frameSampling<=num*timeSec )  //&& Timer<=100 && Timer2<=100
    {
//    rx[i] = mouseX;
//    ry[i] = mouseY;
 //**   net.phase[networkSize-1]= (float) map (v1, 0, 400, 0, TWO_PI);
  //  net.phase[networkSize-1]= (float) map (mouseY, 0, 400, 0, TWO_PI);
     newPosF[0]= (float) map (mouseY, 0, 400, 0, TWO_PI);
    rx[i] = z;
 //   ry[i] = v1;
     ry[i]= newPosF[0]+phaseShiftingFollowPhase11;//almost useless
    mx[i] = rx[i];
    my[i] = ry[i];
    fill(255, 0, 0, 50); 
 //     net.phase[networkSize-1]= (float) map (v1, 0, mouseY, 0, TWO_PI);

 //**   net.phase[2]= (float) map (v1, 0, 400, 0, TWO_PI);
    circle(rx[i], ry[i], 10); 
    }    
   }  
   
    int middleTime = millis(); 
    int TimeMiddleElapsed = middleTime -beginTime;
    
    if ( (frameSampling >=num*timeSec+1 && frameSampling <=num*timeSec+1)) { //|| TimeMiddleElapsed >=1970 && TimeMiddleElapsed <=2030 || 
       LastTimeMiddleElapsed=TimeMiddleElapsed;
       print (frameSampling); print ("  TimeMiddleElapsed "); println ( TimeMiddleElapsed);
       } 
     
    if(frameSampling>=num*timeSec+1  ) // begin to replay for 2 sec
    {
      trigFollowSampling=true;
     
 //**   net.phase[networkSize-1]= (float) map (my[i], 0, 400, 0, TWO_PI);
        newPosF[0]= my[i];
 //¨**    net.phase[networkSize-2]= (float) map (my[i], 0, 400, 0, TWO_PI)+k; // you have sampled oscillator2 and repeat it in oscillator 3 with decay
//  
        newPosF[1]= my[i]+delayTimeFollowPhase11; // useless
        newPosF[1]= newPosF[1]%TWO_PI;
    circle(mx[i]+400, my[i], 10); 
  //  print (frameSampling); print (" ry' "); print (i); print ("  "); println (ry[i]);
    print (" frameSampling "); print (frameSampling); print (" ry "); print (i); print ("  "); print (ry[i]);   // frameSampling%160=1 is the first point and  frameSampling%160=0 is the last point recorded
    print (" my "); print (i); print ("  "); println (my[i]);
    } 
  
   // if(frameSampling>=2*20*4+1 && frameSampling<=2*20*4+1  ) //
    if(frameSampling%(2*num*timeSec)<=0  ) //
    {

    endTime=millis();
    int timeElapsed= endTime-beginTime; 
    LastTimeElapsed= timeElapsed;
     print (" LastTimeElapsed"); println (LastTimeElapsed);
 //   Timer=0;
 //   Timer2=0;
 //   frameSampling=80;
    restartTimer=0;//useless for the moment
    background(255);
    }
    if (mousePressed==true){
        mouseRecorded=true;} 
        
    if (mouseRecorded==true  && frameSampling%(2*num*timeSec+0)<=0 
     ) {
       print (" Restart Record ");  print (" Restart Record ");  println (" Restart Record ");
    mouseRecorded=false;
    frameSampling = 0; // Restart main loop
    restartTimer=1;  //useless for the moment
    trigFollowSampling=false;
     }      
}



 

void sendToTeensy() {
  int turnOnDriverNetPhase11=1; //it has to be more than 2 to turn on the driver in the Teensy

  String dataMarkedToTeensyJoGood  ="<" // BPM9   

   // +   dataMappedForMotorisedPosition[11]+ ","+dataMappedForMotorisedPosition[10]+","+(dataMappedForMotorisedPosition[9])+","+dataMappedForMotorisedPosition[8]+","+dataMappedForMotorisedPosition[7]+","
   // +   dataMappedForMotorisedPosition[6]+","+( dataMappedForMotorisedPosition[5])+","+dataMappedForMotorisedPosition[4]+","+dataMappedForMotorisedPosition[3]+","+dataMappedForMotorisedPosition[2]+","//dataMappedForMotorisedPosition[2]

   // +  (speedDelta) + "," + turnOnDriverNetPhase11 + "," +3+","+decompte[8]+","+decompte[7]+","+decompte[6]+","+decompte[5]+","+decompte[4]+","+decompte[3]+","+decompte[2]+"," // to manage 12 note +decompte[1]+","+decompte[0]+ ","

    +  decompte[1]+"," +cohesionCounterLow +","+ cohesionCounterHigh +","+ int (map (LevelCohesionToSend, 0, 1, 0, 100))+">"; //    cohesionCounterHigh // +orderCohesion+ ">";LevelCohesionToSend ","+ int (map ( LowLevelCohesionToSend, 0, 1, 0, 100))+ 


  if ( abs (speedi[networkSize-1]) > 950 || abs (speedi[0]) > 950) {
    //   key = 'h'; keyReleased();
    textSize (200);
    text("CAREFULL", width/2, height - 20);
  }

  println(frameCount + ": " +  " dataMarkedToTeensyJoGood_inSendToTeensy" + ( dataMarkedToTeensyJoGood ));
 // teensyport.write(dataMarkedToTeensyJoGood); // Send data to Teensy. only the movement
}

void sendToTeensyTurnOnDriver() {
  int turnOnDriverNetPhase11=3; //it has to be more than 2 to turn on the driver in the Teensy

  String dataMarkedToTeensyJoGood  ="<" // BPM9   

   // +   dataMappedForMotorisedPosition[11]+ ","+dataMappedForMotorisedPosition[10]+","+(dataMappedForMotorisedPosition[9])+","+dataMappedForMotorisedPosition[8]+","+dataMappedForMotorisedPosition[7]+","
   // +   dataMappedForMotorisedPosition[6]+","
    
    +( dataMappedForMotorisedPosition[5])+","+dataMappedForMotorisedPosition[4]+","+dataMappedForMotorisedPosition[3]+","+dataMappedForMotorisedPosition[2]+","//dataMappedForMotorisedPosition[2]

    +  (speedDelta) + "," + turnOnDriverNetPhase11 + "," +3+","
    
    //+decompte[8]+","+decompte[7]+","+decompte[6]+","+decompte[5]+","+decompte[4]+","+decompte[3]+","+decompte[2]+"," // to manage 12 note +decompte[1]+","+decompte[0]+ ","

    +  decompte[1]+"," +cohesionCounterLow +","+ cohesionCounterHigh +","+ int (map (LevelCohesionToSend, 0, 1, 0, 100))+">"; //    cohesionCounterHigh // +orderCohesion+ ">";LevelCohesionToSend ","+ int (map ( LowLevelCohesionToSend, 0, 1, 0, 100))+ 



  println(frameCount + ": " +  " dataMarkedToTeensyJoGood" + ( dataMarkedToTeensyJoGood ));
  teensyport.write(dataMarkedToTeensyJoGood); // Send data to Teensy. only the movement
}







void followDistribueAddphasePattern(){
   for (int i = 0; i <  networkSize-0; i+=1) {// networkSize-0
 //    print (net.oldPhase[i]); print (" 12448 ");   println (net.phase[i]); 
 //   net.oldPhase[i]=phaseMapped[i];
    phaseMapped[i]= map (signal[2], 0, 1, 0, TWO_PI); // use varaible phaseMapped (to play movement with time delay or phase delay) to well send it in Teensy
 
    if (phaseMapped[i]<0){
   
    dataMappedForMotorisedPosition[i]= int (map (phaseMapped[i], 0, -TWO_PI, numberOfStep, 0)); 
    net.oldPhase[i]=net.phase[i];
    net.phase[i]= map (dataMappedForMotorisedPosition[i], numberOfStep, 0, 0, -TWO_PI);
       }
       
   else
    
    dataMappedForMotorisedPosition[i]= (int) map (phaseMapped[i], 0, TWO_PI, 0, numberOfStep);
    net.oldPhase[i]=net.phase[i];
    net.phase[i]= map (dataMappedForMotorisedPosition[i], 0, numberOfStep, 0, TWO_PI);
  }
  for (int i = 0; i < (networkSize-0); i+=1){
    print (" degrees "); print (i);  print (" "); println (degrees (net.phase[i]));
 }
   
  if (formerFormerKey == '#'  || formerKeyMetro == '*'  || formerKeyMetro == '*' ) { // || formerKeyMetro == '*'
    
      for (int i = 2; i < networkSize-0; i+=1) { 
        
  ////*****  phaseMappedFollow[i] = phaseMapped[i];
 //   phaseMapped[i] = phaseMappedFollow[i]+phaseMapped[i];
   
    if (phaseMapped[i]<0 ){ //&& phaseMappedFollow[i]<0
      
    phaseMapped[i] = phaseMappedFollow[i]-phaseMapped[i];
    dataMappedForMotorisedPosition[i]= int (map (phaseMapped[i], 0, -TWO_PI, numberOfStep, 0)); 
    net.oldPhase[i]=net.phase[i];
    net.phase[i]= map (dataMappedForMotorisedPosition[i], numberOfStep, 0, 0, -TWO_PI);
  }
       
    if (phaseMapped[i]>0 ){ // && phaseMappedFollow[i]>0
    phaseMapped[i] = phaseMappedFollow[i]+phaseMapped[i];
    dataMappedForMotorisedPosition[i]= (int) map (phaseMapped[i], 0, TWO_PI, 0, numberOfStep);
    net.oldPhase[i]=net.phase[i];
    net.phase[i]= map (dataMappedForMotorisedPosition[i], 0, numberOfStep, 0, TWO_PI);
  }
 }
   
 
    if (formerFormerKey != '#' ) {
 //   if (formerKeyMetro == '*' ) {
     phasePattern();
     
    for (int i = 0; i < networkSize-0; i+=1) { 
      print ("  BEF phaseMapped[i]  ");    println ( phaseMapped[i]  ); 
    phaseMappedFollow[i]= net.phase[i];
    phaseMapped[i] =  phaseMapped[i]+phaseMappedFollow[i];  // add offset given by pendularPattern
    phaseMapped[i] =  phaseMapped[i]%TWO_PI; 
    print ("  phaseMapped[i]  ");    println ( phaseMapped[i]  ); 
   
    if (phaseMapped[i]<0){
   
     dataMappedForMotorisedPosition[i]= int (map (phaseMapped[i], 0, -TWO_PI, numberOfStep, 0)); 
   //  net.oldPhase[i]=phaseMapped[i];
    net.oldPhase[i]= net.phase[i];
    net.phase[i]= map (dataMappedForMotorisedPosition[i], numberOfStep, 0, 0, -TWO_PI);
 //**    net.phase[i]= phaseMapped[i];
       }
       
   else
    
    dataMappedForMotorisedPosition[i]= (int) map (phaseMapped[i], 0, TWO_PI, 0, numberOfStep); 
    net.oldPhase[i]=net.phase[i];
 //**   net.phase[i]= phaseMapped[i];
       net.phase[i]= map (dataMappedForMotorisedPosition[i], 0, numberOfStep, 0, TWO_PI);


//   }
  }
 }
 
 
  //sendToTeensyTurnOnDriver();
  }  
    } 

     
void followDirectLfo(){    
   println (" PatternFollowLfo() ");   
   lfoPattern();
  //  LFO[0]= lfoPhase[2];
 
    splitTimeLfo();
   //  splitWithTime();
                
   if (key=='q' || key=='a') {
     letter = key;
    
     }
  switch(letter) {
    case 'a': 
    doA=true;
    doQ=false;
    println("Alpha");  // Does not execute
    break;
    case 'q': 
    doA=false;
    doQ=true;
    println("qqqqq");  // Does not execute
    break;
     
    }
    
  if (formerFormerKey == '#') { //  && doA==true
     lfoPattern();
      for (int i = 2; i < networkSize-0; i+=1) { 
      print ( " LFO  == '#' "); println (LFO[i]);   
      LFO[i]= lfoPhase[1];
    //  LFO[i]= 0;
   }
   }
   
   if (formerFormerKey == '#') {
     
   if (LFO[oscillatorChange]<0){   // movement drawn by myself      
    LFO[oscillatorChange] = phaseFollowLFO[oscillatorChange]-LFO[oscillatorChange]; 
    
    dataToChange[oscillatorChange]= int (map (LFO[oscillatorChange], 0, -TWO_PI, numberOfStep, 0)); 
    //**    net.oldPhase[i]=net.phase[i];
   // oldPosF[oscillatorChange]=newPosF[oscillatorChange];
   
    //**    net.phase[i]= map (dataToChange[i], numberOfStep, 0, 0, -TWO_PI);
    newPosF[oscillatorChange]= LFO[oscillatorChange]; //map (dataToChange[oscillatorChange], numberOfStep, 0, 0, -TWO_PI);
  }
       
   else
    LFO[oscillatorChange] = phaseFollowLFO[oscillatorChange]+LFO[oscillatorChange];
    LFO[oscillatorChange] = LFO[oscillatorChange]%TWO_PI;
     
    dataToChange[oscillatorChange]= (int) map (LFO[oscillatorChange], 0, TWO_PI, 0, numberOfStep);
    //   net.oldPhase[i]=net.phase[i];
  //  oldPosF[oscillatorChange]=newPosF[oscillatorChange];
   //  net.phase[i]= map (dataToChange[i], 0, numberOfStep, 0, TWO_PI);
    newPosF[oscillatorChange]= LFO[oscillatorChange]; // map (dataToChange[oscillatorChange], 0, numberOfStep, 0, TWO_PI);
  
 }
   
   
   if (formerKey != '#' ) { //  play this command once when you tap on keyboard expect #
    if (doA==true ){ // offset with pendularPattern  || doQ==true
     phasePattern(); // change offset between ball with pendularPattern
     lfoPattern();
   for (int i = 0; i < networkSize-0; i+=1) { 
   
  //  newPosF[i]= net.phase[i];
 //**   newPosF[i]= lfoPhase[1];
  //****  phaseFollowLFO[i]= newPosF[i];

     LFO[i]= lfoPhase[1];
      } 
      
     phaseFollowLFO[oscillatorChange]= lfoPhase[2];
     print ("  case a phaseFollowLFO  ");  print ( oscillatorChange  ); print ( " ");  print ( phaseFollowLFO[oscillatorChange]  ) ; println (   ); 
 //   LFO[i]=0;

//    LFO[oscillatorChange] =  LFO[oscillatorChange]+phaseFollowLFO[oscillatorChange];  // add offset given by pendularPattern
//    LFO[oscillatorChange] =  LFO[oscillatorChange]%TWO_PI; 

    for (int i = 2; i < networkSize-0; i+=1) { 
      
   if (LFO[i]<0){
   
    dataToChange[i]= int (map (LFO[i], 0, -TWO_PI, numberOfStep, 0)); 
  //  oldPosF[i]=newPosF[i];
    newPosF[i]=LFO[i];//dataToChange[i];
 //   dataMappedForMotorisedPosition[i]= (int) newPosF[i];
       }
       
   else
    
    dataToChange[i]= (int) map (LFO[i], 0, TWO_PI, 0, numberOfStep); 
 //   oldPosF[i]=newPosF[i];
    newPosF[i]=LFO[i];//dataToChange[i];
 //   dataMappedForMotorisedPosition[i]= (int) newPosF[i];
       } // 
       
      
       
        key='#';// key='a'; // formerFormerKey = '#';
   //    doA=false;
   //    doQ=true;
   }
   
   }
   /*
  for (int i = 2; i < networkSize; i++) { 
    oldDataToChange[i]= dataToChange[i];
    deltaDataToChange[i]= dataToChange[i]-oldDataToChange[i];
    dataMappedForMotorisedPosition[i]= (int) dataToChange[i];// newPosF[i];
   }  
 */
  
      countRevsContinue();
      
    for (int i = 0; i < networkSize; i++) {
     
     oldPosF[i]=newPosF[i];

      //*******************************  ASSIGN MOTOR WITH POSITION

      if (rev[i]!=0  && (newPosF[i] >  0) ) { // number of revolution is even and rotation is clock wise   
        pos[i]= int (map (newPosF[i], 0, TWO_PI, 0, numberOfStep))+ (rev[i]*numberOfStep);
      }

      if (rev[i]!=0  && (newPosF[i] <  0)) { // number of revolution is even and rotation is Counter clock wise          // pos[i]= int (map (net.phase[i], 0, -TWO_PI, 0,  numberOfStep))+ (rev[i]*numberOfStep);
        pos[i]= int (map (newPosF[i], 0, -TWO_PI, numberOfStep, 0)) +(rev[i]*numberOfStep);       //   print ("pos "); print (i); print (" ");println (pos[i]);
      }

      if (rev[i]==0 && (newPosF[i] < 0) ) { //  number of revolution is 0 and rotation is counter clock wise 
        pos[i]= int (map (newPosF[i], 0, -TWO_PI, numberOfStep, 0));        
      }         
      if (rev[i]==0 && (newPosF[i] > 0) ) {  //  number of revolution is 0 and rotation is clock wise     
        pos[i]= int (map (newPosF[i], 0, TWO_PI, 0, numberOfStep));                //      print ("pos "); print (i); print (" CW rev=0 ");println (pos[i]);
      }
      dataMappedForMotorisedPosition[i]= (int) pos[i];
            
    }
    
 
  

    int driverOnOff=3;
    int dataToTeensyNoJo=-3; // trig noJoe in Teensy
    String dataMarkedToTeensyNoJo  ="<" // BPM9   

    //  +   dataMappedForMotorisedPosition[11]+ ","+dataMappedForMotorisedPosition[10]+","+(dataMappedForMotorisedPosition[9])+","+dataMappedForMotorisedPosition[8]+","+dataMappedForMotorisedPosition[7]+","
    //  +   dataMappedForMotorisedPosition[6]+","+( dataMappedForMotorisedPosition[5])+","+dataMappedForMotorisedPosition[4]+","+dataMappedForMotorisedPosition[3]+","+dataMappedForMotorisedPosition[2]+","//dataMappedForMotorisedPosition[2]

   //   +  (speedDelta) +","+ driverOnOff +","+decompte[9]+","+decompte[8]+","+decompte[7]+","+decompte[6]+","+decompte[5]+","+decompte[4]+","+decompte[3]+","+decompte[2]+"," // to manage 12 note +decompte[1]+","+decompte[0]+ ","

      +  decompte[1]+"," +cohesionCounterLow +","+ cohesionCounterHigh +","+ int (map (LevelCohesionToSend, 0, 1, 0, 100))+">";    

    println(frameCount + ": " +  " dataMarkedToTeensyNoJo" + ( dataMarkedToTeensyNoJo ));
   //  encoderReceiveUSBport101.write(dataMarkedToTeensyNoJo );// Send data to Arduino.
    teensyport.write(dataMarkedToTeensyNoJo); // Send data to Teensy. only the movement
 
 } 

 
 void countRevsContinue() { // =========================================== AJOUTE un case dans tableau networkSize+1

  for (int i = 0; i < networkSize; i++) { 
//**    print (net.oldPhase[i]); print ("count rev ");   println (net.phase[i]); 
    // decrement caused by negative angular velocity
    // both positive angles || both negative angles || positive-to-negative angle
    //   if (//(net.oldPhase[i] < 0.25 * PI && net.phase[i] > 1.75 * PI) ||//
    if (
      ((oldPosF[i] < 0.25 *PI && oldPosF[i]>0)  && (newPosF[i] > -0.25* PI && newPosF[i] <0))  || 
       (oldPosF[i] < -1.75 * PI && newPosF[i] > -0.25 * PI)// ||
    
      ) {
    
      //    TrigmodPos[i]=0;
      RevsContinue[i]--;
      //      print (" revultion negative  "); println (revolution[i]=i+1);
      //   revolution[i]=i+1;
     revolution[i]=0; // trig 0 to sent 0 in Max4Live
      memoryi=i;


   //   decompte[i] = -1; // // RESET COUNTER AT 0 (i know it's strange, otherwise with 0 it begin at 1, not 0)
    } else { // if you do twice there is a funny bug
      //    decompte[i]  ++; 
      //   revolution[i]=0;
    }


    // increment caused by positive angular velocity
    // both positive angles || both negative angles || negative-to-positive angle

    if (
      ((oldPosF[i] > -0.25 *PI && oldPosF[i]<0)  && (newPosF[i] < 0.25* PI && newPosF[i] >0))  || 
       (oldPosF[i] > 1.75 * PI && newPosF[i] < 0.25*PI)
      ) {
      onOFF = 1;
      //   TrigmodPos[i]=0;
      RevsContinue[i]++;
      //   revolution[i]=i+1;
      revolution[i]=0;   // trig 0 to sent 0 in Max4Live
      memoryi=i;
      decompte[i] = 0;  // RESET COUNTER AT 0
    } else {

      decompte[i]  ++; //START COUNTER when a REVOLUTION START OR FINISH

      revolution[i]=1;
    }
     if (  revolution[i]<1) {
   print (" revolution[i] "); print ( memoryi); print ("  "); print (revolution[memoryi]);
    }
  
  //  print (" rev< "); print ( i); print ("  "); println (rev[i]);
  }
  if (

   
    (newPosF[memoryi] < -1.75 * PI && newPosF[memoryi] >= -0.25*TWO_PI) || ( newPosF[memoryi]<=-TWO_PI+0.23  && newPosF[memoryi] >= -0.25*TWO_PI ) 
    ) {
    onOFF = 1;
    //   background (27,59,78);
    //    TrigmodPos[i]=0;
   // RevsContinue[memoryi]--;
    //      print (" revultion negative  "); println (revolution[i]=i+1);
    //   revolution[i]=i+1;
//**** revolution[memoryi]=0; // trig 0 to sent 0 in Max4Live   brecause it count twice in negative way!!!
    // memoryi=i;


    decompte[memoryi] = -1; // // RESET COUNTER AT 0 (i know it's strange, otherwise with 0 it begin at 1, not 0)
  }
 
} 

void addSignal(){
  
    println (" pattern lfoPhase[1] ", lfoPhase[1], "lfoPhase[2] ", lfoPhase[2], "lfoPhase[3] ", lfoPhase[3]); 
   
   if (key=='q' || key=='b') {
     letter = key;   
     }
  switch(letter) {
    case 'q': 
    doQ=true;
    break;
    case 'b': 
    doQ=false;
    break;     
    }
  
   if (formerFormerKey == '#') { //  && doA==true
     print ("  normal " + frameCount + " lfoPhase[1] " + lfoPhase[1] + " lfoPhase[2] " + lfoPhase[2]);    println (   ); 
      for (int i = 2; i <  networkSize+1; i+=1) { 
       LFO[i] = lfoPhase[1]; 
   if (LFO[i]<0){        
       LFO[i] = phaseFollowLFO[i] -  LFO[i];
       dataMappedForMotor[i]= int (map (LFO[i], 0, -TWO_PI, numberOfStep, 0)); 

       newPosX[i]= map (dataMappedForMotor[i], numberOfStep, 0, 0, -TWO_PI);
  }
       
   else
       LFO[i] = phaseFollowLFO[i] +  LFO[i];
       dataMappedForMotor[i]= (int) map (LFO[i], 0, TWO_PI, 0, numberOfStep);

       newPosX[i]= map (dataMappedForMotor[i], 0, numberOfStep, 0, TWO_PI);
 
   }
  
   if (LFO[oscillatorChange]<0){        
       LFO[oscillatorChange] = phaseFollowLFO[oscillatorChange]-LFO[oscillatorChange]; 
       dataMappedForMotor[oscillatorChange]= int (map (LFO[oscillatorChange], 0, -TWO_PI, numberOfStep, 0)); 

       newPosX[oscillatorChange]= map (dataMappedForMotor[oscillatorChange], numberOfStep, 0, 0, -TWO_PI);
  }
       
   else
       LFO[oscillatorChange] = phaseFollowLFO[oscillatorChange]+LFO[oscillatorChange];
       dataMappedForMotor[oscillatorChange]= (int) map (LFO[oscillatorChange], 0, TWO_PI, 0, numberOfStep);

       newPosX[oscillatorChange]= map (dataMappedForMotor[oscillatorChange], 0, numberOfStep, 0, TWO_PI);
  }
 
   if (doQ==true ){
  //   phasePattern(); // offset with lfo oscillator by osillator
    print ("  case q phaseFollowLFO " + oscillatorChange + " "  + phaseFollowLFO[oscillatorChange] + " "); print ("  LFOoscillatorChange  "); print (oscillatorChange); print ("   ") ;  print (LFO[oscillatorChange]  ); 
    print (" newPosX[oscillatorChange] " + newPosX[oscillatorChange]);
    for (int i = 2; i <  networkSize-0; i+=1) { 
   
   //int i = oscillatorChange;
   //  phaseFollowLFO[oscillatorChange]= PI/10*-oscillatorChange; // to understand
     phaseFollowLFO[oscillatorChange]= lfoPhase[2];
     LFO[oscillatorChange]=  LFO[i]+phaseFollowLFO[i];  // add offset given by pendularPattern
     LFO[oscillatorChange]=  LFO[i]; 
  
   
    if (LFO[i]<0){
   
     dataMappedForMotor[i]= int (map (LFO[i], 0, -TWO_PI, numberOfStep, 0)); 

       newPosX[oscillatorChange]= map (dataMappedForMotor[i], numberOfStep, 0, 0, -TWO_PI);
  //   newPosX[i]= LFO[i];
       }
       
   else
    
    dataMappedForMotor[i]= (int) map (LFO[i], 0, TWO_PI, 0, numberOfStep);  
    
    newPosX[oscillatorChange]= map (dataMappedForMotor[i], 0, numberOfStep, 0, TWO_PI);
    
     } //
 
   }
    print ("  LFO+LFOoscillatorChange  "); print (oscillatorChange); print ("   ") ;  println (LFO[oscillatorChange]  ); 
   
  key='#';// 

     for (int i = 2; i <  networkSize+0; i+=1) { // la premiere celle du fond i=2,  la derniere celle du devant i=11
    drawBall(i, newPosX[i] );

   
    print( " oldPositionToMotor[i]" ); print ( oldPositionToMotor[i]);
    positionToMotor[i]= ((int) map (newPosX[i], 0, TWO_PI, 0, numberOfStep)%numberOfStep); //
    
    
    newPosF[i]=positionToMotor[i]%6400;
 //   if (oldPositionToMotor[i]>positionToMotor[i]){
    if ( oldPosF[i]>newPosF[i]){
      revLfo[i]++;
     
    } 
     oldPositionToMotor[i]=  positionToMotor[i];
     oldPosF[i]=newPosF[i];

     print( " newPosF[i] " ); print ( newPosF[i]);
     print( " positionToMotor[i] " ); print ( positionToMotor[i]);
     print (" revolutionLFO "); print ( i); print ("  "); println (revLfo[i]); 
  }
  
   if (formerKeyMetro=='B') {


         for (int i = 0; i < networkSize; i++) {
      // rev[i]=rev[0];


      //*******************************  ASSIGN MOTOR WITH POSITION

      if (revLfo[i]!=0  && (newPosF[i] >  0) ) { // number of revLfoolution is even and rotation is clock wise   
        dataMappedForMotorisedPosition[i]= int (map (newPosF[i], 0, numberOfStep, 0, numberOfStep))+ (revLfo[i]*numberOfStep);
      }

      if (revLfo[i]!=0  && (newPosF[i] <  0)) { // number of revLfoolution is even and rotation is Counter clock wise          // pos[i]= int (map (newPosF[i], 0, -numberOfStep, 0,  numberOfStep))+ (revLfo[i]*numberOfStep);

        dataMappedForMotorisedPosition[i]= int (map (newPosF[i], 0, -numberOfStep, numberOfStep, 0)) +(revLfo[i]*numberOfStep);       //   print ("pos "); print (i); print (" ");println (pos[i]);
      }

      if (revLfo[i]==0 && (newPosF[i] < 0) ) { //  number of revLfoolution is 0 and rotation is counter clock wise 
        dataMappedForMotorisedPosition[i]= int (map (newPosF[i], 0, -numberOfStep, numberOfStep, 0));        
      }         
      if  (revLfo[i]==0 && (newPosF[i] > 0) ) {  //  number of revLfoolution is 0 and rotation is clock wise     
        dataMappedForMotorisedPosition[i]= int (map (newPosF[i], 0, numberOfStep, 0, numberOfStep));                //      print ("pos "); print (i); print (" CW revLfo=0 ");println (pos[i]);
      }
    }
  } 
     
    int speedLocalDelta=4; 
    int driverOnOff=3;
    int dataToTeensyNoJo=-3; // trig noJoe in Teensy
    String dataMarkedToTeensyNoJo  ="<" // BPM9   

      +   dataMappedForMotorisedPosition[11]+ ","+dataMappedForMotorisedPosition[10]+","+(dataMappedForMotorisedPosition[9])+","+dataMappedForMotorisedPosition[8]+","+dataMappedForMotorisedPosition[7]+","
      +   dataMappedForMotorisedPosition[6]+","+( dataMappedForMotorisedPosition[5])+","+dataMappedForMotorisedPosition[4]+","+dataMappedForMotorisedPosition[3]+","+dataMappedForMotorisedPosition[2]+","//dataMappedForMotorisedPosition[2]

    //  +  (speedDelta) +
     +  speedLocalDelta +
      
      ","+ driverOnOff +","+dataToTeensyNoJo+","+decompte[8]+","+decompte[7]+","+decompte[6]+","+decompte[5]+","+decompte[4]+","+decompte[3]+","+decompte[2]+"," // to manage 12 note +decompte[1]+","+decompte[0]+ ","

      +  decompte[1]+"," +cohesionCounterLow +","+ cohesionCounterHigh +","+ int (map (LevelCohesionToSend, 0, 1, 0, 100))+">";    

    println(frameCount + ": " +  " dataMarkedToTeensyNoJo" + ( dataMarkedToTeensyNoJo ));
    //   encoderReceiveUSBport101.write(dataMarkedToDue36data);// Send data to Arduino.
    teensyport.write(dataMarkedToTeensyNoJo); // Send data to Teensy. only the movement
  }
  /*
void countRevsLfoPattern11() { // =========================================== Ter NE PAS TOUCHER LE COMPTEUR ou Reduire l'espace avant et apres 0 pour eviter bug à grande vitesse

  for (int i = 1; i < 2; i++) { 
     print (" oldLfoCount[i] "); print (i); print (" ");  println (oldPhaseLfo[i]); print (" newPhaseLfoCount[i] ");; print (i); print (" ");    println (newPhaseLfo[i]); 
//**    print (net.oldPhase[i]); print ("count rev ");   println (net.phase[i]); 
    // decrement caused by negative angular velocity
    // both positive angles || both negative angles || positive-to-negative angle
    //   if (//(net.oldPhase[i] < 0.25 * PI && net.phase[i] > 1.75 * PI) ||//
    if (
      ((oldPhaseLfo[i] < 0.25 *PI && oldPhaseLfo[i]>0)  && (newPhaseLfo[i] > -0.25* PI && newPhaseLfo[i] <0))  || 
       (oldPhaseLfo[i] < -1.75 * PI && newPhaseLfo[i] > -0.25 * PI)// ||
       
    
      ) {
    
      //    TrigmodPos[i]=0;
      revLfo[i]--;
      //      print (" revultion negative  "); println (revolution[i]=i+1); 
      //   revolution[i]=i+1;
     revolution[i]=0; // trig 0 to sent 0 in Max4Live
      memoryi=i;


   //   decompte[i] = -1; // // RESET COUNTER AT 0 (i know it's strange, otherwise with 0 it begin at 1, not 0)
    } else { // if you do twice there is a funny bug
      //    decompte[i]  ++; 
      //   revolution[i]=0;
    }


    // increment caused by positive angular velocity
    // both positive angles || both negative angles || negative-to-positive angle

    if (
      ((oldPhaseLfo[i] > -0.25 *PI && oldPhaseLfo[i]<0)  && (newPhaseLfo[i] < 0.25* PI && newPhaseLfo[i] >0))  || 
       (oldPhaseLfo[i] > 1.75 * PI && newPhaseLfo[i] < 0.25*PI)
      ) {
      onOFF = 1;
      //   TrigmodPos[i]=0;
      revLfo[i]++;
      //   revolution[i]=i+1;
      revolution[i]=0;   // trig 0 to sent 0 in Max4Live
      memoryi=i;
      decompte[i] = 0;  // RESET COUNTER AT 0
    } else {

      decompte[i]  ++; //START COUNTER when a REVOLUTION START OR FINISH

      revolution[i]=1;
    }
     if (  revolution[i]<1) {
   print (" revolutionPattern[i] "); print ( memoryi); print ("  "); print (revolution[memoryi]);
    }
  
    print (" revPattern "); print ( i); print ("  "); println (revLfo[i]);
  }
  if (

   
    (newPhaseLfo[memoryi] < -1.75 * PI && newPhaseLfo[memoryi] >= -0.25*TWO_PI) || ( newPhaseLfo[memoryi]<=-TWO_PI+0.23  && newPhaseLfo[memoryi] >= -0.25*TWO_PI ) 
    ) {
    onOFF = 1;
    //   background (27,59,78);
    //    TrigmodPos[i]=0;
    rev[memoryi]--;
    //      print (" revultion negative  "); println (revolution[i]=i+1);
    //   revolution[i]=i+1;
//**** revolution[memoryi]=0; // trig 0 to sent 0 in Max4Live   brecause it count twice in negative way!!!
    // memoryi=i;


    decompte[memoryi] = -1; // // RESET COUNTER AT 0 (i know it's strange, otherwise with 0 it begin at 1, not 0)
  }
 
}

void countRevsLfoPattern22() { // =========================================== Ter NE PAS TOUCHER LE COMPTEUR ou Reduire l'espace avant et apres 0 pour eviter bug à grande vitesse

  for (int i = 2; i < 3; i++) { 
     print (" oldLfoCount[i] "); print (i); print (" ");  println (oldPhaseLfo[i]); print (" newPhaseLfoCount[i] ");; print (i); print (" ");    println (newPhaseLfo[i]); 
//**    print (net.oldPhase[i]); print ("count rev ");   println (net.phase[i]); 
    // decrement caused by negative angular velocity
    // both positive angles || both negative angles || positive-to-negative angle
    //   if (//(net.oldPhase[i] < 0.25 * PI && net.phase[i] > 1.75 * PI) ||//
    if (
      ((oldPhaseLfo[i] < 0.25 *PI && oldPhaseLfo[i]>0)  && (newPhaseLfo[i] > -0.25* PI && newPhaseLfo[i] <0))  || 
       (oldPhaseLfo[i] < -1.75 * PI && newPhaseLfo[i] > -0.25 * PI)// ||
       
    
      ) {
    
      //    TrigmodPos[i]=0;
      revLfo[i]--;
      //      print (" revultion negative  "); println (revolution[i]=i+1);
      //   revolution[i]=i+1;
     revolution[i]=0; // trig 0 to sent 0 in Max4Live
      memoryi=i;


   //   decompte[i] = -1; // // RESET COUNTER AT 0 (i know it's strange, otherwise with 0 it begin at 1, not 0)
    } else { // if you do twice there is a funny bug
      //    decompte[i]  ++; 
      //   revolution[i]=0;
    }


    // increment caused by positive angular velocity
    // both positive angles || both negative angles || negative-to-positive angle

    if (
      ((oldPhaseLfo[i] > -0.25 *PI && oldPhaseLfo[i]<0)  && (newPhaseLfo[i] < 0.25* PI && newPhaseLfo[i] >0))  || 
       (oldPhaseLfo[i] > 1.75 * PI && newPhaseLfo[i] < 0.25*PI)
      ) {
      onOFF = 1;
      //   TrigmodPos[i]=0;
      revLfo[i]++;
      //   revolution[i]=i+1;
      revolution[i]=0;   // trig 0 to sent 0 in Max4Live
      memoryi=i;
      decompte[i] = 0;  // RESET COUNTER AT 0
    } else {

      decompte[i]  ++; //START COUNTER when a REVOLUTION START OR FINISH

      revolution[i]=1;
    }
     if (  revolution[i]<1) {
   print (" revolutionPattern[i] "); print ( memoryi); print ("  "); print (revolution[memoryi]);
    }
  
    print (" revPattern "); print ( i); print ("  "); println (revLfo[i]);
  }
  if (

   
    (newPhaseLfo[memoryi] < -1.75 * PI && newPhaseLfo[memoryi] >= -0.25*TWO_PI) || ( newPhaseLfo[memoryi]<=-TWO_PI+0.23  && newPhaseLfo[memoryi] >= -0.25*TWO_PI ) 
    ) {
    onOFF = 1;
    //   background (27,59,78);
    //    TrigmodPos[i]=0;
    rev[memoryi]--;
    //      print (" revultion negative  "); println (revolution[i]=i+1);
    //   revolution[i]=i+1;
//**** revolution[memoryi]=0; // trig 0 to sent 0 in Max4Live   brecause it count twice in negative way!!!
    // memoryi=i;


    decompte[memoryi] = -1; // // RESET COUNTER AT 0 (i know it's strange, otherwise with 0 it begin at 1, not 0)
  }
 
}
*/

