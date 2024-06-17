void sendPositionToBigMachine()
{
       rotate (-PI/2);
       int numberOfEncodeur = 6;
       int encoderMapped [] = new int [numberOfEncodeur];

     if (formerKeyMetro == '*')
     {
          for (int i =0; i<numberOfEncodeur; i++){       
                encodeur[i] =(int) map (encodeur[i], 0, 4000, 0, numberOfStep/1)%numberOfStep/1;
         }
     } 

     if (formerKeyMetro == '$')
     {
          for (int i =0; i<numberOfEncodeur; i++){       
                encodeur[i] =(int) map (encodeur[i], 0, 4000, 0, numberOfStep/1)%numberOfStep/1;
         }
     }

       for (int i = 0; i < 6; i++) { 
             if ( encoderTouched[i]==true){ 
                println(" True encodeur to BigMachine" + i + " " + encoderTouched[i] + " " + encodeur[i]);          
           //     readPositionEncoder[i] = encodeur[i];
             } 

             if ( encoderTouched[i]==false){ 
                println(" False encodeur to BigMachine" + i + " " + encoderTouched[i] + " " + encodeur[i]);  
           //     readPositionEncoder[i] = 0;
            
             } 
        } 
      rotate (PI/2);
} 

void send24DatasToTeensy10motorsToBigMachine(int accelerationRatio, int driver0_On_Off, int computeData, int eraseProcessingData) 
 {   // dataMarkedToTeensyArevoir
       rotate (-PI/2);
       accelerationRatio = speedDelta;
    
    if ( networkSize == 6)  // always 24 datas
    {
    
     dataFromMode = "<"

     
     + dataMappedForMotorisedBigMachine[5] + "," + dataMappedForMotorisedBigMachine[4] + ","
     + dataMappedForMotorisedBigMachine[3] + "," + dataMappedForMotorisedBigMachine[2] + ","
     + dataMappedForMotorisedBigMachine[1] + "," + dataMappedForMotorisedBigMachine[0] + ","      // 
     + 0 + "," + 0 + "," + 0 + "," + 0 + ","
   
     +  accelerationRatio + "," + driver0_On_Off + "," + computeData + "," + eraseProcessingData + ","
    

     + TrigmodPos[5] + "," + TrigmodPos[4] + "," + TrigmodPos[3] + "," + TrigmodPos[2] + "," + TrigmodPos[1] + "," + TrigmodPos[0] + "," // to manage 6 note or effect

     + 0 + "," + 0 + "," + 0 + "," + 0 + ">"; 
    }

    if ( networkSize == 10)
    {
    
     dataFromMode = "<"
    
      + dataMappedForMotorisedBigMachine[9] + "," + dataMappedForMotorisedBigMachine[8] + ","
      + dataMappedForMotorisedBigMachine[7] + "," + dataMappedForMotorisedBigMachine[6] + ","
      + dataMappedForMotorisedBigMachine[5] + "," + dataMappedForMotorisedBigMachine[4] + ","
      + dataMappedForMotorisedBigMachine[3] + "," + dataMappedForMotorisedBigMachine[2] + ","
      + dataMappedForMotorisedBigMachine[1] + "," + dataMappedForMotorisedBigMachine[0] + ","      // 
   
      +  speedDelta + "," + driver0_On_Off + "," + computeData + "," + eraseProcessingData + ","
    
        //  +0+","+0+","+0+","+0+","+0+","+0+","
    
      + TrigmodPos[5] + "," + TrigmodPos[4] + "," + TrigmodPos[3] + "," + TrigmodPos[2] + "," + TrigmodPos[1] + "," + TrigmodPos[0] + "," // to manage 6 note or effect
    
      + 0 + "," + 0 + "," + 0 + "," + 0 + ">"; 
    }

     if ( networkSize == 9)
    {
    
     dataFromMode = "<"
    
      + 0 + "," + dataMappedForMotorisedBigMachine[8] + ","
      + dataMappedForMotorisedBigMachine[7] + "," + dataMappedForMotorisedBigMachine[6] + ","
      + dataMappedForMotorisedBigMachine[5] + "," + dataMappedForMotorisedBigMachine[4] + ","
      + dataMappedForMotorisedBigMachine[3] + "," + dataMappedForMotorisedBigMachine[2] + ","
      + dataMappedForMotorisedBigMachine[1] + "," + dataMappedForMotorisedBigMachine[0] + ","      // 
   
      +  speedDelta + "," + driver0_On_Off + "," + computeData + "," + eraseProcessingData + ","
    
        //  +0+","+0+","+0+","+0+","+0+","+0+","
    
      + TrigmodPos[5] + "," + TrigmodPos[4] + "," + TrigmodPos[3] + "," + TrigmodPos[2] + "," + TrigmodPos[1] + "," + TrigmodPos[0] + "," // to manage 6 note or effect
    
      + 0 + "," + 0 + "," + 0 + "," + 0 + ">"; 
    }

    
    if (computeData <-  1) {
        dataTransformed = " BigMachine SpeedDelta  dataNotComputeInTeensy from mode ";
        println(frameCount + ": " + dataTransformed +  keyMode + " " +   dataFromMode);      
    }
    
    else if (computeData >-  1) {
        dataTransformed = " BigMachine dataComputeInTeensy from mode ";
        println(frameCount + ": " + dataTransformed +  keyMode + " " +   dataFromMode);
    }
    
     // display if port are well connected when big machine is connected
     // if (portConnectedOfBigMachine || portConnectedToBigMachineOnly)
     //  {    If not null, then a match was found
       
    if (frameCount >=  0)
     { 
             text(" BigMachine port USB connected on port 2 mayBe ? " + portsUSBfrom2 + " serialEncoderPort3 " + portsUSBfrom3 , 0, 1100); 
             println ( "WHICH PORT is connceted to 1 " + portsUSBfrom1);

            if ( portConnectedToBigMachineOnly==true || bigMachineConnectedToPort2_And_NATIVEpoortConnectedToPort1 == true )
             { 
             // samplingWithMouse=false;      
              allMachineConnected=false;
              println(" BigMachine port USB connected to 1 or 2 " + portsUSBfrom2 + " portConnectedOfBigMachine " + portConnectedOfBigMachine +  " portOfBigMachineConnected " + portOfBigMachineConnected);  
              text(" only BIG Machine  ENDING with 201 on port 1" + portsUSBfrom1 + " allMachineConnected " + allMachineConnected, 0, 1000); 
              // portConnectedToBigMachineOnly=true;

              teensy4port.write(dataFromMode);
            }

            else {
            // samplingWithMouse=true;
              
              println(" something Connected but only WIFI. That's mean nothing for the moment ");
               text(" USB PROCESSING port NOT connected but on port3 there is" + portsUSBfrom3 + " ", 0, 1000); 
              // teensy4port.write(dataFromMode);

            }
         
        if (portConnectedToBigMachineOnly) 
        {  
          samplingWithMouse=false; 
          if (frameCount <=  200)
           { 
               text(" USB PROCESSING port NOT connected but on port3 there is" + portsUSBfrom3 + " ", 0, 1000); 
               println(" BigMachine port  IS connected " + portsUSBfrom1);   
           }    
        }
        rotate (PI/2);
     } 
}
