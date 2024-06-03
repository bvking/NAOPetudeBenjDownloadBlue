String dataFromModeToTest;
void send6dataToTest() {
//void send6dataToTest(int accelerationRatio, int driver0_On_Off, int computeData, int eraseProcessingData, int driverNetWorkSizeOnOff, int timeElapsedBackingPosition) {  // dataMarkedToTeensyArevoir
    rotate( -PI / 2);
   // driver On =2
   // driver off -2
    for (int i = 0; i < networkSize; i++) {
        //   oldDataMappedForMotorisedPosition[i]= dataMappedForMotorisedPosition[i];
        //  + dataMappedForMotorisedPosition[i]%6400+ 
        startingPos[networkSize -1 - i] = encodeurBrut[i];
    }
    
   // dataFromMode = "<"

        
      dataFromModeToTest  = "<"
    
    + dataMappedForMotorisedPosition[5] + "," + dataMappedForMotorisedPosition[4] + "," + dataMappedForMotorisedPosition[3] + "," + dataMappedForMotorisedPosition[2] + ","
    + dataMappedForMotorisedPosition[1] + "," + dataMappedForMotorisedPosition[0] + ","      // 
    
    + 0 + "," + 0 + ","
    + 0 + "," + 0 + ","
    
     //+  accelerationRatio + "," + driver0_On_Off + "," + computeData + "," + eraseProcessingData + "," + driverNetWorkSizeOnOff + "," + timeElapsedBackingPosition + "," 
     +0+","+0+","+0+","+0+","+0+","+0+","
      +0+","+0+","+0+","+0+
    
     ">";  


      teensy4port.write(dataFromModeToTest); // teensy remplace par serial
      
      println( " send6datas " + dataFromModeToTest);

}
