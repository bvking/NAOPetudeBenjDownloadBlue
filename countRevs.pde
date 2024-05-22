void countRevsPhaseMappedPositiveOnly() { // ============================================= Ter NE PAS TOUCHER LE COMPTEUR ou Reduire l'espace avant et apres 0 pour eviter bug à grande vitesse
    print("                                                                 VELOCI    oldd ");
    showArray(oldOldVelocityBis);
    print("oldV ");
    showArray(oldVelocityBis);
    print("vBis ");
    showArray(velocityBis);
    print(" c ");
    showArray(countControlDr);
    println();
    print("oldOldPositionToMotors ");
    showArray(oldOldPositionToMotor);
    print(" oldPositionToMotor ");
    showArray(oldPositionToMotor);
    print("  positionToMotor ");
    showArray( positionToMotor);
    println();
    
    
    onOFF = 0;
    
    
    for (int i = 0; i < networkSize; i++)
    {
        TrigmodPos[i] = 1; ///no beacuse TrigmodPos is allready in countRevs
        trigSound[i] = 0;
        
        if 
           (
            //1 >=  1
            
            (// test A
            (oldOldPositionToMotor[i] < 0.5 * numberOfStep/2 && oldOldPositionToMotor[i]>=0)  && (positionToMotor[i] > 0.75 * numberOfStep/1 )
            &&
            ( (positionToMotor[i] >  oldOldPositionToMotor[i]) )
            &&
              (positionToMotor[i] >  oldPositionToMotor[i]) 
            ) 
            /*
            ||
            (// test B
            (oldOldPositionToMotor[i] < 0.5 * numberOfStep/2 && oldOldPositionToMotor[i]>=0) && (oldPositionToMotor[i] > 0.75 * numberOfStep/1 )
            &&
            ((positionToMotor[i] <  oldPositionToMotor[i] ) && ( oldPositionToMotor[i]>=positionToMotor[i]) )
            
            &&
            (  // not test A 
            (!
            (oldOldPositionToMotor[i] < 0.5 * numberOfStep/2 && oldOldPositionToMotor[i]>=0)  && (positionToMotor[i] > 0.75 * numberOfStep/1 )
            &&
            ( (positionToMotor[i] >  oldOldPositionToMotor[i]) )
            )
            ) 
            )
            */
           
           )
                {
            
            onOFF = 1;
            countControlDr[i]--;
            rev[i]--;
            text (" YOUR HERE ---" + rev[i], 200, -900+(i*100));
            TrigmodPos[i]=0;
            trigSound[i]=1;         
            decompte[i] = -1;  // RESET COUNTER AT 0
           }         
      
        // increment caused by positive angular velocity________________ both positive angles || both negative angles || negative-to-positive angle
        
        if 
           ( 
            
           (// test A
           (positionToMotor[i] < 0.5 * numberOfStep / 2 && positionToMotor[i] >=  0)  && (oldOldPositionToMotor[i] > 0.75 * numberOfStep / 1)
            && 
           ((oldOldPositionToMotor[i] >  oldPositionToMotor[i]))
           ) 
            
            || 
           (// test B
           (positionToMotor[i] < 0.5 * numberOfStep / 2 && positionToMotor[i]>= 0)  && (oldPositionToMotor[i] > 0.75 * numberOfStep / 1)
            && 
           ((oldOldPositionToMotor[i] <  oldPositionToMotor[i]) && (oldPositionToMotor[i]>= positionToMotor[i]))
            
            && 
           ( // not test A
           ( !  
           (positionToMotor[i] < 0.5 * numberOfStep / 2 && positionToMotor[i]>= 0)  && (oldOldPositionToMotor[i] > 0.75 * numberOfStep / 1)
            && 
           ((oldOldPositionToMotor[i] >  oldPositionToMotor[i]))
           )
           ) 
           )
            
            
           )
        {
            onOFF = 1;
            countControlDr[i]++;
              rev[i]++;
              text(" YOUR HERE ++++" + rev[i], 200, -900 + (i * 100));
             revolution[i] = 0;
             TrigmodPos[i] = 0;
             trigSound[i] = 1;
        
             decompte[i] = 0;  // RESET COUNTER AT 0
        } else
     {
        
        decompte[i]  ++; //START COUNTER when a REVOLUTION START OR FINISH
        revolution[i] = 1;     
     }
   }
}


