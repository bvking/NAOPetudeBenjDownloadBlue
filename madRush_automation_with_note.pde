



















void autoNote1VelInf64Origin() {//1 61 63 64 66 85 
 // keyPressedLFO();

      if (( measure<=40 && millis()>formerEvent[67]+50+d )&&
      (
      (note1>66 && note1<68  && velocity1>=1 && velocity1<=64)|| (note2>66 && note2<68 && velocity2>=1 && velocity2<=64) || (note3>66 && note3<68 && velocity3>=1 && velocity3<=64) || 
      (note4>66 && note4<68  && velocity4>=1 && velocity4<=64)|| (note5>66 && note5<68 && velocity5>=1 && velocity5<=64) || (note6>66 && note6<68 && velocity6>=1 && velocity6<=64)
      )) {
      //   key='E'; 
          key='r'; 
          keyReleased(); //u=117
      formerEvent[67]=millis();
      print ("formerEvent[67] INSIDE"); 
      println (formerEvent[67]);
     }

      if ((( measure<41 ) && (millis()>formerEvent[74]+100)) &&
      ((note1>73 && note1<75 && velocity1>=1 && velocity1<=64)|| (note2>73 && note2<75 && velocity2>=1 && velocity2<=64)|| (note3>73 && note3<75 && velocity3>=1 && velocity3<=64) ||
      (note4>73 && note4<75 && velocity4>=1 && velocity4<=64)|| (note5>73 && note5<75 && velocity5>=1 && velocity5<=64)|| (note6>73 && note6<75 && velocity6>=1 && velocity6<=64)
      )) {
      key='r';
      keyReleased();
      key='r';
      keyReleased();
      formerEvent[74]=millis();
    }


     if (( measure<=15 && millis()>formerEvent[64]+950+d )&&
      (
      (note1>63 && note1<65  && velocity1>=1 && velocity1<=64)|| (note2>63 && note2<65 && velocity2>=1 && velocity2<=64) || (note3>63 && note3<65 && velocity3>=1 && velocity3<=64) || 
      (note4>63 && note4<65  && velocity4>=1 && velocity4<=64)|| (note5>63 && note5<65 && velocity5>=1 && velocity5<=64) || (note6>63 && note6<65 && velocity6>=1 && velocity6<=64)
      )) {
      //    key='f'; 
      //     keyReleased(); //u=117
      formerEvent[64]=millis();
      print ("formerEvent[64] INSIDE"); 
      println (formerEvent[64]);
    }

     if (( measure<=40  && millis()>formerEvent[69]+900+d )&& // from Track1 and Track 0
      (
      (note1>68 && note1<70  && velocity1>=1 && velocity1<=64)|| (note2>68 && note2<70 && velocity2>=1 && velocity2<=64) || (note3>68 && note3<70 && velocity3>=1 && velocity3<=64) || 
      (note4>68 && note4<70  && velocity4>=1 && velocity4<=64)|| (note5>68 && note5<70 && velocity5>=1 && velocity5<=64) || (note6>68 && note6<70 && velocity6>=1 && velocity6<=64)
      )) {
      //      key='r'; 
      //   keyReleased(); //u=117
      formerEvent[69]=millis();
      print ("formerEvent[69] INSIDE"); 
      println (formerEvent[69]);
    }


     if (( measure<=11 && millis()>formerEvent[72]+350+d )&& //250 to adjust with 172 (the other hand of mad rush)
      ((note1>71 && note1<73  && velocity1>=1 && velocity1<=64)|| (note2>71 && note2<73 && velocity2>=1 && velocity2<=64) || (note3>71 && note3<73 && velocity3>=1 && velocity3<=64) ||
      (note4>71 && note4<73  && velocity4>=1 && velocity4<=64)|| (note5>71 && note5<73 && velocity5>=1 && velocity5<=64) || (note6>71 && note6<73 && velocity6>=1 && velocity6<=64)
      )) {

      key='U';//i= 105 
      keyReleased(); 
      formerEvent[72]=millis();
      print ("formerEvent[72] INSIDE"); 
      println (formerEvent[72]);
    }



    if (( measure>=12 && measure<=12 && beatPrecised>=4 && beatPrecisedTrigged==true )
      ) {
      //    key='K';keyReleased();
    }
    if (( measure>=12 && measure<=34 && millis()>formerEvent[76]+1000) &&
      ((note1>75 && note1<77 && velocity1>=1 && velocity1<=127)|| (note2>75 && note2<77 && velocity2>=1 && velocity2<=127)|| (note3>75 && note3<77 && velocity3>=1 && velocity3<=127) ||
      (note4>75 && note4<77 && velocity4>=1 && velocity4<=127)|| (note5>75 && note5<77 && velocity5>=1 && velocity5<=127)|| (note6>75 && note6<77 && velocity6>=1 && velocity6<=127)
      )) {
      key='9';
      keyReleased();

      key='P';
      keyReleased();
      key='P';
      keyReleased();

      formerEvent[76]=millis();
    }
    if (( measure>=24 && measure<=34 && millis()>formerEvent[76]+1000) &&
      ((note1>75 && note1<77 && velocity1>=1 && velocity1<=127)|| (note2>75 && note2<77 && velocity2>=1 && velocity2<=127)|| (note3>75 && note3<77 && velocity3>=1 && velocity3<=127) ||
      (note4>75 && note4<77 && velocity4>=1 && velocity4<=127)|| (note5>75 && note5<77 && velocity5>=1 && velocity5<=127)|| (note6>75 && note6<77 && velocity6>=1 && velocity6<=127)
      )) {
      key='9';
      keyReleased();
      key='P';
      keyReleased();
      key='P';
      keyReleased();
      key='p';
      keyReleased();


      formerEvent[76]=millis();
    }

    if  (measure>=12 && measure<=15  && beatTrigged==true ) {// beatPrecised2=true
      for (int i = 0; i < networkSize; i++) {
      }
    }
    if  (measure>16 && measure<=18  && beatTrigged==true ) {// beatPrecised2=true
      for (int i = 0; i < networkSize; i++) {


        //   key='W'; 
        //   keyReleased();
      }
    }
    if  (measure==36 && beatTrigged==true  ) {// measure>=41 && measure<=42
      for (int i = 0; i < networkSize; i++) {
        key='a';
         keyReleased();
        key='0';
        keyReleased();
        key='q';
        keyReleased();
        key='n';
        keyReleased();
        key='q';
        keyReleased();
        key='n';
        keyReleased();
        key='o';
        keyReleased();
      }
    }
    if  (measure>41 && measure<=42  && beatTrigged==true  ) {// measure>=41 && measure<=42
      for (int i = 0; i < networkSize; i++) {
        //    ActualVirtualPosition[i]=ActualVirtualPosition[i]+numberOfStep/3*i;
      }
    }
    //%ADMAD
   
    if (( measure>=123 && millis()>formerEvent[69]+100+d )&&
      (
      (note1>68 && note1<70  && velocity1>=1 && velocity1<=64)|| (note2>68 && note2<70 && velocity2>=1 && velocity2<=64) || (note3>68 && note3<70 && velocity3>=1 && velocity3<=64) || 
      (note4>68 && note4<70  && velocity4>=1 && velocity4<=64)|| (note5>68 && note5<70 && velocity5>=1 && velocity5<=64) || (note6>68 && note6<70 && velocity6>=1 && velocity6<=64)
      )) {
      key='U'; 
      keyReleased(); //u=117
      formerEvent[69]=millis();
      print ("formerEvent[69] INSIDE"); 
      println (formerEvent[69]);
    }
    if ( measure>=123 && measure<=123 && beatTrigged==true 
      ) {
      //   key='9'; 
      //   keyReleased(); //u=117
      //   formerEvent[69]=millis();
    }
    
    if ( measure>=123+8 && measure<=123+8 && beatTrigged==true 
      ) {
      key='p'; 
      keyReleased(); //u=117
      key='9'; 
      keyReleased(); //u=117
      //   formerEvent[69]=millis();
    }
 
    if (( measure>11 && measure<41 && millis()>formerEvent[72]+350+d-300 )&& //250 to adjust with 172 (the other hand of mad rush)
      ((note1>71 && note1<73  && velocity1>=1 && velocity1<=64)|| (note2>71 && note2<73 && velocity2>=1 && velocity2<=64) || (note3>71 && note3<73 && velocity3>=1 && velocity3<=64) ||
      (note4>71 && note4<73  && velocity4>=1 && velocity4<=64)|| (note5>71 && note5<73 && velocity5>=1 && velocity5<=64) || (note6>71 && note6<73 && velocity6>=1 && velocity6<=64)
      )) {

      key='U';//i= 105 
      keyReleased(); 
      formerEvent[72]=millis();
      print ("formerEvent[72] INSIDE"); 
      println (formerEvent[72]);
    }
 
     
    if (( measure>25 && measure<35 && millis()>formerEvent[70]+300 )&& // from Track1 and Track 0
      (
      (note1>69 && note1<71  && velocity1>=1 && velocity1<=64)|| (note2>69 && note2<71 && velocity2>=1 && velocity2<=64) || (note3>69 && note3<71 && velocity3>=1 && velocity3<=64) || 
      (note4>69 && note4<71  && velocity4>=1 && velocity4<=64)|| (note5>69 && note5<71 && velocity5>=1 && velocity5<=64) || (note6>69 && note6<71 && velocity6>=1 && velocity6<=64)
      )) {
      // oscillatorBlocked=10;  
      key='R'; 
      keyReleased(); 
      //   key='f'; 
      //   keyReleased(); 

      formerEvent[70]=millis();
      print ("                                                   formerEvent[64] INSIDE> f  "); 
      println (formerEvent[64]);
    }



    if (( measure>40 && measure<61  && millis()>formerEvent[64]+100 )&& // from Track1 and Track 0
      (
      (note1>63 && note1<65  && velocity1>=1 && velocity1<=64)|| (note2>63 && note2<65 && velocity2>=1 && velocity2<=64) || (note3>63 && note3<65 && velocity3>=1 && velocity3<=64) || 
      (note4>63 && note4<65  && velocity4>=1 && velocity4<=64)|| (note5>63 && note5<65 && velocity5>=1 && velocity5<=64) || (note6>63 && note6<65 && velocity6>=1 && velocity6<=64)
      )) {
      oscillatorBlocked=10;  
      key='f'; 
      keyReleased(); 
      //   key='f'; 
      //   keyReleased(); 

      formerEvent[64]=millis();
      print ("                                                   formerEvent[64] INSIDE> f  "); 
      println (formerEvent[64]);
    }

    if (( measure>40 && measure<61  && millis()>formerEvent[69]+100 )&& // from Track1 and Track 0
      (
      (note1>68 && note1<70  && velocity1>=1 && velocity1<=64)|| (note2>68 && note2<70 && velocity2>=1 && velocity2<=64) || (note3>68 && note3<70 && velocity3>=1 && velocity3<=64) || 
      (note4>68 && note4<70  && velocity4>=1 && velocity4<=64)|| (note5>68 && note5<70 && velocity5>=1 && velocity5<=64) || (note6>68 && note6<70 && velocity6>=1 && velocity6<=64)
      )) {
      oscillatorBlocked=1;
      key='d'; 
      keyReleased(); 
      //  key='d'; 
      //  keyReleased(); 


      formerEvent[69]=millis();
      print ("                                                   formerEvent[69] INSIDE> d  "); 
      println (formerEvent[69]);
    }

    if (( measure>40 && measure<61  && millis()>formerEvent[67]+100 ) && // pour equilibrer le trop plein de f
      (
      (note1>66 && note1<68  && velocity1>=1 && velocity1<=64)|| (note2>68 && note2<68 && velocity2>=1 && velocity2<=64) || (note3>68 && note3<68 && velocity3>=1 && velocity3<=64) 
      )) {
      //   oscillatorBlocked=1;
      key='d'; 
      keyReleased(); 
      //  key='d'; 
      //  keyReleased(); 

      formerEvent[67]=millis();
    }


    if (( measure>60 && measure<78 && millis()>formerEvent[72]+1000) && //25+d
      ((note1>71 && note1<73  && velocity1>=1 && velocity1<=64 )|| (note2>71 && note2<73 && velocity2>=1 && velocity2<=64) || (note3>71 && note3<73 && velocity3>=1 && velocity3<=64)||
      (note4>71 && note4<73  && velocity4>=1 && velocity4<=64 )|| (note5>71 && note5<73 && velocity5>=1 && velocity5<=64) || (note6>71 && note6<73 && velocity6>=1 && velocity6<=64)
      )) {
      // key='d'; 
      key='i'; // u bloque 
      keyReleased(); //u=117
      formerEvent[72]=millis();
    }

    if (( measure>61 && measure<78 && millis()>formerEvent[74]+200) &&  // wiat 200 ms before consideration of the next event 74. Here is note 74
      ((note1>73 && note1<75 && velocity1>=1 && velocity1<=64)|| (note2>73 && note2<75 && velocity2>=1 && velocity2<=64)|| (note3>73 && note3<75 && velocity3>=1 && velocity3<=64) ||
      (note4>73 && note4<75 && velocity4>=1 && velocity4<=64)|| (note5>73 && note5<75 && velocity5>=1 && velocity5<=64)|| (note6>73 && note6<75 && velocity6>=1 && velocity6<=64)
      )) {

      oscillatorBlocked=networkSize; 
      key='f'; 
      keyReleased();//i= 105
      formerEvent[74]=millis();
    }

}