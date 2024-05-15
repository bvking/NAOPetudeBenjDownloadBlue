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
        encodeur[i] %=  4000;
        
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

        if(startingPos[i] <= dataMappedFromMotor[i]){   
          if(startingPos[i] -100 <= encodeurBrut[networkSize-1-i] && encodeurBrut[networkSize-1-i] <= dataMappedFromMotor[i] + 100 ) { 
            manualyMoved = false;
          }  else if( dataMappedFromMotor[i] <= encodeurBrut[networkSize-1-i] )
          {  
            patternFromInstrument=i; 
            if(!manualyMoved) { 
                numberOfTrig[patternFromInstrument] += 1;
                numberOfTrig[patternFromInstrument] %= 10;   
                manualyMoved = true;  
             } 
          }  else if( encodeurBrut[networkSize-1-i] <= startingPos[i]  )
           {  
             patternFromInstrument=i; 

           numberOfRota[patternFromInstrument] += 1;
           numberOfRota[patternFromInstrument] %= 10;  
        } 
        } 


        
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
        text    (" encoBr " +  encodeurBrut[networkSize-1-i] + " " + dataMappedForMotorisedBigMachine[i]  + " GAP " + velocityBis[networkSize-1-i] + " OLD " + oldVelocityBis[networkSize-1-i] + " olDD " + oldOldVelocityBis[networkSize-1-i] + " " + (networkSize-1-i) + " Ro " + numberOfRota[networkSize-1-i] + " M " + instrumentToMute[networkSize-1-i] + 
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
    /*
    if (deltaAmplitude<-50 && sameInstrument && velocityBis[bigIndex]<100 && velocityBis[bigIndex]>50 && timeEnablingDiscrimination+1000<=millis()) // SECOND DISCRIMIN

    { 
            //formerPatternFromInstrument = patternFromInstrument;
            lastInstrumentTouched = instrumentTouched;
            newInstrumentTouched = i;

            background(30);
           
            newPatternFromInstrument = networkSize - 1 - newInstrumentTouched;  //

            print ( " enable Discrimination instru with N " ); print(newInstrumentTouched) ; print ( " formerPatternFromInstrument " ); print (  formerPatternFromInstrument); print ( "patternFromInstrument "); print ( patternFromInstrument);
            print ( " newPatternFromInstrument "); println ( newPatternFromInstrument);
            timeDisablingChangesPatternFromInstrument=millis();
           // noLoop();

        if (newInstrumentTouched != instrumentTouched)
         {
         instrumentTouched = lastInstrumentTouched;
         }
    }
    */

      
    /*
     for (int i = 0; i < networkSize; i++)
     { 
      if (velocityBis[i] >  75 && velocityBis[i] <  150 && timeToWaitToEnableNextMovement+1000<=millis()) // && velocityBis[i]> oldVelocityBis [i] && oldVelocityBis [i]> oldOldVelocityBis [i]  )  // to ENABLEchange phasePattern
       
          if (newPatternFromInstrument != patternFromInstrument  && timeDisablingChangesPatternFromInstrument+100<=millis()  && timeDisablingChangesPatternFromInstrument>20)
        {
              patternFromInstrument = lastPatternFromInstrument;
              formerPatternFromInstrument = lastPatternFromInstrument;
              instrumentTouched = networkSize - 1 - lastPatternFromInstrument;
      
            print ( " disabl Discrimination instru with i " ); print( instrumentTouched) ; print ( " formerPatternFromInstrument " ); print (  formerPatternFromInstrument); print ( "patternFromInstrument "); print ( patternFromInstrument);
            print ( " newPatternFromInstrument "); println ( newPatternFromInstrument);
                   //  noLoop();
         }
        }
      
     */
   
   
   
       
    
    
     /*
      for (int i = 0; i < networkSize; i++)
     { 

      if  ((velocityBis[i] >  75 && velocityBis[i] <  150 )  && timeToWaitToEnableNextMovement+1500<=millis() && timeDisablingChangesParameterWithPositiveSpeed+500<=millis()) 
       { 
            timeDisablingChangesParameterWithPositiveSpeed = millis();       
            instrumentTouched = i;
            // timeDisablingChangesParameter[instrumentTouched] = millis();
            patternFromInstrument = networkSize - 1 - instrumentTouched;  //
             formerPatternFromInstrument = patternFromInstrument;  // directly to enable trig ++         
        }
     }
     */
    
    
     /*
      if (formerPatternFromInstrument != newPatternFromInstrument)
        {
           patternFromInstrument= formerPatternFromInstrument;
         }
    */
         // trig up when descend from 150 to 50
    
      if ( (velocityBis [instrumentTouched]< 150 && velocityBis [instrumentTouched]>50)
         &&
         (oldVelocityBis [instrumentTouched]> 100 && oldVelocityBis [instrumentTouched]< 300) &&  (oldVelocityBis[instrumentTouched] >= velocityBis [instrumentTouched ])
         &&
         (oldOldVelocityBis [instrumentTouched ]<= oldVelocityBis [instrumentTouched ]) // Aescending
           // &&  oldVelocityBis[instrumentTouched]<150
            ) 
       {      
          timeEnablingChangesParameter[instrumentTouched] = millis();
          chronoON = timeDisablingChangesParameterWithNegativeSpeedBis[instrumentTouched] - timeEnablingChangesParameter[instrumentTouched];
        }
                println ("                                                        CHRONO ON First " + (chronoON) + " " + patternFromInstrument + " " +  formerPatternFromInstrument + " " + " " + numberOfTrig[patternFromInstrument]);   

          if (  (velocityBis [instrumentTouched]> 15 && velocityBis [instrumentTouched]<35 )
          &&  (oldVelocityBis [instrumentTouched]> 15 && oldVelocityBis [instrumentTouched]<35 )
          &&  (oldOldVelocityBis [instrumentTouched]> 15 && oldOldVelocityBis [instrumentTouched]<35 )
          )  //normal use
           
           
        {
                timeDisablingChangesParameterWithPositiveSpeed = millis();
                println ("                                                        NORMAL USE " ) ;
         }
    
      if (  (velocityBis [instrumentTouched]< 150 && velocityBis [instrumentTouched]>10) 
         //&& (oldVelocityBis [instrumentTouched]> 50 && oldVelocityBis [instrumentTouched]< 200)
          &&  (oldVelocityBis[instrumentTouched] >= velocityBis [instrumentTouched ]) 
          && (oldOldVelocityBis [instrumentTouched ]>= oldVelocityBis [instrumentTouched ]) // Desccending
          && timeToWaitToEnableNextMovement+1000<=millis()) //
        {
            timeDisablingChangesParameterWithNegativeSpeedBis[instrumentTouched] = millis();
            timeDisablingChangesParameter[instrumentTouched] = millis();

           //** timeEnablingChangesParameter[instrumentTouched] = millis();
            chronoOFFThird = timeDisablingChangesParameterWithPositiveSpeed - timeEnablingChangesParameter[instrumentTouched]; // not usd
            chronoOFF = timeDisablingChangesParameter[instrumentTouched] - timeEnablingChangesParameter[instrumentTouched];
           }
                println ("                                                        CHRONO  OFF Seco " + (chronoOFF) + " " + patternFromInstrument + " " +  formerPatternFromInstrument + " " + " " + numberOfTrig[patternFromInstrument]);   
                println ("                                                        CHRONO  OFF thir " + (chronoOFFThird) + " " + patternFromInstrument + " " +  formerPatternFromInstrument + " " + " " + numberOfTrig[patternFromInstrument]);   

        if ( 
            chronoOFF>=25 && chronoOFF<=500
            &&  oldOldVelocityBis [instrumentTouched ] > 50 &&  oldOldVelocityBis [instrumentTouched ] <150
            &&  (oldOldVelocityBis [instrumentTouched ]>= oldVelocityBis [instrumentTouched ]) // Desccending
            &&  velocityBis [instrumentTouched ] >= 10 &&  velocityBis [instrumentTouched ] <100   // switch between Discimi et normalUSE
            && timeToWaitToEnableNextMovement+1000<=millis() //
         )     //
        {
               timeDisablingChangesParameterWithPositiveSpeed = millis();
               println ("                    TrigMov              " + " " + instrumentTouched + " " + patternFromInstrument + " " +  formerPatternFromInstrument + " " + numberOfTrig[patternFromInstrument] );
                enablingChangeToSpecificInstrument[instrumentTouched] = true;
                enablingParametersChangesToLive = true;
      
          // enablingChangeToSpecificInstrument[patternFromInstrument] = false;
          //enablingParametersChangesToLive = false;
          //enablingChangeToSpecificInstrument[instrumentTouched] = true;
          //enablingParametersChangesToLive = true;
         }

        

     // // TIME to TRIG POSITIVE SPEED DISCRIMINATION to enablingChangeToSpecificInstrument with

     //if (timeDisablingChangesParameterWithPositiveSpeed+ 500<=millis())
     //  {

        if (timeEnablingChangesParameter[instrumentTouched] + 30 <= millis() && timeEnablingChangesParameter[instrumentTouched] +100 < millis() )  //&& timeToWaitToEnableNextMovement+ 50 <= millis() ) 
    
        { 
               println ("                    TRIG WHAT            " + " " + instrumentTouched + " " + patternFromInstrument + " " +  formerPatternFromInstrument+ " " + numberOfTrig[patternFromInstrument] );
          //  println ("                     TRIG ON " + patternFromInstrument + " " +  formerPatternFromInstrument);
          //  println ("                     TRIG ON " + patternFromInstrument + " " +  formerPatternFromInstrument);
           // enablingChangeToSpecificInstrument[patternFromInstrument] = true;
           // enablingParametersChangesToLive = true;
           enablingChangeToSpecificInstrument[patternFromInstrument] = false;
           enablingParametersChangesToLive = false;
        }
    
          if (timeEnablingChangesParameter[instrumentTouched]+ 69<= millis() && timeEnablingChangesParameter[instrumentTouched]+35> millis() ) // timeEnablingChangesParameter[patternFromInstrument] +70 <= millis() && 
        {
          
               println ( "                    OFF 1                " + " " + instrumentTouched + " " + patternFromInstrument + " " +  formerPatternFromInstrument+ " " + numberOfTrig[patternFromInstrument] );
            enablingChangeToSpecificInstrument[patternFromInstrument] = false;
            enablingParametersChangesToLive = false;
         }
       
        if ( timeDisablingChangesParameter[instrumentTouched]+ 25> millis() 
            &&  timeOfLastChangedInstument+1000 <=millis()
            //&&  timeDisablingChangesParameterWithPositiveSpeed+500 <= millis()
            && chronoON >=500  // USEFULL  ??     wait at least 500 ms
            && timeToWaitToEnableNextMovementFromNegative +1000<= millis()  // wait at least 1000 from discri --
            
             ) // timeEnablingChangesParameter[patternFromInstrument] +70 <= millis() && 
        {
         
               println ( "                     TRIG MOUV            " + " " + instrumentTouched + " " + patternFromInstrument + " " +  formerPatternFromInstrument + " " + numberOfTrig[patternFromInstrument] );
            //  enablingChangeToSpecificInstrument[instrumentTouched] = true;
            //  enablingParametersChangesToLive = true;
         }

    
         if (timeEnablingChangesParameter[instrumentTouched] > timeDisablingChangesParameter[instrumentTouched]+33
               // && timeToWaitToEnableNextMovement+500 <= millis()
               //  && timeDisablingChangesParameterWithPositiveSpeed+500 <= millis()
         )     //
        {

                println ( "                    OFF    3             " + " " + instrumentTouched + " " + patternFromInstrument + " " +  formerPatternFromInstrument + " " + numberOfTrig[patternFromInstrument] );
          // enablingChangeToSpecificInstrument[patternFromInstrument] = false;
          //enablingParametersChangesToLive = false;
         // enablingChangeToSpecificInstrument[patternFromInstrument] = true;
         // enablingParametersChangesToLive = true;
         }
        
    //}
      //-------------------------------------------------------------------------------------------
  
    if (formerPatternFromInstrument != patternFromInstrument)
     {
        instrumentChangedToAddPulse = true;
        timeOfLastChangedInstument = millis();
         
        // instrumentToMute[patternFromInstrument] = false;      
     }

    if (timeDisablingChangesParameterWithPositiveSpeed+500<=millis())
     {
       // instrumentChangedToAddPulse = false;
        // instrumentToMute[patternFromInstrument] = false;      
    } 
    if (formerPatternFromInstrument == patternFromInstrument)
    {
        instrumentChangedToAddPulse = false;                 
            // enablingChangeSound[patternFromInstrument] = true;
    }
    
    //--------------------------:-------------------------------------------------------------------
    // DISCRIMINATE INSTRUMENT TOUCHED with NEGATIVE SPEED
    thresholdToDiscriminateNegativeSpeed = 0;

    for (int i = 0; i < networkSize; i++)
    {   
        if (velocityBis[i] <  -50 && velocityBis[i] >  -400)  // to ENABLEchange phasePattern 250
        {
            formerPatternFromInstrumentWithNegativeSpeed = patternFromInstrumentWithNegativeSpeed;
            instrumentTouchedWithNegativeSpeed = i;
            patternFromInstrumentWithNegativeSpeed = networkSize - 1 - instrumentTouchedWithNegativeSpeed;  //
            
            timeEnablingChangesParameterWithNegativeSpeed[patternFromInstrumentWithNegativeSpeed] = millis();          
        }
        
        if (velocityBis[i] < -15 && oldVelocityBis[i] >-15)  // to DISABLEchange phasePattern
        {
            formerPatternFromInstrumentWithNegativeSpeed = patternFromInstrumentWithNegativeSpeed;
            instrumentTouchedWithNegativeSpeed = i;
            patternFromInstrumentWithNegativeSpeed = networkSize - 1 - instrumentTouchedWithNegativeSpeed;  //
            
            timeDisablingChangesParameterWithNegativeSpeed[patternFromInstrumentWithNegativeSpeed] = millis();          
        }  
        
    
    
        // // TIME to TRIG NEGATIVE SPEED DISCRIMINATION to enablingChangeToSpecificInstrument with
        if (timeEnablingChangesParameterWithNegativeSpeed[patternFromInstrumentWithNegativeSpeed] + 34 <= millis())
        {     
            enablingChangeToSpecificInstrumentWithNegativeSpeed[patternFromInstrumentWithNegativeSpeed] = true;
            enablingParametersChangesToLiveWithNegativeSpeed = true;

        }
        
        if (timeEnablingChangesParameterWithNegativeSpeed[patternFromInstrument] + 40 <= millis() && timeEnablingChangesParameterWithNegativeSpeed[patternFromInstrumentWithNegativeSpeed]> 35)
        {
           enablingChangeToSpecificInstrumentWithNegativeSpeed[patternFromInstrumentWithNegativeSpeed] = false;
           enablingParametersChangesToLiveWithNegativeSpeed = false;
        }
        
        if (timeEnablingChangesParameterWithNegativeSpeed[patternFromInstrumentWithNegativeSpeed] > timeDisablingChangesParameter[patternFromInstrumentWithNegativeSpeed])
        {
         //  enablingChangeToSpecificInstrumentWithNegativeSpeed[patternFromInstrumentWithNegativeSpeed] = false;
         //  enablingParametersChangesToLiveWithNegativeSpeed = false;
        }
    }
    
    if (formerPatternFromInstrumentWithNegativeSpeed != patternFromInstrumentWithNegativeSpeed)
    {
            instrumentChangedToAddPulseWithNegativeSpeed = true;

        // instrumentToMute[patternFromInstrument] = false;      
    } 
    if (formerPatternFromInstrument == patternFromInstrument)
    {
            instrumentChangedToAddPulseWithNegativeSpeed = false;                 
            // enablingChangeSound[patternFromInstrument] = true;
    }
 
    //********
    
   // print(" " + patternFromInstrument +  " slider ");
   // showArrayF(slider);
   // print(" velocityBis ");
   // showArrayF(velocityBis); 
    
    //********
    
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
   
    // ADD PULSE WITH POSITIVE DISCIMINATION
    if (enablingParametersChangesToLive == true && instrumentChangedToAddPulse == false //&& timeDisablingChangesParameterWithPositiveSpeed+500<=millis()
        && timeToWaitToEnableNextMovementFromNegative+2000 <= millis()
       //&& timeToWaitToEnableNextMovement+500 <= millis()
       //  && timeDisablingChangesParameterWithPositiveSpeed+500 <= millis()
       )  
    {       
       //** */ numberOfTrig[patternFromInstrument] += 1;
       //** */ numberOfTrig[patternFromInstrument] %= 10;
        
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
    
     if (enablingRecordFromAndToInstru == true)  // SAVING new position to recordPositionsFromInstrument[k][patternFromInstrument]
     {  
       
        enablingRecordFromAndToInstru = false;
        enablingChangeSoundB[patternFromInstrument] = false;
      //  timeEnablingChangesParameter[patternFromInstrument] = millis();
     }

      if (enablingRecordFromAndToInstru == false )
       { 
         }
    
    
   
} 