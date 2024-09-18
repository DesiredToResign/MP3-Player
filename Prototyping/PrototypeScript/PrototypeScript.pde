import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
int numberOfSongs = 3;
AudioPlayer[] songs = new AudioPlayer[numberOfSongs];
int currentSongIndex = 0; // Start with the first song

// Global Variables
void setup() {
  size(900, 600);
  
  minim = new Minim(this);
  
  // Load Music
  String musicPath = "MP3s/";
  String mp3FileName = ".mp3";
  String[] musicNames = {
    "one",
    "two",
    "three"
  };

  for (int i = 0; i < numberOfSongs; i++) {
    songs[i] = minim.loadFile(musicPath + musicNames[i] + mp3FileName);
  }
  
  songs[currentSongIndex].play();
} // End Setup

void draw() {
  
} // End draw

void mousePressed() {
  currentSongIndex = (currentSongIndex + 1) % numberOfSongs;
  for (AudioPlayer song : songs) {
    song.close();
  }
  songs[currentSongIndex].play();
} // End mousePressed

void keyPressed() {
  
} // End keyPressed
