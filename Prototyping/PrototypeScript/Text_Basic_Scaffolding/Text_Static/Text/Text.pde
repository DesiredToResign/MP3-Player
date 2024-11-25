//my code is better haha -jayden
/* Static Text
 -Text Aspect Ratio
 */
//Global Variables
int appWidth, appHeight;
float titleX, titleY, titleWidth, titleHeight;
float textX, textY, textWidth, textHeight;
float footerX, footerY, footerWidth, footerHeight;
PFont titleFont, footerFont, phraseFont;
color ink, red=#690000, white=#FFFFFF, resetDefaultInk=white;
int size, c;
String title = "This is top", footer = "This is bottom", phrase = "This is middle";
Boolean randomColor = true;
//
void setup()
{
  //Display
  size(500, 700);
  appWidth = width;
  appHeight = height;
  titleFont = createFont("Comic Sans MS", 55);
  footerFont = createFont("Comic Sans MS Bold", 55);
  phraseFont = createFont("Comic Sans MS Bold Italic", 55);
  //
  //Population
  titleX = appWidth*1/10;
  titleY = appHeight*1/10;
  titleWidth = appWidth*8/10;
  titleHeight = appHeight*1/10;
  textX = titleX;
  textY = appHeight*4.5/10;
  textWidth = titleWidth;
  textHeight = titleHeight;
  footerX = textX = titleX = appWidth*1/10;
  footerY = appHeight*8/10;
  footerWidth = textWidth = titleWidth = appWidth*8/10;
  footerHeight = textHeight = titleHeight = appHeight*1/10;
  //DIVs
  rect(titleX, titleY, titleWidth, titleHeight);
  rect(textX, textY, textWidth, textHeight);
  rect(footerX, footerY, footerWidth, footerHeight);
} //End Setup
//
void draw()
{
  //Text
  textAlign(CENTER, CENTER);

  ink = red;
  fill(ink);
  size = 50;
  textFont(titleFont, size);
  text(title, titleX, titleY, titleWidth, titleHeight);

  ink = red;
  fill(ink);
  size = 30;
  textFont(footerFont, size);
  text(footer, footerX, footerY, footerWidth, footerHeight);

  ink = (randomColor == true) ? color(random(0, 256), random(256), random(256)) : red;
  fill(ink);
  size = 40;
  textFont(phraseFont, size);
  text(phrase, textX, textY, textWidth, textHeight);
}
//
void mousePressed() {
} //End MP
//
void keyPressed() {
  if (randomColor == true) {
    randomColor = false;
  } else {
    randomColor = true;
  }
} //End KP
//
//End Main