void countRevsSpecialOldPhase() { // ============================================= Ter NE PAS TOUCHER LE COMPTEUR ou Reduire l'espace avant et apres 0 pour eviter bug à grande vitesse

onOFF = 0;

for (int i = 0; i < networkSize; i++) {
    
    if (
       ((OldSpecialPhase[i] < 0.25 * PI && OldSpecialPhase[i] > 0)  && (specialPhase[i] > - 0.25 * PI && specialPhase[i] <0))  || 
        
        
       (OldSpecialPhase[i] < - 1.75 * PI && specialPhase[i] > - 0.25 * PI)// ||
        //(OldSpecialPhase[i] < 0.25 * PI && specialPhase[i] > -0.25 * PI)
       ) {
        onOFF = 1;
        //TrigmodPos[i]=0;
        rev[i]--;
        //print (" revultion negative  "); println (revolution[i]=i+1);
        //revolution[i]=i+1;
        revolution[i] = 0; // trig 0 to sent 0 in Max4Live
        //**    memoryi=i;
        
        
        decompte[i] = -1; // // RESET COUNTER AT 0 (i know it's strange, otherwise with 0 it begin at 1, not 0)
    } else { // if you do twice there is a funny bug
    }
    
    
    // increment caused by positive angular velocity
    // both positive angles || both negative angles || negative-to-positive angle
    
    if (
       ((OldSpecialPhase[i] > - 0.25 * PI && OldSpecialPhase[i] < 0)  && (specialPhase[i] < 0.25 * PI && specialPhase[i] >0))  || 
       (OldSpecialPhase[i] > 1.75 * PI && specialPhase[i] < 0.25 * PI)
       ) {
        onOFF = 1;
        //TrigmodPos[i]=0;
        rev[i]++;
        //revolution[i]=i+1;
        revolution[i] = 0;   // trig 0 to sent 0 in Max4Live
        decompte[i] = 0;  // RESET COUNTER AT 0
    } else {
        
        decompte[i]  ++; //START COUNTER when a REVOLUTION START OR FINISH
        revolution[i] = 1;
    }
}
}


void countRevs() { // ============================================= Ter NE PAS TOUCHER LE COMPTEUR ou Reduire l'espace avant et apres 0 pour eviter bug à grande vitesse

onOFF = 0;

for (int i = 0; i < networkSize; i++) {
    //**    print (net.oldPhase[i]); print ("count rev ");   println (net.phase[i]);
    // decrement caused by negative angular velocity
    // both positive angles || both negative angles || positive-to-negative angle
    //   if (//(net.oldPhase[i] < 0.25 * PI && net.phase[i] > 1.75 * PI) ||//
    if (modeStartKeyToFollow != " followSignalSampledOppositeWay(frameRatio) ") {
        TrigmodPos[i] = 1;
}
    if (
       ((net.oldPhase[i] < 0.25 * PI && net.oldPhase[i] > 0)  && (net.phase[i] > - 0.25 * PI && net.phase[i] <0))  || 
       (net.oldPhase[i] < - 1.75 * PI && net.phase[i] > - 0.25 * PI)// ||
        //(net.oldPhase[i] < 0.25 * PI && net.phase[i] > -0.25 * PI)
       ) {
        onOFF = 1;
        if (modeStartKeyToFollow != " followSignalSampledOppositeWay(frameRatio) ") {
            TrigmodPos[i] = 0;
    }
        rev[i]--;
        //print (" revultion negative  "); println (revolution[i]=i+1);
        //revolution[i]=i+1;
        revolution[i] = 0; // trig 0 to sent 0 in Max4Live
        //**    memoryi=i;
        
        
        decompte[i] = -1; // // RESET COUNTER AT 0 (i know it's strange, otherwise with 0 it begin at 1, not 0)
    } else { // if you do twice there is a funny bug
        //decompte[i]  ++;
        //revolution[i]=0;
    }
    
    
    // increment caused by positive angular velocity
    // both positive angles || both negative angles || negative-to-positive angle
    
    if (
       ((net.oldPhase[i] > - 0.25 * PI && net.oldPhase[i] < 0)  && (net.phase[i] < 0.25 * PI && net.phase[i] >0))  || 
       (net.oldPhase[i] > 1.75 * PI && net.phase[i] < 0.25 * PI)
       ) {
        onOFF = 1;
        if (modeStartKeyToFollow != " followSignalSampledOppositeWay(frameRatio) ") {
            
            TrigmodPos[i] = 0;
    }
        
        
        rev[i]++;
        //revolution[i]=i+1;
        revolution[i] = 0;   // trig 0 to sent 0 in Max4Live
        //**    memoryi=i;
        decompte[i] = 0;  // RESET COUNTER AT 0
    } else {
        
        decompte[i]  ++; //START COUNTER when a REVOLUTION START OR FINISH
        
        revolution[i] = 1;
    }
    if ( revolution[i] < 1) {
        print(" revolution[i] ");
        print(memoryi);
        print("  ");
        println(revolution[memoryi]);
    }
}

/*
if (

(net.oldPhase[memoryi] < -1.75 * PI && net.phase[memoryi] >= -0.25*TWO_PI) || ( net.phase[memoryi]<=-TWO_PI+0.23  && net.phase[memoryi] >= -0.25*TWO_PI )
) {
onOFF = 1;
//   background (27,59,78);
//    TrigmodPos[i]=0;
rev[memoryi]--;

// memoryi=i;


decompte[memoryi] = -1; // // RESET COUNTER AT 0 (i know it's strange, otherwise with 0 it begin at 1, not 0)
}
*/
}


