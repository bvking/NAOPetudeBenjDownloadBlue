void serialEvent(Serial encoderReceiveUSBport101) { 

 String myEncodeur = encoderReceiveUSBport101.readStringUntil('\n');
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
   
  String[] m0 = match(myEncodeur, "encodeur0");
  String[] m1 = match(myEncodeur, "encodeur1");
  String[] m2 = match(myEncodeur, "encodeur2");
  String[] m3 = match(myEncodeur, "encodeur3");
  String[] m4 = match(myEncodeur, "encodeur4");
  String[] m5 = match(myEncodeur, "encodeur5");

    if (m0 != null) {  // If not null, then a match was found
      encoderTouched[0]=true;
   }
       else encoderTouched[0]=false;

    if (m1 != null) {  // If not null, then a match was found
      encoderTouched[1]=true;
   }
       else  encoderTouched[1]=false;
 
    if (m2 != null) {  // If not null, then a match was found
      encoderTouched[2]=true;
   }
       else  encoderTouched[2]=false;
  
    if (m3 != null) {  // If not null, then a match was found
      encoderTouched[3]=true;
   }
       else  encoderTouched[3]=false;
 
    if (m4 != null) {  // If not null, then a match was found
      encoderTouched[4]=true;
    }
      else  encoderTouched[4]=false;
  
   if (m5 != null) {  // If not null, then a match was found
      encoderTouched[5]=true;
   }
      else  encoderTouched[5]=false;


//  String myString = encoderReceiveUSBport14101.readStringUntil('\n');
   // read the serial buffer:
   //println ( " myEncodeur ", myEncodeur);

  // if you got any bytes other than the linefeed:
 // myString = trim(myString);
    myEncodeur = trim(myEncodeur);
    
    int values[] = int(split(myEncodeur, ',')); // dispatch receive datas splited with ,

    int numberOfEncodeur = 6;
     
  if (values.length == numberOfEncodeur) {//  always 6 when only 6 encoders
  /*
   encodeur[0] = abs ( (int) map (values[0], 0, 4000, 0, 800))%800;
   encodeur[1] = (int) map (values[1], 0, 4000, 0, 800)%800;
   encodeur[2] = (int) map (values[2], 0, 4000, 0, 800)%800;
   encodeur[3] = (int) map (values[3], 0, 4000, 0, 800)%800;
   encodeur[4] = (int) map (values[4], 0, 4000, 0, 800)%800;
   encodeur[5] = (int) map (values[5], 0, 4000, 0, 800)%800;
   */
  } 

   if (values.length == numberOfEncodeur) {//  always 6 when only 6 encoders
       for (int i = 0; i<networkSize; i++){
     //  encodeur[i] = values[i];  DON'T WORK
        }
        
       encodeur[0] = values[0];
       encodeur[1] = values[1];
       encodeur[2] = values[2];
       encodeur[3] = values[3];
       encodeur[4] = values[4];
       encodeur[5] = values[5];
    

    }
   /*
       int encoderMapped [] = new int [numberOfEncodeur];

   if (formerKeyMetro == '*') {
          for (int i =0; i<numberOfEncodeur; i++){
              encodeur[i] = values[i]%6400;
         }
    } 

   if (formerKeyMetro == '$') {
          for (int i =0; i<numberOfEncodeur; i++){
              encoderMapped[i] = encodeur[i]%3200;
               encodeur[i] = values[i]%3200;
      }
    }
*/
  //   print (" originalVal ");   showArray (values);
   //  print (" followProc ");    showArray (encodeur);
  
}

void serialEventfromArduinoDue(Serial DueSerialNativeUSBport101) { // receive 2 datas splited with , and the last is send with println

  // read the serial buffer:
  String myString = DueSerialNativeUSBport101.readStringUntil('\n');

  // if you got any bytes other than the linefeed:
  myString = trim(myString);

  // split the string at the commas
  // and convert the sections into integers:
  int values[] = int(split(myString, ','));

  int numberOfDataSplitedWithComa=2;

  if (values.length == numberOfDataSplitedWithComa) {// v1 de 0 a 4000

    dataFromArduinoDue[0] = (int) map (values[0], 0, 4000, 0, 400);
    dataFromArduinoDue[1] = (int) map (values[1], 0, 4000, 0, 400);

    println ( "  data0  " +  dataFromArduinoDue[0] );
    println ( "  data1  " +  dataFromArduinoDue[1] );
       
 //***   print (" mouseY ");   print (mouseY);   print (" v1 ");   println (v1);  

 //   v2 = values[1]/10;
         
  //      print ( " 12320        v2 ");   println (v2);    

       
  }
}
