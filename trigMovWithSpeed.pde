int[] fromEncodeurToLive = new int[networkSize];
boolean[] trigEffectTo = new boolean[networkSize];
boolean[] trigEffectBisTo = new boolean[networkSize];
int[] timeTriggedFromEncodeur = new int[networkSize];
int[] startMeasureFromEncodeur = new int[networkSize];
int[] recEncodeurPosition = new int[networkSize];
int[] dataMappedFromMotor = new int[networkSize];
boolean[] oldEncoderTouched = new boolean[networkSize];
int[]touchedTimeStarter = new int[networkSize];
boolean[] encoderTurnClockWise = new boolean[networkSize];
boolean[] enablingChangeSound = new boolean[networkSize];
boolean[]  enablingChangeSoundB = new boolean[networkSize];
int mapRatio = 400;
int[] encodeurMappedAsMotor = new int[networkSize];
int[] gapEncoder_Motor = new int[networkSize];
int[] gapEncoder_OldEncodeur = new int[networkSize];
int[] ratioNumberOfStepCorraletedFromInstrument = new int[networkSize];// in phaseDirectFromSeq
int[] dataMapped = new int[networkSize];
int[] timeDisablingChangesParameter = new int[networkSize];
int instrumentTouched; 
boolean enablingRecordFromAndToInstru,enablingRecallFromAndToInstru;

String modeOfControlDr = " virtual ";

int formerPatternFromInstrument;
int formerPatternFromInstrumentWithNegativeSpeed;

int  instrumentTouchedWithNegativeSpeed;
int  timeToWaitToEnableNextMovement;
int timeToWaitToEnableNextMovementFromNegative;
int timeDisablingChangesParameterWithPositiveSpeed;

int[] timeDisablingChangesParameterWithNegativeSpeed = new int[networkSize];
int [] timeDisablingChangesParameterWithNegativeSpeedBis = new int[networkSize];
int[] timeEnablingChangesParameterWithNegativeSpeed = new int[networkSize];

boolean instrumentChangedToAddPulseWithNegativeSpeed;
boolean enablingParametersChangesToLiveWithNegativeSpeed, enablingParametersChangesToLiveWithCenter;
boolean[]  enablingChangeToSpecificInstrumentWithNegativeSpeed = new boolean[networkSize];
int thresholdToDiscriminateNegativeSpeed;

int[]  oldOldVelocityBis = new int[networkSize];
boolean[]  enablingChangeToSpecificInstrument = new boolean[networkSize];

boolean sameInstrument;// = false;
int deltaAmplitude ;
int chronoOFFThird ; 
int timeEnablingDiscrimination;
int discriminON;
boolean  enablingParametersChangesToLiveUp;

boolean manualyMoved = false;

