void autoNote1() { //NOT USE 64 67 69 72 73 74 75

    if ((measure <= 40 && millis() > formerEvent[67] + 50 + d) &&
       ((note1 == 67 && velocity1 != 0) || (note2 == 67 && velocity2 != 0) || (note3 == 67 && velocity3 != 0) ||
        (note4 == 67 && velocity4 != 0) || (note5 == 67 && velocity5 != 0) || (note6 == 67 && velocity6 != 0))) {
      formerEvent[67] = millis();
       keyReleased();
      
    text("formerEvent[67] INSIDE" + formerEvent[67], 500, 700);

    }

    if ((measure <= 15 && millis() > formerEvent[64] + 350 + d) &&
       ((note1 == 64 && velocity1 != 0) || (note2 == 64 && velocity2 != 0) || (note3 == 64 && velocity3 != 0) ||
        (note4 == 64 && velocity4 != 0) || (note5 == 64 && velocity5 != 0) || (note6 == 64 && velocity6 != 0))) {
      formerEvent[64] = millis();
      key = 'f';
      keyReleased();
      text("formerEvent[64] INSIDE" + formerEvent[64], 500, 700);
    }

    if ((measure <= 40 && millis() > formerEvent[69] + 900 + d) &&
        ((note1 == 69 && velocity1 != 0) || (note2 == 69 && velocity2 != 0) || (note3 == 69 && velocity3 != 0) ||
         (note4 == 69 && velocity4 != 0) || (note5 == 69 && velocity5 != 0) || (note6 == 69 && velocity6 != 0))) {
      formerEvent[69] = millis();
      keyReleased();
      text("formerEvent[69] INSIDE" + formerEvent[69], 500, 700);
    }
  
    if (measure == 14 && beatTrigged == true) {
          key = CONTROL;
        keyReleased();
    }
    if (measure == 24 && beatTrigged == true) {
      key = CONTROL;
      keyReleased();
    }
    if (measure == 41 && beatTrigged == true) {
      for (int i = 0; i < networkSize; i++) {
        key = '0';
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
      }
    }
    if (measure == 42 && beatTrigged == true) {
      for (int i = 0; i < networkSize; i++) {
        // ActualVirtualPosition[i]=ActualVirtualPosition[i]+numberOfStep/3*i;
      }
    }
    

    if (measure >= 123 && millis() > formerEvent[69] + 100 + d &&
   ((note1 == 69 && velocity1 != 0) || (note2 == 69 && velocity2 != 0) || (note3 == 69 && velocity3 != 0) ||
    (note4 == 69 && velocity4 != 0) || (note5 == 69 && velocity5 != 0) || (note6 == 69 && velocity6 != 0))) {
  key = 'U';
  keyReleased();
  formerEvent[69] = millis();
  print("formerEvent[69] INSIDE");
  println(formerEvent[69]);
}

if (measure == 123 && beatTrigged) {
  key = '9';
  keyReleased();
}

if (measure == 123 + 4 && beatTrigged) {
  key = '9';
  keyReleased();
}

if (measure == 123 + 8 && beatTrigged) {
  key = '9';
  keyReleased();
}

if (measure == 123 + 8 && beatTrigged) {
  key = 'p';
  keyReleased();
}

if (measure <= 40 && millis() > formerEvent[72] + 100 + d &&
   ((note1 == 72 && velocity1 != 0) || (note2 == 72 && velocity2 != 0) || (note3 == 72 && velocity3 != 0) ||
    (note4 == 72 && velocity4 != 0) || (note5 == 72 && velocity5 != 0) || (note6 == 72 && velocity6 != 0))) {
  key = 'U';
  keyReleased();
  formerEvent[72] = millis();
  print("formerEvent[72] INSIDE");
  println(formerEvent[72]);
}

if (measure > 40 && measure < 61 && millis() > formerEvent[72] + 100 + d &&
   ((note1 == 72 && velocity1 != 0) || (note2 == 72 && velocity2 != 0) || (note3 == 72 && velocity3 != 0) ||
    (note4 == 72 && velocity4 != 0) || (note5 == 72 && velocity5 != 0) || (note6 == 72 && velocity6 != 0))) {
  key = 'd';
  keyReleased();
  key = 'd';
  keyReleased();
  formerEvent[72] = millis();
}

if (measure > 60 && measure < 78 && millis() > formerEvent[72] + 150 + d &&
   ((note1 == 72 && velocity1 != 0) || (note2 == 72 && velocity2 != 0) || (note3 == 72 && velocity3 != 0) ||
    (note4 == 72 && velocity4 != 0) || (note5 == 72 && velocity5 != 0) || (note6 == 72 && velocity6 != 0))) {
  key = 'i';
  keyReleased();
  formerEvent[72] = millis();
}

if (measure > 60 && measure < 78 && millis() > formerEvent[73] + 0 + d + 150 &&
   ((note1 == 73 && velocity1 != 0) || (note2 == 73 && velocity2 != 0) || (note3 == 73 && velocity3 != 0) ||
    (note4 == 73 && velocity4 != 0) || (note5 == 73 && velocity5 != 0) || (note6 == 73 && velocity6 != 0))) {
  keyReleased();
  formerEvent[73] = millis();
}

if (measure < 41 && measure < 41 && millis() > formerEvent[74] + 50 + d &&
   ((note1 == 73 && velocity1 != 0) || (note2 == 73 && velocity2 != 0) || (note3 == 73 && velocity3 != 0) ||
    (note4 == 73 && velocity4 != 0) || (note5 == 73 && velocity5 != 0) || (note6 == 73 && velocity6 != 0))) {
  key = 'i';
  keyReleased();
  formerEvent[74] = millis();
}

if (measure > 41 && measure < 78 && millis() > formerEvent[74] + 0 + d &&
   ((note1 == 73 && velocity1 != 0) || (note2 == 73 && velocity2 != 0) || (note3 == 73 && velocity3 != 0) ||
    (note4 == 73 && velocity4 != 0) || (note5 == 73 && velocity5 != 0) || (note6 == 73 && velocity6 != 0))) {
  key = 'f';
  keyReleased();
  formerEvent[74] = millis();
}

if (measure < 78 && millis() > formerEvent[75] + 0 + d &&
    ((note1 == 75 && velocity1 != 0) || (note2 == 75 && velocity2 != 0) || (note3 == 75 && velocity2 != 0) ||
     (note4 == 75 && velocity4 != 0) || (note5 == 75 && velocity5 != 0) || (note6 == 75 && velocity6 != 0))) {
  key = 'k';
  keyReleased();
  formerEvent[75] = millis();
}

if ((note1 == 60 && velocity1 == 96) || (note2 == 60 && velocity2 == 96)) {
  key = 'p';
  keyReleased();
  formerEvent[60] = millis();
}

  
}
