//© Copyright all rights reserved Desired01 2024 ©//

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

String musicPath = "../../../../MP3s/";
String mp3FileName = ".mp3";
String[] musicNames = {
  "one",
  "two",
  "three"
};
String[] actualMusicNames = {
  "Never Gonna Give You Up",
  "Space",
  "Groove"
};

PImage playbutton;
PImage pausebutton;

int appWidth, appHeight;
//CAUTION: IF Statement Variable Population
float musicButtonDIV_X, musicButtonDIV_Y, musicButtonDIV_Width, musicButtonDIV_Height;
float musicButtonSquareX, musicButtonSquareY, musicButtonSquareWidth, musicButtonSquareHeight;
float stopX, stopY, stopWidth, stopHeight;

float quitButtonX1, quitButtonY1, quitButtonX2, quitButtonY2;
float quitButtonX3, quitButtonY3, quitButtonX4, quitButtonY4;

float quitThicknessLine;

color red=#FC0000, white=#FFFFFF, black=#000000, gray=#717070, backgroundRed=#AD0000;
color dayForeground=white, dayHoverover=white, dayBackground=backgroundRed;
color darkForeground=black, darkHoverover=white, darkBackground=backgroundRed;
color nightForeground=white, nightHoverover=white, nightBackground=black;
color appColorForeground, appColorHoverover, appColorBackground;
color stopButtonHoverOver, quitButtonLineColour;

Boolean colorDayMode=false, colorDarkMode=false, colorNightMode=false;

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

  quitThicknessLine = (musicButtonSquareWidth / musicButtonSquareWidth ) + musicButtonSquareWidth*1/4*1/2;

  quitButtonX1 = stopX;
  quitButtonY1 = stopY;
  quitButtonX2 = stopX+stopWidth;
  quitButtonY2 = stopY+stopHeight;

  quitButtonX3 = quitButtonX2;
  quitButtonY3 = quitButtonY1;
  quitButtonX4 = quitButtonX1;
  quitButtonY4 = quitButtonY2;

  // Load Music
  for (int i = 0; i < numberOfSongs; i++) {
    songs[i] = minim.loadFile(musicPath + musicNames[i] + mp3FileName);
  }

  playbutton = loadImage("../../../../Case_Studies/playbutton.jpg");
  pausebutton = loadImage("../../../../Case_Studies/pausebutton.jpg");
  //songs[currentSongIndex].play();


  if (hour()<=7 || hour()>17 || colorNightMode == true) {
    //nightmode
    appColorForeground = nightForeground;
    appColorHoverover = nightHoverover;
    appColorBackground = nightBackground;
  } else if (hour()>7 || hour()<17 || colorDayMode == true) {
    //daymode
    appColorForeground = dayForeground;
    appColorHoverover = dayHoverover;
    appColorBackground = dayBackground;
  } else {
    //darkmode
    appColorForeground = darkForeground;
    appColorHoverover = darkHoverover;
    appColorBackground = darkBackground;
  }
} // End Setup

void draw() {
  background(appColorBackground);
  fill(0);
  if ( mouseX>musicButtonSquareX && mouseX<musicButtonSquareX+musicButtonSquareWidth && mouseY>musicButtonSquareY && mouseY<musicButtonSquareY+musicButtonSquareHeight ) {
    stopButtonHoverOver = appColorBackground;
    quitButtonLineColour = appColorHoverover;
  } else {
    stopButtonHoverOver = appColorForeground;
    quitButtonLineColour = appColorBackground;
  }
  noStroke();
  fill(stopButtonHoverOver);
  rect( musicButtonSquareX, musicButtonSquareY, musicButtonSquareWidth, musicButtonSquareHeight );
  textSize(32);
  stroke(quitButtonLineColour);
  strokeWeight(quitThicknessLine);
  line( quitButtonX1, quitButtonY1, quitButtonX2, quitButtonY2 );
  line( quitButtonX3, quitButtonY3, quitButtonX4, quitButtonY4 );
  fill(255);
  text("Now Playing: " + actualMusicNames[currentSongIndex], 40, height / 8);
  text("Press 'P' to switch songs", 40, height / 8 + 40);

  // image(playbutton, 50, height/ 2 - 100);
  // image(pausebutton, width / 2 + 200, height/ 2 - 120);
} // End draw

void mousePressed() {
} // End mousePressed

void keyPressed() {
  //song skip below
  if (key == 'P' || key == 'p') {
    if (songs[currentSongIndex].isPlaying()) {
      songs[currentSongIndex].pause();
      songs[currentSongIndex].rewind();
    }
    currentSongIndex = (currentSongIndex + 1) % numberOfSongs;
    songs[currentSongIndex].play();
  }
  //end song skip
}
// End keyPressed
