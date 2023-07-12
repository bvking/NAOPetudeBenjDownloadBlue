

void setPort() {
    // rotate (-PI/2);
    portOfBigMachineConnected = false;
    
    String[] ports = Serial.list();
    String[] portsUSB = { "portsUSB", "portsUSB", "NC", "portsUSB", "BLA", "BLE" ,"BLI", "BLO", "BLU" };
    arrayCopy(ports, portsUSB); // rename portsUSB with real ports names
    printArray(portsUSB);
    
    
    String[] matchPort1 = match(portsUSB[1], "/dev/cu.usbmodem127301101");
    String[] matchPort2 = match(portsUSB[2], "/dev/cu.usbserial-0001");
    String[] matchPort3 = match(portsUSB[3], "/dev/cu.usbserial-0001");
    
    if (matchPort1!= null) { 
        allMachineConnected = false;
        portsUSBfrom3=portsUSB[3];
        println(" serial port 1 as programming port ending with 101 " + portsUSB[1] + " allMachineConnected " + allMachineConnected);       
    }

    if (matchPort2!= null) { 
        allMachineConnected = false;
        portsUSBfrom3=portsUSB[3];
        println(" serial port 2 as data port        ending with 001 " + portsUSB[2] + " allMachineConnected " + allMachineConnected); 
        onlyLitteMachineWithSecondSerialPort = true;
    }

    if (matchPort3!= null) { 
        allMachineConnected = true;
        portsUSBfrom3=portsUSB[3];
        println(" serial programming port conncected OF BIG MACHINE " + portsUSB[1] + " allMachineConnected " + allMachineConnected); 
        onlyLitteMachineWithSecondSerialPort = false;
    }
    
    //do something if nothing connected

        
        
        if (onlyLitteMachineWithSecondSerialPort) {
            
             println(" Port 1 CONNECTED to programming port of Teensy 3.5 "); //  + portsUSBfrom2 + " "
             println(" portConnectedOfBigMachine " + portConnectedOfBigMachine); //  + portsUSBfrom2 + " "
            
            teensyport = new Serial(this, ports[1],115200); // si port connecté Monterey
            encoderReceiveUSBport101 =  new Serial(this,ports[2], 115200); // si port connecté Monterey
            
            // Read bytes into a buffer until you get a linefeed (ASCII 10):
            encoderReceiveUSBport101.bufferUntil('\n');
            
        }
        
        
        if (allMachineConnected)  { 
            // if (portOfBigMachineConnected = true) { // 201  teensy 4.1
            
        }
        
        if (portsUSBfrom2 != "NC") {
            if (portConnectedOfBigMachine) { // 101  teensy 3.5    
                text (" Port 2 CONNECTED to programming port of Teensy 3.5 ",  200, 200); 
                println (" Port 2 CONNECTED to programming port of Teensy 3.5 ");
              //  teensy4port = new Serial(this, ports[1],115200); // si port connecté Montere
               
         }
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