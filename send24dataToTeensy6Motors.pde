boolean portOfBigMachineConnected; 
String portsUSBfrom1;


void send24DatasToTeensy6motorsToLittleMachine(int accelerationRatio, int driver0_On_Off, int computeData, int eraseProcessingData) {  // dataMarkedToTeensyArevoir
    
    for (int i = 0; i < networkSize; i++) {
        //  oldDataMappedForMotorisedPosition[i]= dataMappedForMotorisedPosition[i];
}
    
    dataFromMode = "<"
    
    //  + dataMappedForMotorisedPosition[7]+ ","+ dataMappedForMotorisedPosition[6]+ ","
    
    + dataMappedForMotorisedPosition[5] + "," + dataMappedForMotorisedPosition[4] + "," + dataMappedForMotorisedPosition[3] + "," + dataMappedForMotorisedPosition[2] + ","
    + dataMappedForMotorisedPosition[1] + "," + dataMappedForMotorisedPosition[0] + ","      // 
    
    //    + dataMappedForMotorisedPosition[5]%6400+ ","+ dataMappedForMotorisedPosition[4]%6400+ ","+ dataMappedForMotorisedPosition[3]%6400+","+ dataMappedForMotorisedPosition[2]%6400+ ","
    //    + dataMappedForMotorisedPosition[1]%6400+ ","+ dataMappedForMotorisedPosition[0]%6400 + ","      // 
    
    
    + 0 + "," + 0 + ","
    + 0 + "," + 0 + ","
    
    +  accelerationRatio + "," + driver0_On_Off + "," + computeData + "," + eraseProcessingData + ","
    
    //  +0+","+0+","+0+","+0+","+0+","+0+","
    
    + TrigmodPos[5] + "," + TrigmodPos[4] + "," + TrigmodPos[3] + "," + TrigmodPos[2] + "," + TrigmodPos[1] + "," + TrigmodPos[0] + "," // to manage 6 note or effect
    
    + 0 + "," + 0 + "," + 0 + "," + 0 + ">";  
    
    if (computeData <-  1) {
        dataTransformed = " dataNotComputeInTeensy from mode ";
        println(frameCount + ": " + dataTransformed +  keyMode + " " +   dataFromMode);
        
}
    
    else if (computeData >-  1) {
        dataTransformed = " dataComputeInTeensy from mode ";
        println(frameCount + ": " + dataTransformed +  keyMode + " " +   dataFromMode);
    }
    
    
    if (portConnected)  {   // // If not null, then a match was found
        
        teensyport.write(dataFromMode);
        
        //   teensy4port.write(dataFromMode);
        if (frameCount <=  200)  { 
            text("port USB connected " + portsUSBfrom2 + " ", 0, 700); 
            println("port USB connected " + portsUSBfrom2 + " portConnected " + portConnected);  
        }
    }

     if (portOfBigMachineConnected)  {   // // If not null, then a match was found
      //   teensy4port.write(dataFromMode);
        if (frameCount <=  200)  { 
            text("portOfBigMachineConnected " +portOfBigMachineConnected + " ", 0, 700); 
            println("portOfBigMachineConnected " + portOfBigMachineConnected + " portConnected " + portConnected);  
        }
    }
    
    if (portsUSBfrom2 == "NC")  {   // // If  null, then a match was not found
        // teensyport.write(dataFromMode);
        //   teensy4port.write(dataFromMode);
        if (frameCount <=  200) { 
            text("port NOT connected " + portsUSBfrom2 + " ", 0, 700); 
            println("port  USB NOT connected " + portsUSBfrom2);   
    }
        
        if(frameCount ==  1) noLoop();
        
}
}

void setPort() {
    
    String[] ports = Serial.list();
    String[] portsUSB = { "GA", "FL", "NC", "teensy4.1", "BLA", "BLE" ,"BLI", "BLO", "BLU" };
    arrayCopy(ports, portsUSB);
    
    
    if (portsUSB[2] == "NC")  {   // // If not null, then a match was found
        portsUSBfrom2 = portsUSB[2];
        println("port USB NOT CONNECTED " + portsUSBfrom2 + " ");  
}
    
    if (portsUSB[2] != "NC")  {   // // If not null, then a match was found
        portsUSBfrom2 = portsUSB[2];
        println("port USB CONNECTED " + portsUSBfrom2 + " ");
        portConnected = true;  
}
    
    if (portsUSB[5] != "BLE")  {   // // If not null, then a match was found
       portOfBigMachineConnected=true;
      portsUSBfrom1 = portsUSB[1];
        println(" Teensy 4.1 CONNECTED  as well " + portsUSBfrom1 + " " + " portOfBigMachineConnected" + portOfBigMachineConnected);  
}
    
    if (portsUSB[1] == "/dev/cu.usbmodem116574201")  {   // // If not null, then a match was found
        
        println(" Teensy 4.1 CONNECTED "); //  + portsUSBfrom2 + " "
        //  portConnected=true;  
}
    
    printArray(portsUSB);
    printArray(ports);

 
        if (portOfBigMachineConnected = true) { // 101  teensy 3.5
            

      //      teensy4port = new Serial(this, ports[0],115200); // si port connecté Monterey
    
    }
    
    if(portsUSBfrom2 != "NC") {
        if (portConnected = true) { // 101  teensy 3.5
            
            //*************** WITH TEENSY connected
          //  teensyport = new Serial(this, ports[0], 115200);// si port non connecte Monterey mais buetooth ouvert
          //  teensyport = new Serial(this, ports[1], 115200);// si port non connecte Catalina 
            teensyport = new Serial(this, ports[1],115200); // si port connecté Monterey
    }
    }
    
    if (portsUSBfrom2 == "NC") { 
        println(" NO PORT CONNECTED ");
        //  teensy4port = new Serial(this, ports[3],115200); // si port connecté Monterey
}
    //*************** WITHOUT ENCODER connected
    // if (portsUSBfrom2 == "/dev/cu.usbmodem127301101" ) {
         if(portConnected ==  true)  { 
        println("  PORT 2 or PORT 3 CONNECTED so CONNECT serial " + ports[2] + " portConnected " + portConnected);
        encoderReceiveUSBport101 =  new Serial(this,ports[2], 115200); // si port connecté Monterey
        
       // Read bytes into a buffer until you get a linefeed (ASCII 10):
        encoderReceiveUSBport101.bufferUntil('\n');
    }
}