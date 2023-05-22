String[] displayEventFromKeyReleased(String[] keyEvent) { 
  for (int i = 0; i < keyEvent.length; i++) { 
    text ( " keyEvent " + i + keyEvent[i], 500, 700+100*i); 
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
 //   beatTrigged=false;
 //   beatPrecisedTrigged=false; 
   if (formerBeatPrecised!=beatPrecised) {
         beatPrecisedTrigged=true;
  }
  else  beatPrecisedTrigged=false; 

   if (formerMeasure!=measure) {
  
    beatTrigged=true;

    beatOnMeasure=(measure%4)+1;
    print("  ******** "); 
    print("  ******** "); 
    print("  ******** "); 
    print("  ******** "); 
    print("  ******** "); 
    println(measure);
    formerFrameBeat=frameCount;
    //    if (formerBeatPrecised
 }
 
 else beatTrigged=false;
 
      if (formerBeatPrecised!=beatPrecised) {   
    //     background (127, 50, 50);
    beatPrecisedTrigged=true;
    print("  ******** "); 
    print("  ******** "); 
    print(" automation1*100 ");  println( automation1*100 );
    print("  ******** "); 
    print("  ******** "); 
    print("  beatPrecised "); 
    println(beatPrecisedTrigged);
  }
  
  else  beatPrecisedTrigged=false; 
  
} 

void autmationWithMeasureAndNote() {
 // if (formerSartKey!=L){
  autoNote1VelInf64();
 //  }

  if (measure<5 ) { // && beatTrigged==true 
    speedDelta=4; 
    autoNote2();
  } 
  if (measure==5 && beatTrigged==true) {
    speedDelta=4 ;
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
    key='A'; 
    keyReleased();
    key='o'; 
    keyReleased();

    key='*';
    keyReleased();

    key='T';
    keyReleased();
    key='T';
    keyReleased();
    key='T';
    keyReleased();
    key='T';
    keyReleased();

    key='T';
    keyReleased();
    key='T';
    keyReleased();
    key='T';
    keyReleased();
    key='T';
    keyReleased();

    key='T';
    keyReleased();
    key='T';
    keyReleased();
    key='T';
    keyReleased();
    key='T';
    keyReleased();
    key='t';
    keyReleased();
    keyCode=CONTROL;
    keyReleased();
    speedDelta=12;

    key='Y';
    keyReleased();
    key='Y';
    keyReleased();
    key='Y';
    keyReleased();
    key='Y';
    keyReleased();
    key='Y';
    keyReleased();
    key='Y';
    keyReleased();
    key='Y';
    keyReleased();


    key='Y';
    keyReleased();
    key='Y';
    keyReleased();
    key='Y';
    keyReleased();
    key='Y';
    keyReleased();
    key='Y';
    keyReleased();
  //    key='Y';keyReleased();
    //   key='Y';keyReleased();
  }
  
  if  (measure>=79+1 && measure<=79+1 && beatTrigged==true) {
    speedDelta= 8;
  }  
  if  (measure>=79+1 && measure<=200 ) {//129
    autoNote2();
  }
  if  (measure>=79+2 && measure<=79+2 && beatTrigged==true) {
    speedDelta= 4;
  }
  if  (measure>=79+3 && measure<=79+3 && beatTrigged==true) {
    speedDelta= 4;
  }
  
  if  (measure>=79+4 && measure<=79+4 && beatTrigged==true) {
    speedDelta= 2;
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


void autoNote2() {//1 61 63 64 66 85 
  keyEvent[0] = " 0 ";
  keyEvent[1] = " i No Pressed " + formerEvent[172];
  keyEvent[2] = " 0 ";
  keyEvent[3] = " 0 ";
  d = 0;

  if ((measure <= 5 && millis() > formerEvent[172] + 150 + d) &&
    ((note1 == 72 && velocity1 == 96) || (note2 == 72 && velocity2 == 96) || (note3 == 72 && velocity3 == 96))) {
    formerEvent[172] = millis();
    key = 'i';
    keyReleased();
    keyEvent[1] = " i Pressed " + formerEvent[172];
    oscillatorBlocked = networkSize % 2;
    eventToTrig[1] = " formerEvent[172] INSIDE i ";
    println(eventToTrig[1]);
  }

  if (measure == 42 && beatTrigged) {
    for (int i = 0; i < networkSize; i++) {
      // ActualVirtualPosition[i]=ActualVirtualPosition[i]+numberOfStep/3*i;
      // ActualVirtualPosition[i]=ActualVirtualPosition[i]+numberOfStep/3*i;
      // key=';';keyPressed(); print ("rise up frameratio +5 ");
      // key=';';keyPressed(); print ("rise up frameratio +5 ");
      // key=';';keyPressed(); print ("rise up frameratio +5 ");
    }
  }

  if ((measure <= 40 && millis() > formerEvent[167] + 450 + d) &&
    ((note1 == 67 && velocity1 == 96) || (note2 == 67 && velocity2 == 96) || (note3 == 67 && velocity3 == 96))) {
    formerEvent[167] = millis();
    text("formerEvent[167] INSIDE " + formerEvent[167], 500, 700);
    println(formerEvent[167]);
  }

  if ((measure <= 40 && millis() > formerEvent[169] + 10 + d) &&
    ((note1 == 69 && velocity1 == 96) || (note2 == 69 && velocity2 == 96) || (note3 == 69 && velocity3 == 96))) {
    formerEvent[169] = millis();
    key = 'p';
    keyReleased();
    keyEvent[0] = " formerEvent[169] INSIDE p ";
    text("formerEvent[169] INSIDE " + formerEvent[167], 500, 700);
    println(" formerEvent[160] INSIDE " + formerEvent[167]);
  }

  if ((measure > 40 && measure < 75 && millis() > formerEvent[169] + 450 + d) &&
    ((note1 == 69 && velocity1 == 96) || (note2 == 69 && velocity2 == 96) || (note3 == 69 && velocity3 == 96))) {
    key = 'P';
    keyReleased();
    print("formerEvent[169] INSIDE ");
    println(formerEvent[169]);
    formerEvent[169] = millis();
  }

  if ((measure > 78 && measure <= 129 && millis() > formerEvent[169] + 2950) &&
    ((note1 == 69 && velocity1 == 96) || (note2 == 69 && velocity2 == 96) || (note3 == 69 && velocity3 == 96))) {
    key = 'p';
    keyReleased();
    key = '#';
    keyReleased();
    formerEvent[169] = millis();
    print("formerEvent[269] INSIDE ");
    println(formerEvent[169]);
  }


 /*
  keyEvent[0]= " 0 ";
  //keyEvent[1]= " 0 ";
          keyEvent[1]= " i No Pressed " + formerEvent[172] ;

  keyEvent[2]= " 0 ";
  keyEvent[3]= " 0 ";
  d=0;
  */

    if (( measure<=5 && millis()>formerEvent[172]+150+d)&&
      ((note1==72  && velocity1==96 )|| (note2==72  && velocity2==96 )||
       (note3==72  && velocity3==96 ))) {
        formerEvent[172]=millis();
        key='i';//i= 105 
        keyReleased();
        keyEvent[1]= " i Pressed " + formerEvent[172] ;
        oscillatorBlocked=networkSize%2;
   
        eventToTrig[1]= " formerEvent[172] INSIDE i ";
        println (eventToTrig[1]);
    }

 
    if  (measure>41 && measure<=42  && beatTrigged==true  ) {// measure>=41 && measure<=42
      for (int i = 0; i < networkSize; i++) {

        //    ActualVirtualPosition[i]=ActualVirtualPosition[i]+numberOfStep/3*i;
        //     ActualVirtualPosition[i]=ActualVirtualPosition[i]+numberOfStep/3*i;
        //    key=';';keyPressed(); print ("rise up frameratio +5 ");
        //    key=';';keyPressed(); print ("rise up frameratio +5 ");
        //    key=';';keyPressed(); print ("rise up frameratio +5 ");
      }
    }
    //%ADMAD
    if (( measure<=40 && millis()>formerEvent[167]+450+d)&&
      ((note1>66 && note1<68  && velocity1>=96 && velocity1<=96)|| (note2>66 && note2<68 && velocity2>=96 && velocity2<=96) || (note3>66 && note3<68 && velocity3>=96 && velocity3<=96))) {
      formerEvent[167]=millis();
      //  key='E'; 
      //  keyReleased(); //u=117


      text  ("formerEvent[167] INSIDE " + formerEvent[167], 500, 700);  
 
      println (formerEvent[167]);
    }
     
    if (( measure<=40 && millis()>formerEvent[169]+10+d) &&
      ((note1==69  && velocity1==96)|| (note2>68 && note2<70 && velocity2>=96 && velocity2<=96) || (note3>68 && note3<70 && velocity3>=96 && velocity3<=96))) {
      formerEvent[169]=millis();
      key='p'; //E=69
      keyReleased(); //u=117
    //  eventToTrig[0]= " formerEvent[169] INSIDE p ";
       keyEvent[0]= " formerEvent[169] INSIDE p ";
   //   displayDebugWhenKeyReleased ( " formerEvent[169] INSIDE p ");
      text  ("formerEvent[169] INSIDE " + formerEvent[167], 500, 700);  
      println (" formerEvent[160] INSIDE " + formerEvent[167]);

    } 

    if (( measure>40 && measure<75 && millis()>formerEvent[169]+450+d)&&
      ((note1>68 && note1<70  && velocity1>=96 && velocity1<=96)|| (note2>68 && note2<70 && velocity2>=96 && velocity2<=96) || (note3>68 && note3<70 && velocity3>=96 && velocity3<=96))) {

      key='P'; //P=80
      keyReleased(); //u=117


      print ("formerEvent[169] INSIDE ");  
      println (formerEvent[169]);
      formerEvent[169]=millis();
    } 

    if (( measure>78 && measure<=129 && millis()>formerEvent[169]+2950 )  && //1400 with P
      ((note1>68 && note1<70  && velocity1>=96 && velocity1<=96)|| (note2>68 && note2<70 && velocity2>=96 && velocity2<=96) || (note3>68 && note3<70 && velocity3>=96 && velocity3<=96))) {

   //   key='R'; //P=80    R when frequency are negative
      key='p';
      keyReleased(); //u=117
      key='#'; //P=80    R when frequency are negative
      //  keyReleased(); //u=117

      formerEvent[169]=millis();
      print ("formerEvent[269] INSIDE ");  
      println (formerEvent[169]);
    } 
    
   

  
} 


