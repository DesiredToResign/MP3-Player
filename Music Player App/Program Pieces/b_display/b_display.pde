import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
//Global Variables
Minim minim;
int appwidth, appHeight;
//
void setup()
{
  fullScreen();
  appwidth = displayWidth;
  appHeight = displayHeight;
  //
  //Music Player Constructor (see CS30 for full explanation)
  minim = new Minim(this);
  //
} //End setup
//
void draw() {
} //End draw
//
void mousePressed() {
} //End mousePressed
//
void keyPressed() {
} //End keyPressed
//
// End Main Program
