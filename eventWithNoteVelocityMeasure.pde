void autmationWithMeasureAndNote()
  {
  char lastKey = key;
  if (key!='#'){
  lastKey=key; 
    }
     text(" autmationWith " + lastKey, 1500, -900);

  //autoNote1VelInf64();
  //autoNote1();
   if (measure ==1 && beatPrecised == 1 && beatTrigged==true  ) { // && beatTrigged==true 
    //  keyCode = CONTROL;
      keyReleased();
  } 

  if (measure<5 ) { // && beatTrigged==true 
    speedDelta=3; 
    autoNote2();
  } 
  
  if (measure>4  ) {
  //autoNote1();
   autoNote1VelInf64();
    } 
  if (measure==5 && beatTrigged==true) {
    speedDelta=3 ;
  } 
  if ( measure==1 && beatTrigged==true ) {

    key='$';
    keyReleased();
  }
  if ( measure==5 && beatTrigged==true) {
    // d=0;
    oscillatorBlocked=networkSize/2;
//    d=100;
  }
  if ( measure==6 && beatTrigged==true) {
    d=200;
  }

  if  (measure==61 && beatTrigged==true  ) {
    key='o';
    keyReleased();
  }

  if  (measure>=71 && measure<78 ) {
    autoNote2();
  }

  if  (measure==40 && beatTrigged==true ) {//77  //&& beatTrigged==true
    //    key='o';
    //    keyReleased();
    key='9';
    keyReleased();
    key=CONTROL;
    keyReleased();
    oscillatorBlocked=networkSize-1;
    speedDelta=4;
  }

  if  (measure==43 || measure==45 || measure==47 || measure==50 && beatPrecised>=16 && beatPrecisedTrigged==true ) {//77  //&& beatTrigged==true
    key='o';
    keyReleased();
  }

if (measure >= 41 && measure <= 57 && millis() > formerEvent[74] + 200 &&
    ((note1 == 74 && velocity1 >= 1 && velocity1 <= 64) ||
     (note2 == 74 && velocity2 >= 1 && velocity2 <= 64) ||
     (note3 == 74 && velocity3 >= 1 && velocity3 <= 64) ||
     (note4 == 74 && velocity4 >= 1 && velocity4 <= 64) ||
     (note5 == 74 && velocity5 >= 1 && velocity5 <= 64) ||
     (note6 == 74 && velocity6 >= 1 && velocity6 <= 64))) { 
    //     key='9'; //TROUVE AUTRE CHOSE QUE l'ALIGNEMENT   pas cool à 60
    key='t'; //TROUVE AUTRE CHOSE QUE l'ALIGNEMENT   pas cool à 60
    keyReleased();
    formerEvent[74]=millis();
  }

  if  (measure==78 && beatTrigged==true) {

    key='*';
    keyReleased();
    key='9';
    keyReleased();
    speedDelta=3;
    memoryi=9;
    key='A'; 
    keyReleased();
    net.naturalFrequency[9]=1;
    key='o'; 
    keyReleased();
 
     }
    if  (measure==79 && beatPrecisedTrigged==true  ) { 
      text(" beatPrecisedTrigged " + beatPrecisedTrigged, 1500, -1000);

    key='T'; // speed is propaged to  next oscilltor 
    keyReleased();
    key='y';keyReleased(); // uprise speed 
   
  }
  if  (measure==80 && beatPrecisedTrigged==true  ) { 
      text(" beatPrecisedTrigged " + beatPrecisedTrigged, 1500, -1000);

    key='T'; // speed is propaged to  next oscilltor 
    keyReleased();
    key='y';keyReleased(); // uprise speed 
   
  }

     if  (measure==79 && beatTrigged==true) {
    speedDelta= 4;
  }  

   if  (measure==79 && beatPrecisedTrigged==true  ) { 
      //   key='y';keyReleased(); // uprise speed 
   
  }

    if  (measure==80 && beatTrigged==true) {
    speedDelta= 5;
  }  
  
  if  (measure==81  && beatTrigged==true) {
     //   speedDelta= 6;
  }  
  if  (measure==80 && measure<=200 ) {//129
    autoNote2();
  }
  if  (measure>=79+2 && measure<=79+2 && beatTrigged==true) {
   // speedDelta= 4;
  }
  if  (measure>=79+3 && measure<=79+3 && beatTrigged==true) {
  //  speedDelta= 4;
  }
  
  if  (measure>=79+4 && measure<=79+4 && beatTrigged==true) {
  //  speedDelta= 4;
  }

  if  (measure>=84 && measure<=92 && beatTrigged==true) {

    //   key='y';keyReleased();
  }
   if ( measure>=106 && measure<=106 && beatTrigged==true) {
       speedDelta= 2;
  //     key='e'; keyReleased();
    
  } 
  if ( measure>=107 && measure<=107 && beatTrigged==true) {
       speedDelta= 2;
  //     key='e'; keyReleased();
      keyCode =CONTROL; keyReleased();
    
  } 
    if ( measure>=109 && measure<=109 && beatTrigged==true) {
       speedDelta= 2;
     
  } 
    if ( measure>=115 && measure<=115 && beatTrigged==true) {
       speedDelta= 2;
    //   key='e'; keyReleased();
    
  } 
      if ( measure>=116 && measure<=116 && beatTrigged==true) {
       speedDelta= 2;
     
  } 


  if  (measure>=129 && measure<130 && beatTrigged==true) {// measure>=41 && measure<=42
    speedDelta=4;
    key='$';
    keyReleased();
    key='H';
    keyReleased();
    key='H';
    keyReleased();
    key='H';
    keyReleased();
    key='H';
    keyReleased();

    key='H';
    keyReleased();
    key='H';
    keyReleased();
    key='H';
    keyReleased();
    key='H';
    keyReleased();

    //  key='O';
    ///   keyReleased();

    //   key='°';keyReleased(); // speed=0 
    key='0';
    keyReleased(); // speed=0
    key='q';
    keyReleased(); // speed=0
    key='n';
    keyReleased(); // speed=0
  }
  if  (measure>=129 ) {// measure>=41 && measure<=42
    //  autoNote1();
  }


  if  (measure>=133 && measure<=137 && beatTrigged==true) {// measure>=41 && measure<=42

    //  key='o';    keyReleased();
    key='*';    
    keyReleased();
    key='w';    
    keyReleased();
  }
  if  (measure>=137 && measure<=137 && beatTrigged==true) {// measure>=41 && measure<=42

    //  key='o';    keyReleased();
    key='*';    
    keyReleased();
    
  }
   if  (measure>=166 && beatTrigged==true) {// measure>=41 && measure<=42
    key='°';    keyReleased();
    key='o';    keyReleased();
    key='*';    keyReleased();
    
  }
  // autoNote1Original(); // !=0
  // autoNote2();
}

String[] displayEventFromKeyReleased(String[] keyEvent) { 
  for (int i = 0; i < keyEvent.length; i++) { 
  //  text ( " keyEvent " + i + keyEvent[i], 500, 700+100*i); 
  } 
  return keyEvent;  // Returns an array of 3 ints: 20, 40, 60 
}

/*
void displayDebugWhenKeyReleased (eventToTrig[1], eventToTrig[0])
 {
       text  (" eventToTrig " + eventToTrig[0], 500, 700);  
        text  (" eventToTrig " + eventToTrig[1], 500, 700);  
   }
*/

void trigBeatWithMeasure()
 {
   if (formerBeatPrecised!=beatPrecised) {
         beatPrecisedTrigged=true;
   }
     else  beatPrecisedTrigged=false; 

  if (formerMeasure!=measure) {
    beatTrigged=true;
    beatOnMeasure=(measure%4)+1;
    println(" MEASURE " + measure);
    formerFrameBeat=frameCount;
   }
 
   else beatTrigged=false;
 
  if (formerBeatPrecised!=beatPrecised) {   
     beatPrecisedTrigged=true;
     println(beatPrecisedTrigged);
    }
  
   else  beatPrecisedTrigged=false; 
  
 } 