void sendPositionToLiveFromTouchedEncodeurNetworkSizeOnly()
{  
    textSize(75);
     // DISCRIMINATE_INSTRUMENT_TOUCHED_with_NEGATIVE_SPEED();
    
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
        text     ( "center " +  numberOfCenter[networkSize-1-i] + " encoBr " +  encodeurBrut[networkSize-1-i] + " motor " + dataMappedForMotorisedBigMachine[i]  + " GAP " + velocityBis[networkSize-1-i] + " OLD " + oldVelocityBis[networkSize-1-i] + " olDD " + oldOldVelocityBis[networkSize-1-i] + " " + (networkSize-1-i) + " Ro " + numberOfRota[networkSize-1-i] + " M " + instrumentToMute[networkSize-1-i] + 
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
     // print("The slowest count was found at index " + bigIndex);
     // println(" and had the value " + velocityBis[bigIndex]);

    
    for(int i = 0; i <  networkSize-0; i++)
    {
    if(velocityBis[i] > bigValue)
    {
      bigValue = velocityBis[i];
      bigIndex = i;
    }
    }
    // print("The biggest delta was found at index " + bigIndex);
    // println(" and had the value " + velocityBis[bigIndex]);
    
    //********
   //  FORMER PROGRAM BIS

   /*
    if (enablingChangeToSpecificInstrument[patternFromInstrument] ==  true) // && enablingParametersChangesToLive == true 
    { 
        enablingChangeSound[patternFromInstrument] = true;  
    } 
    
   */ 
    //ALIGN AND RECALL
   
    if (enablingChangeSound[patternFromInstrument] == true &&  sameInstrument == false
         && timeToWaitToEnableNextMovement+1000 <= millis()
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
        timeToWaitToEnableNextMovement = millis();    
    }
    
    // ADD PULSE WITH POSITIVE DISCIMINATION  //&& timeToWaitToEnableNextMovement+500 <= millis()   && timeDisablingChangesParameterWithPositiveSpeed+500 <= millis()
        for(int i = 0; i <  networkSize-0; i++)
        {
        if (controlUpWay[i] == true)
        { 
          // i = instrumentTouched;
           formerPatternFromInstrument = patternFromInstrument; 
           patternFromInstrument = networkSize-1-i;
           enablingParametersChangesToLiveUp = true;
        }
        }

        if (formerPatternFromInstrument == patternFromInstrument)
         {
          sameInstrument = true;
          enablingChangeSound[patternFromInstrument] = true;
         }
         else 
        {
          sameInstrument = false;
        }
       
        if (enablingParametersChangesToLiveUp == true && sameInstrument == true)
        {
         
         numberOfTrig[patternFromInstrument] += 1;
         numberOfTrig[patternFromInstrument] %= 10;
                 
         if (numberOfTrig[patternFromInstrument] == 9)
          { 
             numberOfTrig[patternFromInstrument] = 0;  // all go from 8 to 16
          }
            //  0--> Kick Bottom
            numberOfTrig[0] = (int) map (numberOfTrig[0], 0, 8, 0, 8);  // all go from 8 to 16
            //  5--> HitHat

         background(50);
         key = 'e';
         phaseDirectFromSeq();

        if (numberOfTrig[patternFromInstrument] ==0)

         {
           key = 'ç';
         phaseDirectFromSeq();
          }

         enablingParametersChangesToLiveUp= false;
            
         textSize(150);    
         text("               changeS " + patternFromInstrument+ " " + numberOfTrig[patternFromInstrument] + " ", 0, 1 * patternFromInstrument * 50); 
         println("            changeInstrument " + patternFromInstrument + " " + numberOfTrig[patternFromInstrument] ); 
         println("            changeInstrument " + patternFromInstrument + " " + numberOfTrig[patternFromInstrument] ); 
         /*
        lastPatternFromInstrument=patternFromInstrument;

         enablingRecordFromAndToInstru = true;
         enablingChangeSound[patternFromInstrument] = false; 
         enablingChangeSoundB[patternFromInstrument] = true;
         timeDisablingChangesParameterWithNegativeSpeedBis[instrumentTouched] = millis();       // start disabloing Ro
         
         timeDisablingChangesParameterWithPositiveSpeed = millis();

         timeToWaitToEnableNextMovement = millis();       // start disabloing Ro
         */
  
         for(int i = 0; i <  networkSize-0; i++)
         {
            controlUpWay[i] = false;      
          }
       }
  
   
       // ADD PULSE WITH NEGATIVE DISCIMINATION_____________________________________________________________________________________
      
    
        for(int i = 0; i <  networkSize-0; i++)
        {
        if (controlDownWay[i] == true   &&
           millis()>=timeDisablingChangesParameterWithNegativeSpeedBis[instrumentTouched]+500)
        { 
           //i = instrumentTouched;
           patternFromInstrumentWithNegativeSpeed = networkSize-1-i;
           enablingParametersChangesToLiveWithNegativeSpeed = true;
          // timeToWaitToEnableNextMovementFromNegative=millis();
        }
        }

        if (enablingParametersChangesToLiveWithNegativeSpeed == true)
        {
          enablingParametersChangesToLiveWithNegativeSpeed= false;
              
          numberOfRota[patternFromInstrumentWithNegativeSpeed] += 1;
          numberOfRota[networkSize - 1 - instrumentTouched] %= 10;
        
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
           for(int i = 0; i <  networkSize-0; i++)
         {
            controlDownWay[i]= false;
          }
             
        }

        // ADD PULSE WITH CEHTER_____________________________________________________________________________________
      
        for(int i = 0; i <  networkSize-0; i++)
        {
        if (centerPos[i] == true)
        { 
           patternFromInstrumentWithCenter = networkSize-1-i;
           enablingParametersChangesToLiveWithCenter = true;
        }
        }

        if (enablingParametersChangesToLiveWithCenter == true )
        {
          enablingParametersChangesToLiveWithCenter= false; 

           numberOfCenter[patternFromInstrumentWithCenter] += 1;
           numberOfCenter[patternFromInstrumentWithCenter] %= 9;
             
          for(int i = 0; i <  networkSize-0; i++)
         {
            centerPos[i]= false;
         }
        }  
} 
