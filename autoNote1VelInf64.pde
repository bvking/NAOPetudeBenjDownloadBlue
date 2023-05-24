void autoNote1VelInf64() {

  if (measure <= 15 && millis() > formerEvent[64] + 950 + d &&

      ((note1 == 64 && velocity1 >= 1 && velocity1 <= 64) || (note2 == 64 && velocity2 >= 1 && velocity2 <= 64) ||
       (note3 == 64 && velocity3 >= 1 && velocity3 <= 64) || (note4 == 64 && velocity4 >= 1 && velocity4 <= 64) ||
       (note5 == 64 && velocity5 >= 1 && velocity5 <= 64) || (note6 == 64 && velocity6 >= 1 && velocity6 <= 64))) {
    formerEvent[64] = millis();
    print("formerEvent[64] INSIDE");
    println(formerEvent[64]);
  }

  if (measure <= 40 && millis() > formerEvent[69] + 900 + d &&

      ((note1 == 69 && velocity1 >= 1 && velocity1 <= 64) || (note2 == 69 && velocity2 >= 1 && velocity2 <= 64) ||
       (note3 == 69 && velocity3 >= 1 && velocity3 <= 64) || (note4 == 69 && velocity4 >= 1 && velocity4 <= 64) ||
       (note5 == 69 && velocity5 >= 1 && velocity5 <= 64) || (note6 == 69 && velocity6 >= 1 && velocity6 <= 64))) {
   key = 'f';
   keyReleased();
    formerEvent[69] = millis();
    print("formerEvent[69] INSIDE");
    println(formerEvent[69]);
  }

  if (measure <= 11 && millis() > formerEvent[72] + 350 + d && 

   ((note1 == 72 && velocity1 >= 1 && velocity1 <= 64) || 
    (note2 == 72 && velocity2 >= 1 && velocity2 <= 64) || 
    (note3 == 72 && velocity3 >= 1 && velocity3 <= 64) || 
    (note4 == 72 && velocity4 >= 1 && velocity4 <= 64) || 
    (note5 == 72 && velocity5 >= 1 && velocity5 <= 64) || 
    (note6 == 72 && velocity6 >= 1 && velocity6 <= 64))) {

  //key = 'U';
  key = 'u';
  keyReleased();
  formerEvent[72] = millis();
  print("formerEvent[72] INSIDE");
  println(formerEvent[72]);
}


  if (measure <= 40 && millis() > formerEvent[67] + 50 + d &&

      ((note1 == 66 && velocity1 >= 1 && velocity1 <= 64) || (note2 == 66 && velocity2 >= 1 && velocity2 <= 64) ||
       (note3 == 66 && velocity3 >= 1 && velocity3 <= 64) || (note4 == 66 && velocity4 >= 1 && velocity4 <= 64) ||
       (note5 == 66 && velocity5 >= 1 && velocity5 <= 64) || (note6 == 66 && velocity6 >= 1 && velocity6 <= 64))) {
    key = 'r';
    keyReleased();
    formerEvent[67] = millis();
    print("formerEvent[67] INSIDE");
    println(formerEvent[67]);
  }

  if (measure < 41 && millis() > formerEvent[74] + 100 &&

      ((note1 == 74 && velocity1 >= 1 && velocity1 <= 64) || (note2 == 74 && velocity2 >= 1 && velocity2 <= 64) ||
       (note3 == 74 && velocity3 >= 1 && velocity3 <= 64) || (note4 == 74 && velocity4 >= 1 && velocity4 <= 64) ||
       (note5 == 74 && velocity5 >= 1 && velocity5 <= 64) || (note6 == 74 && velocity6 >= 1 && velocity6 <= 64))) {
    key = 'r';
    keyReleased();
    key = 'r';
    keyReleased();
    formerEvent[74] = millis();
  }

  

  if (measure >= 12 && measure <= 12 && beatPrecised >= 4 && beatPrecisedTrigged == true) {
  // key='K';keyReleased();
   } 
 
  if (measure >= 12 && measure <= 34 && millis() > formerEvent[76] + 1000 &&
  
   ((note1 == 76 && velocity1 >= 1 && velocity1 <= 127) || 
    (note2 == 76 && velocity2 >= 1 && velocity2 <= 127) || 
    (note3 == 76 && velocity3 >= 1 && velocity3 <= 127) || 
    (note4 == 76 && velocity4 >= 1 && velocity4 <= 127) || 
    (note5 == 76 && velocity5 >= 1 && velocity5 <= 127) || 
    (note6 == 76 && velocity6 >= 1 && velocity6 <= 127))) {

  key = '9';
  keyReleased();
  key = 'P';
  keyReleased();
  key = 'P';
  keyReleased();

  formerEvent[76] = millis();
  }

  if (measure >= 24 && measure <= 34 && millis() > formerEvent[76] + 1000 &&

    ((note1 == 76 && velocity1 >= 1 && velocity1 <= 127) || 
    (note2 == 76 && velocity2 >= 1 && velocity2 <= 127) || 
    (note3 == 76 && velocity3 >= 1 && velocity3 <= 127) || 
    (note4 == 76 && velocity4 >= 1 && velocity4 <= 127) || 
    (note5 == 76 && velocity5 >= 1 && velocity5 <= 127) || 
    (note6 == 76 && velocity6 >= 1 && velocity6 <= 127))) {

  key = '9';
  keyReleased();
  key = 'P';
  keyReleased();
  key = 'P';
  keyReleased();
  key = 'p';
  keyReleased();

  formerEvent[76] = millis();
  }

  if  (measure==36 && beatTrigged==true  ) {// measure>=41 && measure<=42
     // for (int i = 0; i < networkSize; i++) {
        key='a';
         keyReleased();
        key='0';
        keyReleased();
        key='q';
        keyReleased();
        key='n';
        keyReleased();
        key='q';
        keyReleased();
        key='n';
        keyReleased();
        key='o';
        keyReleased();
    //  }
  }


if (measure > 11 && measure < 41 && millis() > formerEvent[72] + 350 + d - 300 &&

    ((note1 == 72 && velocity1 >= 1 && velocity1 <= 64) ||
     (note2 == 72 && velocity2 >= 1 && velocity2 <= 64) ||
     (note3 == 72 && velocity3 >= 1 && velocity3 <= 64) ||
     (note4 == 72 && velocity4 >= 1 && velocity4 <= 64) ||
     (note5 == 72 && velocity5 >= 1 && velocity5 <= 64) ||
     (note6 == 72 && velocity6 >= 1 && velocity6 <= 64))) {
  key = 'U'; // i=105
  keyReleased();
  formerEvent[72] = millis();
  print("formerEvent[72] INSIDE");
  println(formerEvent[72]);
}

if (measure > 25 && measure < 35 && millis() > formerEvent[70] + 300 &&
    ((note1 == 70 && velocity1 >= 1 && velocity1 <= 64) ||
     (note2 == 70 && velocity2 >= 1 && velocity2 <= 64) ||
     (note3 == 70 && velocity3 >= 1 && velocity3 <= 64) ||
     (note4 == 70 && velocity4 >= 1 && velocity4 <= 64) ||
     (note5 == 70 && velocity5 >= 1 && velocity5 <= 64) ||
     (note6 == 70 && velocity6 >= 1 && velocity6 <= 64))) {
  // oscillatorBlocked=10;
  key = 'R';
  keyReleased();
  // key = 'f';
  // keyReleased();

  formerEvent[70] = millis();
  print("formerEvent[64] INSIDE > f");
  println(formerEvent[64]);
}
    if  (measure>41 && measure<=42  && beatTrigged==true  ) {// measure>=41 && measure<=42
      for (int i = 0; i < networkSize; i++) {
        //    ActualVirtualPosition[i]=ActualVirtualPosition[i]+numberOfStep/3*i;
      }
    }

if (measure > 40 && measure < 61 && millis() > formerEvent[64] + 100 &&
    ((note1 == 64 && velocity1 >= 1 && velocity1 <= 64) ||
     (note2 == 64 && velocity2 >= 1 && velocity2 <= 64) ||
     (note3 == 64 && velocity3 >= 1 && velocity3 <= 64) ||
     (note4 == 64 && velocity4 >= 1 && velocity4 <= 64) ||
     (note5 == 64 && velocity5 >= 1 && velocity5 <= 64) ||
     (note6 == 64 && velocity6 >= 1 && velocity6 <= 64))) {
  oscillatorBlocked = 10;
  key = 'f';
  keyReleased();
  // key = 'f';
  // keyReleased();

  formerEvent[64] = millis();
  print("formerEvent[64] INSIDE > f");
  println(formerEvent[64]);
}

if (measure > 40 && measure < 61 && millis() > formerEvent[69] + 100 &&
    ((note1 == 69 && velocity1 >= 1 && velocity1 <= 64) ||
     (note2 == 69 && velocity2 >= 1 && velocity2 <= 64) ||
     (note3 == 69 && velocity3 >= 1 && velocity3 <= 64) ||
     (note4 == 69 && velocity4 >= 1 && velocity4 <= 64) ||
     (note5 == 69 && velocity5 >= 1 && velocity5 <= 64) ||
     (note6 == 69 && velocity6 >= 1 && velocity6 <= 64))) {
  oscillatorBlocked = 1;
  key = 'd';
  keyReleased();
  // key = 'd';
  // keyReleased();

  formerEvent[69] = millis();
  print("formerEvent[69] INSIDE > d");
  println(formerEvent[69]);
}

if (measure > 40 && measure < 61 && millis() > formerEvent[67] + 100 &&
    ((note1 == 67 && velocity1 >= 1 && velocity1 <= 64) ||
     (note2 == 67 && velocity2 >= 1 && velocity2 <= 64) ||
     (note3 == 67 && velocity3 >= 1 && velocity3 <= 64))) {
  // oscillatorBlocked=1;
  key = 'd';
  keyReleased();
  // key = 'd';
  // keyReleased();

  formerEvent[67] = millis();
}

if (measure > 60 && measure < 78 && millis() > formerEvent[72] + 1000 &&
    ((note1 == 72 && velocity1 >= 1 && velocity1 <= 64) ||
     (note2 == 72 && velocity2 >= 1 && velocity2 <= 64) ||
     (note3 == 72 && velocity3 >= 1 && velocity3 <= 64) ||
     (note4 == 72 && velocity4 >= 1 && velocity4 <= 64) ||
     (note5 == 72 && velocity5 >= 1 && velocity5 <= 64) ||
     (note6 == 72 && velocity6 >= 1 && velocity6 <= 64))) {
  // key = 'd';
  key = 'i'; // u bloque
  keyReleased(); // u=117
  formerEvent[72] = millis();
}

if (measure > 61 && measure < 78 && millis() > formerEvent[74] + 200 &&
    ((note1 == 74 && velocity1 >= 1 && velocity1 <= 64) ||
     (note2 == 74 && velocity2 >= 1 && velocity2 <= 64) ||
     (note3 == 74 && velocity3 >= 1 && velocity3 <= 64) ||
     (note4 == 74 && velocity4 >= 1 && velocity4 <= 64) ||
     (note5 == 74 && velocity5 >= 1 && velocity5 <= 64) ||
     (note6 == 74 && velocity6 >= 1 && velocity6 <= 64))) {
  oscillatorBlocked = networkSize;
  key = 'f';
  keyReleased(); // i=105
  formerEvent[74] = millis();
}

    //%ADMAD
    if (measure >= 123 && millis() > formerEvent[69] + 100 + d &&
    ((note1 == 69 && velocity1 >= 1 && velocity1 <= 64) ||
     (note2 == 69 && velocity2 >= 1 && velocity2 <= 64) ||
     (note3 == 69 && velocity3 >= 1 && velocity3 <= 64) ||
     (note4 == 69 && velocity4 >= 1 && velocity4 <= 64) ||
     (note5 == 69 && velocity5 >= 1 && velocity5 <= 64) ||
     (note6 == 69 && velocity6 >= 1 && velocity6 <= 64))) {
  key = 'U';
  keyReleased(); // u=117
  formerEvent[69] = millis();
  print("formerEvent[69] INSIDE");
  println(formerEvent[69]);
}

if (measure == 123 && beatTrigged) {
  // key = '9';
  // keyReleased(); // u=117
  // formerEvent[69] = millis();
}

if (measure == 131 && beatTrigged) {
  key = 'p';
  keyReleased(); // u=117
  key = '9';
  keyReleased(); // u=117
  // formerEvent[69] = millis();
}

}

