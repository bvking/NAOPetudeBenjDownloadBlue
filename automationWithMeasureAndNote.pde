void autmationWithMeasureAndNote()
{
  textSize(100);
  char lastKeyAuto = key;
   if (formerKey!='#'){
  lastKeyAuto=formerKey;
     }

  text(" speedD " + speedDelta + " beat%4 " + ((beatPrecised-1)%4==0) + " lastK "  + lastKeyAuto , 1000, -200);  // + " event " + formerEvent[note1]

  if (measure ==1  && beatPrecised == 2 && beatPrecisedTrigged == true )  //startStop = 3;
   { 
    speedDelta = 2;
    //keyCode = CONTROL;
    modeCircular=false;
    key = 'F';keyReleased();
    key = 'F';keyReleased();
    key = 'F';keyReleased();
    key = 'k';keyReleased();
    key = 'k';keyReleased();
  }

  if ((measure >= 1 && measure<5 && beatPrecisedTrigged == true && ((beatPrecised-1)%4)==0  )) // 1 5 9 13   0 4 8 12 //&& millis() > formerEvent[172] + 150 &&
    //((note1 == 72  || note2 == 72 || note3 == 72 )))
    //((note1 == 69  || note2 == 69 || note3 == 69 ))
  {
    formerEvent[172] = millis(); //
    key = 'i';
    // key = 'T';
    keyReleased();
    //keyEvent[1] = "  autoNote2 Pressed " + formerEvent[172];
    //oscillatorBlocked = networkSize % 2;
    //eventToTrig[1] = " formerEvent[172] INSIDE i ";
    //println(eventToTrig[1]);
  }

  if (measure ==2 && beatPrecised == 12 && beatPrecisedTrigged==true  ) { // && beatTrigged==true
    key = '°';
    keyReleased();
  }


  if (measure<5 ) { // && beatTrigged==true
    //  speedDelta=3;

   // autoNote2();// too much event
  }


  if (measure==5 && beatTrigged==true) {

    key = '9'; //Alig
    keyReleased();
    memoryi=networkSize-1;
    key = 'A'; // net.naturalFrequency[memoryi]= 0.25
    keyReleased(); // decale une à une et revient dans l'alignement
    // net.naturalFrequency[memoryi]= 0.25;//4.68/2; // 124 bpm

   // net.naturalFrequency[9]= 5;
  }

  if (measure==5 && beatPrecised == 4 && beatPrecisedTrigged==true) {
   // key = '°'; // stop frequency
   // keyReleased();
    key = '9'; //Alig
    keyReleased();
    //key = 'P'; 
    key = 'F';keyReleased();
    key = 'F';keyReleased();
    key = 'F';keyReleased();
    //keyCode = CONTROL;
  }

  if (measure>4 && measure<=41 ) {
    //autoNote1();
    autoNote1VelInf64();  // declaer avec A . arrete A puis faire des i ou u
  }

  if ( measure==2 && beatTrigged==true ) {
    key='$';
    keyReleased();
  }
  
  if (measure ==  36 && beatTrigged ==  true ) {// measure>=41 && measure<=42
    // for (int i = 0; i < networkSize; i++) {
    memoryi=0;
    net.naturalFrequency[memoryi]=1;
    key = 'a';  // frequency  [0]= 1
    keyReleased();
    key = '9';  // align
    keyReleased();
    key = '0';  // same speed
    keyReleased();
    key = 'q';
    keyReleased();
    key = 'n';
    keyReleased();
    key = 'q';
    keyReleased();
    key = 'n';
    keyReleased();
    key = 'o';
    keyReleased();
    //  }
  }

  if  (measure==37 && beatTrigged==true  ) {
    key='p';
    keyReleased();
    key='p';
    keyReleased();
    
  }

  if  (measure==40 && beatTrigged==true  )
   {
    key='9'; // align
    keyReleased();
    key='r';
    keyReleased();
    key='r';
    keyReleased();
    key='r';
    keyReleased();
   
  }
  
  if  (measure==40 && beatPrecised == 15 && beatPrecisedTrigged==true ) {
    key='9'; // align
    keyReleased();
    }


  if  (measure==40 && beatPrecised == 15 && beatPrecisedTrigged==true ) {// return in main
  
    formerKeyMetro = '*';
    keyMode = " null ";
    draw(); //go to main --> goOut from trigEvent
  }


  if  (measure==410 && beatTrigged==true ) {//77  //&& beatTrigged==true
    //    key='o';
    //    keyReleased();
    specialPropagationKey = ':';
  
    //**key='1';
    //**keyReleased();
    //key='à';// normalize frquency to net.natural(frequency[0] or networksize-1)
    //**key='0';// // normalize frquency to net.natural(frequency[0] or networksize-1)
    //**keyReleased();

     //key=CONTROL;
    // keyReleased();
    // oscillatorBlocked=networkSize-1;
    speedDelta=1;
  }


    if  (measure==51 && beatTrigged==true ) {//77  //&& beatTrigged==true

    specialPropagationKey = ':';
  
    speedDelta=3;
  }

  if  ((measure==43 || measure==45 || measure==47 || measure==50 ) && ( beatPrecised>=16 && beatPrecisedTrigged==true ) ) {//77  //&& beatTrigged==true
   // key='o';
  //  keyReleased();
  }

 // if (measure >= 41 && measure <= 57 && millis() > formerEvent[74] + 200 &&
 if (measure >= 41 && measure <= 80 && millis() > formerEvent[74] + 500 &&
    ((note1 == 74 && velocity1 >= 1 && velocity1 <= 130) ||
    (note2 == 74 && velocity2 >= 1 && velocity2 <= 130) ||
    (note3 == 74 && velocity3 >= 1 && velocity3 <= 130) ||
    (note4 == 74 && velocity4 >= 1 && velocity4 <= 130) ||
    (note5 == 74 && velocity5 >= 1 && velocity5 <= 64) ||
    (note6 == 74 && velocity6 >= 1 && velocity6 <= 64))) {
    //     key='9'; //TROUVE AUTRE CHOSE QUE l'ALIGNEMENT   pas cool à 60
    // key='t'; //TROUVE AUTRE CHOSE QUE l'ALIGNEMENT   pas cool à 60

   //  key='p'; 
    // keyReleased();
    formerEvent[74]=millis();
  }

  if  (measure==71 && beatTrigged==true  ) {
    speedDelta=3;
  }

  if  (measure==81 &&   beatPrecised%4==0  && beatPrecisedTrigged==true) {

    speedDelta=3;
    modeStartKeyToFollow =  " truc "; // tres important pour sortir du mode follow sample
    moveKeys[8]=true;
    moveKeys[11]=true;  // keyMode TrigEvent
    setKeyModeByTappingKeyPadOnce();
    key = 'f'; keyReleased();
  }

  if  (measure==82 &&   beatPrecised == 1 && beatPrecisedTrigged==true) {

    key = '°';
    keyReleased();
    formerKeyMetro = '*';

    key='9'; // aligné  à une position
    keyReleased();
    speedDelta=7;

    memoryi = networkSize-1;

    net.naturalFrequency[memoryi]= 2;
    //   key = 't' ;  keyReleased(); // aligné à la moyenne de l'ensemble
   // key='y';
   // keyReleased(); // uprise speed
  }



  if  (measure==82 && beatPrecisedTrigged==true &&  ( beatPrecised > 1 && beatPrecised <= networkSize+1)) {
    text(" beatPrecisedTrigged " + beatPrecisedTrigged, 1500, -1000);
    key='T'; // speed is propaged to  next oscilltor
    keyReleased();
    
  }

  if  (measure==82 && beatPrecisedTrigged==true && beatPrecised > networkSize+1 ) {
    text(" beatPrecisedTrigged " + beatPrecisedTrigged, 1500, -1000);
    key='y';
    keyReleased(); // uprise speed
  }
  if  (measure==83 && beatTrigged ) {
   // speedDelta=8;
  }
  if  (measure==83 && beatPrecisedTrigged==true && (beatPrecised+1)%4==0  ) {  //  &&  beatPrecised <=8
    text(" beatPrecisedTrigged " + beatPrecisedTrigged, 1500, -1000);
    key='y';
    keyReleased(); // uprise speed
  }
  if  (measure==84 && beatTrigged ) {
   // speedDelta=8;
  }

  if  (measure==84 && beatPrecisedTrigged==true && (beatPrecised+1)%6==0  ) {  //  &&  beatPrecised <=8
    text(" beatPrecisedTrigged " + beatPrecisedTrigged, 1500, -1000);
    key='y';
    keyReleased(); // uprise speed
    key='y';
    keyReleased(); // uprise speed
  }

  if  (measure==85 && beatTrigged ) {
    key='y';
    keyReleased(); // uprise speed
  }

  if  (measure==87 && beatTrigged==true) {  //  &&  beatPrecised <=8
    text(" beatPrecisedTrigged " + beatPrecisedTrigged, 1500, -1000);

    keyCode=CONTROL;
    keyReleased();
  }

  if ( (measure==89 || measure==92 || measure==94) && beatTrigged==true) {

    key='P';
    keyReleased();
  }

  if ( (measure==96 || measure==99 || measure==101) && beatTrigged==true) {

    key='P';
    keyReleased();
   // key='P';
   // keyReleased();
  }

  if ( (measure==89 || measure==92 || measure==94) && beatPrecisedTrigged==true && beatPrecised == 3) { // acceleration after mouvement
    key='r';
    keyReleased();
    key='r';
    keyReleased();
    key='r';
    keyReleased();
    key='r';
    keyReleased();
    key='r';
    keyReleased();
    key='r';
    keyReleased();
  }

  if ( (measure==97 || measure==100 || measure==102) && beatPrecisedTrigged==true && beatPrecised == 3) { // acceleration after mouvement
    key='r';
    keyReleased();
    key='r';
    keyReleased();
    key='r';
    keyReleased();
    key='r';
    keyReleased();
    key='r';
    keyReleased();
  }

  if ( measure==104 && beatTrigged==true) {
    key='P';
    keyReleased();
  
  }

  if ( measure==104 && beatPrecisedTrigged==true  && ( beatPrecised == 1 || beatPrecised == 5   || beatPrecised == 9 || beatPrecised == 13 || beatPrecised == 17 || beatPrecised == 21  )) {
     key='r';
    keyReleased();
    }

  if ( (measure==106  && beatPrecisedTrigged==true) && ( beatPrecised == 1 || beatPrecised == 6   || beatPrecised == 11  || beatPrecised == 17 || beatPrecised == 23 ) ) { //|| beatPrecised == 6 || beatPrecised == 17
   //key='r';
   //keyReleased();
   //  key='R';
  //  keyReleased();
   
  }

  if ( measure==107 && beatPrecisedTrigged==true && ( beatPrecised == 1 || beatPrecised == 13 )) {

    key='F';
    keyReleased();
 
  }
  if ( measure==108 && beatTrigged==true) {
    key='F';
    keyReleased();
    
  
  }

  if  (((measure==111 || measure==113 || measure== 117)  && beatPrecisedTrigged==true && // ( beatPrecised == 1 || beatPrecised == 2 || beatPrecised == 3|| beatPrecised == 4 || beatPrecised == 5 ||
            beatPrecised %4==0 ))  {                                                                            //    beatPrecised == 7|| beatPrecised == 9 || beatPrecised == 11 || beatPrecised == 13 || beatPrecised == 15 ||
                                                                                         //     beatPrecised == 17 || beatPrecised == 19 || beatPrecised == 21 || beatPrecised == 23   ) ) { 
                                                                                             
    key='f'; // good way
    keyReleased();
 
  }

  if  (((measure==119)  && beatPrecisedTrigged==true) && ( beatPrecised == 1 || beatPrecised == 6 || beatPrecised == 11 || beatPrecised == 16|| beatPrecised == 21 ) ) {
    key='T';
    keyReleased();
  }

  if  (((measure==120)  && beatTrigged==true)  ) {
    memoryi=networkSize-1;// set Memoryi to 9 to start stop frequency at 0 by tapping 't'
  }

  if  (((measure==120)  && beatPrecisedTrigged==true) && ( beatPrecised == 1 || beatPrecised == 6 || beatPrecised == 11 || beatPrecised == 16 || beatPrecised == 21 ) ) {
    key='t';
    keyReleased();
  }

  if  (((measure==121)  && beatPrecisedTrigged==true) && ( beatPrecised == 1 || beatPrecised == 6 || beatPrecised == 11 || beatPrecised == 16  ) ) {
    key='t';
    keyReleased();
  }



   if  (measure==121 && beatPrecised==18 && beatPrecisedTrigged==true)
  {// 124 basse
    speedDelta=4;
    key='*';
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
    key='0';
    keyReleased(); // speed=0
    key='q';
    keyReleased(); // speed=0
    key='n';
    keyReleased(); // speed=0
  }


  if  (measure==122 && beatPrecised==1 && beatPrecisedTrigged == true) {// 124 basse
    propagationSpeed= 77.0;
   // keyCode = LEFT; keyReleased(); // to do in propa
    keyMode = " propagationBallRotationBis ";
    //moveKeys[8]=true;
    //moveKeys[16]=true;
    //setKeyModeByTappingKeyPadOnce();
    //propagationBallRotationBis(propagationSpeed);

    //  key='w';
    //  keyReleased();
  }

  if  (measure==126 && beatPrecised==1 && beatPrecisedTrigged == true) {// measure>=41 && measure<=42

    // keyCode = ALT;  keyPressed ();
    key= 'P';
    keyReleased ();
    // keyMode = " trigEventWithAbletonSignal ";  // to do in keyMode above. So in functon propagationBallRotationBis();
    // propagationSpeed= 90.0;
    // keyMode = " propagationBallRotationBis ";
  }

  
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
  } else  beatPrecisedTrigged=false;

  if (formerMeasure!=measure) {
    beatTrigged=true;
    beatOnMeasure=(measure%4)+1;
    println(" MEASURE " + measure);
    formerFrameBeat=frameCount;
  } else beatTrigged=false;

  if (formerBeatPrecised!=beatPrecised) {
    beatPrecisedTrigged=true;
    println(beatPrecisedTrigged);
  } else  beatPrecisedTrigged=false;
}