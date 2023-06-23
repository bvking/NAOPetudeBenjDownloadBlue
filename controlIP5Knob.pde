import controlP5.*;

ControlP5 cp5;

int myColorBackground = color(127,127,127);
int knobValue = 100;

int valueOfKnobA = 180;

Knob myKnobA;
Knob myKnobB;
//end knowledge

// print value of knob
void knob(int theValue) {
//  myColorBackground = color(theValue);
  println("a knob event. setting background to "+theValue);
}
void knobValue(int theValue) {
//  myColorBackground = color(theValue);
  println("b knob event. setting background to "+theValue);
}
