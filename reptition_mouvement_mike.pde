//int actualSec,lastSec,measure,measureToStartRecording;
//boolean bRecording = false;
//boolean mouseRecorded =  true;
//float movementInterpolated, angleToInterpolate;
float [] sampledModifiedChecking =  new float [100000];

//timeRecording = 2000*numberOfMeasureToRecord;
int timeRecording = 8000;
int numberOfSample;
int numberOfrepetition;

// float speed = 0.5; in setup
// speed = speedOfrepetition;

//--------------------        coordinates of an angle in radians // no need here

//--------------------        method of interpolation to return the position of (rotation) by adding modulo in setup
/*
float mlerp(float x0, float x1, float t, float M) {
 float dx = (x1 - x0 + 1.5 * M) % M - 0.5 * M;
 return (x0 + t * dx + M) % M;
 }
 */



float scaleTheta(float theta) {
  while (theta < -PI ) {
    theta += TWO_PI;
  }
  while (theta >= PI ) {
    theta -= TWO_PI;
  }
  return theta;
}

class SampleTheta {
  int t;
  float theta;
  SampleTheta(int t, float theta) {
    this.t = t;
    this.theta = theta;
  }
}

class SamplerTheta {

  ArrayList<SampleTheta> samples;
  ArrayList<SampleTheta> samplesModified;
  int startTime;
  int playbackFrame;

  SamplerTheta() {
    samples = new ArrayList<SampleTheta>();
    samplesModified = new ArrayList<SampleTheta>();
    startTime = 0;
  }
  void beginRecording() {
    samples = new ArrayList<SampleTheta>();
    samplesModified = new ArrayList<SampleTheta>();
    playbackFrame = 0;
  }
  void addSample(float theta) {  // add sample when bRecording
    int now = millis();
    if (samples.size() == 0) startTime = now;
    samples.add(new SampleTheta(now - startTime, theta));
  }
  int fullTime() {
    return (samples.size() > 1) ? samples.get(samples.size() - 1).t : 0;
  }



  void beginPlaying() {
    startTime = millis();
    playbackFrame = 0;


    if (samples.size() > 0) {
      numberOfSample = samples.size();

      println(numberOfSample, "samples over", fullTime(), "milliseconds");

      float deltaTheta = scaleTheta(samples.get(0).theta - samples.get(numberOfSample - 1).theta);
      float sumdist = 0;

      for (int i = 0; i < samples.size() - 1; i++) {
        sumdist += abs(scaleTheta((samples.get(i).theta - samples.get(i + 1).theta)));
      }
      samplesModified.add(new SampleTheta(samples.get(0).t, samples.get(0).theta));
      float dist = 0;


      println( "sample size = " + samples.size());
      for (int i = 0; i < samples.size() - 1; i++) {
        dist += abs(scaleTheta((samples.get(i).theta - samples.get(i + 1).theta)));
        samplesModified.add(new SampleTheta(int(samples.get(i + 1).t * timeRecording / fullTime()), (float)(samples.get(i + 1).theta + (dist * deltaTheta) / sumdist)));

        print(i);
        print("  ");
        print(samples.get(i).theta);
        print(" t =  " + samples.get(i).t);
        println("");
      }

      println(samplesModified.size(), "samples over", samplesModified.get(samples.size() - 1).t, "milliseconds");
      for (int i = 0; i < samplesModified.size(); i++) {
        print(i);
        print(",");
        print(" good data x " + samplesModified.get(i).theta);
        print(" t =  " + samplesModified.get(i).t);
        println("");
      }
      println( "Modifier sample size = " + samplesModified.size());
    }
  }

    boolean draw() {
    boolean result = false;
    stroke(255);

    float absspeed = abs(speed);
    int now = millis() - startTime; 
    if( now > (int)(timeRecording/ absspeed)) {
      startTime += (int)(timeRecording/ absspeed);
      result = true;
    }
    now = int(((now) % (int)(timeRecording/ absspeed)));
    if (speed < 0) {
      now = (int)(timeRecording / absspeed) - now;
    }

    playbackFrame = 0;
    while (samplesModified.get(playbackFrame + 1).t / absspeed < now)
      playbackFrame = (playbackFrame + 1) % (samplesModified.size() - 1);

    SampleTheta s0 = samplesModified.get(playbackFrame);
    SampleTheta s1 = samplesModified.get(playbackFrame + 1);
    float theta0 = s0.theta;
    float theta1 = s1.theta;
    if (abs(theta0-theta1) > PI ) {
      theta0 = scaleTheta(theta0);
      theta1 = scaleTheta(theta1);
    }
    float t0 = s0.t / absspeed;
    float t1 = s1.t / absspeed;
    float dt = (now - t0) / (t1 - t0);
    movementInterpolated = theta0 + dt * (theta1 - theta0);
   // movementInterpolated+=15/16*TWO_PI;
     movementInterpolated+=TWO_PI/factorSynchro;
     movementInterpolated+=PI;
    //  movementInterpolated-=TWO_PI*15/16;

    text(" mov " + (movementInterpolated), 100, 500);
    fill(255, 255, 255);
    circle(100 * cos(movementInterpolated) + 200, 100 * sin(movementInterpolated) + 200, 20);
    stroke(255);
    return result;
  }
  
}

SamplerTheta sampler;
