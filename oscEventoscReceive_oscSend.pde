int dataLFO, lastDataLfo;
float positionFromLive;
//int shapeLfoToCount;
float shapeLfo = 0.1666; //   => UP    0.3333 ==> DOWN

//********  OSCRECEIVE
//RECEIVE OSC AUTOMATION with port 2346 or 2349 and 2350 and analyse OSC messages
void oscEvent(OscMessage theMsg)
{

   if (theMsg.checkAddrPattern("/shapeLfo")==true) {
    shapeLfo = theMsg.get(0).floatValue();
   // shapeLfoToCount = (shapeLfo*10.0);
  }

   if (theMsg.checkAddrPattern("/positionFromLive")==true) {
    positionFromLive = theMsg.get(0).floatValue();
  }

  if (theMsg.checkAddrPattern("/trigedSignFromAbleton0")==true) {
    trigedSignFromAbleton[0] = theMsg.get(0).floatValue();
 
  }
   if (theMsg.checkAddrPattern("/trigedSignFromAbleton1")==true) {
    trigedSignFromAbleton[1] = theMsg.get(0).floatValue();
  }

   if (theMsg.checkAddrPattern("/trigedSignFromAbleton2")==true) {
    trigedSignFromAbleton[2] = theMsg.get(0).floatValue();
 
  }
   if (theMsg.checkAddrPattern("/trigedSignFromAbleton3")==true) {
    trigedSignFromAbleton[3] = theMsg.get(0).floatValue();
  }
  

  if (theMsg.checkAddrPattern("/LFOdecay")==true) {
    automationLFO[1] = theMsg.get(0).floatValue();
  } 

  if (theMsg.checkAddrPattern("/LFO2")==true) {
    automationLFO[2] = theMsg.get(0).floatValue();
  }  

  if (theMsg.checkAddrPattern("/LFO3")==true) {
    automationLFO[3] = theMsg.get(0).floatValue();
  }  

  if (theMsg.checkAddrPattern("/LFO4")==true) {
    automationLFO[4] = theMsg.get(0).floatValue();
  }  

 // if (theMsg.checkAddrPattern("/LFO5")==true) {
  if (theMsg.checkAddrPattern("/pongo")==true) {
    automationLFO[5] = theMsg.get(0).floatValue();
  //  text ( " receive ", 200, 200);
  }  
/*
  if (theMsg.checkAddrPattern("/LFO6")==true) {
    automationLFO[6] = theMsg.get(0).floatValue();
  } 

  if (theMsg.checkAddrPattern("/LFO7")==true) {
    automationLFO[7] = theMsg.get(0).floatValue();
  } 

  if (theMsg.checkAddrPattern("/LFO8")==true) {
    automationLFO[8] = theMsg.get(0).floatValue();
  } 

  if (theMsg.checkAddrPattern("/LFO9")==true) {
    automationLFO[9] = theMsg.get(0).floatValue();
  }
  
*/  
  


  if (theMsg.checkAddrPattern("/oscillator2")==true) {
    oscillator[2] = theMsg.get(0).floatValue();
  }  

  if (theMsg.checkAddrPattern("/oscillator3")==true) {
    oscillator[3] = theMsg.get(0).floatValue();
  }  

  if (theMsg.checkAddrPattern("/oscillator4")==true) {
    oscillator[4] = theMsg.get(0).floatValue();
  }  

  if (theMsg.checkAddrPattern("/oscillator5")==true) {
    oscillator[5] = theMsg.get(0).floatValue();
  }  
 /*
  if (theMsg.checkAddrPattern("/oscillator6")==true) {
    oscillator[6] = theMsg.get(0).floatValue();
  } 

  if (theMsg.checkAddrPattern("/oscillator7")==true) {
    oscillator[7] = theMsg.get(0).floatValue();
  } 

  if (theMsg.checkAddrPattern("/oscillator8")==true) {
    oscillator[8] = theMsg.get(0).floatValue();
  } 

  if (theMsg.checkAddrPattern("/oscillator9")==true) {
    oscillator[9] = theMsg.get(0).floatValue();
  }
  
      if (theMsg.checkAddrPattern("/oscillator10")==true) {
    oscillator[10] = theMsg.get(0).floatValue();
  }

  if (theMsg.checkAddrPattern("/oscillator11")==true) {
    oscillator[11] = theMsg.get(0).floatValue();
  } 
  
  */
  


  if (theMsg.checkAddrPattern("/madTempoShaper")==true) {
    formerAutomation1=automation1;
    automation1 = theMsg.get(0).floatValue();
    for (int i = 0; i < networkSize; i++) {   
      //   net.phase[i]= map (automation2, 0, 1, -PI, PI );
    }
  }
  if (theMsg.checkAddrPattern("/speedTempo")==true) {
    automation2 = theMsg.get(0).floatValue();
    //  LFOX=automation2;
  }
  if (theMsg.checkAddrPattern("/followMadTrack1bis")==true) {
    automation3 = theMsg.get(0).floatValue();
    //  LFOY=automation3;
  }  

  if (theMsg.checkAddrPattern("/measureGood")==true) {
    automation4 = theMsg.get(0).floatValue();

  }  

  if (theMsg.checkAddrPattern("/beatPrecised")==true) {
    automation5 = theMsg.get(0).floatValue();
  
  }  

  if (theMsg.checkAddrPattern("/lfo1")==true) {
    automation6 = theMsg.get(0).floatValue();
  }  

  if (theMsg.checkAddrPattern("/lfo2")==true) {
    automation7 = theMsg.get(0).floatValue();
  } 
  
    if (theMsg.checkAddrPattern("/lfo3")==true) {
    automation8 = theMsg.get(0).floatValue();
  }  

  if (theMsg.checkAddrPattern("/LPF")==true) {
    automation9 = theMsg.get(0).floatValue();
  } 
  
   //***** ableton[i]
  

  if (theMsg.checkAddrPattern("/ableton0")==true) {
    ableton[0] = theMsg.get(0).floatValue();
  }  

  if (theMsg.checkAddrPattern("/ableton1")==true) {
    ableton[1] = theMsg.get(0).floatValue();
  }  

  if (theMsg.checkAddrPattern("/ableton2")==true) {
    ableton[2] = theMsg.get(0).floatValue();
  }  

  if (theMsg.checkAddrPattern("/ableton3")==true) {
    ableton[3] = theMsg.get(0).floatValue();
  }  

  if (theMsg.checkAddrPattern("/ableton4")==true) {
    ableton[4] = theMsg.get(0).floatValue();
  } 

  if (theMsg.checkAddrPattern("/ableton5")==true) {
    ableton[5] = theMsg.get(0).floatValue();
  }


 /*
  if (theMsg.checkAddrPattern("/ableton6")==true) {
    ableton[6] = theMsg.get(0).floatValue();
  } 

  if (theMsg.checkAddrPattern("/ableton7")==true) {
    ableton[7] = theMsg.get(0).floatValue();
  }
  
  if (theMsg.checkAddrPattern("/ableton8")==true) {
    ableton[8] = theMsg.get(0).floatValue();
  }

  if (theMsg.checkAddrPattern("/ableton9")==true) {
    ableton[9] = theMsg.get(0).floatValue();
  } 
  */
  
  

  if (theMsg.checkAddrPattern("/signal0")==true) {
    signal[0] = theMsg.get(0).floatValue();
  }  

  if (theMsg.checkAddrPattern("/signal1")==true) {
    signal[1] = theMsg.get(0).floatValue();
  }  

  if (theMsg.checkAddrPattern("/signal2")==true) {
    signal[2] = theMsg.get(0).floatValue();
  }  

  if (theMsg.checkAddrPattern("/signal3")==true) {
    signal[3] = theMsg.get(0).floatValue();
  }  

  if (theMsg.checkAddrPattern("/signal4")==true) {
    signal[4] = theMsg.get(0).floatValue();
  }

  if (theMsg.checkAddrPattern("/signal5")==true) {
    signal[6] = theMsg.get(0).floatValue();
  } 

  if (theMsg.checkAddrPattern("/signal6")==true) {
    signal[6] = theMsg.get(0).floatValue();
  } 

  if (theMsg.checkAddrPattern("/signal7")==true) {
    signal[7] = theMsg.get(0).floatValue();
  }
  
  if (theMsg.checkAddrPattern("/signal8")==true) {
    signal[8] = theMsg.get(0).floatValue();
  }

  if (theMsg.checkAddrPattern("/signal9")==true) {
    signal[9] = theMsg.get(0).floatValue();
  } 

  //slider to receive from manage_slider_max_psp

  if (theMsg.checkAddrPattern("/slider0")==true) {
   slider[0] = theMsg.get(0).floatValue();
  } 
  if (theMsg.checkAddrPattern("/slider1")==true) {
   slider[1] = theMsg.get(0).floatValue();
  }  
  if (theMsg.checkAddrPattern("/slider2")==true) {
    slider[2] = theMsg.get(0).floatValue();
  }
  if (theMsg.checkAddrPattern("/slider3")==true) {
    slider[3] = theMsg.get(0).floatValue();
  }  
  if (theMsg.checkAddrPattern("/slider4")==true) {
    slider[4] = theMsg.get(0).floatValue();
  }
  if (theMsg.checkAddrPattern("/slider5")==true) {
    slider[5] = theMsg.get(0).floatValue();
  }
  /* 
  if (theMsg.checkAddrPattern("/slider6")==true) {
    slider[6] = theMsg.get(0).floatValue();
  } 
  if (theMsg.checkAddrPattern("/slider7")==true) {
    slider[7] = theMsg.get(0).floatValue();
  }
  if (theMsg.checkAddrPattern("/slider8")==true) {
    slider[8] = theMsg.get(0).floatValue();
  }
  if (theMsg.checkAddrPattern("/slider9")==true) {
    slider[9] = theMsg.get(0).floatValue();
  } 
  */

  //***  MIDI NOTE

  if (theMsg.checkAddrPattern("/Velocity1")==true) {
    velocity1 = theMsg.get(0).intValue();
    ver_move1 = map(velocity1, 0, 127, 0, 60);
  }

  if (theMsg.checkAddrPattern("/Velocity2")==true) {
    velocity2 = theMsg.get(0).intValue();
    ver_move2 = map(velocity2, 0, 127, 0, 60);
  }  

  if (theMsg.checkAddrPattern("/Velocity3")==true) {
    velocity3 = theMsg.get(0).intValue();
    ver_move3 = map(velocity3, 0, 127, 0, 60);
  }  

  if (theMsg.checkAddrPattern("/Velocity4")==true) {
    velocity4 = theMsg.get(0).intValue();
    ver_move4 = map(velocity4, 0, 127, 0, 60);
  }

  if (theMsg.checkAddrPattern("/Velocity5")==true) {
    velocity5 = theMsg.get(0).intValue();
    ver_move5 = map(velocity5, 0, 127, 0, 60);
  }  

  if (theMsg.checkAddrPattern("/Velocity6")==true) {
    velocity6 = theMsg.get(0).intValue();
    ver_move6 = map(velocity6, 0, 127, 0, 60);
  }  

  if (theMsg.checkAddrPattern("/Velocity7")==true) {
    velocity7 = theMsg.get(0).intValue();
    ver_move7 = map(velocity7, 0, 127, 0, 60);
  }  

  if (theMsg.checkAddrPattern("/Velocity8")==true) {
    velocity8 = theMsg.get(0).intValue();
    ver_move8 = map(velocity8, 0, 127, 0, 60);
  }  

  if (theMsg.checkAddrPattern("/Note1")==true) {
    note1 = theMsg.get(0).intValue();
    duration1 = map(sq(note1), 1, sq(127), 0.05, 0.5);
  }

  if (theMsg.checkAddrPattern("/Note2")==true) {
    note2 = theMsg.get(0).intValue();
    duration2 = map(sq(note2), 1, sq(127), 0.05, 0.5);
  } 

  if (theMsg.checkAddrPattern("/Note3")==true) {
    note3 = theMsg.get(0).intValue();
    duration3 = map(sq(note3), 1, sq(127), 0.05, 0.5);
  }

  if (theMsg.checkAddrPattern("/Note4")==true) {
    note4 = theMsg.get(0).intValue();
    duration4 = map(sq(note4), 1, sq(127), 0.05, 0.5);
  } 

  if (theMsg.checkAddrPattern("/Note5")==true) {
    note5 = theMsg.get(0).intValue();
    duration5 = map(sq(note5), 1, sq(127), 0.05, 0.5);
  }

  if (theMsg.checkAddrPattern("/Note6")==true) {
    note6 = theMsg.get(0).intValue();
    duration6 = map(sq(note6), 1, sq(127), 0.05, 0.5);
  } 

  if (theMsg.checkAddrPattern("/Note7")==true) {
    note7 = theMsg.get(0).intValue();
    duration7 = map(sq(note7), 1, sq(127), 0.05, 0.5);
  }

  if (theMsg.checkAddrPattern("/Note8")==true) {
    note8 = theMsg.get(0).intValue();
    duration8 = map(sq(note8), 1, sq(127), 0.05, 0.5);
  }
}




