//global variables
int appWidth, appHeight;
float backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight;
float batX, batY, batWidth, batHeight;
PImage picBackground, picBat;
float picBatWidthChanged, picBatHeightChanged, picBatWidth, picBatHeight;
float biggerSide, smallerSide, ratio;
Boolean nightMode = false;
//

void setup() {
  size(600, 600); //Landscape
  appWidth = width;
  appHeight = height;
  //
  //Population
  backgroundImageX = appWidth*0;
  backgroundImageY = appHeight*0;
  backgroundImageWidth = appWidth-1;
  backgroundImageHeight = appHeight-1;
  picBackground = loadImage("Square - Baseball/baseball.jpg");
  picBat = loadImage("Square - Bat/bat.jpg");
  picBatWidthChanged = picBatWidth = 1961;
  picBatHeightChanged = picBatHeight = 2560;
  batX = appWidth * 1/4;
  batY = appHeight * 1/4;
  batWidth = appWidth * 1/2;
  batHeight = appHeight * 1/2;
  //
  // le compression
  biggerSide = (picBatWidth > picBatHeight) ? picBatWidth : picBatHeight;
  smallerSide = (picBatWidth < picBatHeight) ? picBatWidth : picBatHeight;
  ratio = (1 / biggerSide) * smallerSide; //ratio bigger than 1, divide = smaller side, multiply = larger side

  if (batWidth > batHeight) {
    picBatHeightChanged = batHeight;
    picBatWidthChanged = (picBatWidth > picBatHeight) ? picBatWidthChanged * ratio : picBatWidthChanged / ratio;
  } else {
    picBatWidthChanged = batWidth;
    picBatHeightChanged = (picBatWidth > picBatHeight) ? picBatWidthChanged * ratio : picBatWidthChanged / ratio;
  }

  println(biggerSide, smallerSide, ratio);
  //
  //DIVs
  stroke(0);
  rect(backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight);
  rect(batX, batY, batWidth, batHeight);
  //
  //Draw Image One Time, for testing
}

void draw() {
  image( picBackground, backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight );
  image(picBat, batX, batY, picBatWidthChanged, picBatHeightChanged);
}

void mousePressed() {

}

void keyPressed() {
}
