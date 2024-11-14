//global variables
int appWidth, appHeight;
float backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight;
float bikeX, bikeY, bikeWidth, bikeHeight;
PImage picBackground;
//

void setup() {
  size(500, 500); //Landscape
  appWidth = width;
  appHeight = height;
  //
  //Population
  backgroundImageX = appWidth*0;
  backgroundImageY = appHeight*0;
  backgroundImageWidth = appWidth-1;
  backgroundImageHeight = appHeight-1;
  picBackground = loadImage("Square - Baseball/baseball.jpg");
  bikeX = appWidth;
  bikeY = appHeight;
  bikeWidth = appWidth;
  bikeHeight = appHeight;
  //
  //DIVs
    rect( backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight );
    rect(bikeX, bikeY, bikeWidth, bikeHeight);
  //
  //Draw Image One Time, for testing
}

void draw() {
  image( picBackground, backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight );
}

void mousePressed() {
}

void keyPressed() {
}
