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

color red=#FC0000, white=#FFFFFF, black=#000000, gray=#717070, backgroundRed=#AD0000;
color dayForeground=white, dayHoverover=black, dayBackground=backgroundRed;
color darkForeground=black, darkHoverover=white, darkBackground=backgroundRed;
color nightForeground=black, nightHoverover=white, nightBackground=black;
color appColorForeground, appColorHoverover, appColorBackground;
color stopButtonHoverOver;

Boolean colorDayMode=false, colorDarkMode=false, colorNightMode=false;

float playButton1X, playButton1Y, playButton2X, playButton2Y, playButton3X, playButton3Y;

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

  playButton1X = musicButtonSquareX + musicButtonSquareWidth*1/4;
  playButton1Y = musicButtonSquareY + musicButtonSquareHeight*1/4;
  playButton2X = musicButtonSquareX + musicButtonSquareWidth*3/4;
  playButton2Y = musicButtonSquareY + musicButtonSquareHeight*1/2;
  playButton3X = musicButtonSquareX + musicButtonSquareWidth*1/4;
  playButton3Y = musicButtonSquareY + musicButtonSquareHeight*3/4;

  // Load Music
  for (int i = 0; i < numberOfSongs; i++) {
    songs[i] = minim.loadFile(musicPath + musicNames[i] + mp3FileName);
  }

  playbutton = loadImage("../../../../Case_Studies/playbutton.jpg");
  pausebutton = loadImage("../../../../Case_Studies/pausebutton.jpg");
  
  songs[currentSongIndex].play();

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
    fill(appColorForeground);
  } else {
    fill(appColorHoverover);
  }
  rect( musicButtonSquareX, musicButtonSquareY, musicButtonSquareWidth, musicButtonSquareHeight );
  fill(appColorBackground);
  textSize(32);
  triangle(playButton1X, playButton1Y, playButton2X, playButton2Y, playButton3X, playButton3Y);
  fill(255);
  text("Now Playing: " + actualMusicNames[currentSongIndex], 40, height / 8);
  text("Press the Play Button to pause/play songs", 40, height / 8 + 40);

  // image(playbutton, 50, height/ 2 - 100);
  // image(pausebutton, width / 2 + 200, height/ 2 - 120);
} // End draw

void mousePressed() {
  if ( mouseX>musicButtonSquareX && mouseX<musicButtonSquareX+musicButtonSquareWidth && mouseY>musicButtonSquareY && mouseY<musicButtonSquareY+musicButtonSquareHeight ) {
    if (songs[currentSongIndex].isPlaying()) {
      songs[currentSongIndex].pause();
    } else {
      songs[currentSongIndex].play();
    };
  } // End mousePressed
}

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
      println(actualMusicNames[currentSongIndex]);
      songs[currentSongIndex].play();
    } else {
      songs[currentSongIndex].rewind();
      currentSongIndex = (currentSongIndex + 1) % numberOfSongs;
      println(actualMusicNames[currentSongIndex]);
    };
  }; // next
  if (key == 'P' || key == 'p' ) {
        if (songs[currentSongIndex].isPlaying()) {
      songs[currentSongIndex].pause();
      songs[currentSongIndex].rewind();
      currentSongIndex = (currentSongIndex - 1) % numberOfSongs;
      println(actualMusicNames[currentSongIndex]);
      songs[currentSongIndex].play();
    } else {
      songs[currentSongIndex].rewind();
      currentSongIndex = (currentSongIndex - 1) % numberOfSongs;
      println(actualMusicNames[currentSongIndex]);
    };
  }; // previous
  if (key == ' ' || key == ' ' ) ; // shuffle - play (random)
  if (key == ' ' || key == ' ' ) ; // play-pause-stop
}
// End keyPressed
