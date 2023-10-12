//String portsUSBfrom3;

void mapEncodeurToNumberOfStepsMotor(){
        rotate (-PI/2); // add rotation to well display data on screen
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
            //    println(" True encodeur to BigMachine" + i + " " + encoderTouched[i] + " " + encodeur[i]);          
           //     readPositionEncoder[i] = encodeur[i];
             } 

             if ( encoderTouched[i]==false){ 
           //     println(" False encodeur to BigMachine" + i + " " + encoderTouched[i] + " " + encodeur[i]);  
           //     readPositionEncoder[i] = 0;           
             } 
        } 
           println(" True of False encodeur to BigMachine" + 0 + " " + encoderTouched[0] + " " + encodeur[0]);
      rotate (PI/2);
} 
