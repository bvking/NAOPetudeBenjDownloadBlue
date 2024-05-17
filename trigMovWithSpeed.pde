boolean sameInstrument;// = false;
int deltaAmplitude ;
int chronoOFFThird ; 
int timeEnablingDiscrimination;
int discriminON;

boolean manualyMoved = false;

void sendPositionToLiveFromTouchedEncodeurNetworkSizeOnly()
{  
    textSize(75);
    
    for (int i = 0; i < networkSize; i++)
    { 
        if (modeOfControlDr == " virtual ")
        { 
         // encodeur[i] = (int) map(slider[i], 0., 127., 0, 4000);
        } 
        
        encoderTouched[i] =  false;
        oldEncodeurPosition[i] = encodeurPosition[i] * 1;
        
        encodeurPosition[i] = encodeur[i];
        
        encodeurMappedAsMotor[i] = abs((int) map(encodeur[i], 0, 4000, 0, numberOfStep)); 


        
        //*********** COMPUTE SPEED of encoder
        
        gapEncoder_OldEncodeur[i] = encodeurPosition[i] - oldEncodeurPosition[i];
        
        if (gapEncoder_OldEncodeur[i] < ( -4000 + 400))
        {
            gapEncoder_OldEncodeur[i] += 4000;
        }

        oldOldVelocityBis[i] =  oldVelocityBis[i]; // to use to disciminate variation of speed
        oldVelocityBis[i] = velocityBis[i];// usefull may be to compute acceleration
        velocityBis[i] = gapEncoder_OldEncodeur[i];
        
        //*********** COMPUTE GAP between where the position of motor would have to be and actual position of encoder  not USED
        
        dataMapped[i]  = (int) dataMappedForMotorisedPosition[networkSize - 1 - i]; //assign instrument changed at the good order 0 left, then 1,2, .., .. 4 right fonctionne en up
        
        dataMappedFromMotor[i] = (int)  map(dataMapped[i], 0, numberOfStep, 0, 4000); 

        
        /*
        if(startingPos[i] <= dataMappedFromMotor[i] ){   
          if(startingPos[i] -100 <= encodeurBrut[networkSize-1-i] && encodeurBrut[networkSize-1-i] <= dataMappedFromMotor[i]) { 
            manualyMoved = false;
          }  else if( dataMappedFromMotor[i] <= encodeurBrut[networkSize-1-i])
          {  
            patternFromInstrument=i; 
            if(!manualyMoved) { 
                numberOfTrig[patternFromInstrument] += 1;
                numberOfTrig[patternFromInstrument] %= 9;   
                manualyMoved = true; 

                key = 'e';
                   background(50);
  
               phaseDirectFromSeq();
      
                textSize(150);    
                text("               changeS " + patternFromInstrument+ " " + numberOfTrig[patternFromInstrument] + " ", 0, 1 * patternFromInstrument * 50); 
                println("            changeInstrument " + patternFromInstrument + " " + numberOfTrig[patternFromInstrument] ); 
                println("            changeInstrument " + patternFromInstrument + " " + numberOfTrig[patternFromInstrument] ); 

              //  lastPatternFromInstrument=patternFromInstrument;

            /*
             enablingParametersChangesToLive = false;
             enablingRecordFromAndToInstru = true;
        
             enablingChangeSound[patternFromInstrument] = false; 
             enablingChangeSoundB[patternFromInstrument] = true;
             timeDisablingChangesParameterWithNegativeSpeedBis[instrumentTouched] = millis();       // start disabloing Ro

              timeToWaitToEnableNextMovement = millis();       // start disabloing Ro 
              */
             /*
             } 
          }  else if( encodeurBrut[networkSize-1-i] <= startingPos[i] - 100 )
           {  
            if(!manualyMoved) 
            { 
              patternFromInstrument=i; 

              numberOfRota[patternFromInstrument] += 1;
              numberOfRota[patternFromInstrument] %= 10; 

            } 
          }
        } 
       */




        
        //_____ not USED
        if (oldEncoderTouched[i] != encoderTouched[i])
        {            
        }     
        if (velocityBis[i] > 10)
        { 
            encoderTurnClockWise[i] = true;
        }
        if (velocityBis[i] <-  10)
        { 
            encoderTurnClockWise[i] = false; 
        }     
        if (encoderTouched[i] ==  true)
        {       
        } 

        gapEncoder_Motor[i] =  abs(encodeurMappedAsMotor[i] - dataMappedFromMotor[i]); // not USED

        //_____ not USED
        //*********************************
        
        rotate( -PI / 2);
        if (!systemForBigMachine) 
        { 
            // "VIRT " + slider[i] +   " GapM " +  gapEncoder_Motor[i] +  " acc " + accelerationBis[i] +
        text     ( " start " +  startingPos[i] + " encoBr " +  encodeurBrut[networkSize-1-i] + " motor " + dataMappedForMotorisedBigMachine[i]  + " GAP " + velocityBis[networkSize-1-i] + " OLD " + oldVelocityBis[networkSize-1-i] + " olDD " + oldOldVelocityBis[networkSize-1-i] + " " + (networkSize-1-i) + " Ro " + numberOfRota[networkSize-1-i] + " M " + instrumentToMute[networkSize-1-i] + 
                 " old " + oldEncodeurPosition[networkSize-1-i] + " " + encodeurPosition[networkSize-1-i] + " " + numberOfTrig[networkSize-1-i] + " " + enablingParametersChangesToLive + " SAVING " + patternFromInstrument + " " + recordPositionsFromInstrument[patternFromInstrument][networkSize-1-i] + " "  +
                 " recall " + patterFromInstrumentRecorded  + " " + recordPositionsFromInstrument[networkSize-1-i][patterFromInstrumentRecorded] +
                 " lfo2 " + shapeLfoMode , -1000, + 1200 -75*(networkSize-1-i));
        } 
        rotate(PI / 2);
    } 
        
      // DISCRIMINATE BIS INSTRUMENT TOUCHED with POSITIVE SPEED
    //if (timeDisablingChangesParameterWithPositiveSpeed+30<=millis())
    if ( timeToWaitToEnableNextMovement+500<=millis())
    {
          print ( "                                                               DISCR  oldd ");
     showArray( oldOldVelocityBis);
     print ( "oldV ");
     showArray( oldVelocityBis);
     print ( "vBis ");
     showArray( velocityBis);
     println ();
     }

    
    for(int i = 0; i <  networkSize-0; i++)
    {
    if(velocityBis[i] < bigValue)
    {
      bigValue = velocityBis[i];
      bigIndex = i;
    }
    }  
      print("The slowest count was found at index " + bigIndex);
      println(" and had the value " + velocityBis[bigIndex]);

    
    for(int i = 0; i <  networkSize-0; i++)
    {
    if(velocityBis[i] > bigValue)
    {
      bigValue = velocityBis[i];
      bigIndex = i;
    }
    }
     print("The biggest delta was found at index " + bigIndex);
     println(" and had the value " + velocityBis[bigIndex]);
    
    /*
     for(int i = 0; i <  networkSize-1; i++)
     {
     if(oldOldVelocityBis[i] > bigDelta)// && oldOldVelocityBis[i] > bigValue)
    
     {
      bigDelta = oldOldVelocityBis[i];
      bigDeltaI = i;

     }
     }
   
     print("The biggest Odelt was found at index " + bigDeltaI);
     println(" and had the value " + oldOldVelocityBis[bigDeltaI]);
       */
    
    for(int i = 0; i <  networkSize-1; i++)
    {
    if(oldOldVelocityBis[i] > bigValue)
    {
      bigValue = oldOldVelocityBis[i];
      bigDeltaI = i;
    }
    }
     print("The biggest Odlta was found at index " + bigDeltaI);
     println(" and had the value " + oldOldVelocityBis[bigDeltaI]);

     if (bigIndex==bigDeltaI)
     {  
     sameInstrument = true;
     deltaAmplitude = velocityBis[bigIndex]- oldOldVelocityBis[bigIndex];
         print("The delTest Odelt was found at index " + bigIndex);
     //println(" and had the value " + oldOldVelocityBis[bigDeltaI]);
     println(" and had the value " +  deltaAmplitude + " " + sameInstrument);

      }
     if (bigIndex!=bigDeltaI)
     { 
     sameInstrument = false;
      }


      /*
      for(int i = 0; i <  velocityBis.length; i++)
     {
     if(oldOldVelocityBis[i] >= velocityBis[bigIndex]) // && oldOldVelocityBis[i] > bigDelta)
    
     {
      //bigValue = velocityBis[i];
      //bigIndex = i;
      bigDelta = oldOldVelocityBis[i]-velocityBis[bigIndex];
      bigDeltaI = i;

     }
     }
     */
    
    if (deltaAmplitude<-50 && sameInstrument && velocityBis[bigIndex]<100 && velocityBis[bigIndex]>50 && timeToWaitToEnableNextMovement+1000<=millis()) // FIRST DISCRIMIN
    {
            //timeEnablingChangesParameter[instrumentTouched] = millis();
           //timeDisablingChangesParameter[instrumentTouched] = millis(); 
            timeEnablingDiscrimination = millis();
            
            formerPatternFromInstrument = patternFromInstrument;
            instrumentTouched = bigIndex;
            // timeDisablingChangesParameter[instrumentTouched] = millis();
            patternFromInstrument = networkSize - 1 - instrumentTouched;  //

           
       
            discriminON = timeDisablingChangesParameterWithPositiveSpeed - timeEnablingDiscrimination; // normal - disci
            
            //timeDisablingChangesParameterWithPositiveSpeed = millis();
            println ("                                                          DISCRIM ON  " + (discriminON) + " " + patternFromInstrument + " " +  formerPatternFromInstrument + " "  + " " + numberOfTrig[patternFromInstrument]);   

            print ( " enable Discrimination instru with i " ); print( instrumentTouched) ; print ( " formerPatternFromInstrument " ); print (  formerPatternFromInstrument); print ( "patternFromInstrument "); print ( patternFromInstrument);
            print ( " newPatternFromInstrument "); println ( newPatternFromInstrument);
    }
    
    //********
   //  FORMER PROGRAM BIS

   /*
    if (enablingChangeToSpecificInstrument[patternFromInstrument] ==  true) // && enablingParametersChangesToLive == true 
    { 
        enablingChangeSound[patternFromInstrument] = true;  
    } 
    
    
    //ALIGN AND RECALL
    if (enablingChangeSound[patternFromInstrument] == true && instrumentChangedToAddPulse == true
         && timeToWaitToEnableNextMovement+5000 <= millis()
         ) 
    {  
        key = 'à';
        phaseDirectToMotor();
         timeToWaitToEnableNextMovement = millis();
        for (int i = 0; i < networkSize; i++)
            {         
            for (int j = patternFromInstrument; j < patternFromInstrument + 1; j++) 
                { 
                //   recordPositionsFromInstrument[i][j] = positionFromMotorPhase[i]; 
                //  recordPositionsFromInstrument[i][j] = 0;             
                //  recordPositionsFromInstrument[i][j] = (int) realign[i];                 
                positionFromMotorPhase[i] =  recordPositionAligned[i][patternFromInstrument];
            
                text(" recPaTAbletonLive " + patternFromInstrument + " " + recordPositionsFromInstrument[i][j] + " enaSound " + (networkSize - 1 - instrumentTouched) + " " + enablingChangeSoundB[networkSize - 1 - instrumentTouched], 700 * 0, j * 30);           
             //   println(" recPaTAbletonLive " + patternFromInstrument + " " + recordPositionsFromInstrument[i][j]); 
            }
        }      
        recallLastPatternInstrument = patternFromInstrument;
        enablingRecallFromAndToInstru = true;
        phaseDirectFromSeq();
       
        enablingRecallFromAndToInstru = false;      
  
        enablingChangeSound[patternFromInstrument] = false;
        timeToWaitToEnableNextMovement = millis()+1000;    
    }
  
 
   
    // ADD PULSE WITH POSITIVE DISCIMINATION  //&& timeToWaitToEnableNextMovement+500 <= millis()   && timeDisablingChangesParameterWithPositiveSpeed+500 <= millis()
  
  
    if (enablingParametersChangesToLive == true && instrumentChangedToAddPulse == false //&& timeDisablingChangesParameterWithPositiveSpeed+500<=millis()
        && timeToWaitToEnableNextMovementFromNegative+2000 <= millis()
       
       )  
    {       
       //**  numberOfTrig[patternFromInstrument] += 1;
       //**  numberOfTrig[patternFromInstrument] %= 10;
        
        if (numberOfTrig[patternFromInstrument] == 9)
            { 
            numberOfTrig[patternFromInstrument] = 0;  // all go from 8 to 16
        }
        //  0--> Kick Bottom
            numberOfTrig[0] = (int) map (numberOfTrig[0], 0, 8, 0, 8);  // all go from 8 to 16
        //   5--> HitHat

        background(50);
        key = 'e';
        phaseDirectFromSeq();
      
        textSize(150);    
        text("               changeS " + patternFromInstrument+ " " + numberOfTrig[patternFromInstrument] + " ", 0, 1 * patternFromInstrument * 50); 
        println("            changeInstrument " + patternFromInstrument + " " + numberOfTrig[patternFromInstrument] ); 
        println("            changeInstrument " + patternFromInstrument + " " + numberOfTrig[patternFromInstrument] ); 

        lastPatternFromInstrument=patternFromInstrument;

        enablingParametersChangesToLive = false;
        enablingRecordFromAndToInstru = true;
        
        enablingChangeSound[patternFromInstrument] = false; 
        enablingChangeSoundB[patternFromInstrument] = true;
        timeDisablingChangesParameterWithNegativeSpeedBis[instrumentTouched] = millis();       // start disabloing Ro

        //timeDisablingChangesParameterWithPositiveSpeed = millis();

        timeToWaitToEnableNextMovement = millis();       // start disabloing Ro
    }
    */
    
    // ADD PULSE WITH NEGATIVE DISCIMINATION
    
    if (enablingParametersChangesToLiveWithNegativeSpeed == true && instrumentChangedToAddPulseWithNegativeSpeed == false
        && 
        timeDisablingChangesParameterWithNegativeSpeedBis[patternFromInstrument]+500 <= millis() // from Tr
        &&
        timeToWaitToEnableNextMovementFromNegative+500<=millis() // from Ro itself
        )       // wait 5000 to enabling Ro+=1
     {
        timeToWaitToEnableNextMovementFromNegative=millis();
        textSize(150);           
       //** */ numberOfRota[patternFromInstrumentWithNegativeSpeed] += 1;
       //** */ numberOfRota[networkSize - 1 - instrumentTouched] %= 10;
        
        if (numberOfRota[patternFromInstrumentWithNegativeSpeed] == 9)
        { 
            numberOfRota[patternFromInstrumentWithNegativeSpeed] = 0;
        }
        
        if (numberOfRota[patternFromInstrumentWithNegativeSpeed] % 2 == 0)
        { 
            instrumentToMute[patternFromInstrumentWithNegativeSpeed] = false;
        }
        
        if (numberOfRota[patternFromInstrumentWithNegativeSpeed] % 2 == 1)
        { 
            instrumentToMute[patternFromInstrumentWithNegativeSpeed] = true;
        }
       
        enablingParametersChangesToLiveWithNegativeSpeed = false;
           
     }
      
        //USELESS ? 
    
    /*
     if (enablingRecordFromAndToInstru == true)  // SAVING new position to recordPositionsFromInstrument[k][patternFromInstrument]
     {  
       
        enablingRecordFromAndToInstru = false;
        enablingChangeSoundB[patternFromInstrument] = false;
      //  timeEnablingChangesParameter[patternFromInstrument] = millis();
     }

      if (enablingRecordFromAndToInstru == false )
       { 
         }
    
    */
    
   
} 