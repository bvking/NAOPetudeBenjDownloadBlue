void autmationWithMeasureAndNote()
  {
  char lastKey = key;
  if (key!='#'){
  lastKey=key; 
    }
     text( (beatPrecised-1) %4 + " autmationWith " + lastKey, 1500, -900);

  //autoNote1VelInf64();
  //autoNote1();


    if (measure ==1  && beatPrecised == 1 && beatPrecisedTrigged!=true   ) { // && beatTrigged==true 
      key ='A';
      //net.naturalFrequency[9]=1;
      keyReleased();
     } 

   if ((measure >= 1 && beatPrecisedTrigged == true && ((beatPrecised-1)%4) == 0  ) // 1 5 9 13   0 4 8 12 //&& millis() > formerEvent[172] + 150 &&

   // ((note1 == 72 && velocity1 == 96) || (note2 == 72 && velocity2 == 96) || (note3 == 72 && velocity3 == 96))) {
    // ((note1 == 72  || note2 == 72 || note3 == 72 ))) 
      // ((note1 == 69  || note2 == 69 || note3 == 69 ))
       ) 
     
     {
    formerEvent[172] = millis();
   // key = 'i';
    key = 'T';
    keyReleased();
    //keyEvent[1] = "  autoNote2 Pressed " + formerEvent[172];
    //oscillatorBlocked = networkSize % 2;
    //eventToTrig[1] = " formerEvent[172] INSIDE i ";
    //println(eventToTrig[1]);
  }
  
  if (measure ==2 && beatPrecised == 12 && beatPrecisedTrigged==true  ) { // && beatTrigged==true 
      key = '°'; keyReleased();
  } 

  
  if (measure<5 ) { // && beatTrigged==true 
    speedDelta=3; 
    autoNote2();
  } 
  

  if (measure==5 && beatTrigged==true) {
    speedDelta=3 ;
    key = '9'; keyReleased();
    key = 'A'; keyReleased(); // decale une à une et revient dans l'alignement
    net.naturalFrequency[9]= 5;
  } 

  if (measure==5 && beatPrecised == 4 && beatPrecisedTrigged==true) {
    speedDelta=3 ;

    key = '°';
    keyReleased();
  } 

  if (measure>4  ) {
  //autoNote1();
   autoNote1VelInf64();  // declaer avec A . arrete A puis faire des i ou u
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

  if  (measure==82 &&   beatPrecised == 1 && beatPrecisedTrigged==true) {
    key = '°'; keyReleased();
    formerKeyMetro = '*';
  
    key='9'; // aligné  à une position 
    keyReleased();
    speedDelta=4;
   
    memoryi = 9;
    
    net.naturalFrequency[memoryi]= 2;
  //   key = 't' ;  keyReleased(); // aligné à la moyenne de l'ensemble
  }

    if  (measure==82 && beatPrecisedTrigged==true &&  ( beatPrecised > 1 && beatPrecised <= networkSize+1)) { 
      text(" beatPrecisedTrigged " + beatPrecisedTrigged, 1500, -1000);

    key='T'; // speed is propaged to  next oscilltor 
    keyReleased();
   // key='y';keyReleased(); // uprise speed 
   
   }

     if  (measure==82 && beatPrecisedTrigged==true && beatPrecised > networkSize+1 ) { 
        text(" beatPrecisedTrigged " + beatPrecisedTrigged, 1500, -1000);
        key='y';keyReleased(); // uprise speed 
   
     }

    if  (measure==83 && beatPrecisedTrigged==true && beatPrecised < 15) {  //  &&  beatPrecised <=8 
      text(" beatPrecisedTrigged " + beatPrecisedTrigged, 1500, -1000);
      speedDelta= 6;
      key='y';keyReleased(); // uprise speed 
   
    }

    if  (measure==87 && beatTrigged==true) {  //  &&  beatPrecised <=8 
      text(" beatPrecisedTrigged " + beatPrecisedTrigged, 1500, -1000);
      speedDelta= 6;
      keyCode=CONTROL; keyReleased(); 
      
    }
 

     if ( measure>=106 && measure<=106 && beatTrigged==true) {
       speedDelta= 4;
      //     key='e'; keyReleased();
    
     } 
    if ( measure>=107 && measure<=107 && beatTrigged==true) {
       speedDelta= 4;
        //     key='e'; keyReleased();
      keyCode =CONTROL; keyReleased();
     } 
    if ( measure==108 && beatTrigged==true) {
       speedDelta= 5; 
    }

    if ( measure==122 && beatTrigged==true) {
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


  if  (measure==122 && beatTrigged==true) {// 124 basse

   keyMode = " propagationBallRotationBis ";
    propagationSpeed= 60.0;
        //  key='w';    
        //  keyReleased();
  }

   if  (measure==126 && beatPrecised==1 && beatPrecisedTrigged) {// measure>=41 && measure<=42

      // keyCode = ALT;  keyPressed ();
    key= 'P'; keyReleased ();
       // keyMode = " trigEventWithAbletonSignal ";  // to do in keyMode above. So in functon propagationBallRotationBis();
       // propagationSpeed= 90.0;
       // keyMode = " propagationBallRotationBis ";

   }

    if  (measure==126 && beatPrecised==2 && beatPrecisedTrigged) {// measure>=41 && measure<=42

      // keyCode = ALT;  keyPressed ();
      //  key= 'P'; keyReleased ();
     // keyMode = " trigEventWithAbletonSignal ";  // to do in keyMode above. So in functon propagationBallRotationBis();
      //  propagationSpeed= 90.0;
    keyMode = " propagationBallRotationBis ";

   }

      if  (measure==130 && beatPrecised==1 && beatPrecisedTrigged) {// measure>=41 && measure<=42

     // key= 'M'; keyReleased ();
     // keyMode = " trigEventWithAbletonSignal ";  // to do in keyMode above. So in functon propagationBallRotationBis();
    // propagationSpeed= 30.0;

   }

    if  (measure==128 && beatTrigged==true) {// measure>=41 && measure<=42
    keyMode = " propagationBallRotationBis ";
  
  //  key='w';    
  //  keyReleased();
  }
  
    if  (measure==129 && beatTrigged==true) {// measure>=41 && measure<=42
   // propagationSpeed= 280.0;
   
  //  key='w';    
  //  keyReleased();
  }

  if  (measure==130 && beatTrigged==true) {// measure>=41 && measure<=42
     keyMode = " propagationBallRotationBis ";
   // propagationSpeed= 120.0;

  }
  if  (measure>=129 ) {// measure>=41 && measure<=42
    //  autoNote1();
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

  lastKey = '#';
 
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
