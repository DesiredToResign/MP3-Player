import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
int numberOfSongs = 1;
AudioPlayer[] song = new AudioPlayer[numberOfSongs];
int currentSong = numberOfSongs - numberOfSongs;

//Global Variables
void setup() 
{
  size(900,600);
  
  minim = new Minim(this);
  //Load Music
  String musicPath = "MP3s/";
  String mp3FileName = ".mp3";
  
  String[] song = {
    "1"
  };
  
  //song.play();
  
} //End Setup
void draw() {
 
} //End draw
void mousePressed() {
} //End MP
void keyPressed() {
} //End KP
