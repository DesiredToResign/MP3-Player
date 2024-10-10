import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//global varis
Minim minim;
int numberOfSongs = 3;
AudioPlayer[] songs = new AudioPlayer[numberOfSongs];
int currentSongIndex = 0;

String musicPath = "MP3s/";
String mp3FileName = ".mp3";
String[] musicNames = {
  "one",
  "two",
  "three"
};

PImage playbutton;
PImage stopbutton;

int appWidth, appHeight;
//CAUTION: IF Statement Variable Population
float musicButtonDIV_X, musicButtonDIV_Y, musicButtonDIV_Width, musicButtonDIV_Height;
float musicButtonSquareX, musicButtonSquareY, musicButtonSquareWidth, musicButtonSquareHeight;
float stopX, stopY, stopWidth, stopHeight;

// Global Variables
void setup() {
  size(900, 600);
  appWidth = width;
  appHeight = height;
  //Variables for any music button
  musicButtonDIV_Width = appWidth*1/2;
  musicButtonDIV_Height = appHeight*1/2;
  musicButtonDIV_X = musicButtonDIV_Width - musicButtonDIV_Width*1/2;
  musicButtonDIV_Y = musicButtonDIV_Height- musicButtonDIV_Height*1/2;

  minim = new Minim(this);

  if ( musicButtonDIV_Width >= musicButtonDIV_Height ) { // Landscape //error: square does not go in the middle
    // musicButtonWidth needs to change
    musicButtonSquareWidth = musicButtonDIV_Height ;
    musicButtonSquareHeight = musicButtonDIV_Height ;
    float padding1 = musicButtonDIV_Width - musicButtonDIV_Height; //working out value needed, with formulae
    float padding2 = padding1*1/2; ////working out value needed, with formulae
    musicButtonSquareX = musicButtonDIV_X + padding2 ; //note: minus moves it the wrong way, difficult to see
    musicButtonSquareY = musicButtonDIV_Y;
  } else { //Portrait
    // musicButtonHeight needs to change
    musicButtonSquareWidth = musicButtonDIV_Width ;
    musicButtonSquareHeight = musicButtonDIV_Width;
    float padding1 = musicButtonDIV_Height - musicButtonDIV_Width; //working out value needed, with formulae
    float padding2 = padding1*1/2; ////working out value needed, with formulae
    musicButtonSquareX = musicButtonDIV_X; //note: minus moves it the wrong way, difficult to see
    musicButtonSquareY = musicButtonDIV_Y + padding2;
  }

  stopWidth = musicButtonSquareWidth*1/2;
  stopHeight = musicButtonSquareHeight*1/2;
  stopX = musicButtonSquareX + musicButtonSquareWidth*1/4;
  stopY = musicButtonSquareY + musicButtonSquareHeight*1/4;

  // Load Music
  for (int i = 0; i < numberOfSongs; i++) {
    songs[i] = minim.loadFile(musicPath + musicNames[i] + mp3FileName);
  }

  playbutton = loadImage("../../../../Case_Studies/playbutton.jpg");
  stopbutton = loadImage("../../../../Case_Studies/stopbutton.jpg");
  // songs[currentSongIndex].play();
} // End Setup

void draw() {
  String[] musicNames = {
    "one",
    "two",
    "three"
  };
  color red = #FC0000;
  background(100);
  fill(0);
  if ( mouseX>musicButtonSquareX && mouseX<musicButtonSquareX+musicButtonSquareWidth && mouseY>musicButtonSquareY && mouseY<musicButtonSquareY+musicButtonSquareHeight ) {
    fill(255);
  } else {
    fill(0);
  }
  rect( musicButtonSquareX, musicButtonSquareY, musicButtonSquareWidth, musicButtonSquareHeight );
  fill(red);
  textSize(32);
  rect( stopX, stopY, stopWidth, stopHeight );
  fill(255);
  text("Now Playing: " + musicNames[currentSongIndex], 10, height / 8);
  text("Press SPACE to switch songs", 10, height / 8 + 40);

  image(playbutton, 50, height/ 2 - 100);
} // End draw

void mousePressed() {
} // End mousePressed

void keyPressed() {
  /*
  if (key == ' ') {
   for (AudioPlayer song : songs) {
   song.close();
   }
   currentSongIndex = (currentSongIndex + 1) % numberOfSongs;
   // not playing for some reason (cant find track?) // songs[currentSongIndex].play();
   }
   */
} // End keyPressed
