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
float imageDIV_X, imageDIV_Y, imageDIV_Width, imageDIV_Height;

String musicPath = "../MP3s/";
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

  imageDIV_Width = appWidth*1/2;
  imageDIV_Height = appHeight*1/2;
  imageDIV_X = imageDIV_Width - imageDIV_Width*1/2;
  imageDIV_Y = imageDIV_Height - imageDIV_Height*1/2;

  //population

  if ( imageDIV_Width >= imageDIV_Height ) { // Landscape //error: square does not go in the middle
  } else { //Portrait
  }
  minim = new Minim(this);

  // Load Music
  for (int i = 0; i < numberOfSongs; i++) {
    songs[i] = minim.loadFile(musicPath + musicNames[i] + mp3FileName);
  }

  rect(imageDIV_X, imageDIV_Y, imageDIV_Width, imageDIV_Height);
} // End Setup

void draw() {
  rect(imageDIV_X, imageDIV_Y, imageDIV_Width, imageDIV_Height);
} // End draw

void mousePressed() {
} // End mousePressed

void keyPressed() {
  if (key == 'L' || key == 'l' ) songs[currentSongIndex].loop(1); // loop once
  if (key == 'K' || key == 'k' ) songs[currentSongIndex].loop(); // loop forever
  if (key == 'F' || key == 'f' ) songs[currentSongIndex].skip(1000); // fast forward
  if (key == 'R' || key == 'r' ) songs[currentSongIndex].skip(-1000); // fast rewind
  if (key == 'M' || key == 'm' ) {
    if (songs[currentSongIndex].isMuted()) {
      songs[currentSongIndex].unmute();
    } else {
      songs[currentSongIndex].mute();
    };
  }; // mute
  if (key == 'O' || key == 'o' ) {
    if (songs[currentSongIndex].isPlaying()) {
      songs[currentSongIndex].pause();
    } else {
      songs[currentSongIndex].play();
    };
  }; // pause
  if (key == CODED || keyCode == ESC || key == 'Q' || key == 'q') exit(); // quit
  if (key == 'N' || key == 'n' ) {
    if (songs[currentSongIndex].isPlaying()) {
      songs[currentSongIndex].pause();
      songs[currentSongIndex].rewind();
      currentSongIndex = (currentSongIndex + 1) % numberOfSongs;
      println(musicNames[currentSongIndex]);
      songs[currentSongIndex].play();
    } else {
      songs[currentSongIndex].rewind();
      currentSongIndex = (currentSongIndex + 1) % numberOfSongs;
      println(musicNames[currentSongIndex]);
    };
  }; // next
  if (key == 'P' || key == 'p' ) {
    if (songs[currentSongIndex].isPlaying()) {
      songs[currentSongIndex].pause();
      songs[currentSongIndex].rewind();
      currentSongIndex = (currentSongIndex - 1) % numberOfSongs;
      if (currentSongIndex <= -1) {
        currentSongIndex = (currentSongIndex + numberOfSongs) % numberOfSongs;
      }
      println(musicNames[currentSongIndex]);
      songs[currentSongIndex].play();
    } else {
      songs[currentSongIndex].rewind();
      currentSongIndex = (currentSongIndex - 1) % numberOfSongs;
      if (currentSongIndex <= -1) {
        currentSongIndex = (currentSongIndex + numberOfSongs) % numberOfSongs;
      }
      println(musicNames[currentSongIndex]);
    };
  }; // previous
  if (key == ' ' || key == ' ' ) ; // shuffle - play (random)
  if (key == ' ' || key == ' ' ) ; // play-pause-stop
}
// End keyPressed
