//String [] portsUSB = new string [10];

void send24DatasToTeensy6motors(int accelerationRatio, int driver0_On_Off, int computeData, int eraseProcessingData){  // dataMarkedToTeensyArevoir

 // computeData=-2;
       dataFromMode ="<"

      + dataMappedForMotorisedPosition[5]+ ","+ dataMappedForMotorisedPosition[4]+ ","+ dataMappedForMotorisedPosition[3]+","+ dataMappedForMotorisedPosition[2]+ ","
      + dataMappedForMotorisedPosition[1]+ ","+ dataMappedForMotorisedPosition[0] + ","      // 

    //    + dataMappedForMotorisedPosition[5]%6400+ ","+ dataMappedForMotorisedPosition[4]%6400+ ","+ dataMappedForMotorisedPosition[3]%6400+","+ dataMappedForMotorisedPosition[2]%6400+ ","
    //  + dataMappedForMotorisedPosition[1]%6400+ ","+  dataMappedForMotorisedPosition[0]%6400 + ","      // 
       +0+","+0+","+0+","+0+","

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
  // String[] m1 = match(portUSB, " teensy ");

   // if (m1 == null) {
  //  teensyport.write(dataFromMode);
   //println ( " noPortPlugged " + portsUSB[0]); 
   //}

   //  teensyport.write(dataFromMode);
      if (frameCount ==5) noLoop();
  }

  void setPort(){

   String[] ports = Serial.list();
   
 
   String[] portsUSB = { "GA", "FL", "NC", "po", "po", "po" ,"po", "po", "po" };
arrayCopy(ports, portsUSB);
println(portsUSB);
// Prints updated array contents to the console:
// [0] "OH"
// [1] "IN"
// [2] "MI"
  printArray(Serial.list());
  printArray (portsUSB);




    //*************** WITH TEENSY connected
 //teensyport = new Serial(this, ports[0], 115200);// si port non connecte Monterey mais buetooth ouvert
  //  teensyport = new Serial(this, ports[1], 115200);// si port non connecte Catalina 
   teensyport = new Serial(this, ports[1],115200); // si port connecté Monterey
 
  //*************** WITHOUT ENODEER connected
 
  //  encoderReceiveUSBport101 =  new Serial(this,ports[2], 1000000); // si port connecté Monterey

  // Read bytes into a buffer until you get a linefeed (ASCII 10):
 //   encoderReceiveUSBport101.bufferUntil('\n');

 }