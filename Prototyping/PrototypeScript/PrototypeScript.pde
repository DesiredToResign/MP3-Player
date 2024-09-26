import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
int numberOfSongs = 3;
AudioPlayer[] songs = new AudioPlayer[numberOfSongs];
int currentSongIndex = 0;

int appWidth, appHeight;
float musicButtonDIV_X, musicButtonDIV_Y, musicButtonDIV_Width, musicButtonDIV_Height;
float musicButtonSquareX, musicButtonSquareY, musicButtonSquareWidth, musicButtonSquareHeight;
float stopX, stopY, stopWidth, stopHeight;

String musicPath = "MP3s/";
String mp3FileName = ".mp3";
String[] musicNames = {
  "one",
  "two",
  "three"
};

// Global Variables
void setup() {
  size(900, 600);
  appWidth = width;
  appHeight = height;

  // button variables
  
  musicButtonDIV_Width = appWidth*1/2;
  musicButtonDIV_Height = appHeight*1/2;
  musicButtonDIV_X = musicButtonDIV_Width - musicButtonDIV_Width*1/2;
  musicButtonDIV_Y = musicButtonDIV_Height - musicButtonDIV_Height*1/2;
  
  /*
  if (musicButtonWidth >= musicButtonHeight) {
    musicButtonWidth needs to change
      musicButtonWidth = musicButtonHeight;
  } else {
    musicButtonHeight = musicButtonWidth;
  }
  */
  /*
  musicButtonSquareX = ;
  musicButtonSquareY = ;
  musicButtonSquareWidth = ;
  musicButtonSquareHeight = ;
  */
  
  
  float padding = 1.0/4.0;
  float stopButtonSize = 1.0-(1.0/4.0);

  stopWidth = musicButtonDIV_Width*stopButtonSize;
  stopHeight = musicButtonDIV_Height*stopButtonSize;

  stopX = musicButtonDIV_X+padding;
  stopY = musicButtonDIV_Y+padding;

  minim = new Minim(this);

  // Load Music
  for (int i = 0; i < numberOfSongs; i++) {
    songs[i] = minim.loadFile(musicPath + musicNames[i] + mp3FileName);
  }

  // songs[currentSongIndex].play();
} // End Setup

void draw() {
  String[] musicNames = {
    "one",
    "two",
    "three"
  };

  background(0);
  fill(255, 0, 0);
  textSize(32);
  text("Now Playing: " + musicNames[currentSongIndex], 50, height / 2);
  text("Press SPACE to switch songs", 50, height / 2 + 40);
  rect(musicButtonDIV_X, musicButtonDIV_Y, musicButtonDIV_Width, musicButtonDIV_Height);
  rect(musicButtonSquareX, musicButtonSquareY, musicButtonSquareWidth, musicButtonSquareHeight);
  rect(stopX, stopY, stopWidth, stopHeight);

  // rect(X, Y, Width, Height);
  // rect();
  // rect();
} // End draw

void mousePressed() {
} // End mousePressed

void keyPressed() {
  if (key == ' ') {
    for (AudioPlayer song : songs) {
      song.close();
    }
    currentSongIndex = (currentSongIndex + 1) % numberOfSongs;
    // not playing for some reason (cant find track?) // songs[currentSongIndex].play();
  }
} // End keyPressed
