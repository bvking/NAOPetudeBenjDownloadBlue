

void send24DatasToTeensy6motors(int accelerationRatio, int driver0_On_Off, int computeData, int eraseProcessingData){  // dataMarkedToTeensyArevoir

       dataFromMode ="<"

      + dataMappedForMotorisedPosition[7]+ ","+ dataMappedForMotorisedPosition[6]+ ","

      + dataMappedForMotorisedPosition[5]+ ","+ dataMappedForMotorisedPosition[4]+ ","+ dataMappedForMotorisedPosition[3]+","+ dataMappedForMotorisedPosition[2]+ ","
      + dataMappedForMotorisedPosition[1]+ ","+ dataMappedForMotorisedPosition[0] + ","      // 

    //    + dataMappedForMotorisedPosition[5]%6400+ ","+ dataMappedForMotorisedPosition[4]%6400+ ","+ dataMappedForMotorisedPosition[3]%6400+","+ dataMappedForMotorisedPosition[2]%6400+ ","
    //    + dataMappedForMotorisedPosition[1]%6400+ ","+ dataMappedForMotorisedPosition[0]%6400 + ","      // 
      
       
       +0+","+0+","

      +  accelerationRatio +","+ driver0_On_Off +","+ computeData +","+ eraseProcessingData + ","
      
    //  +0+","+0+","+0+","+0+","+0+","+0+","

     +TrigmodPos[5]+","+TrigmodPos[4]+","+TrigmodPos[3]+","+TrigmodPos[2]+","+TrigmodPos[1]+","+TrigmodPos[0]+ "," // to manage 6 note or effect

       +0+","+0+","+0+","+0+">";  

      if (computeData<-1){
      dataTransformed = " dataNotComputeInTeensy from mode ";
      println(frameCount + ": " + dataTransformed +  keyMode + " " +   dataFromMode );

  }
  
     else  if (computeData>-1){dataTransformed = " dataComputeInTeensy from mode ";
     println(frameCount + ": " + dataTransformed +  keyMode + " " +   dataFromMode );
  
  }
    if (portsUSBfrom2 != "NC")  {   // // If not null, then a match was found
      teensyport.write(dataFromMode);
      teensy4port.write(dataFromMode);
     // println("port USB connected " + portsUSBfrom2 + " ");  
   }

    if (frameCount ==1) noLoop();

  }

  void setPort(){

   String[] ports = Serial.list();
   String[] portsUSB = { "GA", "FL", "NC", "BLI", "BLA", "BLE" ,"BLI", "BLO", "BLU" };
   arrayCopy(ports, portsUSB);


   if (portsUSB[2] == "NC")  {   // // If not null, then a match was found
      println("port USB not connected " + portsUSB[2] + " ");  
      }

   if (portsUSB[2] != "NC")  {   // // If not null, then a match was found
       portsUSBfrom2 = portsUSB[2];
      println("port USB connected " + portsUSBfrom2 + " ");  
      }

  printArray (portsUSB);
  printArray (ports);

    //*************** WITH TEENSY connected
  //  teensyport = new Serial(this, ports[0], 115200);// si port non connecte Monterey mais buetooth ouvert
  //  teensyport = new Serial(this, ports[1], 115200);// si port non connecte Catalina 
      teensyport = new Serial(this, ports[1],115200); // si port connecté Monterey
   if (portsUSB[2] != "NC")  { 
      teensy4port = new Serial(this, ports[2],115200); // si port connecté Monterey
     }
  //*************** WITHOUT ENODEER connected
   if (portsUSB[2] != "NC")  { 
    encoderReceiveUSBport101 =  new Serial(this,ports[3], 1000000); // si port connecté Monterey

  // Read bytes into a buffer until you get a linefeed (ASCII 10):
    encoderReceiveUSBport101.bufferUntil('\n');
    }
 }