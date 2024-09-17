import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
int numberOfSongs = 3;
AudioPlayer[] song = new AudioPlayer[numberOfSongs];
int currentSong = numberOfSongs - numberOfSongs;

//Global Variables
void setup()
{
  size(900, 600);

  minim = new Minim(this);
  //Load Music
  String musicPath = "MP3s/";
  String mp3FileName = ".mp3";
  String[] musicNames = {
    "one",
    "two",
    "three"
  };

  song[currentSong] = minim.loadFile( "../../" + musicPath + musicNames[0] + musicPath);
  //song[currentSong] = minim.loadFile( "../../" + musicPath + musicNames[1] + mp3FileName );
  //song[currentSong] = minim.loadFile( "../../" + musicPath + musicNames[2] + mp3FileName );
  
  song[currentSong+=1].play();
} //End Setup
void draw() {
} //End drawg
void mousePressed() {
} //End MP
void keyPressed() {
} //End KP
