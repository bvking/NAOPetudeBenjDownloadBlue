/*
  void serialEvent(Serial encoderReceiveUSBport101)
  {  
    String myEncodeur = encoderReceiveUSBport101.readStringUntil('\n');  
  
 /// println (myEncodeur);

    String[] m0 = match(myEncodeur, "e0");
    String[] m1 = match(myEncodeur, "e1");
    String[] m2 = match(myEncodeur, "e2");
    String[] m3 = match(myEncodeur, "e3");
    String[] m4 = match(myEncodeur, "e4");
    String[] m5 = match(myEncodeur, "e5");
/*
    String[] Nm0 = match(myEncodeur, "n0");
    String[] Nm1 = match(myEncodeur, "n1");
    String[] Nm2 = match(myEncodeur, "n2");
    String[] Nm3 = match(myEncodeur, "n3");
    String[] Nm4 = match(myEncodeur, "n4");
    String[] Nm5 = match(myEncodeur, "n5");
  */


/*

    String[] p0 = match(myEncodeur, "mi0");
    String[] p1 = match(myEncodeur, "mi1");
    String[] p2 = match(myEncodeur, "mi2");
    String[] p3 = match(myEncodeur, "mi3");
    String[] p4 = match(myEncodeur, "mi4");
    String[] p5 = match(myEncodeur, "mi5");

    String[] Np0 = match(myEncodeur, "no0");
    String[] Np1 = match(myEncodeur, "no1");
    String[] Np2 = match(myEncodeur, "no2");
    String[] Np3 = match(myEncodeur, "no3");
    String[] Np4 = match(myEncodeur, "no4");
    String[] Np5 = match(myEncodeur, "no5");
*/

/*
    if (Nm0 != null) {  // If not null, then a match was found
        encoderTouched[0] = false;
    }
     
    if (Nm1 != null) {  // If not null, then a match was found
        encoderTouched[1] = false;
    }
    
    if (Nm2 != null) {  // If not null, then a match was found
        encoderTouched[2] = false;
    }
        
    if (Nm3 != null) {  // If not null, then a match was found
        encoderTouched[3] = false;
    }
   
    
    if (Nm4 != null) {  // If not null, then a match was found
        encoderTouched[4] = false;
    }

    
    if (Nm5 != null) {  // If not null, then a match was found
        encoderTouched[5] = false;
    }



    
    
    if (m0 != null) {  // If not null, then a match was found
        encoderTouched[0] = true;
    }
   
    
    if (m1 != null) {  // If not null, then a match was found
        encoderTouched[1] = true;
    }
 
    
    if (m2 != null) {  // If not null, then a match was found
        encoderTouched[2] = true;
    }
    
    
    if (m3 != null) {  // If not null, then a match was found
        encoderTouched[3] = true;
    }
   
    
    if (m4 != null) {  // If not null, then a match was found
        encoderTouched[4] = true;
    }

    
    if (m5 != null) {  // If not null, then a match was found
        encoderTouched[5] = true;
    }
*/



    // trigMiddlepositionFromProcessing
/*

    if (Np0 != null) {  // If not null, then a match was found
        midPos[0] = false;
    }

    if (p0 != null) {  // If not null, then a match was found
        midPos[0] = true;
      
    }
     
    if (Np1 != null) {  // If not null, then a match was found
        midPos[1] = false;
    } 

    if (p1 != null) {  // If not null, then a match was found
        midPos[1] = true;
    }

    if (Np2 != null) {  // If not null, then a match was found
        midPos[2] = false;
    }
    
    if (p2 != null) {  // If not null, then a match was found
        midPos[2] = true;
    }

    if (Np3 != null) {  // If not null, then a match was found
        midPos[3] = false;
    }
   
    if (p3 != null) {  // If not null, then a match was found
        midPos[3] = true;
    }

    if (Np4 != null) {  // If not null, then a match was found
        midPos[4] = false;
    }
    
    if (p4 != null) {  // If not null, then a match was found
        midPos[4] = true;
    }

    if (Np5 != null) {  // If not null, then a match was found
        midPos[5] = false;
    }
    
    if (p5 != null) {  // If not null, then a match was found
        midPos[5] = true;
    }

 */ 

    
    //  String myString = encoderReceiveUSBport14101.readStringUntil('\n');
    // read the serial buffer:
    //println ( " myEncodeur ", myEncodeur);
    
    //if you got any bytes other than the linefeed:
    // myString = trim(myString);
    //myEncodeur = trim(myEncodeur);
 /*   
    int values[] = int(split(myEncodeur, ',')); // dispatch receive datas splited with ,
    
    int numberOfEncodeur = 6;
      
    if (values.length == numberOfEncodeur) {//  always 6 when only 6 encoders
        for (int i = 0; i < networkSize; i++) {
           //  encodeur[i] = values[i];  DON'T WORK
        } 
*/  
        /*
        encodeur[0] = values[0];
        encodeur[1] = values[1];
        encodeur[2] = values[2];
        encodeur[3] = values[3];
        encodeur[4] = values[4];
        encodeur[5] = values[5];      
        */
/*
        encodeur[0]= (int)map (abs( values[0]), 0, 6400, 0, 4000)%4000;  
        encodeur[1] =(int)map (abs( values[1]), 0, 6400, 0, 4000)%4000;  
        encodeur[2] =(int)map (abs( values[2]), 0, 6400, 0, 4000)%4000; 
        encodeur[3]= (int)map (abs( values[3]), 0, 6400, 0, 4000)%4000;  
        encodeur[4] =(int)map (abs( values[4]), 0, 6400, 0, 4000)%4000;  
        encodeur[5] =(int)map (abs( values[5]), 0, 6400, 0, 4000)%4000; 

    }   
  }
*/

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





  // try to factorise
  /*
    String [] m = new String [networkSize];
    for (int i = 0; i<networkSize; i++){
    m[i] = match(myEncodeur, "encodeur"+"(i)");
    println ( " encodeur" + String(i)  + "encodeur"+String(i));
    if (m[i] != null)
    {  // If not null, then a match was found
     encoderTouched[i]=true;
    }
    else encoderTouched[i]=false;
    }
*/

