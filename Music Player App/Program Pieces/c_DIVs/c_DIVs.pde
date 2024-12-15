// Global Variables for Screen Dimensions
int appWidth, appHeight;

// Layout Positions and Sizes
int mainX, mainY, mainWidth, mainHeight; // Main section
int headerX, headerY, headerWidth, headerHeight; // "Now Playing" Header
int controlsX, controlsY, buttonSize, buttonSpacing; // Control Buttons
int quitX, quitY, quitWidth, quitHeight; // Quit Button
int playlistX, playlistY, rowHeight, playlistWidth; // Playlist Grid
int iconX, iconY, iconSize, iconSpacing; // Bottom Icons

// Setup the canvas
void setup() {
  fullScreen(); // Fullscreen mode
  appWidth = width;
  appHeight = height;

  // Set up basic styles
  rectMode(CORNER);

  // Populate Layout Variables
  mainX = 10;
  mainY = 10;
  mainWidth = appWidth - 20;
  mainHeight = appHeight - 20;

  headerX = mainX + 10;
  headerY = mainY + 10;
  headerWidth = mainWidth - 40;
  headerHeight = 80;

  controlsX = appWidth * 1/2 - appWidth * 1/8;
  controlsY = headerY + headerHeight + 10;
  buttonSize = 50;
  buttonSpacing = 10;

  quitWidth = 60;
  quitHeight = 40;
  quitX = mainWidth - quitWidth - 20;
  quitY = controlsY;

  playlistX = mainX + 10;
  playlistY = controlsY + buttonSize + 10;
  playlistWidth = mainWidth - 40;
  rowHeight = 60;

  iconSize = 70;
  iconSpacing = 20;
  iconX = playlistX;
  iconY = mainHeight - iconSize - 20;
}

// Draw the UI layout
void draw() {
  background(240); // Light grey background

  // Main MP3 Player Section
  drawMainSection();
}

// Main Section
void drawMainSection() {
  // Main Background
  fill(220);
  stroke(0);
  rect(mainX, mainY, mainWidth, mainHeight);

  // "Now Playing" Header
  fill(200);
  rect(headerX, headerY, headerWidth, headerHeight);
  fill(0);

  // Controls Row (Playback Buttons)
  for (int i = 0; i < 8; i++) {
    fill(255); // White buttons
    rect(controlsX + i * (buttonSize + buttonSpacing), controlsY, buttonSize, buttonSize);
    fill(0);
  }

  // Quit Button (aligned to the right)
  fill(255); // Reset to white for the QUIT button
  stroke(0); // Black outline
  rect(quitX, quitY, quitWidth, quitHeight);
  fill(0); // Set text color to black

  // Playlist Grid
  for (int i = 0; i < 3; i++) {
    fill(255);
    stroke(0);
    rect(playlistX, playlistY + i * rowHeight, playlistWidth, rowHeight);
    fill(0);
  }

  // Bottom Icons
  for (int i = 0; i < 2; i++) {
    fill(255); // White background for icons
    stroke(0);
    rect(iconX + i * (iconSize + iconSpacing), iconY, iconSize, iconSize);
    fill(0);
  }
}

// Control Labels
String getControlLabel(int i) {
  String[] labels = {"|<", "<<", "Play", "Stop", ">>", ">|", "Loop", "Shuffle"};
  return labels[i];
}

// Icon Labels
String getIconLabel(int i) {
  String[] labels = {"Settings", "Theme"};
  return labels[i];
}
