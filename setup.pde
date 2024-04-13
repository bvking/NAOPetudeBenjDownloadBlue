// import PNetwork.java.*; 
// MANAGE NETWORK of OSCILLATOR
// import java.util.Arrays;
import sync.*;
PNetwork net;
import java.util.Arrays;

/*
public void settings() {
size(600, 600, P3D);
 windowRatio(300, 300);
} 
*/

//boolean systemForBigMachine=false;
boolean systemForBigMachine=true;
int timeTosendData;



int networkSize = 10; // attention avec big Machine numberOfStep = 3200;
//int networkSize = 6;
int numberOfStep = 3200;
//int numberOfStep = 6400;

float[] slider = new float[networkSize]; // slider from max_msp
int[][] recordPositionsFromInstrument = new int [networkSize][networkSize];
int[][] recordPositionFromMotorPhaseFromLastInstrument = new int [networkSize][networkSize];
int patterFromInstument=0;
int patterFromInstrumentRecorded=0;
int[] positionFromMotorPhaseRecorded = new int[networkSize];



int[] countControlDr = new int [networkSize];   // numberOfrevolution depanding lfo and lfoUP or lfoDown 
int shapeLfoMode = 10;  //lfo UP CounterWay

float shapeLfoToCount=1;  // lfo up

boolean samplingWithMouse = false;
boolean abletonLFO =        true;
boolean samplingWithTeensy3_5 = false;

int numberOfMeasureToRecord;
int measureToStartRecording;
float delayTime;
int factorSynchro=14;
boolean preStartSpeedOfRepetitionUP, preStartSpeedOfRepetitionDOWN ;
//int timeRecording;

String music_from_ableton_live;
String positionMov;  

boolean enablingParametersChangesToLive=false;
int secondTouchedTimeStarter;

int oldSimpleSignal2,simpleSignal2;  // 0 to 1
int directionOfsignal;
    
int nbBalls = networkSize;
int specialMeasureToStartRecording,specialMeasureToStartRecordingBis;
int speedDelta = 2; // ratio of speed and acceleration in Arduino

// set music at the end of the setup

int posAverage = 0;
float speed = 1;
float speedOfrepetition = 1;

int[] changeMotorisedPosition = new int [networkSize];
int[] dataFromArduinoDue= new int [networkSize];

int[] upDateMotorisedPosition (int[] newMotorPositions) { 
  for (int i = 0; i < newMotorPositions.length; i++) { 
    newMotorPositions[i] = newMotorPositions[i] + numberOfStep; 
  } 
  return newMotorPositions;  // Returns an array of 3 ints: 20, 40, 60 
}

boolean bigMachineConnectedToPort2_And_NATIVEpoortConnectedToPort1;
boolean portOfBigMachineConnected; 
String  portsUSBfrom1,portsUSBfrom2,portsUSBfrom3;
boolean signalUpRise;

boolean allMachineConnected, onlyLitteMachineWithSecondSerialPort,portConnectedOfBigMachine,portConnectedToBigMachineOnly;

String[] eventToTrig = {"0","0","0","0"};
String[] keyEvent = {" bla "," bli ","0","0"};
char specialPropagationKey;
int propagationTimeElapsed;
float trigedWithAnySign, oldTrigedWithAnySign;
float[] trigedSignFromAbleton = new float[networkSize];
float[] oldTrigedSignFromAbleton = new float[networkSize];
float [] oldOldPhaseMapped = new float [networkSize];
float [] oldPhaseMapped = new float [networkSize];
int [] specialPhase =new int [networkSize];
int [] OldSpecialPhase =new int [networkSize];
int  [] positionToFollow =new int [networkSize];
int  [] positionFromMotorPhase =new int [networkSize];
int  [] recordPositionFromMPhase =new int [networkSize];
int  [] trigSound =new int [networkSize];
int  [] changeSound =new int [networkSize];

float[] deltaOldPhaseActualPhase = new float[networkSize];

float levelFromArrow, phaseAmount;
boolean modulePhaseAmountWithArrow;

int [] oldEncodeurPosition = new int[networkSize];
int [] encodeurPosition = new int[networkSize];
boolean[] encoderTouched = new boolean[networkSize]; // data from Teensy's serial
boolean[] midPos = new boolean[networkSize]; // data from Teensy's serial
float [] sendMiddle = new float[networkSize]; // only float send with OSC
int [] sendMiddleInt = new int[networkSize]; // only float send with OSC
int[] RevsContinue = new int[networkSize];

int[] positionFromShiftedOscillator  = new int[networkSize];

int[] dataMappedForMotorisedBigMachine = new int[networkSize];

int[] oldDataMappedForMotorisedPosition = new int[networkSize];
int[] positionMotorisedFromContinuesMod = new int[networkSize];
float[] oscillatorFollowing = new float[networkSize];
boolean actualisePositionDataFromCircular;

float squaredRootOccurrence(float dVal, int numberOfoccurrence) { // return the root square of returned value
    // as many number of occurence 
    for (int i = 1; i <= numberOfoccurrence; i++) {
        dVal = sqrt(dVal);
    }
        return dVal;  // 
}

float oldFaz;
float faz = 3;
int oscillatorMaster = 0;
        
