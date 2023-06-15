void serialEvent(Serial encoderReceiveUSBport101) { 

   String myEncodeur = encoderReceiveUSBport101.readStringUntil('\n');
 
  String[] m0 = match(myEncodeur, "encodeur0");
  String[] m1 = match(myEncodeur, "encodeur1");
 
  String[] m2 = match(myEncodeur, "encodeur2");
  String[] m3 = match(myEncodeur, "encodeur3");
  String[] m4 = match(myEncodeur, "encodeur4");
  String[] m5 = match(myEncodeur, "encodeur5");

    if (m0 != null) {  // If not null, then a match was found
      encoderTouched[0]=true;
    }
   else  encoderTouched[0]=false;

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
 //  println ( " myEncodeur ", myEncodeur);

  // if you got any bytes other than the linefeed:
 // myString = trim(myString);
    myEncodeur = trim(myEncodeur);
    
    int values[] = int(split(myEncodeur, ',')); // dispatch receive datas splited with ,
     

   if (values.length == networkSize-0) {//  encodeur de 0 a 4000
   encodeur[0] = abs ( (int) map (values[0], 0, 4000, 0, 800))%800;
   encodeur[1] = (int) map (values[1], 0, 4000, 0, 800)%800;
   encodeur[2] = (int) map (values[2], 0, 4000, 0, 800)%800;
   encodeur[3] = (int) map (values[3], 0, 4000, 0, 800)%800;
   encodeur[4] = (int) map (values[4], 0, 4000, 0, 800)%800;
   encodeur[5] = (int) map (values[5], 0, 4000, 0, 800)%800;
 }

// printArray(encodeur); 

}