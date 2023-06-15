void sendPositionToBigMachine(){

     for (int i = 0; i < networkSize; i++) 

             if ( encoderTouched[i]==true){ 
   
                println(" Main Found encodeur to BigMachine" + i + " " + encoderTouched[i] + " " + encodeur[i]);  

                readPositionEncoder[i] =(int) map (encodeur[i], 0, 800, 0, numberOfStep);

             } 
     } 

void send24DatasToTeensy10motorsToBigMachine(int accelerationRatio, int driver0_On_Off, int computeData, int eraseProcessingData) {  // dataMarkedToTeensyArevoir
    
    for (int i = 0; i < networkSize; i++) {
        //  oldDataMappedForMotorisedPosition[i]= dataMappedForMotorisedPosition[i];
     }
    
    dataFromMode = "<"
    
     + dataMappedForMotorisedPosition[9]+ ","+ dataMappedForMotorisedPosition[8]+ ","
     + dataMappedForMotorisedPosition[7]+ ","+ dataMappedForMotorisedPosition[6]+ ","
    
    + dataMappedForMotorisedPosition[5] + "," + dataMappedForMotorisedPosition[4] + "," + dataMappedForMotorisedPosition[3] + "," + dataMappedForMotorisedPosition[2] + ","
    + dataMappedForMotorisedPosition[1] + "," + dataMappedForMotorisedPosition[0] + ","      // 
    
    //    + dataMappedForMotorisedPosition[5]%6400+ ","+ dataMappedForMotorisedPosition[4]%6400+ ","+ dataMappedForMotorisedPosition[3]%6400+","+ dataMappedForMotorisedPosition[2]%6400+ ","
    //    + dataMappedForMotorisedPosition[1]%6400+ ","+ dataMappedForMotorisedPosition[0]%6400 + ","      // 
    
   
    
    +  accelerationRatio + "," + driver0_On_Off + "," + computeData + "," + eraseProcessingData + ","
    
    //  +0+","+0+","+0+","+0+","+0+","+0+","
    
    + TrigmodPos[5] + "," + TrigmodPos[4] + "," + TrigmodPos[3] + "," + TrigmodPos[2] + "," + TrigmodPos[1] + "," + TrigmodPos[0] + "," // to manage 6 note or effect
    
    + 0 + "," + 0 + "," + 0 + "," + 0 + ">";  
    
    if (computeData <-  1) {
        dataTransformed = " BigMachine  dataNotComputeInTeensy from mode ";
        println(frameCount + ": " + dataTransformed +  keyMode + " " +   dataFromMode);
        
}
    
    else if (computeData >-  1) {
        dataTransformed = " BigMachine dataComputeInTeensy from mode ";
        println(frameCount + ": " + dataTransformed +  keyMode + " " +   dataFromMode);
    }
    
    
    if (portConnected)  {   // // If not null, then a match was found
        
       
        
           teensy4port.write(dataFromMode);
        if (frameCount <=  200)  { 
            text(" BigMachine port USB connected " + portsUSBfrom2 + " ", 0, 700); 
            println(" BigMachine port USB connected " + portsUSBfrom2 + " portConnected " + portConnected);  
        }
    }
    
    if (portsUSBfrom2 == "NC")  {   // // If  null, then a match was not found
        // teensyport.write(dataFromMode);
        //   teensy4port.write(dataFromMode);
        if (frameCount <=  200) { 
            text(" BigMachine port NOT connected " + portsUSBfrom2 + " ", 0, 700); 
            println(" BigMachine port  USB NOT connected " + portsUSBfrom2);   
    }
        
     //   if(frameCount ==  1) noLoop();
        
   }
} 