/*float log10 (int x) {
 return (log(x) / log(10));
 }*/

class B_String {
  float osc_points, p11, p21, p31, p41, shade;

  B_String(float a1, float b1, float c1, float d1, float i, int colour) {
    noFill();
    //fill(250, 0, 0, 55);
    stroke(200, colour, 0);
    bezier(a1, i, b1, i, c1, i, d1, i);
    osc_points = i;
    p11 = a1;
    p21 = b1;
    p31 = c1;
    p41 = d1;
    shade = colour;
    //fill(0, 0, 0);
  }

  void display(float velocity) { 
    noFill();
    stroke(200, shade, 0);
    /*
    bezier(p11, osc_points, p21, osc_points+velocity, p31, osc_points+velocity, p41, osc_points);
    bezier(p11, osc_points, p21, osc_points+0.8*velocity, p31, osc_points+0.8*velocity, p41, osc_points);
    bezier(p11, osc_points, p21, osc_points+0.6*velocity, p31, osc_points+0.6*velocity, p41, osc_points);
    bezier(p11, osc_points, p21, osc_points+0.4*velocity, p31, osc_points+0.4*velocity, p41, osc_points);
    bezier(p11, osc_points, p21, osc_points+0.2*velocity, p31, osc_points+0.2*velocity, p41, osc_points);
    bezier(p11, osc_points, p21, osc_points, p31, osc_points, p41, osc_points);
    */
  }
} 

