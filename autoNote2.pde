void autoNote2() {//1 67 69 72
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
    keyEvent[1] = "  autoNote2 Pressed " + formerEvent[172];
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
    keyEvent[0] = "  autoNote2 Pressed " + formerEvent[169];
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

    

 
  if  (measure>41 && measure<=42  && beatTrigged==true  ) {// measure>=41 && measure<=42
      for (int i = 0; i < networkSize; i++) {

        //    ActualVirtualPosition[i]=ActualVirtualPosition[i]+numberOfStep/3*i;
        //     ActualVirtualPosition[i]=ActualVirtualPosition[i]+numberOfStep/3*i;
        //    key=';';keyPressed(); print ("rise up frameratio +5 ");
        //    key=';';keyPressed(); print ("rise up frameratio +5 ");
        //    key=';';keyPressed(); print ("rise up frameratio +5 ");
      }
    }
 }