/* META - Strings
 */
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
//Global Variables
int appWidth, appHeight;
float metaDataX1, metaDataY1, metaDataWidth1, metaDataHeight1;
float metaDataX2, metaDataY2, metaDataWidth2, metaDataHeight2;
float metaDataX3, metaDataY3, metaDataWidth3, metaDataHeight3;
//
Minim minim;
int numberOfSongs = 3;
AudioPlayer[] playList = new AudioPlayer[numberOfSongs];
AudioMetaData[] playListTitleMetaData = new AudioMetaData[numberOfSongs];
AudioMetaData[] playListPositionMetaData = new AudioMetaData[numberOfSongs];
AudioMetaData[] playListTimeRemainingMetaData = new AudioMetaData[numberOfSongs];
AudioMetaData[] playListTotalTimeMetaData = new AudioMetaData[numberOfSongs];
int currentSong = 0;

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
//
void setup() {
  fullScreen();
  appWidth = displayWidth;
  appHeight = displayHeight;
  //
  //Population
  metaDataX1 = appWidth * 1/10; //Title
  metaDataY1 = appHeight * 4/10;
  metaDataWidth1 = appWidth * 8/10;
  metaDataHeight1 = appHeight * 1/10;

  metaDataX2 = appWidth * 1/10; //Song Position
  metaDataY2 = appHeight * 5/10;
  metaDataWidth2 = appWidth * 2/10;
  metaDataHeight2 = appHeight * 1/10;

  metaDataX3 = appWidth * 6/10; //Time Remaining
  metaDataY3 = appHeight * 5/10;
  metaDataWidth3 = appWidth * 3/10;
  metaDataHeight3 = appHeight * 1/10;

  minim = new Minim(this);

  // Load Music
  for (int i = 0; i < numberOfSongs; i++) {
    playList[i] = minim.loadFile(musicPath + musicNames[i] + mp3FileName);
  }

  //DIV
  rect(metaDataX1, metaDataY1, metaDataWidth1, metaDataHeight1);
  rect(metaDataX2, metaDataY2, metaDataWidth2, metaDataHeight2);
  rect(metaDataX3, metaDataY3, metaDataWidth3, metaDataHeight3);
} //End Setup
//
void draw() {
  fill(255);
  // Draw the boxes (already present)
  rect(metaDataX1, metaDataY1, metaDataWidth1, metaDataHeight1);
  rect(metaDataX2, metaDataY2, metaDataWidth2, metaDataHeight2);
  rect(metaDataX3, metaDataY3, metaDataWidth3, metaDataHeight3);

  // Add text to each box

  // Title Box
  fill(0);
  textSize(32);
  textAlign(CENTER, CENTER);
  text("title of song", metaDataX1 + metaDataWidth1 / 2, metaDataY1 + metaDataHeight1 / 2);

  // Song Position Box
  textSize(20);
  textAlign(CENTER, CENTER);
  text("progress", metaDataX2 + metaDataWidth2 / 2, metaDataY2 + metaDataHeight2 / 2);

  // Time Remaining Box
  text("time remaining", metaDataX3 + metaDataWidth3 / 2, metaDataY3 + metaDataHeight3 / 2);
}

//
void mousePressed() {
} //End mousePressed
//
void keyPressed() {
  if (key == 'P' || key == 'p') {
    if (playList[currentSong].isPlaying()) {
      playList[currentSong].pause();
    } else {
      playList[currentSong].play();
    };
  } // End Play
} //End keyPressed
//
//End MAIN