void printMidiNoteVelocity() {
   translate (0, -height);

  if  (note1>0)
   {
    /*
    print ("note "); 
    print (1); 
    print (" "); 
    print (note1);
    print ("note "); 
    print (2); 
    print (" "); 
    print (note2);
    print ("note "); 
    print (3); 
    print (" "); 
    print (note3);
    print ("note "); 
    print (4); 
    print (" "); 
    print (note4);
    print ("note "); 
    print (5); 
    print (" "); 
    print (note5);
    print ("note "); 
    print (6); 
    print (" "); 
    print (note6);
    print ("note "); 
    print (7); 
    print (" "); 
    println (note7);
  */
  } 

  else {
    //   println (" ");
  }

  if  (velocity1>0) {
    /*

    print ("velo "); 
    print (1); 
    print (" "); 
    print (velocity1);
    print ("velo "); 
    print (2); 
    print (" "); 
    print (velocity2);
    print ("velo "); 
    print (3); 
    print (" "); 
    print (velocity3);
    print ("velo "); 
    print (4); 
    print (" "); 
    print (velocity4);
    print ("velo"); 
    print (5); 
    print (" "); 
    println (velocity5);
    print ("velo"); 
    print (6); 
    print (" "); 
    print (velocity6);
    print ("velo"); 
    print (7); 
    print (" "); 
    println (velocity7);
    */
  }

   textSize (50);
  

  //  if  (1!=0) {
  if  (velocity1>0) {
   
    //  String NOTE1= nf (note1, 0, 0); // transform time elapsed betwween two pulsation in BPM
    text (measure, (-width+1350), -height );  
    text ("1", (-width-150), -height );
    text (note1, -width-50+50, -height );
    text ("2", (-width+50+50), -height );
    text (note2, -width+150+50, -height );   
    text ("3", (-width+250+50), -height );
    text (note3, -width+350+50, -height );
    text ("4", (-width+450+50), -height);
    text (note4, -width+550+50, -height );
    text ("5", (-width+650+50), -height);
    text (note5, -width+750+50, -height );
    text ("6", (-width+850+50), -height);
    text (note6, -width+950+50, -height );
    text ("7", (-width+1050+50), -height);
    text (note7, -width+1150+50, -height );

    text (velocity1, -width-50+50, -height+100 );
    text (velocity2, -width+150+50, -height+100 );   
    text (velocity3, -width+350+50, -height+100 );
    text (velocity4, -width+550+50, -height+100 );
    text (velocity5, -width+750+50, -height+100 );
    text (velocity6, -width+950+50, -height+100 );   
    text (velocity7, -width+1150+50, -height+100 );
  } else {
    
    note1=note2=note3=note4=note5=note6=note7=note8=0;
    velocity1=velocity2=velocity3=velocity4=velocity5=velocity6=velocity7=velocity8=0;

    text (measure, (-width+1350), -height );  
    text ("1", (-width-150), -height );
    text (note1, -width-50+50, -height );
    text ("2", (-width+50+50), -height );
    text (note2, -width+150+50, -height );   
    text ("3", (-width+250+50), -height );
    text (note3, -width+350+50, -height );
    text ("4", (-width+450+50), -height);
    text (note4, -width+550+50, -height );
    text ("5", (-width+650+50), -height);
    text (note5, -width+750+50, -height );
    text ("6", (-width+850+50), -height);
    text (note6, -width+950+50, -height );
    text ("7", (-width+1050+50), -height);
    text (note7, -width+1150+50, -height );

    text (velocity1, -width-50+50, -height+100 );
    text (velocity2, -width+150+50, -height+100 );   
    text (velocity3, -width+350+50, -height+100 );
    text (velocity4, -width+550+50, -height+100 );
    text (velocity5, -width+750+50, -height+100 );
    text (velocity6, -width+950+50, -height+100 );   
    text (velocity7, -width+1150+50, -height+100 );
    //println (" ");
  }
  translate (0, height);
}


