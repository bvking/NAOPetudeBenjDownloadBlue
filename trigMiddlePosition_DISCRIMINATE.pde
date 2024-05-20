
void  trigMiddlePositionFromEncodeur()
{
      for (int i = 0; i < networkSize; i++)
    { 

       //  oldEncodeurPosition[i]= encodeurPosition[i];
         encodeurPosition[i] = (int) map(encodeur[i], 0, 4000, 0, 4000);    

          //  println ( encodeurPosition[i] + " " +  oldEncodeurPosition[i]); 

       if (((oldEncodeurPosition[i] > 3600 &&  oldEncodeurPosition[i] <= 4000 && encodeurPosition[i] >20 && encodeurPosition[i] < 4000)
            ||
             // ( oldEncodeurPosition[i] >= 1800 && encodeurPosition[i] <=2000)
            (1<=-1)
           )
           &&
           timeDisablingChangesParameterWithNegativeSpeedBis[instrumentTouched]+1000<=millis()

          )
        
       {
          timeDisablingChangesParameterWithNegativeSpeedBis[instrumentTouched] = millis();
     /*
          patternFromInstrumentWithCenter = networkSize-1-i;
          numberOfCenter[patternFromInstrumentWithCenter] += 1;
          numberOfCenter[patternFromInstrumentWithCenter] %= 9;   
          numberOfCenter[patternFromInstrumentWithCenter] *= 16;
          */

           // numberOfCenter[patternFromInstrumentWithCenter] =(int) map (numberOfCenter[patternFromInstrumentWithCenter] , 0, 8, 0, 127);

       //   println ( " numberOfCenter " + numberOfCenter[networkSize-1-i]); 
          rotate(HALF_PI);
        }
         oldEncodeurPosition[i] = encodeurPosition[i];      
     }
 }

  void  DISCRIMINATE_INSTRUMENT_TOUCHED_BOTH_SPEED()
   {
            for (int i = 0; i < networkSize; i++)
    { 

         if(startingPos[i] <= dataMappedFromMotor[i] )
        {   
          if(startingPos[i] -100 <= encodeurBrut[networkSize-1-i] && encodeurBrut[networkSize-1-i] <= dataMappedFromMotor[i]) { 
            manualyMoved = false;
          }  else if( dataMappedFromMotor[i] <= encodeurBrut[networkSize-1-i])
          {  

            patternFromInstrument=i; 
            if(!manualyMoved)
            { 

             //   numberOfTrig[patternFromInstrument] += 1;
             //   numberOfTrig[patternFromInstrument] %= 9;   
             //   manualyMoved = true; 


              //  lastPatternFromInstrument=patternFromInstrument;
        
             
             } 
          }
            else if( encodeurBrut[networkSize-1-i] <= startingPos[i] - 50 ) // && encodeurPosition[i] > 3500 
           { 
             manualyMoved = false; 
            } 
            if(!manualyMoved &&  timeToWaitToEnableNextMovement+1000<=millis()) 
            { 
              /*
              patternFromInstrument=i; 
              numberOfRota[patternFromInstrument] += 1;
              numberOfRota[patternFromInstrument] %= 10; 
           
              */

                  //  patternFromInstrumentWithCenter = networkSize-1-i;
                  //  numberOfCenter[patternFromInstrumentWithCenter] += 1;
                  //  numberOfCenter[patternFromInstrumentWithCenter] %= 9;  
                    manualyMoved = true;  
                    //   numberOfCenter[patternFromInstrumentWithCenter] *= 16;
                  //  timeToWaitToEnableNextMovement = millis();       // start disabloing Ro 

          
          }
        } 
     } 
  }


     //--------------------------:-------------------------------------------------------------------
    // DISCRIMINATE INSTRUMENT TOUCHED with NEGATIVE SPEED

 void  DISCRIMINATE_INSTRUMENT_TOUCHED_with_NEGATIVE_SPEED()
  {
    thresholdToDiscriminateNegativeSpeed = 0;

    for (int i = 0; i < networkSize; i++)
    {   
        if (velocityBis[i] >  10 && velocityBis[i] <  50)  // to ENABLEchange phasePattern 250
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
        
        if (timeEnablingChangesParameterWithNegativeSpeed[patternFromInstrumentWithNegativeSpeed] + 40 <= millis() && timeEnablingChangesParameterWithNegativeSpeed[patternFromInstrumentWithNegativeSpeed]> 35)
        {
           enablingChangeToSpecificInstrumentWithNegativeSpeed[patternFromInstrumentWithNegativeSpeed] = false;
           enablingParametersChangesToLiveWithNegativeSpeed = false;
        }
        
        if (timeEnablingChangesParameterWithNegativeSpeed[patternFromInstrumentWithNegativeSpeed] > timeDisablingChangesParameter[patternFromInstrumentWithNegativeSpeed])
        {
         //  enablingChangeToSpecificInstrumentWithNegativeSpeed[patternFromInstrumentWithNegativeSpeed] = false;
         //  enablingParametersChangesToLiveWithNegativeSpeed = false;
        }

    println ( " enablingChangeToSpecificInstrumentWithNegativeSpeed " + (networkSize-1-i) + " " + enablingChangeToSpecificInstrumentWithNegativeSpeed[ networkSize-1-i]) ;   
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
  
 }



   // DISCRIMINATE BIS INSTRUMENT TOUCHED with POSITIVE SPEED

    void  DISCRIMINATE_INSTRUMENT_TOUCHED_with_POSITIVE_SPEED()
     {

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
         // trig up when descend from 109 to 1
         // trig up when descend from 150 to 50
    
      // if ( (velocityBis [instrumentTouched]< 150 && velocityBis [instrumentTouched]>70)
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
 }
  
    

