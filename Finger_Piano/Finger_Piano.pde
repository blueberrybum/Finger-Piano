//add all of the libraries needed for the leap motion to work with processing.
import com.leapmotion.leap.Controller;
import com.leapmotion.leap.Frame;
import com.leapmotion.leap.Gesture;
import com.leapmotion.leap.Hand;
import com.leapmotion.leap.Finger;
import com.leapmotion.leap.processing.LeapMotion;


import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import javax.sound.sampled.*;
int fingers = 0;



//define all of the minim library requirements.
Minim minim;
AudioPlayer billionaire;
AudioPlayer her;
AudioPlayer rapgod;
AudioPlayer heartbeat;
AudioPlayer easier;
AudioPlayer paper;
AudioPlayer eclipse;
AudioOutput out;
int x = 800;
int y = 800;
float timer = 0;
float a = 3;
float b = .5;
PImage bruno;
PFont f;



LeapMotion leapMotion;



void setup()
{
  background(0);
  size(300,100);
  
bruno = loadImage("bruno.jpg");
f = createFont("Arial",16,true);
  leapMotion = new LeapMotion(this);

  minim = new Minim(this);
  
  //load all of the music files
   out = minim.getLineOut(Minim.STEREO);
  billionaire = minim.loadFile("billionaire.mp3");
  her = minim.loadFile("patent_pending.mp3");
  rapgod = minim.loadFile("rapgod .mp3");
  heartbeat = minim.loadFile("heartbeat.mp3");
  easier = minim.loadFile("easier.mp3");
  paper = minim.loadFile("paper.mp3");
  eclipse = minim.loadFile("eclipse.mp3");
  



}

void draw()
{
 timer = a++;
 textFont(f,12);
fill(255,0,0);
rectMode(CENTER);
rect(x/2 + timer,400,50,50);
text("Now Playing",0,20);

if(timer >=400){
  a = -a;
  
}
}
//LEAP MOTION VOID



//DELETE ABOVE
void onInit(final Controller controller)
{
  controller.enableGesture(Gesture.Type.TYPE_CIRCLE);
  controller.enableGesture(Gesture.Type.TYPE_KEY_TAP);
  controller.enableGesture(Gesture.Type.TYPE_SCREEN_TAP);
  controller.enableGesture(Gesture.Type.TYPE_SWIPE);
  // enable background policy
  controller.setPolicyFlags(Controller.PolicyFlag.POLICY_BACKGROUND_FRAMES);
}

