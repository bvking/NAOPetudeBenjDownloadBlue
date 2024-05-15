
void send24DatasToTeensy6motorsToLittleMachine(int accelerationRatio, int driver0_On_Off, int computeData, int eraseProcessingData, int driverNetWorkSizeOnOff, int timeElapsedBackingPosition) {  // dataMarkedToTeensyArevoir
    rotate( -PI / 2);
   // driver On =2
   // driver off -2
    for (int i = 0; i < networkSize; i++) {
        //   oldDataMappedForMotorisedPosition[i]= dataMappedForMotorisedPosition[i];
        //  + dataMappedForMotorisedPosition[i]%6400+ 
        startingPos[networkSize -1 - i] = encodeur[i];
    }
    
    dataFromMode = "<"
    
    + dataMappedForMotorisedPosition[5] + "," + dataMappedForMotorisedPosition[4] + "," + dataMappedForMotorisedPosition[3] + "," + dataMappedForMotorisedPosition[2] + ","
    + dataMappedForMotorisedPosition[1] + "," + dataMappedForMotorisedPosition[0] + ","      // 
    
    + 0 + "," + 0 + ","
    + 0 + "," + 0 + ","
    
    +  accelerationRatio + "," + driver0_On_Off + "," + computeData + "," + eraseProcessingData + "," + driverNetWorkSizeOnOff + "," + timeElapsedBackingPosition + "," 
    
    //  +0+","+0+","+0+","+0+","+0+","+0+","
    
    + TrigmodPos[5] + "," + TrigmodPos[4] + "," + TrigmodPos[3] + "," + TrigmodPos[2] + "," + TrigmodPos[1] + "," + TrigmodPos[0] + "," // to see trigging according position note
    
    + 0 + "," + 0 + ">";  
    
    if (computeData <-  1) {
        dataTransformed = " dataNotComputeInTeensy from mode ";
        println(frameCount + ": " + dataTransformed +  keyMode + " " +   dataFromMode);
        
    }
    
    else if (computeData >-  1) {
        dataTransformed = " dataComputeInTeensy from mode ";
        println(frameCount + ": " + dataTransformed +  keyMode + " " +   dataFromMode);
    }
    
    
    if (onlyLitteMachineWithSecondSerialPort)  {   // // If not null, then a match was found
        
        teensyport.write(dataFromMode);
               
        if (frameCount <=  200)  { 
            text("Data port USB connected to port2" + portsUSBfrom2 + " ending with -0001 ", 0, 700); 
            println("Data port USB connected to port2" + portsUSBfrom2 + " ending with -0001 ");  
        }
    }
    
    if (portOfBigMachineConnected)  {   // // If not null, then a match was found
        
        if (frameCount <=  200)  { 
            text("port NOT USB connected to little with portUSBfrom2" + portsUSBfrom2 + " ending with 101 ", 0, 700); 
            println("port NOT USB connected to little with portUSBfrom2 " + portsUSBfrom2 + " ending with 101 ");   
        }
    }
    
    if (portsUSBfrom2 == "NC")  {   // // If  null, then a match was not found
        
        if (frameCount <=  200) { 
            text("NO port connected " + portsUSBfrom2 + " ", 0, 700); 
            println("NO port connected " + portsUSBfrom2);   
        }
        
        if (frameCount ==  1) noLoop();
        
    }
    rotate(PI / 2);
}
