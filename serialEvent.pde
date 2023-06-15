void serialEvent(Serial encoderReceiveUSBport101) { 
    
    String myEncodeur = encoderReceiveUSBport101.readStringUntil('\n');
    
    String[] m0 = match(myEncodeur, " encodeur0 ");
    String[] m1 = match(myEncodeur, " encodeur1 ");
    
    String[] m2 = match(myEncodeur, " encodeur2 ");
    String[] m3 = match(myEncodeur, " encodeur3 ");
    String[] m4 = match(myEncodeur, "encodeur4");
    String[] m5 = match(myEncodeur, "encodeur5");
    
    
    
    if (m0 != null) {  // If not null, then a match was found
        encoderTouched[0] = true;
        if (frameCount > formerFrameCountFromSerialEvent[0] + 15) { 
            formerFrameCountFromSerialEvent[0] = frameCount;
            println("Found encodeur0 a match in '" + m0 + "'");  
        } 
        else  encoderTouched[0] = false; 
    } 
    
    if (m1 != null) {  // If not null, then a match was found
        encoderTouched[1] = true;
        if (frameCount > formerFrameCountFromSerialEvent[1] + 15) { 
            formerFrameCountFromSerialEvent[1] = frameCount;
            println("Found encodeur1 a match in '");  
            } 
        else  encoderTouched[1] = false; 
        }
    
    
    if (m2 != null) {  // If not null, then a match was found
        encoderTouched[2] = true; 
        if (frameCount > formerFrameCountFromSerialEvent[2] + 15) { 
            formerFrameCountFromSerialEvent[2] = frameCount;
            println("Found encodeur2 a match in '" + m2 + "'");  
            } 
        else  encoderTouched[2] = false; 
        }
    
    if (m3 != null) {  // Ifnot null, then a match was found
        encoderTouched[3] = true; 
        println("Found encodeur3 a matchin '" + m3 + "'");
        if (frameCount > formerFrameCountFromSerialEvent[3] + 15) { 
            formerFrameCountFromSerialEvent[3] = frameCount;
            println("Found encodeur3 a match in '");  
            }
        }
    else  encoderTouched[3] = false; 
    println("NOT FOUND encodeur3 a matchin '" + m3 + "'");
    
    
    if (m4 != null) {  // If not null, then a match was found
        encoderTouched[4] = true;
        
        if (frameCount > formerFrameCountFromSerialEvent[4] + 15) { 
            // encoderTouched[4] = false; 
            formerFrameCountFromSerialEvent[4] = frameCount;
            println("Found encodeur4 a match in '" + m4 + "'");  
            textSize(500);
            }
        else  encoderTouched[4] = false; 
        }
    if (m5 != null) {  // If not null, then a match was found
        
        // if (frameCount>formerFrameCountFromSerialEvent[5]+15){ 
        encoderTouched[5] = true;
        formerFrameCountFromSerialEvent[5] = frameCount;
        println("Found encodeur5 a match in   " + encoderTouched[5]);  
        textSize(500);
        }
    else  encoderTouched[5] = false;
    
    
    
    //  String myString = encoderReceiveUSBport14101.readStringUntil('\n');
    // read the serial buffer:
    //  println(" myEncodeur ", myEncodeur);
    
    // if you got any bytes other than the linefeed:
    // myString = trim(myString);
    myEncodeur = trim(myEncodeur);
    
    int values[] = int(split(myEncodeur, ',')); // dispatch receive datas splited with ,
    
    
    if (values.length == networkSize - 0) {//  encodeur de 0 a 4000
        encodeur[0] = abs((int) map(values[0], 0, 4000, 0, 800)) % 800;
        encodeur[1] = (int) map(values[1], 0, 4000, 0, 800) % 800;
        encodeur[2] = (int) map(values[2], 0, 4000, 0, 800) % 800;
        encodeur[3] = (int) map(values[3], 0, 4000, 0, 800) % 800;
        encodeur[4] = (int) map(values[4], 0, 4000, 0, 800) % 800;
        encodeur[5] = (int) map(values[5], 0, 4000, 0, 800) % 800;
        }
    
    // printArray(encodeur); 
    
}