void onFrame(final Controller controller)
{
  SineWave mySine;
  PianoNote newNote;
  timer = a+b;
  Frame frame = controller.frame();
  float pitch = 0;
 
  for (Gesture gesture : frame.gestures())
  {
    
 if ("TYPE_SCREEN_TAP".equals(gesture.type().toString()) && "STATE_STOP".equals(gesture.state().toString())) {
      rapgod.setGain(rapgod.getGain() + 50);
      println(gesture);
      
    }
    if ("TYPE_SCREEN_TAP".equals(gesture.type().toString()) && "STATE_UPDATE".equals(gesture.state().toString())) {
      rapgod.setGain(rapgod.getGain() - 50);
      println(gesture);
    
    }
    println("gesture " + gesture + " id " + gesture.id() + " type " + gesture.type() + " state " + gesture.state() + " duration " + gesture.duration() + " durationSeconds " + gesture.durationSeconds());
    if (frame.hands().isEmpty())
  {
 
  }
  else
  {
    int c = 0;
    
    for (Hand hand : frame.hands())
    {
      c = Math.max(c, hand.fingers().count());
      
    }
    fingers = c;
    println(fingers);
    
  }
  if(fingers == 1 && "TYPE_CIRCLE".equals(gesture.type().toString()) && "STATE_UPDATE".equals(gesture.state().toString())){
rapgod.rewind();
rapgod.play();
  paper.pause();
     heartbeat.pause();
     eclipse.pause();
     billionaire.pause();
     easier.pause();
     case 's': pitch = 277; break;
  }
  if(fingers == 2 && "TYPE_CIRCLE".equals(gesture.type().toString()) && "STATE_UPDATE".equals(gesture.state().toString())){
       paper.pause();
    heartbeat.pause();
    rapgod.pause();
    billionaire.pause();
    easier.pause();
    eclipse.rewind();
    eclipse.play();
      case 'z': pitch = 262; break;

    
    
}
if(fingers == 3 && "TYPE_CIRCLE".equals(gesture.type().toString()) && "STATE_UPDATE".equals(gesture.state().toString())){
  paper.rewind();
  paper.play();
  heartbeat.pause();
  rapgod.pause();
  eclipse.pause();
  billionaire.pause();
  easier.pause();
  
}
if(fingers == 4 && "TYPE_CIRCLE".equals(gesture.type().toString()) && "STATE_UPDATE".equals(gesture.state().toString())){
  billionaire.rewind();
  billionaire.play();
 heartbeat.pause();
  rapgod.pause();
  eclipse.pause();
  paper.pause();
  easier.pause();
  case 'x': pitch = 294; break;
  
}
if(fingers == 0){
   easier.pause();
  heartbeat.pause();
  eclipse.pause();
  paper.pause();
  billionaire.pause();
  rapgod.pause();
    case 'd': pitch = 311; break;
}
if(fingers == 5 && "TYPE_CIRCLE".equals(gesture.type().toString()) && "STATE_UPDATE".equals(gesture.state().toString())){
  easier.rewind();
  easier.play();
  heartbeat.pause();
  eclipse.pause();
  paper.pause();
  billionaire.pause();
  rapgod.pause();
  case 'c': pitch = 330; break;
}
if(fingers <= 2 && "TYPE_SWIPE".equals(gesture.type().toString()) && "STATE_STOP".equals(gesture.state().toString())){
  eclipse.rewind();
  rapgod.rewind();
  paper.rewind();
  easier.rewind();
  billionaire.rewind();
  
}
if(fingers == 2 && "TYPE_KEY_TAP".equals(gesture.type().toString()) && "STATE_STOP".equals(gesture.state().toString())){
  rapgod.setGain(rapgod.getGain() + 10);
  heartbeat.setGain(rapgod.getGain() + 10);
  eclipse.setGain(rapgod.getGain() + 10);
  paper.setGain(rapgod.getGain() + 10);
  billionaire.setGain(rapgod.getGain() + 10);
  rapgod.setGain(rapgod.getGain() + 10);
}
if(fingers == 3 && "TYPE_KEY_TAP".equals(gesture.type().toString()) && "STATE_STOP".equals(gesture.state().toString())){
  rapgod.setGain(rapgod.getGain() - 10);
  heartbeat.setGain(rapgod.getGain() - 10);
  eclipse.setGain(rapgod.getGain() - 10);
  paper.setGain(rapgod.getGain() - 10);
  billionaire.setGain(rapgod.getGain() - 10);
  rapgod.setGain(rapgod.getGain() - 10);
}
}
 if (pitch > 0) {
      newNote = new PianoNote(pitch, 0.2);
   }
  }

 
void stop()
{

  billionaire.close();
  her.close();
  easier.close();
  rapgod.close();
  heartbeat.close();
  minim.stop();
  super.stop();
}
class PianoNote implements AudioSignal
{
     private float freq;
     private float level;
     private float alph;
     private SineWave sine;
     
     PianoNote(float pitch, float amplitude)
     {
         freq = pitch;
         level = amplitude;
         sine = new SineWave(freq, level, out.sampleRate());
         alph = 0.9;  // Decay constant for the envelope
         out.addSignal(this);
     }

     void updateLevel()
     {
         // Called once per buffer to decay the amplitude away
         level = level * alph;
         sine.setAmp(level);
         
         // This also handles stopping this oscillator when its level is very low.
         if (level < 0.01) {
             out.removeSignal(this);
         }
         // this will lead to destruction of the object, since the only active 
         // reference to it is from the LineOut
     }
     
     void generate(float [] samp)
     {
         // generate the next buffer's worth of sinusoid
         sine.generate(samp);
         // decay the amplitude a little bit more
         updateLevel();
     }
     
    // AudioSignal requires both mono and stereo generate functions
    void generate(float [] sampL, float [] sampR)
    {
        sine.generate(sampL, sampR);
        updateLevel();
    }

}
