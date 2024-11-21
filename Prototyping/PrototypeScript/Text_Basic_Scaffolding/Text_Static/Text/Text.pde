//my code is better haha -jayden
/* Static Text
-Text Aspect Ratio
*/
//Global Variables
int appWidth, appHeight;
float titleX, titleY, titleWidth, titleHeight;
float textX, textY, textWidth, textHeight;
float footerX, footerY, footerWidth, footerHeight;
//
//Display
size(500, 500);
appWidth = width;
appHeight = height;
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
footerX = titleX;
footerY = appHeight*8/10;
footerWidth = titleWidth;
footerHeight = titleHeight;
//DIVs
rect(titleX, titleY, titleWidth, titleHeight);
rect(textX, textY, textWidth, textHeight);
rect(footerX, footerY, footerWidth, footerHeight);