float getOldPositionOfActiveOscillator(float phaseOfOscillator0) { // return former value of actual oscillator
            // as many number of oscillator
oscillatorMaster += 1;
oscillatorMaster %=  networkSize;
            //textSize (250);
            
if (oscillatorMaster > 0) { 
                
                for (int i = oscillatorMaster - 1; i <=  oscillatorMaster; i++) { 
                    println(" oscillatorFollowi " + (oscillatorMaster - i) + " " + oscillatorFollowing[oscillatorMaster - i] + " " + oscillatorMaster + " " +  oscillatorFollowing[oscillatorMaster] , -300, 250 * i);
                    
                    
                    oscillatorFollowing[oscillatorMaster - i] = oscillatorFollowing[oscillatorMaster];
                    oscillatorFollowing[oscillatorMaster] =   phaseOfOscillator0;
                    
                    //  phaseOfOscillator0 = oscillatorFollowing[oscillatorMaster];
                    
                }
            }
                
               else if (oscillatorMaster ==  0) {   
                    
                    oscillatorFollowing[networkSize - 1] = oscillatorFollowing[oscillatorMaster];
                    // phaseOfOscillator0=oscillatorFollowing[oscillatorMaster];
                    text(" oscillatorFollowi[networkSize-1] " + oscillatorFollowing[networkSize - 1], -300, 100 * networkSize - 1);
                    
                }
                
                return phaseOfOscillator0;  // 
            }
            
            float log10(float x) {
                return(log(x) / log(10));
            }
            
            
            int timeToTrigSomething;
            int timeToTrigSomethingBis;
            boolean trigEffect;
            boolean trigEffectBis;
            
            int numFrame = 900;
            float LFOmemory[] = new float[numFrame];
            float Automation1[] = new float[numFrame];
            int formerAuto;
            
            String keyMode, formerKeyMode;
            boolean[] moveKeys = new boolean[99];
            
            int numberOfPointInterpolated = 2; 
            float[]  interpolatedAngle = new float[numberOfPointInterpolated];
            float[]  netPhaseBase  = new float[networkSize];
            float[]  netOldPhaseBase  = new float[networkSize];
            
            String v0, v1, v2, v3, v4, v5;
            int incrementeX;
            
            int[] result_modulo  = new int[networkSize];
            int[] AlternativeVirtualPositionFromOtherMode = new int[networkSize];
            int[] oldEncodeur = new int[networkSize];
            int[] encodeur = new int[networkSize];
            int[] readPositionEncoder = new int[networkSize];
            float[] newPosFollowed = new float[networkSize]; // followOppositeWay
            float[] phaseSigna2Followed = new float[networkSize]; // followOppositeWay
            float[] newPosFollowedWithoutPropagation = new float[networkSize]; // followOppositeWay
            
            
            int oldOscillatorChangePropagation, oscillatorChangePropagation; // splitIncoming
            boolean oscillatorChangingPropagation; // splitIncoming
            
            
            // SAMPLING AND " INTERPOLATION "
            int actualSec,lastSec, lastLastSec, measure;  // trig internal clock each seconde as a measure  (period of 1 seconde)
            
            int currTime;
            boolean bRecording,bRecordingBis = true;
            boolean mouseRecorded = true;
            boolean readyToRecord;
            float movementInterpolatedContinue;
            
            int Movement;
            
            float oldMovementInterpolated; // not used
            float movementInterpolated, angleToInterpolate, movementInterpolatedBis, angleToInterpolateBis;
            float formerInterpolatedY;
            float interpolatedX, interpolatedY;
            
            //END INTERPOLaTION
            
            // MANAGE ARDUINO && TEENSY
            import processing.serial.*;
            Serial encoderReceiveUSBport101; // The Teensy serial port giving position :  finish with 101
            Serial DueSerialNativeUSBport101; // The ArduinoDue serial port giving position :  finish with 101
            Serial teensyport;
            Serial teensy4port;
            
            int[] formerFrameCountFromSerialEvent = new int[networkSize];
            
            String dataTransformed;
            String dataFromMode;
            
            boolean startZ = false; // to trig opposite way of propaagtion in addSignalOneAndTwoQuater
            
            float signalToSplit, oldSignalToSplit;  // signal oscillant entre 0 et 1 ou entre - TWO_PI et TWO_PI. oldSignalTosplit est la valeur du signal a la frame precedente. 
            
            float timeLfo; // met à l'echelle le "signalToSplit" afin qu'il soit limité entre 0 et 1000
            
            float splitTime, oldSplitTime; // // renvoie la valeur discontine du time. Quand le temps s'ecoule de maniere cconstante et lineaire
            
            float splitTimeLfo, oldSplitTimeLfo; // renvoie la valeur discontine du timeLFO. Quand timeLFO va de 0 à 1000, splitTimeLfo renvoie la valeur restante du timeLfo
            
            float propagationSpeed = 130.0; // " vitesse " à laquelle on change d'oscillateur
            
            int oscillatorChanging; // next or last changing oscillator
            //** * * * * * * * * * * * * * * * *         followSignalLfo
            
            char  modeStartKey;
            String modeStartKeyToFollow;
            
            float[] oscillator = new float[networkSize];
            int[] countFollowSignalLfo = new int[networkSize];
            int[] oldOldPositionToMotor = new int[networkSize];
            int[] trigFollowSignalLfo = new int[networkSize];
            
            // ALIGNEMENT Trig 0
            int[] result;
            float[] resultMidPosWithEncoderF;
            int[] resultMidPosWithEncoderInt;
            
            
            int[] multiMatchData(int matchValue, int newValue, int[] theArray) {
                IntList list = new IntList();
                for (int i = 0; i <  theArray.length; i++)
                    if (theArray[i] == matchValue) list.append(i);
                if (list.size() > 4)
                    list.forEach(element -> { theArray[element] = newValue; });
                return theArray;
            }
            /*
             float[] multiMatchDataF(float matchValue, float newValue, int[] theArray) {
                FloatList list = new FloatList();
                for ( int i= 0; i <  theArray.length; i++)

                    if (theArray[i] == matchValue) list.append(i);
                if (list.size() > 4)

                    list.forEach(element -> { theArray[element] = newValue; });
                return theArray;
            }
            */
            
            void showArray(int[] array) {
                for (int i = 0; i < array.length; i++)
                    print(array[i] + "   ");
                print(" ");
            }

             void showArrayDouble(int[] array,  int[] arrayB  ) {
            for (int i = 0; i < array.length; i++) 
                for (int j = 0; i < arrayB.length; i++)
                 {
                    print(array[i] + "   " + arrayB[j] );
               
                }
                 print(" ");
            }

            void showArrayF(float[] array) {
                for (int i = 0; i < array.length; i++)
                    print(array[i] + "   ");
                print(" ");
            }
            
            //
            
            float[]  velocityBis =  new float[networkSize]; //;
            float[]  oldVelocityBis =  new float[networkSize]; //;
            float[]  accelerationBis =  new float[networkSize]; //;
            //float[]  oldaccelerationBis =  new float[networkSize]; //;
            
            float[] phaseAcceleration =  new float[networkSize]; //;
            float[] oldPhaseAcceleration =  new float[networkSize]; //;
            
            
            //**** * * * * * * * * * * * * * *FollowMovement addSignalOneAndTwo and addSignalOneAndTwoBis
            
            char letter;
            boolean doA,doQ,doZ;
            
            int oldOscillatorChange, oscillatorChange;
            boolean oscillatorChanged;
            
            
            
            
            int[] recordLastDataOfMotorPosition = new int[networkSize];  // not used
            
            //float[] phaseShiftingFollowLFO = new float[12];
            
            
            int frameCountRed;
            String keyModeRed;
            String mappingMode; 
            int   controlTrigLfoPattern;
            float phaseShiftingFollowLFO;
            
            int decayTimeLfo;
            int formerDecayTimeLfo;
        
            //int[] j = new int[networkSize];// number of the last changed oscillator
            float[] phaseKeptAtChange =  new float[networkSize]; //;
            float[] phasePatternFollow =  new float[networkSize]; //;
            
            float[] newPosXaddSignal =  new float[networkSize]; //;
            float[] newPosX =  new float[networkSize]; //;
            float[] oldPosX =  new float[networkSize]; //;
            
            int decayTimeBis;
            int formerDecayTimeBis;
            
            //**** * * * * * * * * * * * * * *FollowMovement   
            
            float oldYsampled,  ySampled;
            int formerDecayTime,decayTime;
            int frameCountBis = 0;
            int decayshiftFollowMov = 0;
            
            float[] ableton = new float[networkSize]; //;
            float[] signal = new float[networkSize]; //;
            float[] phaseAbleton =  new float[networkSize]; //;
            float[] oldPhaseAbleton =  new float[networkSize]; //;
            
            float[] oldPhaseLfo = new float[networkSize]; //;
            float[] newPhaseLfo = new float[networkSize]; //;
            
            float[] newPosY = new float[networkSize]; //;
            float[] LFO = new float[networkSize]; //;
            
            float[] phaseFollowLFO = new float[networkSize]; // 

            // used to count rotation with propagation Modes
            float[] oldOldOldPosF = new float[networkSize]; // 
            float[] oldOldPosF = new float[networkSize]; // 
            float[] oldPosF = new float[networkSize]; // 
            float[] newPosF = new float[networkSize]; //

            float[] oldOldOldPosShifted = new float[networkSize]; // 
            float[] oldOldPosShifted = new float[networkSize]; // 
            float[] oldPosShifted = new float[networkSize]; // 
            float[] newPosShifted = new float[networkSize]; //

            float[] oldLfoPhase =  new float[networkSize]; //

            float[] lfoPhase =  new float[networkSize]; //
            int[] dataMappedForMotor =  new int[networkSize]; //
            int[] positionToMotor =  new int[networkSize];
            int[] oldPositionToMotor =  new int[networkSize];
            int[] revLfo =  new int[networkSize];
            
            // for mode keyMetro< in fonction PatternFollowLfo()
            int[] dataToChange =  new int[networkSize]; //
            float[] oldMotorToVisualPhase = new float[networkSize];
            float[] motorToVisualPhase = new float[networkSize];
            //float[] phaseShiftingFollowLFO = new float[12];
            
            
            
            
            
            //int frameRatio = 20;
            //int nbBall = 9;
            //int nbMaxDelais = 2000;
            
            
            
            
            //**** * * * * * * * * * * * * * *INTERPOLATION AND  SamplingMovement
            int phase11;
            float addPhase;
            float addPhaseAllMode;
            float trigLfo; // send only to float to osc
            float oldMov;
            float movementRecording; 
            
            // IMPORTANT TO COMPARE
            // to interpolate angle
            float mlerp(float x0, float x1, float t, float M) {
                float dx = (x1 - x0 + 1.5 * M) % M - 0.5 * M;
                return(x0 + t * dx + M) % M;
            }

            // activation - control sampling - oversampling <=> overdub

            boolean overDub = false; 
         
            int formerBeatPrecised, beatPrecised, formerMeasure, formerBeatOnMeasure; // autmationWithMeasureAndNote
            int beginTrigEffect, stopTrigEffect, beginMeasure, stopMeasure;
            int lastMeasureRecordStart, measureRecordStart , measureRecordStop, beginSample, endSample;
            int lastMeasureRecordStartBis, measureRecordStartBis , measureRecordStopBis, beginSampleBis, endSampleBis;

            boolean beatPrecisedTrigged;
            int timeFrameOffsetFollowing;
            
            
            // RECORD MOTOR 0 and SAMPLING MOVEMENT and PLAIY IT in LOOP
            
            int frameSampling; 
            int z;
            
            int  counterV1;
            int  oldv1;
            //Record and repeat movement
            
            boolean trigFollowSampling = true;
            boolean trigRatio;
            int  delayTimeFollowPhase11 = 0;
            float phaseShiftingFollowPhase11 = 0;
            int num = 40; // you need normally 45 frameSamplings/s but actually with a 3D setting you  need only 40 frameSamplings
            int numberSec = 5;
            
            float mx[] = new float[num * numberSec]; // memorised frameSampling played 
            float my[] = new float[num * numberSec]; // 
            
            float rx[] = new float[num * numberSec]; // recorded frameSampling
            float ry[] = new float[num * numberSec]; 
            
            int beginTime,endTime,TimeMiddleElapsed,LastTimeMiddleElapsed,LastTimeElapsed;
            int restartTimer;
            float Timer,Timer2;
            
            // END RECORD MOTOR 0 and SAMPLING MOVEMENT and PLAIY IT in LOOP
            
            
            // fonction FOLLOW phaseJo
            String debug = "";
            String dataToControlMotor;
            
            int nbBall = networkSize;
            int nbMaxDelais = 2000;
            
            // Variable pour suivre un mouvement avec un decalage en frame et phase.DANS les FONCTIONS commencant par follow
            boolean firstFollowingLast = true;
            float deltaFollow = PI / 180;
            boolean firstFollowingStarted = false;
            
            float[][] phases = new float[nbBall][nbMaxDelais];
            int[] phaseToMotor;
            float[] phaseMapped;
            float[] phaseMappedFollow;
            
            float b, a;
            // fin fonction JO
            
            color bg = rcolor();
            color rcolor() {
                return(color(random(255), random(255), random(255)));
                }
            // Variable pour fonction avec starter et inteerphase
            
            float[] interFrequency =  new float[networkSize];
            float[] interPhase  =  new float[networkSize];
            float[] interPhaseCircular =  new float[networkSize];
            int oldOldOldMemoryi, oldOldMemoryi;
            int lastTimeTrigged;
            int TimeTrigged;
            float[] TrigRightTemp  =  new float[networkSize];
            float[] interPosition = new float[networkSize];
            int[] upstairVpos = new int[networkSize];
            int[] upstairOldVpos = new int[networkSize];
            int[] LasttimeTrigged = new int[networkSize];
            int[] timeTrigged = new int[networkSize];
            int lastTimeUpstair;
            boolean[] upstairShifting;
            boolean[] clockWay;
            boolean[] oldClockWay;
            int[] ClockWay = new int[networkSize];
            int[] FactorWay = new int[networkSize];
            //boolean upstairShifting; 
            
            int upstairTime = 0;
            int TimeUpstair = 0;
            float[] PhaseDecay;
            int oldMemoryi;
            int oscillatorMoving;
            int OldoscillatorMoving;
            boolean[] oldOscillatorMoving; 
            boolean[] OscillatorMoving;
            int millisRatio;
            String JoDebug;
            int incrementSpeed; // the speed of periodic wave
            int[] formerEvent = new int[networkSize];
            int[] TimeEllapsedBall = new int[networkSize];
            
            float[] automationLFO;
            
            float averageDeltaPhase;
            boolean twoTree = false;
            boolean treeFour = false;
            boolean fourFive = false;
            boolean fiveSix = false;
            boolean sixSeven = false;
            boolean sevenEight = false;
            boolean eightNine = false;
            boolean nineTen = false;
            boolean tenEleven = false;
            boolean elevenTwo = false;
            boolean[] followNumber;
            int currentTime;
            float[] pseudoTimer;
            float[] timer;
            float[] phaseReturned;
            float k = 0; // factor of phiShift in fonction formerkeyo
            int d = 0; // factor of timeOffset before trigging phaseshifting in fonction formerkeyo
            boolean[] factorWay; // factor of phiShift according the oscillator moving in upstairx in cw or ccw
            int timeOffset = 1;
            float phiShift =-  PI / 4;
            float mapShiftPendular; // map the scale of K * phiShift
            float mapShiftCircular;
            float LFOX;
            float LFOY;
            
            //import the necessary libraries to use send, receive and understand OSC data
            import oscP5.*;
            import netP5.*;
            
            // OSC loading stuff
            OscP5 o;//Receive Piano/ Only track 1 from live 
            OscP5 oII;//Receive Data/ Automation from Live
            OscP5 oscP5;//send data
            OscP5 oscP5bis;//send data
            NetAddress myRemoteLocation;     // send data  to Live
            NetAddress myRemoteLocationII;   // send data  to Live
            NetAddress myRemoteLocation9000; // send data to Esp32
            NetAddress myRemoteLocation9001; // send data to Esp32
            NetAddress myRemoteLocation9002; // send data to Esp32
            NetAddress myRemoteLocation9003; // send data to Esp32
            NetAddress myRemoteLocation9004; // send data to Esp32
            NetAddress myRemoteLocation9005; // send data to Esp32
            NetAddress myRemoteLocation9006; // send data to Esp32
            NetAddress myRemoteLocation9007; // send data to Esp32
            NetAddress myRemoteLocation9008; // send data to Esp32
            NetAddress myRemoteLocation9009; // send data to Esp32
            NetAddress myRemoteLocation9010; // send data to Esp32
            NetAddress myRemoteLocation9011; // send data to Esp32
            
            float[] dataToLive; 
            int[] upVelocity = new int[networkSize]; 
            int[] downVelocity = new int[networkSize]; 
            float Velocity;
            int autmationWithMeasureAndNote;
            int beatOnMeasure;
            int actualMeasure;
            
            int formerFrameBeat;
            float formerAutomation;
            int LastBeat = 0;
            boolean beatTrigged;
            
            // potar position scaled 0 to 1
            float formerAutomation1;
            float automation1, automation2, automation3, automation4, automation5, automation6, automation7, automation8, automation9  = 0; 
            
            
            // midi note data
            B_String string1, string2, string3, string4, string5, string6, string7, string8;
            int velocity1, velocity2, velocity3, velocity4, velocity5, velocity6, velocity7, velocity8 = 0;
            float ver_move1, ver_move2, ver_move3, ver_move4, ver_move5, ver_move6, ver_move7, ver_move8;
            float duration1, duration2, duration3, duration4, duration5, duration6, duration7, duration8;
            int note1, note2, note3, note4, note5, note6, note7, note8  = 0;
            
            // END OF OSC DATAS
            
            int oscillatorBlocked;
            
            int pendular;  //actualise datas. 
            boolean modeCircular; //switch datas of positions in a pendular way
            boolean trigTest; // Trig data when oscillator is on the left
            
            // variable to manage graphics 
            PNetwork netG;
            int numRows = 12;
            int numCols = 12;
            int networkSizeGraphic = numRows * numCols;
            int gridSize = 16;  
            
            float Coupling;
            float sigma; 
            float Freq; 
            // end of variable to managegraphics 
            
            int orderframe;
            int stoploop;
            int memoryi;
            float f = 0.05; // FOLLOW MODEto incremente phase with  formerkey =='f'
            float fmemory;
            
            boolean F11 = true;  
            //MANAGE START STOP into LIVE
            
            int startStop;
            
            int nextScene = 0; // Do not trig nextScene
            int cohesionTrig;
            
            //Manage when oscillator 11 trig his position = 0
            boolean ready = false;
            float pulsation; // nnot used
            int pause_start_time, sketch_pause_interval = 0;
            int prev_time;
            
            // MANAGE Time according theframe.
            float TimeFrame;
            int lastMillis = 0;
            int sec; 
            
            float timeFrame;
            boolean running_Timer = true;
            
            int pair = 0; // to manage wether I control oscillator odd or even.
            
            
            
            
            // variable of the setting of oscillator network
            
            float x, y;
            float side;  
            float displacement;
            float NaturalF;
            //float coupling;
            float noiseScale = 1;
            float radius;
            float orderParameter;
            float coupling;
            float formerCoupling;
            float averagePhase;
            float averageFrequency;
            
            float stepSize;
            int[] rev; //(counter of revolution of each oscillator);
            
            // MANAGE data TO SEND POSITION or SPEED to ARDUINO
            int[] oldVirtualPosition = new int[networkSize];
            int[] VirtualPosition  = new int[networkSize];
            int[] pos = new int[networkSize];
            int[] oldPos = new int[networkSize];
            float[] Pos = new float[networkSize]; // to convert data of position always positively
            int[] numberOfTrig = new int[networkSize];
            int[] numberOfRota = new int[networkSize];


            int[] modPos = new int[networkSize]; // ta have special position  quarter or half round
            int[] modOldPos = new int[networkSize]; //to have former
            int[] modOldOldPos = new int[networkSize]; //to have former
            int[] TrigmodPos = new int[networkSize]; // to trig accordinag modPos;
            
            int[] counter = new int[networkSize];
            
            
            float[] metroPhase; 
            float[] metroOldPhase; // convert circular to pendular
            float[] abstractPhase; // tocompute abstract phase
            float[] OldFrequency;
            float[] divideFrequency;
            
            int[] PendularVirtualPosition = new int[networkSize];
            int[] CircularVirtualPosition  = new int[networkSize];
            int[] dataMappedForMotorisedPosition  = new int[networkSize];
            int[] ActualVirtualPosition = new int[networkSize];
            int[] oldLastActualPosition = new int[networkSize];
            int[] lastActualPosition  = new int[networkSize];
            int[] lastOldActualPosition  = new int[networkSize];
            int[] oldActualVirtualPosition  = new int[networkSize];
            int[] PendularOldVirtualPosition  = new int[networkSize];
            int[] CircularOldVirtualPosition  = new int[networkSize];
            int[] PendularLeftVirtualPosition  = new int[networkSize];
            int[] PendularOldLeftVirtualPosition  = new int[networkSize];
            int[] PendularOldOldLeftVirtualPosition  = new int[networkSize];
            int[] PendularOldOldOldLeftVirtualPosition  = new int[networkSize];
            
            int[] revolution;
            int[] pseudoRevolutionTodeblock;
            // WHAT TO CHOSSE ?? ? ? ?  200 * 4 ou 200 * 8 =? ? ? ? ? 
            int[] decompte; // decremente a number when a revolution is trigged
            int[] mapAcceleration;
            int[] mapAccelerationinversed;
            
            
            int[] j; // to reduce the number of revolution to their number even or odd  
            
            //MANAGE VARIABLE TO MODULATE MOVEMENT with different CASES AUTOMATICALY
            int caseNumber;
            char caseLetter;
            
            // MANAGE COUNTER of COHESION to manage sound
            // Trig counter when cohesion is >= 0.99
            int orderCohesion;
            int cohesionCounterHigh;
            int cohesionCounterLow;
            
            // Trig counter when cohesion is <= 0.01
            int orderCohesionLow;
            int cohesionCounterHighLow;
            float LevelCohesionToSend;
            
            // MANAGE PERSPECTIVE CAMERA
            import peasy.*;
            PeasyCam cam;
            
            // change these for screen size
            float fov = 45;  // degrees
            float w = 1000;
            float h = 800;
            
            // don't change these
            float cameraZ, zNear, zFar;
            float w2 = w / 2;
            float h2 = h / 2;
            
            int frameRatio;
            
            // SPECIFIED DATAS TO MAX MSP
            float bPM9;
            int BPM9;
            int constrainedBPM; 
            int onOFF;
            
            //******* * * * to RECORD and  playback data in the skecth folder
            char formerKey; 
            int formerSartKey; 
            int formerKeyCode;
            int formerFormerKey; 
            int formerKeyCodeAzerty;
            int formerFrame;
            int formerKeyMetro;
            
            int Key;
            int KeyCode;
            
            int couplingRed;
            float couplingRecorded;
            
            String[] lines;
            int index = 0, nextFrame = 0; //these stay the same
            // To outpout data recorded as sequences of case on Keypressed
            PrintWriter output;
            
            //******** * * * * * * * * * * * * * Data mapped to send To MAX 4 LIVE
            int  orderToexpMappedOpposedLive; 
            int  acc0ToexpMappedBisLive, acc9ToexpMappedBisLive; 
            
            //BPM
            float[] bpmFrequency;
            float bpmToSend = 0.0;
            
            //frame where to stop
            //int framecount = 10040;//4440 //50400à°)-_
            int framecount = 30040;//4440 //5040  0à°)-_
            
            void frameStop() { 
                if (frameCount % framecount ==  0) { /// choose the in the   frame where you want to stop
                    stoploop = 10; // incrmente the stepto the next frame
                    framecount = framecount + stoploop;
                    noLoop();
                    //       print(" last or : ");   println(orderframe);
                    orderframe  = framecount;
                    //       print("a:ctual order : ");println(orderframe);
                    }
                }


