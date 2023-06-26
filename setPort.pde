
boolean allMachineConnected;
void setPort() {
    portOfBigMachineConnected = false;
    
    String[] ports = Serial.list();
    String[] portsUSB = { "GA", "FL", "NC", "teensy4.1", "BLA", "BLE" ,"BLI", "BLO", "BLU" };
    arrayCopy(ports, portsUSB);
    
    
    if (portsUSB[2] == "NC")  {   // // If not null, then a match was found
        portsUSBfrom2 = portsUSB[2];
        portsUSBfrom1=  portsUSB[1];
        println("port USB NOT CONNECTED " + portsUSBfrom2 + " "); 
        portConnected= false; 
}
    
    if (portsUSB[2] != "NC")  {   // // If not null, then a match was found
        portsUSBfrom2 = portsUSB[2];
        println("serial port USB CONNECTED " + portsUSBfrom2 + " portConnected " + portConnected);
        portConnected = true;  
}
    
    if (portsUSB[3] != "teensy4.1")  {   // // If not null, then a match was found
        portsUSBfrom3=portsUSB[3];
        portsUSBfrom1=portsUSB[1];
        if (portsUSBfrom3 == "/dev/cu.usbserial-0001") {  
            portOfBigMachineConnected=true;
            println(" serialFromEncodeur Connected on port 3 " + portsUSB[3] + " " + " serialFromLittleMachineConnceted" + portsUSBfrom3 );  
        }
        else if (portsUSB[3] != "/dev/cu.usbserial-0001") {   println(" portOfBigMachine NOT Connected " + portsUSB[3] +  " portOfBigMachineConnected " + portOfBigMachineConnected);  
        }
     }
    
    if (portsUSB[1] == "/dev/cu.usbmodem116574201")  {   // // If not null, then a match was found
        
        println(" Teensy 4.1 CONNECTED "); //  + portsUSBfrom2 + " "
        //  portConnected=true;  
}
     if (portsUSB[1] == "/dev/cu.usbmodem127301101")  {   // // If not null, then a match was found
        
        println(" Teensy 3.5 CONNECTED "); //  + portsUSBfrom2 + " "
        //  portConnected=true;  
}
    
    printArray(portsUSB);
    printArray(ports);

          if(portConnected ==  true)  { 
       // if (portOfBigMachineConnected = true) { // 201  teensy 4.1
              teensy4port = new Serial(this, ports[1],115200); // si port connecté Montere
           }
    
         if(portsUSBfrom2 != "NC") {
           if (portConnected = true) { // 101  teensy 3.5        
            //*************** WITH TEENSY connected
          //  teensyport = new Serial(this, ports[0], 115200);// si port non connecte Monterey mais buetooth ouvert
          //  teensyport = new Serial(this, ports[1], 115200);// si port non connecte Catalina 
              teensyport = new Serial(this, ports[2],115200); // si port connecté Monterey
               }
           }

            //*************** WITHOUT ENODEER connected
             if(portConnected ==  true)  { 
                 println("  PORT 2 or PORT 3 CONNECTED so CONNECT serial " + ports[3] + " portConnected " + portConnected);
                encoderReceiveUSBport101 =  new Serial(this,ports[3], 115200); // si port connecté Monterey
        
             // Read bytes into a buffer until you get a linefeed (ASCII 10):
              encoderReceiveUSBport101.bufferUntil('\n');
             }
   
  /*
    if ( allMachineConnected){
        if (portOfBigMachineConnected = true) { // 101  teensy 3.5
            teensy4port = new Serial(this, ports[1],115200); // si port connecté Montere
           }
    
        if(portsUSBfrom2 != "NC") {
           if (portConnected = true) { // 101  teensy 3.5        
            //*************** WITH TEENSY connected
          //  teensyport = new Serial(this, ports[0], 115200);// si port non connecte Monterey mais buetooth ouvert
          //  teensyport = new Serial(this, ports[1], 115200);// si port non connecte Catalina 
              teensyport = new Serial(this, ports[2],115200); // si port connecté Monterey
               }
           }
    
    
            //*************** WITHOUT ENODEER connected
        if(portConnected ==  true)  { 
                 println("  PORT 2 or PORT 3 CONNECTED so CONNECT serial " + ports[2] + " portConnected " + portConnected);
                encoderReceiveUSBport101 =  new Serial(this,ports[3], 115200); // si port connecté Monterey
        
             // Read bytes into a buffer until you get a linefeed (ASCII 10):
              encoderReceiveUSBport101.bufferUntil('\n');
        }
   }
 */ 
}