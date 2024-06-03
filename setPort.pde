void setPort() 
{
   
    bigMachineConnectedToPort2_And_NATIVEpoortConnectedToPort1 = false;
    portOfBigMachineConnected = false;
    
    String[] ports = Serial.list();
    String[] portsUSB = { "portsUSB", "portsUSB", "NC", "portsUSB", "BLA", "BLE" ,"BLI", "BLO", "BLU" };
    arrayCopy(ports, portsUSB); // rename portsUSB with real ports names
    printArray(portsUSB);
    
    String[] matchPort1Nothing = match(portsUSB[1],"/dev/tty.Bluetooth-Incoming-Port");
    //String[] matchPort1B = match(portsUSB[1], "/dev/cu.usbmodem116574201");
     String[] matchPort1B = match(portsUSB[1], "/dev/cu.usbserial-0001"); // BIG TEST with node32S
    String[] matchPort1B2 = match(portsUSB[2], "/dev/cu.usbmodem116574201"); // BIG MACHINE

    //String[] matchPort1B2 = match(portsUSB[2], "/dev/cu.usbmodem127280601");
    //String[] matchPort1B = match(portsUSB[1], "/dev/cu.usbmodem127280601"); // Little chez Jo
    //String[] matchPort1 = match(portsUSB[1], "/dev/cu.usbmodem127280601");

    String[] matchPort1 = match(portsUSB[1], "/dev/cu.usbmodem127301101"); // Little chez benj
    String[] matchPort2 = match(portsUSB[2], "/dev/cu.usbserial-0001"); // chez Benj

    //String[] matchPort2 = match(portsUSB[2], "/dev/cu.usbserial-1420"); // avec grosse MAchine
    //String[] matchPort2 = match(portsUSB[2], "/dev/cu.usbserial-2130"); // chez Jo
    String[] matchPort2BlueTooth = match(portsUSB[2], "/dev/tty.Bluetooth-Incoming-Port");

    String[] matchPort2B = match(portsUSB[2], "/dev/cu.usbserial-0001"); // only serial connected
    String[] matchPort3 = match(portsUSB[3], "/dev/cu.usbserial-0001");

        portsUSBfrom1=portsUSB[1];
        portsUSBfrom2=portsUSB[2];
        portsUSBfrom3=portsUSB[3];


      if (matchPort2BlueTooth!= null) { 
        allMachineConnected = false;    
        println(" serial port 2 as DATA serial port is NOT connceted to " + portsUSBfrom2 );   
        println(" NO port Connected of position data");
       // onlyLitteMachineWithSecondSerialPort = true;    
    }

     if (matchPort1Nothing!= null) { 
        allMachineConnected = false;    
        println(" serial port 1 connected to bluetooth " + portsUSB[1] + " allMachineConnected " + allMachineConnected); 
        portConnectedToBigMachineOnly=false;      
    }
  
     if (matchPort1B!= null) { 
        allMachineConnected = false;
        println(" serial port 1 as programming port ending with 201 " + portsUSB[1] + " allMachineConnected " + allMachineConnected); 
        portConnectedToBigMachineOnly=true;      
    }


     if (matchPort1B2!= null) { 
        allMachineConnected = false;
        println(" serial port 1 is NATIVE ARDUINO DUE  with 401 " + portsUSBfrom1 + " allMachineConnected " + allMachineConnected); 
        println(" serial port 2 Teensy 4.1 " + portsUSB[2] + " " + portsUSBfrom2 +  " allMachineConnected " + allMachineConnected); 
       // portConnectedToBigMachineOnly = true;
        bigMachineConnectedToPort2_And_NATIVEpoortConnectedToPort1=true;      
    }
   
   
    if (matchPort1!= null) { 
        allMachineConnected = false;    
        println(" serial port 1 as programming port ending with 101 " + portsUSBfrom1 + " allMachineConnected " + allMachineConnected);   
       
       // onlyLitteMachineWithSecondSerialPort = true;    
    }
    
   
    if (matchPort2!= null) { 
        allMachineConnected = false;
  
        println(" serial port 2 as data port        ending with 001 " + portsUSB[2] + " allMachineConnected " + allMachineConnected); 
        onlyLitteMachineWithSecondSerialPort = true;
        portConnectedToBigMachineOnly=false;      

    }

    if (matchPort3!= null) { 
        allMachineConnected = true;
      
        println(" serial port 2 of little mahine " + portsUSB[2] + " allMachineConnected " + allMachineConnected); 
        onlyLitteMachineWithSecondSerialPort = false;
        portConnectedToBigMachineOnly=false;      

    }
    
    //do something if nothing connected

        
     if (bigMachineConnectedToPort2_And_NATIVEpoortConnectedToPort1==false)
      { 
         println(" portConnectedToBigMachineOnly " + portConnectedToBigMachineOnly);
        if (onlyLitteMachineWithSecondSerialPort) {
            
             println(" Port 1 CONNECTED to programming port of Teensy 3.5 "); //  + portsUSBfrom2 + " "
             println(" portConnectedOfBigMachine " + portConnectedOfBigMachine); //  + portsUSBfrom2 + " "
            
              teensyport = new Serial(this, ports[1],115200); // si port connecté Monterey
              
              encoderReceiveUSBport101 =  new Serial(this,ports[2], 115200); // si port connecté Monterey
         
           // DueSerialNativeUSBport101 =  new Serial(this,ports[2], 115200); 

            // Read bytes into a buffer until you get a linefeed (ASCII 10):
             encoderReceiveUSBport101.bufferUntil('\n');
           // DueSerialNativeUSBport101.bufferUntil('\n');
            
        }
    }

    if (bigMachineConnectedToPort2_And_NATIVEpoortConnectedToPort1==true)
     { 
             println(" portConnectedToBigMachineOnly " + portConnectedToBigMachineOnly +  " due to ENCODER plugged on port 1 " + portsUSBfrom1 );
       
             println(" Port 2  CONNECTED to programming port of Teensy 4.1 named" + portsUSBfrom2  ); //  + portsUSBfrom2 + " "
            
            teensy4port = new Serial(this, ports[2],115200); // si port connecté Monterey
           // encoderReceiveUSBport101 =  new Serial(this,ports[2], 115200); // si port connecté Monterey
         
            DueSerialNativeUSBport101 =  new Serial(this,ports[1], 115200); 

            // Read bytes into a buffer until you get a linefeed (ASCII 10):
            // encoderReceiveUSBport101.bufferUntil('\n');
            DueSerialNativeUSBport101.bufferUntil('\n');

            String myString = DueSerialNativeUSBport101.readStringUntil('\n');

                // if you got any bytes other than the linefeed:
                 myString = trim(myString);

                 println ( " myString " + myString);
            
        
    }
        
        
        if (allMachineConnected)  { 
            // if (portOfBigMachineConnected = true) { // 201  teensy 4.1
            
        }
        
      
        if (portConnectedToBigMachineOnly && bigMachineConnectedToPort2_And_NATIVEpoortConnectedToPort1==false)
        { 
            
         
                println(" Port 1 CONNECTED to programming port of Teensy 4.1 withOut encoder");
                //*************** WITH TEENSY connected
                //teensyport = new Serial(this, ports[0], 115200);// si port non connecte Monterey mais buetooth ouvert
               teensy4port = new Serial(this, ports[1], 115200);// si port non connecte Catalina 
              //teensyport = new Serial(this, ports[0], 115200);
                //  teensyport = new Serial(this, ports[2],115200); // si port connecté Monterey
        }
    
        
        //*************** WITHOUT ENODEER connected
        if (allMachineConnected)  { 
            println("  PORT 2 or PORT 3 CONNECTED so CONNECT serial " + ports[3] + " portConnectedOfBigMachine " + portConnectedOfBigMachine);
            if (ports[3] == "/dev/cu.usbserial-000") println(ports[3] + " reading position serial port connected ");
            encoderReceiveUSBport101 =  new Serial(this,ports[3], 115200); // si port connecté Monterey
            
            // Read bytes into a buffer until you get a linefeed (ASCII 10):
            encoderReceiveUSBport101.bufferUntil('\n');
        }
        //rotate (PI/2);
        
     
}