void oscSend(){

    for (int i = 0; i < networkSize; i++)
     {
        //  encoderTouched[i]=false;
        //  midPos[i]=false;
        //  sendMiddle[i]=0.;
        //  TrigmodPos[i]=0;
        //  numberOfTrig[i]=0;
     }

    if (formerKey == 'ç')
        {
            background(200);
            for (int i = 0; i < networkSize; i++)
             {
             numberOfRota[i]=numberOfTrig[i]=0;
          }
        }

    if ( keyCode == TAB || formerKey == 'a') 
     {

     // encoderTouched[0]=true;
     // TrigmodPos[0]=1;
     // Pos[0]=127;
     
     /*
     numberOfTrig[0]%=8;
     numberOfTrig[0]+=1;
     
     numberOfRota[0]%=8;
     numberOfRota[0]+=1;
     */
     }

    if ( Key == 'z')
     {
     encoderTouched[1]=true;

     instrumentToMute[1]=true;
     /*
     numberOfTrig[1]%=8;
     numberOfTrig[1]+=1;
     */
     /*
     numberOfRota[1]%=8;
     numberOfRota[1]+=1
     */  
     }

    if ( formerKey == 'e')
     {
      /*
     midPos[2]=true;
     sendMiddle[2]=1.;

     numberOfTrig[2]%=8;
     numberOfTrig[2]+=1;
     
     numberOfRota[2]%=8;
     numberOfRota[2]+=1;
     */
     }

     // if ( key == 's')
       if ( keyCode == SHIFT)
     {
     encoderTouched[1]=false;
        TrigmodPos[1]=1;
     sendMiddle[1]=1.;
     Pos[1]=1;
     }
     /*
           if ( keyCode == CONTROL)
     {
     encoderTouched[4]=true;
     sendMiddle[2]=1.;
      TrigmodPos[2]=1;
     }
     */
     if ( key == 'r')
     {
     encoderTouched[5]=true;
     }
      
   
     rotate (-HALF_PI);  
    for (int i = 0; i < networkSize-0; i++)
    {  
     if  ( 1>=1 && formerKeyMetro == '$' && modeStartKeyToFollow !=  " followSignalSampledOppositeWay(frameRatio) ")
     {
       TrigmodPos[i]=1;
       oldPos[i]=(int) Pos[i];
   
       //MIDDLE POINT == between 61 & 65
       if ((oldPos[i]<= 64 && Pos[i] >=63) ||
          (oldPos[i]>= 64 && Pos[i] <=63))
        
       {
        //  patternFromInstrumentWithCenter = networkSize-1-i;
        //  numberOfCenter[patternFromInstrumentWithCenter] += 1;
        //  numberOfCenter[patternFromInstrumentWithCenter] %= 9;
        //  println ( " numberOfCenter " + numberOfCenter[networkSize-1-i]); 


         // text ( " POS " + i + " "  + numberOfCenter[patternFromInstrumentWithCenter] , 500, 500);
         
          dataToLive[i]= (networkSize-1)*(i-0);  // because there i beac you can send data with the step you want to separate controller depending oscillator --> here it is 11.
          dataToLive[0]= (networkSize-1)*(i-0);  // you can send data with the step you want to one controler 
      
         upVelocity[i]= 1;  
         TrigmodPos[i]=0; 
      }
    
       if ( Pos[i] >65 ||
            Pos[i] <61)
             {
              dataToLive[i]=0;
              upVelocity[i]= -1;
              //  TrigmodPos[i]=0; 
 
            } 
         keyCode = BACKSPACE;
      }   
    }


   //  rotate (HALF_PI);  

     downVelocity[1]=  upVelocity[2]* upVelocity[3]* upVelocity[4]* upVelocity[5];//* upVelocity[6];
    
               //       upVelocity[7]* upVelocity[8] * upVelocity[9]* upVelocity[10]* upVelocity[11];
                    
    if ( downVelocity[1]>0)
     { // if one of oscillator is at middle point
       Velocity=1;  
     }
     else 
     {  Velocity=-1;
     } 
     
 //  OscMessage myMessage = new OscMessage("/test");
    OscMessage myMessage = new OscMessage("msg");
    myMessage.add(0); /* add an int to the osc message */
    
   // OscMessage myMessage1 = new OscMessage("/trigLfo");
    // oscP5.send(myMessage1, myRemoteLocationII);
    
    OscMessage myMessage1 = new OscMessage("/led");
    OscMessage myMessage2 = new OscMessage("/led");

    
   float lfoTosend; 
   lfoTosend=0.0;

  if (lastDataLfo!=dataLFO){
    lastDataLfo=dataLFO;
    lfoTosend=1.0;
   }
    // dataLFO = int( millis()*0.001); // sec
    // dataLFO = int( millis()*0.01); // 1/10sec
    dataLFO = int( millis()*0.005); // 1/10sec
    rotate(-PI/2);
     text (  lfoTosend, -1000, -200, 1000);
     trigLfo=lfoTosend;
     myMessage1.add(trigLfo); // called led
     myMessage2.add(1.0-trigLfo); // called led

  // oscP5.send(myMessage1, myRemoteLocation8002);
  // oscP5.send(myMessage2, myRemoteLocation8003);

  //OscMessage myMessage2 = new OscMessage("/Velocity");
  OscMessage myMessage3 = new OscMessage("/cohesion");
  OscMessage myMessage4 = new OscMessage("/speedDelta");
  OscMessage myMessage5 = new OscMessage("/upVelocity10");
  OscMessage myMessage6 = new OscMessage("/upVelocity9");
  OscMessage myMessage7 = new OscMessage("/upVelocity8");
  OscMessage myMessage8 = new OscMessage("/upVelocity7");
  OscMessage myMessage9 = new OscMessage("/upVelocity6");
  OscMessage myMessage10= new OscMessage("/upVelocity5");
  OscMessage myMessage11= new OscMessage("/upVelocity4");
  OscMessage myMessage12= new OscMessage("/upVelocity3");
  OscMessage myMessage13= new OscMessage("/upVelocity2");
  
  OscMessage myMessage14= new OscMessage("/averageDeltaPhase");
  OscMessage myMessage15= new OscMessage("/startStop");
  OscMessage myMessage16= new OscMessage("/addPhase");
  OscMessage myMessage17= new OscMessage("/addPhaseAllMode");
  OscMessage myMessage18= new OscMessage("/mouseX"); // oscillator 
  OscMessage myMessage19= new OscMessage("/mouseY"); // oscillator behind

 
  float j= LevelCohesionToSend*1.0;

  //myMessage.add((map ((j), 0, 1, 1, 127))); /* add an int to the osc message */


  float data10= dataMappedForMotorisedPosition[networkSize-1]*1.0;   
  myMessage2.add(Velocity);
  myMessage3.add(LevelCohesionToSend);

  myMessage4.add(speedDelta);
  //oscP5.send(myMessage4, myRemoteLocationII); //port 8001

  /*
  myMessage4.add(upVelocity[11]);
  myMessage5.add(upVelocity[10]);
  myMessage6.add(upVelocity[9]);
  myMessage7.add(upVelocity[8]);
  myMessage8.add(upVelocity[7]);
  myMessage9.add(upVelocity[6]);
  */

  myMessage10.add(upVelocity[5]);
  myMessage11.add(upVelocity[4]);
  myMessage12.add(upVelocity[3]);
  myMessage13.add(upVelocity[2]);
  
  myMessage14.add(averageDeltaPhase);
  myMessage15.add(startStop);
  myMessage16.add((map (addPhase, -1, 1, 0, 127)));
  myMessage17.add((map (addPhaseAllMode, -1, 1, 0, 127)));  
  myMessage18.add((float) map (mouseX, 0, 800, 0, 127));
  myMessage19.add((float) map (mouseY, 0, 800, 0, 127));
 
 /*
  OscMessage myMessage60= new OscMessage("/fromEncodeurToLive0"); // oscillator SEND 0 or 1
  OscMessage myMessage61= new OscMessage("/fromEncodeurToLive1"); // oscillator 
  OscMessage myMessage62= new OscMessage("/fromEncodeurToLive2"); // oscillator 
  OscMessage myMessage63= new OscMessage("/fromEncodeurToLive3"); // oscillator 
  OscMessage myMessage64= new OscMessage("/fromEncodeurToLive4"); // oscillator 
  OscMessage myMessage65= new OscMessage("/fromEncodeurToLive5"); // oscillato

  myMessage60.add(fromEncodeurToLive[0]);  // 0 or 1;
  myMessage61.add(fromEncodeurToLive[1]);
  myMessage62.add(fromEncodeurToLive[2]);
  myMessage63.add(fromEncodeurToLive[3]);
  myMessage64.add(fromEncodeurToLive[4]);
  myMessage65.add(fromEncodeurToLive[5]);
*/

oldEncodeur[0]= encodeur[0];

/*
  oldEncodeur[0]= encodeur[0];
  encodeur[0]=mouseY*2;
  myMessage60.add(abs (map (encodeur[0], 0, 800, 0, 127)));  // send encodeur
*/

//*******    if ( oldEncodeur[0]<0 && = encodeur[0];)

 
  OscMessage myMessage60= new OscMessage("/encodeur0"); // oscillator SEND 0 or 1
  OscMessage myMessage61= new OscMessage("/encodeur1"); // oscillator 
  OscMessage myMessage62= new OscMessage("/encodeur2"); // oscillator 
  OscMessage myMessage63= new OscMessage("/encodeur3"); // oscillator 
  OscMessage myMessage64= new OscMessage("/encodeur4"); // oscillator 
  OscMessage myMessage65= new OscMessage("/encodeur5"); // oscillato

  myMessage60.add(encodeur[0]);  // 0 to 400
  myMessage61.add(encodeur[1]);
  myMessage62.add(encodeur[2]);
  myMessage63.add(encodeur[3]);
  myMessage64.add(encodeur[4]);
  myMessage65.add(encodeur[5]);

  OscMessage myMessage90= new OscMessage("/numberOfRota0"); // oscillator SEND // 0 to 32 or 64
  OscMessage myMessage91= new OscMessage("/numberOfRota1"); // oscillator 
  OscMessage myMessage92= new OscMessage("/numberOfRota2"); // oscillator 
  OscMessage myMessage93= new OscMessage("/numberOfRota3"); // oscillator 
  OscMessage myMessage94= new OscMessage("/numberOfRota4"); // oscillator 
  OscMessage myMessage95= new OscMessage("/numberOfRota5"); // oscillato

  myMessage90.add(numberOfRota[0]);  // // 0 to 32 or 64
  myMessage91.add(numberOfRota[1]);
  myMessage92.add(numberOfRota[2]);
  myMessage93.add(numberOfRota[3]);
  myMessage94.add(numberOfRota[4]);
  myMessage95.add(numberOfRota[5]);

  // numberOfTrig

  OscMessage myMessage100= new OscMessage("/numberOfTrig0"); // oscillator SEND // 0 to 32 or 64
  OscMessage myMessage101= new OscMessage("/numberOfTrig1"); // oscillator 
  OscMessage myMessage102= new OscMessage("/numberOfTrig2"); // oscillator 
  OscMessage myMessage103= new OscMessage("/numberOfTrig3"); // oscillator 
  OscMessage myMessage104= new OscMessage("/numberOfTrig4"); // oscillator 
  OscMessage myMessage105= new OscMessage("/numberOfTrig5"); // oscillato

  myMessage100.add(numberOfTrig[0]);  // 0 to 32 or 64
  myMessage101.add(numberOfTrig[1]);
  myMessage102.add(numberOfTrig[2]);
  myMessage103.add(numberOfTrig[3]);
  myMessage104.add(numberOfTrig[4]);
  myMessage105.add(numberOfTrig[5]);

   // trigSound

  OscMessage myMessage106= new OscMessage("/trigSound0"); // oscillator SEND // 0 to 32 or 64
  OscMessage myMessage107= new OscMessage("/trigSound1"); // oscillator 
  OscMessage myMessage108= new OscMessage("/trigSound2"); // oscillator 
  OscMessage myMessage109= new OscMessage("/trigSound3"); // oscillator 
  OscMessage myMessage110= new OscMessage("/trigSound4"); // oscillator 
  OscMessage myMessage111= new OscMessage("/trigSound5"); // oscillato

  myMessage106.add(trigSound[0]);  // 0 to 32 or 64
  myMessage107.add(trigSound[1]);
  myMessage108.add(trigSound[2]);
  myMessage109.add(trigSound[3]);
  myMessage110.add(trigSound[4]);
  myMessage111.add(trigSound[5]);

    // instrumentToMute

  OscMessage myMessage120= new OscMessage("/instrumentToMute0"); // oscillator SEND // 0 to 32 or 64
  OscMessage myMessage121= new OscMessage("/instrumentToMute1"); // oscillator 
  OscMessage myMessage122= new OscMessage("/instrumentToMute2"); // oscillator 
  OscMessage myMessage123= new OscMessage("/instrumentToMute3"); // oscillator 
  OscMessage myMessage124= new OscMessage("/instrumentToMute4"); // oscillator 
  OscMessage myMessage125= new OscMessage("/instrumentToMute5"); // oscillato

  myMessage120.add(instrumentToMute[0]);  // 0 to 32 or 64
  myMessage121.add(instrumentToMute[1]);
  myMessage122.add(instrumentToMute[2]);
  myMessage123.add(instrumentToMute[3]);
  myMessage124.add(instrumentToMute[4]);
  myMessage125.add(instrumentToMute[5]);

  oscP5.send(myMessage120, myRemoteLocation); 
  oscP5.send(myMessage121, myRemoteLocation); 
  oscP5.send(myMessage122, myRemoteLocation); 
  oscP5.send(myMessage123, myRemoteLocation); 
  oscP5.send(myMessage124, myRemoteLocation); 
  oscP5.send(myMessage125, myRemoteLocation); 

  oscP5.send(myMessage106, myRemoteLocationII); 
  oscP5.send(myMessage107, myRemoteLocationII); 
  oscP5.send(myMessage108, myRemoteLocationII); 
  oscP5.send(myMessage109, myRemoteLocationII); 
  oscP5.send(myMessage110, myRemoteLocationII); 
  oscP5.send(myMessage111, myRemoteLocationII); 

  // encodeur works with modeOfControlDr= " virtual "

  OscMessage myMessage130= new OscMessage("/encodeur0"); // encodeur
  OscMessage myMessage131= new OscMessage("/encodeur1"); // oscillator 
  OscMessage myMessage132= new OscMessage("/encodeur2"); // oscillator 
  OscMessage myMessage133= new OscMessage("/encodeur3"); // oscillator 
  OscMessage myMessage134= new OscMessage("/encodeur4"); // oscillator 
  OscMessage myMessage135= new OscMessage("/encodeur5"); // oscillato

  myMessage130.add(encodeur[0]);  // 0 to 32 or 64
  myMessage131.add(encodeur[1]);
  myMessage132.add(encodeur[2]);
  myMessage133.add(encodeur[3]);
  myMessage134.add(encodeur[4]);
  myMessage135.add(encodeur[5]);

  oscP5.send(myMessage130, myRemoteLocation); 
  oscP5.send(myMessage131, myRemoteLocation); 
  oscP5.send(myMessage132, myRemoteLocation); 
  oscP5.send(myMessage133, myRemoteLocation); 
  oscP5.send(myMessage134, myRemoteLocation); 
  oscP5.send(myMessage135, myRemoteLocation); 

  // counter, rev

  OscMessage myMessage140= new OscMessage("/countControlDr0"); // countControlDr
  OscMessage myMessage141= new OscMessage("/countControlDr1"); // oscillator 
  OscMessage myMessage142= new OscMessage("/countControlDr2"); // oscillator 
  OscMessage myMessage143= new OscMessage("/countControlDr3"); // oscillator 
  OscMessage myMessage144= new OscMessage("/countControlDr4"); // oscillator 
  OscMessage myMessage145= new OscMessage("/countControlDr5"); // oscillato
  OscMessage myMessage146= new OscMessage("/countControlDr6"); // countControlDr
  OscMessage myMessage147= new OscMessage("/countControlDr7"); // oscillator 
  OscMessage myMessage148= new OscMessage("/countControlDr8"); // oscillator 
  OscMessage myMessage149= new OscMessage("/countControlDr9"); // oscillator 
  OscMessage myMessage150= new OscMessage("/countControlDr10"); // oscillator 

  myMessage140.add(countControlDr[0]);  //
  myMessage141.add(countControlDr[1]);
  myMessage142.add(countControlDr[2]);
  myMessage143.add(countControlDr[3]);
  myMessage144.add(countControlDr[4]);
  myMessage145.add(countControlDr[5]);
  myMessage146.add(countControlDr[6]);
  myMessage147.add(countControlDr[7]);
  myMessage148.add(countControlDr[8]);
 // myMessage149.add(countControlDr[9]);

  oscP5.send(myMessage140, myRemoteLocation); 
  oscP5.send(myMessage141, myRemoteLocation); 
  oscP5.send(myMessage142, myRemoteLocation); 
  oscP5.send(myMessage143, myRemoteLocation); 
  oscP5.send(myMessage144, myRemoteLocation); 
  oscP5.send(myMessage145, myRemoteLocation); 
  oscP5.send(myMessage146, myRemoteLocation); 
  oscP5.send(myMessage147, myRemoteLocation); 
  oscP5.send(myMessage148, myRemoteLocation); 
  oscP5.send(myMessage149, myRemoteLocation); 
 
 


  JoDebug  ="<" // BPM9   
   // + (dataMappedForMotorisedPosition[11])+","+dataMappedForMotorisedPosition[10]+","+(dataMappedForMotorisedPosition[9])+","+dataMappedForMotorisedPosition[8]+","+dataMappedForMotorisedPosition[7]+","
   // + dataMappedForMotorisedPosition[6]+","
    +( dataMappedForMotorisedPosition[5])+","+dataMappedForMotorisedPosition[4]+","+dataMappedForMotorisedPosition[3]+","+dataMappedForMotorisedPosition[2]+","
    + ">";
     
  OscMessage myMessage20= new OscMessage("/position0"); // oscillator front
  OscMessage myMessage21= new OscMessage("/position1"); // oscillator 
  OscMessage myMessage22= new OscMessage("/position2"); // oscillator 
  OscMessage myMessage23= new OscMessage("/position3"); // oscillator 
  OscMessage myMessage24= new OscMessage("/position4"); // oscillator 
  OscMessage myMessage25= new OscMessage("/position5"); // oscillato
  OscMessage myMessage26= new OscMessage("/position6"); // oscillator 
  OscMessage myMessage27= new OscMessage("/position7"); // oscillator 
  OscMessage myMessage28= new OscMessage("/position8"); // oscillator 
  OscMessage myMessage29= new OscMessage("/position9"); // oscillator behind
   /*
  OscMessage myMessage30= new OscMessage("/decompte11"); // oscillator SEND TRIG NOTE IN MAX4LIVE
  OscMessage myMessage31= new OscMessage("/decompte10"); // oscillator 
  OscMessage myMessage32= new OscMessage("/decompte9"); // oscillator 
  OscMessage myMessage33= new OscMessage("/decompte8"); // oscillator 
  OscMessage myMessage34= new OscMessage("/decompte7"); // oscillator 
  OscMessage myMessage35= new OscMessage("/decompte6"); // oscillato
  OscMessage myMessage36= new OscMessage("/decompte5"); // oscillator 
  OscMessage myMessage37= new OscMessage("/decompte4"); // oscillator 
  OscMessage myMessage38= new OscMessage("/decompte3"); // oscillator 
  OscMessage myMessage39= new OscMessage("/decompte2"); // oscillator behind
  */

  OscMessage myMessage50= new OscMessage("/acceleration0"); // oscillator SEND ACCELERATION
  OscMessage myMessage51= new OscMessage("/acceleration1"); // oscillator 
  OscMessage myMessage52= new OscMessage("/acceleration2"); // oscillator 
  OscMessage myMessage53= new OscMessage("/acceleration3"); // oscillator 
  OscMessage myMessage54= new OscMessage("/acceleration4"); // oscillator 
  OscMessage myMessage55= new OscMessage("/acceleration5"); // oscillato
  OscMessage myMessage56= new OscMessage("/acceleration6"); // oscillator 
  OscMessage myMessage57= new OscMessage("/acceleration7"); // oscillator 
  OscMessage myMessage58= new OscMessage("/acceleration8"); // oscillator 
  OscMessage myMessage59= new OscMessage("/acceleration9"); // oscillator behind

  OscMessage myMessage70= new OscMessage("/numberOfCenter0"); //  SEND 1 oscillatorTouched
  OscMessage myMessage71= new OscMessage("/numberOfCenter1"); // oscillator 
  OscMessage myMessage72= new OscMessage("/numberOfCenter2"); // oscillator 
  OscMessage myMessage73= new OscMessage("/numberOfCenter3"); // oscillator 
  OscMessage myMessage74= new OscMessage("/numberOfCenter4"); // oscillator 
  OscMessage myMessage75= new OscMessage("/numberOfCenter5"); // oscillato
  OscMessage myMessage76= new OscMessage("/numberOfCenter6"); // oscillator 

  myMessage70.add(numberOfCenter[0]);
  myMessage71.add(numberOfCenter[1]);
  myMessage72.add(numberOfCenter[2]);
  myMessage73.add(numberOfCenter[3]);
  myMessage74.add(numberOfCenter[4]);
  myMessage75.add(numberOfCenter[5]);

  if  (systemForBigMachine==false)
  {
  myMessage20.add(Pos[0]);
  myMessage21.add(Pos[1]);
  myMessage22.add(Pos[2]);
  myMessage23.add(Pos[3]);
  myMessage24.add(Pos[4]);
  myMessage25.add(Pos[5]);
  }

  if  (systemForBigMachine==true)
  {
  myMessage20.add(Pos[0]);
  myMessage21.add(Pos[1]);
  myMessage22.add(Pos[2]);
  myMessage23.add(Pos[3]);
  myMessage24.add(Pos[4]);
  myMessage25.add(Pos[5]);
  myMessage26.add(Pos[6]);
  myMessage27.add(Pos[7]);
  myMessage28.add(Pos[8]);

  if (networkSize==10)
  {
   myMessage29.add(Pos[9]);
  }
  }

 /*  
  myMessage30.add(Pos[9]);
  myMessage31.add(Pos[8]);
  myMessage32.add(Pos[7]);
  myMessage33.add(Pos[6]);
  myMessage34.add(Pos[5]);
  myMessage35.add(Pos[4]);
  myMessage36.add(Pos[3]);
  myMessage37.add(Pos[2]);
  myMessage38.add(Pos[1]);
  myMessage39.add(Pos[0]);
 */

  //print ( " showTrig ") ; showArray(TrigmodPos);
  //text ( " Trig0 " + TrigmodPos[0], 600, 200);
  //text ( " Trig5 " + TrigmodPos[5], 600, 400);
  // These tests used a copy of the original array so that we can perform multiple
  // test using the same working array
  //  println("Convert multiple 0s to 1s (good)");

// in main

  
    /*
        myMessage30.add(TrigmodPos[0]);  // Trig on the right but there are bugs in pendular way
        myMessage31.add(TrigmodPos[1]);
        myMessage32.add(TrigmodPos[2]);
        myMessage33.add(TrigmodPos[3]);
        myMessage34.add(TrigmodPos[4]);
        myMessage35.add(TrigmodPos[5]);
    */

   int trigMuteAll;
   trigMuteAll=1;

  if (TrigmodPos[0]==0|| TrigmodPos[1]==0 || TrigmodPos[2]==0 || TrigmodPos[3]==0 || TrigmodPos[4]==0 || TrigmodPos[5]==0)
  {
    trigMuteAll= 0;
  }
  OscMessage myMessage30= new OscMessage("/trigModPos0"); // oscillator SEND TRIG NOTE IN MAX4LIVE
  OscMessage myMessage31= new OscMessage("/trigModPos1"); // oscillator 
  OscMessage myMessage32= new OscMessage("/trigModPos2"); // oscillator 
  OscMessage myMessage33= new OscMessage("/trigModPos3"); // oscillator 
  OscMessage myMessage34= new OscMessage("/trigModPos4"); // oscillator 
  OscMessage myMessage35= new OscMessage("/trigModPos5"); // oscillato
  OscMessage myMessage36= new OscMessage("/trigMuteAll"); // oscillator 
  OscMessage myMessage37= new OscMessage("/posAverage"); // oscillator 
  OscMessage myMessage38= new OscMessage("/trigModPos8"); // oscillator 
  OscMessage myMessage39= new OscMessage("/trigModPos9"); // oscillator behind 

  //text ( " trigMuteAll " + trigMuteAll + " dataMappedBigMachine[0] " + dataMappedForMotorisedBigMachine[0] ,  600, -1100);
     
  myMessage30.add(TrigmodPos[0]);  // Trig on the right but there are bugs in pendular way
  myMessage31.add(TrigmodPos[1]);
  myMessage32.add(TrigmodPos[2]);
  myMessage33.add(TrigmodPos[3]);
  myMessage34.add(TrigmodPos[4]);
  myMessage35.add(TrigmodPos[5]);
  myMessage36.add(trigMuteAll);
  myMessage37.add(posAverage);
  /*
  myMessage37.add(TrigmodPos[6]);
  myMessage38.add(TrigmodPos[7]);
  myMessage39.add(TrigmodPos[8]);
  */

  OscMessage myMessage40= new OscMessage("/midPos0"); // SEND TRIG NOTE IN MAX4LIVE
  OscMessage myMessage41= new OscMessage("/midPos1"); // SEND TRIG NOTE IN MAX4LIVE
  OscMessage myMessage42= new OscMessage("/midPos2"); // SEND TRIG NOTE IN MAX4LIVE
  OscMessage myMessage43= new OscMessage("/midPos3"); // SEND TRIG NOTE IN MAX4LIVE
  OscMessage myMessage44= new OscMessage("/midPos4"); // SEND TRIG NOTE IN MAX4LIVE
  OscMessage myMessage45= new OscMessage("/midPos5"); // SEND TRIG NOTE IN MAX4LIVE
  OscMessage myMessage46= new OscMessage("/dataToLive6"); // oscillator 
  OscMessage myMessage47= new OscMessage("/dataToLive7"); // oscillator 
  OscMessage myMessage48= new OscMessage("/dataToLive8"); // oscillator 
  OscMessage myMessage49= new OscMessage("/dataToLive9"); // oscillator behind


       

 /*
  myMessage40.add(dataToLive[11]);  // Trig on the right but there are bugs in pendular way
  myMessage41.add(dataToLive[10]);
  myMessage42.add(dataToLive[9]);
  myMessage43.add(dataToLive[8]);
  myMessage44.add(dataToLive[7]);
  myMessage45.add(dataToLive[6]);

  */ 
  myMessage46.add(dataToLive[5]);
  myMessage47.add(dataToLive[4]);
  myMessage48.add(dataToLive[3]);
  myMessage49.add(dataToLive[2]);
//  myMessage50.add(dataToLive[0]);

 /*
  myMessage50.add(mapAcceleration[11]);  // Trig on the right but there are bugs in pendular way
  myMessage51.add(mapAcceleration[10]);
  myMessage52.add(mapAcceleration[9]);
  myMessage53.add(mapAcceleration[8]);
  myMessage54.add(mapAcceleration[7]);
  myMessage55.add(mapAcceleration[6]);
  */
  myMessage56.add(mapAcceleration[5]);
  myMessage57.add(mapAcceleration[4]);
  myMessage58.add(mapAcceleration[3]);
  myMessage59.add(mapAcceleration[2]);
 // myMessage60.add(mapAcceleration[1]);
    
   
  //  UNCOMMENT to BEGIN TO USE good useful OSC
  // /* myRemoteLocation to port 8000

  oscP5.send(myMessage,  myRemoteLocation); 
  oscP5.send(myMessage1, myRemoteLocation); 
  oscP5.send(myMessage2, myRemoteLocation); 
  oscP5.send(myMessage3, myRemoteLocation); 

  oscP5.send(myMessage4, myRemoteLocation); 
  oscP5.send(myMessage5, myRemoteLocation); 
  oscP5.send(myMessage6, myRemoteLocation); 
  oscP5.send(myMessage7, myRemoteLocation); 
  oscP5.send(myMessage8, myRemoteLocation); 
  oscP5.send(myMessage9, myRemoteLocation); 
  oscP5.send(myMessage10, myRemoteLocation); 
  oscP5.send(myMessage11, myRemoteLocation); 
  oscP5.send(myMessage12, myRemoteLocation); 
  oscP5.send(myMessage13, myRemoteLocation); 
  

  oscP5.send(myMessage14, myRemoteLocation);
  oscP5.send(myMessage15, myRemoteLocation); 
  oscP5.send(myMessage16, myRemoteLocation); 
  oscP5.send(myMessage17, myRemoteLocation); 

  oscP5.send(myMessage18, myRemoteLocation); 
  oscP5.send(myMessage19, myRemoteLocation); 



  // myRemoteLocationII port 8001  //position0 to position9
  
  oscP5.send(myMessage20, myRemoteLocationII);
  oscP5.send(myMessage21, myRemoteLocationII);
  oscP5.send(myMessage22, myRemoteLocationII);
  oscP5.send(myMessage23, myRemoteLocationII);
  oscP5.send(myMessage24, myRemoteLocationII);
  oscP5.send(myMessage25, myRemoteLocationII);
  oscP5.send(myMessage26, myRemoteLocationII);
  oscP5.send(myMessage27, myRemoteLocationII);
  oscP5.send(myMessage28, myRemoteLocationII);
  oscP5.send(myMessage29, myRemoteLocationII);

  // myRemoteLocation9000 port 9000 to 9009  //position0 to position9

  oscP5.send(myMessage20, myRemoteLocation9000);
  oscP5.send(myMessage21, myRemoteLocation9001);
  oscP5.send(myMessage22, myRemoteLocation9002);
  oscP5.send(myMessage23, myRemoteLocation9003);


   //  END TO USE, NOT BELOW, END OF UNCOMMENT


    // myRemoteLocation port 8000  data to live  //*** /*
  oscP5.send(myMessage30, myRemoteLocation);
  oscP5.send(myMessage31, myRemoteLocation);
  oscP5.send(myMessage32, myRemoteLocation);
  oscP5.send(myMessage33, myRemoteLocation);
  oscP5.send(myMessage34, myRemoteLocation);
  oscP5.send(myMessage35, myRemoteLocation);
  oscP5.send(myMessage36, myRemoteLocation);
  oscP5.send(myMessage37, myRemoteLocation);
  oscP5.send(myMessage38, myRemoteLocation);
  oscP5.send(myMessage39, myRemoteLocation);

 // encodeur position 
  oscP5.send(myMessage60, myRemoteLocation);
  oscP5.send(myMessage61, myRemoteLocation);
  oscP5.send(myMessage62, myRemoteLocation);
  oscP5.send(myMessage63, myRemoteLocation);
  oscP5.send(myMessage64, myRemoteLocation);
  oscP5.send(myMessage65, myRemoteLocation);

  // encodeur center
  oscP5.send(myMessage70, myRemoteLocation);
  oscP5.send(myMessage71, myRemoteLocation);
  oscP5.send(myMessage72, myRemoteLocation);
  oscP5.send(myMessage73, myRemoteLocation);
  oscP5.send(myMessage74, myRemoteLocation);
  oscP5.send(myMessage75, myRemoteLocation);

  // encoder numberOfRota
  oscP5.send(myMessage90, myRemoteLocation);
  oscP5.send(myMessage91, myRemoteLocation);
  oscP5.send(myMessage92, myRemoteLocation);
  oscP5.send(myMessage93, myRemoteLocation);
  oscP5.send(myMessage94, myRemoteLocation);
  oscP5.send(myMessage95, myRemoteLocation);

  // encoder numberOfRota
  oscP5.send(myMessage100, myRemoteLocation); 
  oscP5.send(myMessage101, myRemoteLocation); 
  oscP5.send(myMessage102, myRemoteLocation); 
  oscP5.send(myMessage103, myRemoteLocation); 
  oscP5.send(myMessage104, myRemoteLocation); 
  oscP5.send(myMessage105, myRemoteLocation); 

  //  trigSound
  oscP5.send(myMessage106, myRemoteLocation); 
  oscP5.send(myMessage107, myRemoteLocation); 
  oscP5.send(myMessage108, myRemoteLocation); 
  oscP5.send(myMessage109, myRemoteLocation); 
  oscP5.send(myMessage110, myRemoteLocation); 
  oscP5.send(myMessage111, myRemoteLocation); 

  /*
  oscP5.send(myMessage112, myRemoteLocation); 
  oscP5.send(myMessage113, myRemoteLocation); 
  */



/*
  OscMessage myMessage81= new OscMessage("/SignFromAbleton[2]"); // oscillator behind
  myMessage81.add(trigedSignFromAbleton[1]);  // Trig on the right but there are bugs in pendular way
  oscP5.send(myMessage81, myRemoteLocation);

  OscMessage myMessage82= new OscMessage("/SignFromAbleton[2]"); // oscillator behind
  myMessage81.add(trigedSignFromAbleton[2]);  // Trig on the right but there are bugs in pendular way
  oscP5.send(myMessage82, myRemoteLocation);
 */ 

   // myRemoteLocationII port 8002

  // middleSend
  oscP5.send(myMessage40, myRemoteLocationII);
  oscP5.send(myMessage41, myRemoteLocationII);
  oscP5.send(myMessage42, myRemoteLocationII);
  oscP5.send(myMessage43, myRemoteLocationII);
  oscP5.send(myMessage44, myRemoteLocationII);
  oscP5.send(myMessage45, myRemoteLocationII);
  oscP5.send(myMessage46, myRemoteLocationII);
  oscP5.send(myMessage47, myRemoteLocationII);
  oscP5.send(myMessage48, myRemoteLocationII);
  oscP5.send(myMessage49, myRemoteLocationII);
  oscP5.send(myMessage50, myRemoteLocationII);
  
  // acceleration
  /*
  oscP5.send(myMessage50, myRemoteLocation3);
  oscP5.send(myMessage51, myRemoteLocation3);
  oscP5.send(myMessage52, myRemoteLocation3);
  oscP5.send(myMessage53, myRemoteLocation3);
  oscP5.send(myMessage54, myRemoteLocation3);
  oscP5.send(myMessage55, myRemoteLocation3);
  oscP5.send(myMessage56, myRemoteLocation3);
  oscP5.send(myMessage57, myRemoteLocation3);
  oscP5.send(myMessage58, myRemoteLocation3);
  oscP5.send(myMessage59, myRemoteLocation3);
  
   // myRemoteLocation port 8000
   
    oscP5.send(myMessage50, myRemoteLocation);
  oscP5.send(myMessage51, myRemoteLocation);
  oscP5.send(myMessage52, myRemoteLocation);
  oscP5.send(myMessage53, myRemoteLocation);
  oscP5.send(myMessage54, myRemoteLocation);
  oscP5.send(myMessage55, myRemoteLocation);
  oscP5.send(myMessage56, myRemoteLocation);
  oscP5.send(myMessage57, myRemoteLocation);
  oscP5.send(myMessage58, myRemoteLocation);
  oscP5.send(myMessage59, myRemoteLocation);
*/
 
 
}
