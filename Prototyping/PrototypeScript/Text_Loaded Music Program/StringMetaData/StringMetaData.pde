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
int numberOfSongs = 8;
AudioPlayer[] playList = new AudioPlayer[numberOfSongs];
AudioMetaData[] playListTitleMetaData = new AudioMetaData[numberOfSongs];
AudioMetaData[] playListPositionMetaData = new AudioMetaData[numberOfSongs];
AudioMetaData[] playListTimeRemainingMetaData = new AudioMetaData[numberOfSongs];
AudioMetaData[] playListTotalTimeMetaData = new AudioMetaData[numberOfSongs];
int currentSong = numberOfSongs - numberOfSongs;
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
  //DIV
  rect(metaDataX1, metaDataY1, metaDataWidth1, metaDataHeight1);
  rect(metaDataX2, metaDataY2, metaDataWidth2, metaDataHeight2);
  rect(metaDataX3, metaDataY3, metaDataWidth3, metaDataHeight3);
} //End Setup
//
void draw() {
} //End Draw
//
void mousePressed() {
} //End mousePressed
//
void keyPressed() {
} //End keyPressed
//
//End MAIN
