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
color red=#690000, resetDefaultInk=#FFFFFF;
int size;
String title = "{insert blue grinch}";
//
//Display
size(500, 500);
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
//
//Text
fill(red);
textAlign(CENTER, CENTER);
size = 50;

textFont(titleFont, size);
text(title, titleX, titleY, titleWidth, titleHeight);

textFont(footerFont, size);
text(title, footerX, footerY, footerWidth, footerHeight);

textFont(phraseFont, size);
text(title, textX, textY, textWidth, textHeight);
