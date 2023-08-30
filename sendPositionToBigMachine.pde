String portsUSBfrom3;

void sendPositionToBigMachine(){
        rotate (-PI/2);
       int numberOfEncodeur = 6;
       int encoderMapped [] = new int [numberOfEncodeur];

   if (formerKeyMetro == '*') {
          for (int i =0; i<numberOfEncodeur; i++){       
                encodeur[i] =(int) map (encodeur[i], 0, 4000, 0, numberOfStep/1)%numberOfStep/1;
         }
    } 

   if (formerKeyMetro == '$') {
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

void send24DatasToTeensy10motorsToBigMachine(int accelerationRatio, int driver0_On_Off, int computeData, int eraseProcessingData) {  // dataMarkedToTeensyArevoir
     rotate (-PI/2);
        accelerationRatio = speedDelta;
    
    if ( networkSize == 6){
    
    dataFromMode = "<"
    
    // + dataMappedForMotorisedBigMachine[9]+ ","+ dataMappedForMotorisedBigMachine[8]+ ","
    // + dataMappedForMotorisedBigMachine[7]+ ","+ dataMappedForMotorisedBigMachine[6]+ ","
    
    + dataMappedForMotorisedBigMachine[5] + "," + dataMappedForMotorisedBigMachine[4] + "," + dataMappedForMotorisedBigMachine[3] + "," + dataMappedForMotorisedBigMachine[2] + ","
    + dataMappedForMotorisedBigMachine[1] + "," + dataMappedForMotorisedBigMachine[0] + ","      // 
   
    +  accelerationRatio + "," + driver0_On_Off + "," + computeData + "," + eraseProcessingData + ","
    
    //  +0+","+0+","+0+","+0+","+0+","+0+","
    
    + TrigmodPos[5] + "," + TrigmodPos[4] + "," + TrigmodPos[3] + "," + TrigmodPos[2] + "," + TrigmodPos[1] + "," + TrigmodPos[0] + "," // to manage 6 note or effect
    
    + 0 + "," + 0 + "," + 0 + "," + 0 + ">"; 
 
    }
     if ( networkSize == 10){
    
    dataFromMode = "<"
    
     + dataMappedForMotorisedBigMachine[9]+ ","+ dataMappedForMotorisedBigMachine[8]+ ","
     + dataMappedForMotorisedBigMachine[7]+ ","+ dataMappedForMotorisedBigMachine[6]+ ","
    
    + dataMappedForMotorisedBigMachine[5] + "," + dataMappedForMotorisedBigMachine[4] + "," + dataMappedForMotorisedBigMachine[3] + "," + dataMappedForMotorisedBigMachine[2] + ","
    + dataMappedForMotorisedBigMachine[1] + "," + dataMappedForMotorisedBigMachine[0] + ","      // 
   
    +  accelerationRatio + "," + driver0_On_Off + "," + computeData + "," + eraseProcessingData + ","
    
    //  +0+","+0+","+0+","+0+","+0+","+0+","
    
    + TrigmodPos[5] + "," + TrigmodPos[4] + "," + TrigmodPos[3] + "," + TrigmodPos[2] + "," + TrigmodPos[1] + "," + TrigmodPos[0] + "," // to manage 6 note or effect
    
    + 0 + "," + 0 + "," + 0 + "," + 0 + ">"; 
 
    }

    
    if (computeData <-  1) {
        dataTransformed = " BigMachine  dataNotComputeInTeensy from mode ";
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
            text(" BigMachine port USB connected " + portsUSBfrom3 + " serialEncoderPort3 " + portsUSBfrom3 , 0, 1100); 


              String[] matchPort1B = match(portsUSBfrom1, "/dev/cu.usbmodem116574201");

             if ( matchPort1B!= null ){ 
                allMachineConnected=false;
              println(" BigMachine port USB connected " + portsUSBfrom3 + " portConnectedOfBigMachine " + portConnectedOfBigMachine +  " portOfBigMachineConnected " + portOfBigMachineConnected);  
              text(" only BIG Machine  ENDING with 201 on port 1" + portsUSBfrom1 + " allMachineConnected " + allMachineConnected, 0, 1000); 
              // portConnectedToBigMachineOnly=true;
              teensy4port.write(dataFromMode);
            }

            String[] matchPort = match(portsUSBfrom3, "/dev/cu.usbserial-0001");
              
            if ( matchPort!= null )
            { 
                allMachineConnected=true;
                text(" ALL Machine CONNECTED  port 2 is teensy 3.5 ending with 101 " + portsUSBfrom2 + " allMachineConnected " + allMachineConnected, 0, 1000); 
            }
            else
            {    println(" BigMachine CONNECTED to port 1" + portsUSBfrom1 + " allMachineConnected " + allMachineConnected);
            }

            if (frameCount <=  200)  
            {    text(" BigMachine port USB connected " + portsUSBfrom1 + " serialEncoderPort3 " + portsUSBfrom3 , 0, 1000); 
            }
             //  allMachineConnected=true;
      }
   //}

     if (portConnectedToBigMachineOnly) 
      {  
       if (frameCount <=  200)
        { 
               text(" USB PROCESSING port NOT connected but on port3 there is" + portsUSBfrom3 + " ", 0, 1000); 
               println(" BigMachine port  USB NOT connected " + portsUSBfrom3);   
        }    
     //   if(frameCount ==  1) noLoop();
      }
  rotate (PI/2);
} 
