//if  (!systemForBigMachine){


  void serialEvent(Serial encoderReceiveUSBport101)
  {  
    String myEncodeur = encoderReceiveUSBport101.readStringUntil('\n');  
    String[] m0 = match(myEncodeur, "encodeur0");
    String[] m1 = match(myEncodeur, "encodeur1");
    String[] m2 = match(myEncodeur, "encodeur2");
    String[] m3 = match(myEncodeur, "encodeur3");
    String[] m4 = match(myEncodeur, "encodeur4");
    String[] m5 = match(myEncodeur, "encodeur5");

    String[] p0 = match(myEncodeur, "midPos0");
    String[] p1 = match(myEncodeur, "midPos1");
    String[] p2 = match(myEncodeur, "midPos2");
    String[] p3 = match(myEncodeur, "midPos3");
    String[] p4 = match(myEncodeur, "midPos4");
    String[] p5 = match(myEncodeur, "midPos5");
    
    if (m0 != null) {  // If not null, then a match was found
        encoderTouched[0] = true;
    }
    else encoderTouched[0] = false;
    
    if (m1 != null) {  // If not null, then a match was found
        encoderTouched[1] = true;
    }
    else  encoderTouched[1] = false;
    
    if (m2 != null) {  // If not null, then a match was found
        encoderTouched[2] = true;
    }
    else  encoderTouched[2] = false;
    
    if (m3 != null) {  // If not null, then a match was found
        encoderTouched[3] = true;
    }
    else  encoderTouched[3] = false;
    
    if (m4 != null) {  // If not null, then a match was found
        encoderTouched[4] = true;
    }
    else  encoderTouched[4] = false;

    
    if (m5 != null) {  // If not null, then a match was found
        encoderTouched[5] = true;
    }
    else  encoderTouched[5] = false;

    // trigMiddlepositionFromProcessing
    
    midPos[0] = false;

    if (p0 != null) {  // If not null, then a match was found
        midPos[0] = true;
    }
     midPos[1] = false;

    if (p1 != null) {  // If not null, then a match was found
        midPos[1] = true;
    }
    
    if (p2 != null) {  // If not null, then a match was found
        midPos[2] = true;
    }
    else  midPos[2] = false;
    
    if (p3 != null) {  // If not null, then a match was found
        midPos[3] = true;
    }
    else  midPos[3] = false;
    
    if (p4 != null) {  // If not null, then a match was found
        midPos[4] = true;
    }
    else  midPos[4] = false;

    midPos[5] = false;
    
    if (p5 != null) {  // If not null, then a match was found
        midPos[5] = true;
    }
    
    //  String myString = encoderReceiveUSBport14101.readStringUntil('\n');
    // read the serial buffer:
    //println ( " myEncodeur ", myEncodeur);
    
    //if you got any bytes other than the linefeed:
    // myString = trim(myString);
    myEncodeur = trim(myEncodeur);
    
    int values[] = int(split(myEncodeur, ',')); // dispatch receive datas splited with ,
    
    int numberOfEncodeur = 6;
      
    if (values.length == numberOfEncodeur) {//  always 6 when only 6 encoders
        for (int i = 0; i < networkSize; i++) {
           //  encodeur[i] = values[i];  DON'T WORK
        }   
        encodeur[0] = values[0];
        encodeur[1] = values[1];
        encodeur[2] = values[2];
        encodeur[3] = values[3];
        encodeur[4] = values[4];
        encodeur[5] = values[5];         
    }   
  }





/*
void serialEvent(Serial DueSerialNativeUSBport101) { // receive 2 datas splited with , and the last is send with println
    
    //read the serial buffer:
    String myString = DueSerialNativeUSBport101.readStringUntil('\n');
    
    //if you got any bytes other than the linefeed:
    myString = trim(myString);
    
    //split the string at the commas
    //and convert the sections into integers:
    int valuesFromDue[] = int(split(myString, ','));
    
    int numberOfDataSplitedWithComa = 2;
    
    if(valuesFromDue.length == numberOfDataSplitedWithComa) {// //     if(valuesFromDue.length >0 ) {// v1 de 0 a 4000
 
        
        dataFromArduinoDue[0] = (int) map(valuesFromDue[0], 0, 4000, 0, 4000);
        dataFromArduinoDue[1] = (int) map(valuesFromDue[1], 0, 4000, 0, 4000);        
  } 
 }

*/



  // try to factorise
  /*
    String [] m = new String [networkSize];
    for (int i = 0; i<networkSize; i++){
    m[i] = match(myEncodeur, "encodeur"+i);
    println ( " encodeur" + String(i)  + "encodeur"+String(i));
    if (m[i] != null) {  // If not null, then a match was found
    encoderTouched[i]=true;
    }
    else encoderTouched[i]=false;
    
   }
    */

