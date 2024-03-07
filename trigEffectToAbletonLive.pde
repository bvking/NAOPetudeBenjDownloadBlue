int[] fromEncodeurToLive = new int[networkSize];
boolean[] trigEffectTo = new boolean[networkSize];
boolean[] trigEffectBisTo = new boolean[networkSize];
int[] timeTriggedFromEncodeur = new int[networkSize];
int[] startMeasureFromEncodeur = new int[networkSize];
int[] recEncodeurPosition = new int[networkSize];
boolean[] oldEncoderTouched = new boolean[networkSize];

void sendPositionToLiveFromTouchedEncodeurNetworkSizeOnly() {
       for (int i = 0; i < networkSize; i++) { 


       // encoderTouched[i] =  false;
            oldEncoderTouched[i]=encoderTouched[i];
            
        if (encoderTouched[i] ==  true)
         { 

          encodeurPosition[i]=(int) map(encodeur[i], 0, 4000, 0, 4000);
          recEncodeurPosition[i]=encodeurPosition[i];
            
            println("Main Found encodeur A MATCH in " + i + " " + encoderTouched[i] + " " + encodeur[i]); 
            text("ENCODEUR TOUCHED " + i + " " + encoderTouched[i] + " " + encodeur[i], -1000, 1*i*200);  




            //Pos[i] = (int) map(encodeur[i], 0, 800, 0, 127);

          //  println(" sendPositionToLive " + encoderTouched[i] + " " + Pos[i]);  
 
         }
             if ( oldEncoderTouched[i] == encoderTouched[i])
          { 
           //   text("ENCODEUR MATCH " + i + " " + encoderTouched[i] + " " + encodeur[i], -1000, 1*i*200);  

           }
         
          println("MIDDLE POSITION NOTT MATCH in " + i + " " + midPos[i] + " " + midPos[i]); 

        if (midPos[i] ==  true)
         { 
          println("MIDDLE POSITION GOOD MATCH in " + i + " " + midPos[i] + " " + midPos[i]);  
         }

    } 
}

void trigMiddlePositionFromEncodeur()
{
 int mapRatio= 400;
 textSize(100);
 rotate(-HALF_PI);
    for (int i = 0; i < networkSize; i++) { 
         midPos[i] =  false;
         oldEncodeurPosition[i]=encodeurPosition[i];      
         encodeurPosition[i]=(int) map(encodeur[i], 0, 4000, 0, mapRatio);

         text ( " trigMid " + oldEncodeurPosition[i] + " " + encodeurPosition[i], -1000, 1*i*100);
  
        if ((oldEncodeurPosition[i]<mapRatio/2 && encodeurPosition[i]>mapRatio/2)) 
       {
         midPos[i] =  true;
        text("MIDDLE POSITION GOD2 MATCH in " + i + " " + midPos[i] + " " + midPos[i] , -1000, 1*i*100);  

       }

        if ((oldEncodeurPosition[i]>mapRatio/2 && encodeurPosition[i]<mapRatio/2)) 
       {
         midPos[i] =  true;
       }

         text (oldEncodeurPosition[i] + " " + encodeurPosition[i] + " " +  midPos[i], 100, 200*i);
    }
    rotate(HALF_PI);
}

void trigEffectToAbletonLive() {

  
    if (oldEncodeur[0] != encodeur[0]) {   
        trigEffectTo[0] = true;
        textSize(150);
        timeTriggedFromEncodeur[0] = millis(); // NOT USED
        trigEffectBisTo[0] = true;
        fromEncodeurToLive[0] = 1;
        
        }
    else trigEffectTo[0] = false;
    
    if (trigEffectBisTo[0] ==  true && beatTrigged ==  true) {
        startMeasureFromEncodeur[0] = measure;
        textSize(400);
        trigEffectBisTo[0] = false;  
        }
    
    if (measure ==  startMeasureFromEncodeur[0] + 2) {   
        textSize(200);
        fromEncodeurToLive[0] = 0;
        }
    text(" trigEffectTo[0] " + trigEffectTo[0] + " fromEncodeurToLive[0] " + fromEncodeurToLive[0] +  " encodeur[0] " + encodeur[0] , -300, 700);
    
    oldEncodeur[0] = encodeur[0];
    
    /*
    if (oldEncodeur[1] != encodeur[1]) {   
    trigEffectTo[1] = true;
    textSize(150);
    timeTriggedFromEncodeur[1] = millis(); // NOT USED
    trigEffectBisTo[1] = true;
    fromEncodeurToLive[1] = 1;
    
    }
    else trigEffectTo[1] = false;
    
    if (trigEffectBisTo[1] ==  true && beatTrigged ==  true) {
    startMeasureFromEncodeur[1] = measure;
    textSize(400); 
    trigEffectBisTo[1] = false; 
    }
    
    if (measure ==  startMeasureFromEncodeur[1] + 2) {   
    textSize(200);
    fromEncodeurToLive[1] = 0;
    }
    text(" trigEffectTo[1]" + trigEffectTo[1] + " fromEncodeurToLive[1]"  + fromEncodeurToLive[1] +  " encodeur[1] " + encodeur[1] , -300, 800);
    
    oldEncodeur[1] = encodeur[1];
    
    */
    
    
    
    
    } 






void trigEffectToAbletonLiveArray() { 
    
    /*
    
    for (int j = 0; j < networkSize; j++)  {
    
    for (int i = j; i < j + 1; i++) {
    
    if (oldEncodeur[i] != encodeur[i]) {   
    trigEffectTo[i] = true;
    textSize(150);
    timeTriggedFromEncodeur[i] = millis(); // NOT USED
    trigEffectBisTo[i] = true;
    fromEncodeurToLive[i] = 1;
    
    }
    else trigEffectTo[i] = false;
    
    if (trigEffectBisTo[i] ==  true && beatTrigged ==  true) {
    startMeasureFromEncodeur[i] = measure;
    textSize(400); 
    trigEffectBisTo[i] = false;  
    }
    
    if (measure ==  startMeasureFromEncodeur[i] + 2) {   
    textSize(200);
    fromEncodeurToLive[i] = 0;
    }
    
    oldEncodeur[i] = encodeur[i];
    
    
    
    }
    text ( j + " fromEncodeurToLive[j] " + fromEncodeurToLive[j] +  " encodeur[j] " + encodeur[j] , -300, 700 + 100 * j);
    
    }
    */  
    } 