void setup() {

            numberOfMeasureToRecord=4;      
            frameRatio = 30;///30/5=> 108/5 BPM 21.6  or 114/5 = 22.8
            frameRate(frameRatio); //57 frame pour 1 tour. // joure avec G et g et cf le p
                
                
                //sampler = new Sampler();// old version to sample with mouseX and mouse Y " with polar coordonation
                sampler = new SamplerTheta();
                samplerBis = new SamplerTheta();
                
                
                //  noStroke();
                fill(255, 0, 0, 50); 
                println("Start Drawing!");
                //  frameRate(45);
                
                
                // end sampling
                
                int midiNoteAndOtherData  = 300;
                //int networkSize = 6;
                
                formerEvent = new int[300];
                formerSartKey = '#';
                autmationWithMeasureAndNote = 1;
                
                
                
                automationLFO = new float[networkSize];
                followNumber = new boolean[networkSize];
                pseudoTimer = new float[networkSize];
                timer =  new float[networkSize];
                phaseReturned =  new float[networkSize];
                
                k = 0; // set phase offset to 0
                d = 0; // set time offset to 0
                
                TimeEllapsedBall = new int[networkSize];
                timeTrigged = new int[networkSize];
                TrigRightTemp = new float[networkSize];
                upstairVpos = new int[networkSize];
                upstairOldVpos = new int[networkSize];
                LasttimeTrigged = new int[networkSize];
                interPosition = new float[networkSize];
                PhaseDecay = new float[networkSize];
                interPhase = new float[networkSize];
                interFrequency = new float[networkSize];
                interPhaseCircular = new float[networkSize];
                factorWay = new boolean[networkSize];
                
                
                float noiseLevel = 0; // Usefull only with case Q?
                
                // Osc midi potar
                automation1 = automation2 = automation3 = automation4 = automation5 = automation6 = automation7 = 0.5;
                o = new OscP5(this, 2346);//receive data from a port number - it has to be same as in your Max for Live device // careful to oveflow
               // oII = new OscP5(this, 2350);//receive datapiano partitionII   
                oscP5 = new OscP5(this, 7999);//receive data to himself
                oII = new OscP5(this, 1000);//receive data to himself

                // send DATA
                // myRemoteLocation = new NetAddress("192.168.1.77", 8000); // send data to port 8000 
                myRemoteLocation = new NetAddress("127.0.0.1", 8000); // rsend data to live. define address ove which the communication takes place. Requires host address (127.0.0.1 for localhost and the port number previously defined.)
                myRemoteLocationII = new NetAddress("127.0.0.1", 8001); // receive data fto live. define address ove which the communication takes place. Requires host address (127.0.0.1 for localhost and the port number previously defined.)
                myRemoteLocation9000 = new NetAddress("127.0.0.1", 9000); 
                myRemoteLocation9001 = new NetAddress("127.0.0.1", 9001); 
                myRemoteLocation9002 = new NetAddress("127.0.0.1", 9002); 
                myRemoteLocation9003 = new NetAddress("127.0.0.1", 9003); 
          
                dataToLive = new float[networkSize];
                upVelocity = new int[networkSize];
                
                downVelocity = new int[networkSize];
                //OSC midi note data
                
                string1 = new B_String(width * 0.1, width * 0.3, width * 0.7, width * 0.9, height * 0.2, 250);
                string2 = new B_String(width * 0.1, width * 0.3, width * 0.7, width * 0.9, height * 0.3, 50);
                string3 = new B_String(width * 0.1, width * 0.3, width * 0.7, width * 0.9, height * 0.4, 150);
                string4 = new B_String(width * 0.1, width * 0.3, width * 0.7, width * 0.9, height * 0.5, 100);
                string5 = new B_String(width * 0.1, width * 0.3, width * 0.7, width * 0.9, height * 0.6, 200);
                string6 = new B_String(width * 0.1, width * 0.3, width * 0.7, width * 0.9, height * 0.7, 0);
                string7 = new B_String(width * 0.1, width * 0.3, width * 0.7, width * 0.9, height * 0.8, 133);
                string8 = new B_String(width * 0.1, width * 0.3, width * 0.7, width * 0.9, height * 0.9, 278);
                     
                startStop = 0; // data used in Live
               
                stepSize = 10; // no effect //  net.stepSize = 1; // no effect  
                // Creat text with cases, in order to havea sequence according cases
                //======== = = = = = = = = record data to the skecth folder
                output = createWriter("OVERCOOL/viergelentAlongRecBisVitesse8FRAMEFaireVVraimentBis5FINAL39.txt");// 
                output.println("0:0:0:0:0: addSignalOneAndTwo ");   
                //======== = = = = = = = = donwload data from the skecth folder
                
                //******** * * * * * * * * * * * *  
                // lines = loadStrings("OVERCOOL/viergelentAlongRecBisVitesse8FRAMEcontinueBisElague.txt");//retire o garde pendulaire 5366:36:56:42
                //lines = loadStrings("OVERCOOL/viergelentAlongRecBisVitesse8FRAMEFaireVVraimentBis2.txt");// // to play to trig LIVE
                //lines = loadStrings("OVERCOOL/viergelentAlongRecBisVitesse8FRAMEFaireVVraimentBis5FINAL6.txt");// drole d'effet vers frame 16000 
                //lines = loadStrings("OVERCOOL/viergelentAlongRecBisVitesse8FRAMEFaireVVraimentBis5FINAL13.txt");//
                //lines = loadStrings("OVERCOOL/viergelentAlongRecBisVitesse8FRAMEFaireVVraimentBis5FINAL16.txt");//
                
                //lines = loadStrings("OVERCOOL/viergelentAlongRecBisVitesse8FRAMEFaireVVraimentBis5FINAL33.txt");//  // 33 fonctione
                
                
                //******** * * * * * * * * * * * *  fichier vierge
                //  lines = loadStrings("vierge.txt");
                //***  lines = loadStrings("viergechar.txt");
                // lines = loadStrings("madrushstart.txt");
                //**** readOneLine(); // play case frame by frame. Uncomment if you want play in live
                textSize(200);
                //********  Sending and Receiving data with two different serialport
                
                setPort();
                
                //******** * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * BEGIN GRAPHIC CHIMERA STATE SETUP
                float[][] Coupling = new float[networkSizeGraphic][networkSizeGraphic];
                float sigma = 0.25; // play with this? Howcan I do?
                initializeCoupling(Coupling, sigma);
                float[] phase = new float[networkSizeGraphic];
                initializePhase(phase);
                float[] naturalFrequency = new float[networkSizeGraphic];
                Freq = PI / 8; // play with this PI/8
                initializeNaturalFrequency(naturalFrequency, Freq);
                netG = new PNetwork(this, phase, naturalFrequency, Coupling);
                
                colorMode(HSB, TWO_PI, 100, 100);
                noStroke();
                
                //******** * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * END GRAPHIC CHIMERA STATE SETUP
                rev = new int[networkSize]; // counter of rev
                j = new int[networkSize]; // reduce  the number of rev  to the number even or odd with 0 or 1 /
                
                oldVirtualPosition = new int[networkSize];
                VirtualPosition = new int[networkSize];
                pos = new int[networkSize];
                oldPos = new int[networkSize];
                //  Pos = new float[networkSize];
                modPos = new int[networkSize];
                modOldPos = new int[networkSize]; 
                modOldOldPos = new int[networkSize]; 
                
                metroPhase = new float[networkSize]; 
                
                metroOldPhase = new float[networkSize]; 
                abstractPhase = new float[networkSize]; 
                
                OldFrequency = new float[networkSize]; 
                PendularVirtualPosition = new int[networkSize]; 
                CircularVirtualPosition = new int[networkSize]; 
                dataMappedForMotorisedPosition = new int[networkSize]; 
                ActualVirtualPosition = new int[networkSize];
                lastActualPosition = new int[networkSize];
                oldActualVirtualPosition = new int[networkSize];
                
                PendularOldVirtualPosition = new int[networkSize]; 
                CircularOldVirtualPosition = new int[networkSize]; 
                PendularLeftVirtualPosition = new int[networkSize];
                PendularOldLeftVirtualPosition = new int[networkSize];
                PendularOldOldLeftVirtualPosition = new int[networkSize];
                PendularOldOldOldLeftVirtualPosition = new int[networkSize];
                TrigmodPos = new int[networkSize]; 
                revolution = new int[networkSize];
                pseudoRevolutionTodeblock = new int[networkSize];
                decompte =  new int[networkSize];
                mapAcceleration = new int[networkSize];
                mapAccelerationinversed = new int[networkSize];
                divideFrequency = new float[networkSize];
                
                coupling = 0; 
                
                net = new PNetwork(this, networkSize, coupling, noiseLevel);
                side = height * 0.15 * 1 / networkSize;
                displacement = width / 2;
                
                minim   = new Minim(this);
                
                // this opens the file and puts it in the "play" state.                          
                filePlayer = new FilePlayer(minim.loadFileStream(fileName));
                // and then we'll tell the recording to loop indefinitely
                // filePlayer.loop();
                
                // this creates a TickRate UGen with the default playback speed of 1.
                // ie, it will sound as if the file is patched directly to the output
                rateControl = new TickRate(1.f);
                
                // get a line out from Minim. It's important that the file is the same audio format 
                // as our output(i.e.same sample rate, number of channels, etc).
                out = minim.getLineOut();
                
                // patch the file player through the TickRate to the output.
                filePlayer.patch(rateControl).patch(out);
                //******** * * * * * * * * * * * * * * * * * * 
                // to play synthesis with minim.Not used anymore
                
                phazi =  new float[networkSize];
                speedi = new float[networkSize];
                freqi =  new float[networkSize];
                volumei = new float[networkSize];
                bpmFrequency = new float[networkSize];
                //******** * * * * * * * * * * * * * * * * * * 
                
                
                
                /*  to manage later reflection on sphere
                colorMode(RGB, 1);
                //  fill(0.4);
                */
                
                //******** * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * SET minim library to discriminate 3 differents frequencies in a mp3 
                
                //  minim = new Minim(this);
                //** song = minim.loadFile("09-The Secret Agent Ending.mp3", 1024);
                //**song.play();
                
                //  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
                //  beat.setSensitivity(400);//300 ou 100?
                
                
                kickSize = snareSize = hatSize = 16;
                // make a new beat listener, so that we won't miss any buffers for the analysis
                bl = new BeatListener(beat, song);  
                textFont(createFont("Helvetica", 16));
                textAlign(CENTER);
                //***************************************** set position and coupling of oscillators
                mouseX = width / 2;
                // in order to have coupling=0;
                formerKeyMetro = '$'; // to begin setting of phase with pendular phase in the menu $ ; 
                modeCircular = false;
                for (int i = 0; i < networkSize; i++) {
                    //   net.phase[i] = (i*PI/2);// position0 at the top
                    net.phase[i] = PI / 2;// position 0 at thetop
                    //   net.phase[i]=-PI+0.5*PI+PI/12; // position 0+PI/12
                    }
                
                
                upstairShifting = new boolean[networkSize];
                clockWay = new boolean[networkSize];
                oldClockWay = new boolean[networkSize];
                // ClockWay = new int [networkSize];
                FactorWay = new int[networkSize];
                oldOscillatorMoving = new boolean[networkSize];
                OscillatorMoving = new boolean[networkSize];
                
                for (int i = 0; i < networkSize; i++) {
                    
                    oldOscillatorMoving[i] = false;
                    OscillatorMoving[i] = false;
                    
                    }
                
                for (int i = 0; i < networkSize; i++) {
                    //   ActualVirtualPosition[i]=80*i;
                    // dataMappedForMotorisedPosition[i]= dataMappedForMotorisedPosition[i]+800;
                    dataMappedForMotorisedPosition[i] = (int)map(dataMappedForMotorisedPosition[i], -800, 800, 1600, 4800) + ActualVirtualPosition[i];  // mapped for 6400 step/round +800
                    //  dataToLive[i]=(float)  map(dataMappedForMotorisedPosition[i], 1600, 4800, 0f, 1f);
                    }
                for (int i = 0; i < 300; i++) {
                    // which+1 is the smallest (the oldest in the array)
                    //  formerEvent[i]=0; //Time elapsed before trigging event
                    }
                for (int i = 0; i <  networkSize; i++) {
                    phaseToMotor = new int[networkSize];
                    phaseMapped = new float[nbBall];
                    phaseMappedFollow = new float[nbBall];
                    ActualVirtualPosition[i] = 0;
                    
                    for (int j = 0; j < nbMaxDelais; j++)
                        phases[i][j] = -PI;      
                    }

                smooth();
                       noStroke();
  
                cp5 = new ControlP5(this);
  
               myKnobA = cp5.addKnob("valueOfKnobA")
               .setRange(0,255)
               .setValue(50)
               .setPosition(100,70)
               .setRadius(50)
               .setDragDirection(Knob.VERTICAL)
               ;
                     
               myKnobB = cp5.addKnob("knob")
               .setRange(0,255)
               .setValue(220)
               .setPosition(100,210)
               .setRadius(50)
               .setNumberOfTickMarks(10)
               .setTickMarkLength(4)
               .snapToTickMarks(true)
               .setColorForeground(color(255))
               .setColorBackground(color(0, 160, 100))
               .setColorActive(color(255,255,0))
               .setDragDirection(Knob.HORIZONTAL)
               ;
       

                
                //***************************************** SET 3D CAM 
                
                cam = new PeasyCam(this, 2000);
                cameraZ = (h / 2.0) / tan(radians(fov) / 2.0);
                zNear = cameraZ / 10.0;
                zFar = cameraZ * 10.0;
                println("CamZ: " + cameraZ);
                rectMode(CENTER);
                
                //***************************************** END 3D CAM  

                // music_from_ableton_live = " pleasureKraft ";
                //  positionMov = " premierePartie "; 
                //
                 if (systemForBigMachine == true)
                 {
                  samplingWithTeensy3_5 = false;
                 // music_from_ableton_live = " madRush ";
                 // music_from_ableton_live = " mouvement ";
                   music_from_ableton_live = " Dessine ";
                  // music_from_ableton_live = " controlDr ";
                  //automationForMusicDessine()               
                  keyMode = " trigEventWithAbletonSignal "; 

                  modeStartKeyToFollow = " followSignal2 ";  // to test followSignal

                  doo = true; // oposite way is true 
               // doo = false; // to enable propagation

                 networkSize = 10;
                 numberOfStep = 3200;
                  }

                 if (systemForBigMachine == false)
                 {
                 // samplingWithTeensy3_5 = true;
                 // music_from_ableton_live = " pleasureKraft ";  
                 //  music_from_ableton_live = " Dessine ";
                    music_from_ableton_live = " controlDr "; 

                    keyMode = " trigEventWithAbletonSignal "; 

                    modeStartKeyToFollow = " followSignal2 ";  // to test followSignal

                
                  doo = true; // oposite way is true 
               // doo = false; // to enable propagation

                 networkSize = 6;
                 numberOfStep = 6400;

                 for (int i = 0; i <  networkSize; i++) {
                    numberOfRota[i]=1;   
                    numberOfTrig[i]=8;    
                    }
                  }
                
                  
                

                k = 0; // phaseShifting
                oscillatorBlocked = networkSize - 1;
                memoryi = networkSize - 1;
                oscillatorFollowing[0] = 3.14;
                
                
                //keyMode = " addSignalOneAndTwoBis ";  
                formerKeyMetro = '$';

                //--keyMode = " phasePattern ";
                //--phasePattern();
                
              
                
                // USED TO REPAIR
                //***keyMode = " notNull "; 
                // modeStartKeyToFollow = " samplingModeInternal " ;

     windowMove(0,0);// window at the top_left of the screen
     size(600, 600, P3D);

              //   windowRatio(900, 900); 
              //  translate(0, -800,1000);
                
                
}
