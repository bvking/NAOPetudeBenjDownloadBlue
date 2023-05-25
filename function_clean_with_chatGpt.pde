void computePhaseSum() {
  if (circularMov=true) {
  for (int i = 0; i < networkSize; i++) {
    addPhaseAllMode += net.phase[i];
  }
    }
   if (circularMov=false) {
  for (int i = 0; i < networkSize; i++) {
    addPhaseAllMode += metroPhase[i];
  }
    }
  addPhaseAllMode/=networkSize;
  print("average phase ");
  print (addPhaseAllMode);
  addPhaseAllMode = map(addPhaseAllMode, -(networkSize - 1) * TWO_PI, (networkSize - 1) * TWO_PI, 0, 1);
  print("averagemapped ");
  println(addPhaseAllMode);
}

//void handleModeStartKeyToFollow() {

 // if (modeStartKeyToFollow != " samplingModeInternal ") {

void setMeasureAndBeatPrecised() {  
    if (modeStartKeyToFollow != " followSignalSampledOppositeWay(frameRatio) ") {
      measure = (int) map(automation4 * 10, 0, 7.874016, 1, 1000);
      print("measure ");
      print(measure);
      print("AUTOMATION 5 = beatPrecised ");
      beatPrecised = (int) map(automation5 * 10, 0, 7.874016, 1, 1000);
      println(beatPrecised);
}
}