void countRevsContinue() { // =========================================== AJOUTE un case dans tableau networkSize+1

for (int i = 0; i < networkSize; i++) {
    //**    print (net.oldPhase[i]); print ("count rev ");   println (net.phase[i]);
    // decrement caused by negative angular velocity
    // both positive angles || both negative angles || positive-to-negative angle
    //   if (//(net.oldPhase[i] < 0.25 * PI && net.phase[i] > 1.75 * PI) ||//
    if (
       ((oldPosF[i] < 0.25 * PI && oldPosF[i] > 0)  && (newPosF[i] > - 0.25 * PI && newPosF[i] <0))  || 
       (oldPosF[i] < - 1.75 * PI && newPosF[i] > - 0.25 * PI)// ||
        
       ) {
        
        //TrigmodPos[i]=0;
        RevsContinue[i]--;
        //print (" revultion negative  "); println (revolution[i]=i+1);
        //revolution[i]=i+1;
        revolution[i] = 0; // trig 0 to sent 0 in Max4Live
        memoryi = i;
        
        
        //decompte[i] = -1; // // RESET COUNTER AT 0 (i know it's strange, otherwise with 0 it begin at 1, not 0)
    } else { // if you do twice there is a funny bug
        //decompte[i]  ++;
        //revolution[i]=0;
    }
    
    
    // increment caused by positive angular velocity
    // both positive angles || both negative angles || negative-to-positive angle
    
    if (
       ((oldPosF[i] > - 0.25 * PI && oldPosF[i] < 0)  && (newPosF[i] < 0.25 * PI && newPosF[i] >0))  || 
       (oldPosF[i] > 1.75 * PI && newPosF[i] < 0.25 * PI)
       ) {
        onOFF = 1;
        //TrigmodPos[i]=0;
        RevsContinue[i]++;
        //revolution[i]=i+1;
        revolution[i] = 0;   // trig 0 to sent 0 in Max4Live
        memoryi = i;
        decompte[i] = 0;  // RESET COUNTER AT 0
    } else {
        
        decompte[i]  ++; //START COUNTER when a REVOLUTION START OR FINISH
        
        revolution[i] = 1;
    }
    if ( revolution[i] < 1) {
        print(" revolution[i] ");
        print(memoryi);
        print("  ");
        print(revolution[memoryi]);
    }
    
    //  print (" rev< "); print ( i); print ("  "); println (rev[i]);
}
if (
    
    
   (newPosF[memoryi] < - 1.75 * PI && newPosF[memoryi] >= -0.25 * TWO_PI) || (newPosF[memoryi]<=-  TWO_PI + 0.23  && newPosF[memoryi] >= -0.25 * TWO_PI)
   ) {
    onOFF = 1;
    //   background (27,59,78);
    //    TrigmodPos[i]=0;
    // RevsContinue[memoryi]--;
    //      print (" revultion negative  "); println (revolution[i]=i+1);
    //   revolution[i]=i+1;
    //**** revolution[memoryi]=0; // trig 0 to sent 0 in Max4Live   brecause it count twice in negative way!!!
    // memoryi=i;
    
    
    decompte[memoryi] = -1; // // RESET COUNTER AT 0 (i know it's strange, otherwise with 0 it begin at 1, not 0)
}
}
