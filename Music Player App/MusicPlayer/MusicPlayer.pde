// © Copyright Desired01 / Jayden Minoza-Thomas 2024 © //

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// Global Variables for Screen Dimensions
int appWidth, appHeight;

// Global Variables for Layout Positions and Sizes
int mainX, mainY, mainWidth, mainHeight;         // Main section
int headerX, headerY, headerWidth, headerHeight; // "Now Playing" Header
int controlsX, controlsY, buttonSize, spacing;   // Control Buttons
int quitX, quitY, quitWidth, quitHeight;         // Quit Button
int playlistX, playlistY, rowWidth, rowHeight;   // Playlist Grid
int iconX, iconY, iconSize, iconSpacing;         // Bottom Icons

// Global Variables for Minim
Minim minim;
int numberOfSongs = 3; // Adjusted to 3 songs
AudioPlayer[] songs = new AudioPlayer[numberOfSongs];
int currentSongIndex = 0;

String musicPath = "../../MP3s/";
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

// Variables for hover and click detection
boolean[] iconHovered = new boolean[2];
boolean[] iconClicked = new boolean[2];
boolean[] controlHovered = new boolean[8];
boolean[] controlClicked = new boolean[8];
boolean quitHovered = false;
boolean quitClicked = false;

// Global Variable to Track Theme
boolean isDarkTheme = true; // false for Light, true for Dark

// Setup the canvas
void setup() {
  fullScreen(); // Fullscreen mode
  appWidth = width;
  appHeight = height;

  // Set up basic styles
  rectMode(CORNER);
  textAlign(CENTER, CENTER);
  textSize(20);

  //Minim setup
  minim = new Minim(this);

  // Load Music (Adjust to the new number of songs)
  for (int i = 0; i < numberOfSongs; i++) {
    songs[i] = minim.loadFile(musicPath + musicNames[i] + mp3FileName);
  }

  // Play Song
  songs[currentSongIndex].play();

  // Populate Global Variables
  mainX = 10;
  mainY = 10;
  mainWidth = appWidth - 20;
  mainHeight = appHeight - 20;

  headerX = mainX + 10;
  headerY = mainY + 10;
  headerWidth = mainWidth - 40;
  headerHeight = 80;

  controlsX = appWidth * 1/2 - appWidth * 1/8;
  controlsY = headerY + headerHeight + 20;
  buttonSize = 50;
  spacing = 10;

  quitWidth = 60;
  quitHeight = 40;
  quitX = mainX + mainWidth - quitWidth - 20;
  quitY = controlsY;

  playlistX = headerX;
  playlistY = controlsY + buttonSize + 20;
  rowWidth = mainWidth - 40;
  rowHeight = 60;

  iconSize = 70;
  iconSpacing = 20;
  iconX = playlistX;
  iconY = mainY + mainHeight - iconSize - 20;
}

// Draw the UI layout
void draw() {
  // Set background color based on the theme
  if (isDarkTheme) {
    background(30); // Dark background
  } else {
    background(240); // Light background
  }

  // Main MP3 Player Section
  drawMainSection();

  // Draw Icons with Hover Effects
  drawBottomIcons();

  // Draw Control Buttons with Hover Effects
  drawControlButtons();

  // Draw Quit Button with Hover Effects
  drawQuitButton();
}

// Main Section
void drawMainSection() {
  // Main Background
  if (isDarkTheme) {
    fill(50); // Dark background for main section
    stroke(200);
  } else {
    fill(220); // Light background for main section
    stroke(0);
  }
  rect(mainX, mainY, mainWidth, mainHeight);

  // "Now Playing" Header with Song Name
  if (isDarkTheme) {
    fill(70); // Dark header
  } else {
    fill(200); // Light header
  }
  rect(headerX, headerY, headerWidth, headerHeight);
  fill(isDarkTheme ? 255 : 0); // Text color opposite to background
  String nowPlayingText = "Now Playing: " + actualMusicNames[currentSongIndex]; // Dynamic song name
  text(nowPlayingText, headerX + headerWidth / 2, headerY + headerHeight / 2);

  // Playlist Grid
  for (int i = 0; i < numberOfSongs; i++) { // Adjusted to 3 songs
    if (isDarkTheme) {
      fill(60); // Dark row background
      stroke(100);
    } else {
      fill(255); // Light row background
      stroke(0);
    }
    rect(playlistX, playlistY + i * rowHeight, rowWidth, rowHeight);
    fill(isDarkTheme ? 255 : 0); // Text color opposite to background
    textAlign(LEFT, CENTER);
    text(actualMusicNames[i], playlistX + 10, playlistY + i * rowHeight + rowHeight / 2);
    textAlign(CENTER, CENTER);
  }
}

// Draw Bottom Icons (Buttons)
void drawBottomIcons() {
  for (int i = 0; i < 2; i++) {
    // Check if the mouse is hovering over the icon
    if (mouseX >= iconX + i * (iconSize + iconSpacing) && mouseX <= iconX + i * (iconSize + iconSpacing) + iconSize &&
      mouseY >= iconY && mouseY <= iconY + iconSize) {
      iconHovered[i] = true;
    } else {
      iconHovered[i] = false;
    }

    // Draw icon button with hover effect
    if (iconHovered[i]) {
      fill(isDarkTheme ? 100 : 200); // Hover color
    } else {
      fill(isDarkTheme ? 40 : 255); // Default color based on theme
    }
    stroke(0);
    rect(iconX + i * (iconSize + iconSpacing), iconY, iconSize, iconSize);
    fill(isDarkTheme ? 255 : 0); // Icon label color based on theme
    text(getIconLabel(i), iconX + i * (iconSize + iconSpacing) + iconSize / 2, iconY + iconSize / 2);
  }
}

// Draw Control Buttons (Playback)
void drawControlButtons() {
  for (int i = 0; i < 8; i++) {
    // Check if the mouse is hovering over the control button
    if (mouseX >= controlsX + i * (buttonSize + spacing) && mouseX <= controlsX + i * (buttonSize + spacing) + buttonSize &&
      mouseY >= controlsY && mouseY <= controlsY + buttonSize) {
      controlHovered[i] = true;
    } else {
      controlHovered[i] = false;
    }

    // Draw control button with hover effect
    if (controlHovered[i]) {
      fill(isDarkTheme ? 100 : 200); // Hover color
    } else {
      fill(isDarkTheme ? 40 : 255); // Default color based on theme
    }
    stroke(0);
    rect(controlsX + i * (buttonSize + spacing), controlsY, buttonSize, buttonSize);
    fill(isDarkTheme ? 255 : 0); // Icon label color based on theme
    text(getControlLabel(i), controlsX + i * (buttonSize + spacing) + buttonSize / 2, controlsY + buttonSize / 2);
  }
}

// Draw Quit Button (Exit)
void drawQuitButton() {
  // Check if the mouse is hovering over the quit button
  if (mouseX >= quitX && mouseX <= quitX + quitWidth && mouseY >= quitY && mouseY <= quitY + quitHeight) {
    quitHovered = true;
  } else {
    quitHovered = false;
  }

  // Draw quit button with hover effect
  if (quitHovered) {
    fill(isDarkTheme ? 100 : 200); // Hover color
  } else {
    fill(isDarkTheme ? 40 : 255); // Default color based on theme
  }
  stroke(0);
  rect(quitX, quitY, quitWidth, quitHeight);
  fill(isDarkTheme ? 255 : 0); // Text color based on theme
  text("X", quitX + quitWidth / 2, quitY + quitHeight / 2);
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

// Mouse Pressed to simulate button click
void mousePressed() {
  // Check if an icon is clicked
  for (int i = 0; i < 2; i++) {
    if (iconHovered[i]) {
      iconClicked[i] = true;
      println(getIconLabel(i) + " button clicked!");

      // Toggle theme if "Theme" icon is clicked
      if (getIconLabel(i) == "Theme") {
        isDarkTheme = !isDarkTheme;
        println("Theme switched to " + (isDarkTheme ? "Dark" : "Light"));
      }
    }
  }

  // Check if a control button is clicked
  for (int i = 0; i < 8; i++) {
    if (controlHovered[i]) {
      controlClicked[i] = true;
      println(getControlLabel(i) + " button clicked!");

      // Play button clicked
      if (getControlLabel(i) == "Play") {
        if (songs[currentSongIndex].isPlaying()) {
          songs[currentSongIndex].pause();
        } else {
          songs[currentSongIndex].play();
        }
      }

      // Stop button clicked
      if (getControlLabel(i) == "Stop") {
        songs[currentSongIndex].pause();
        songs[currentSongIndex].rewind();
      }

      // Next Song
      if (getControlLabel(i) == ">|") {
        songs[currentSongIndex].pause();  // Pause the current song
        songs[currentSongIndex].rewind(); // Rewind the song
        currentSongIndex = (currentSongIndex + 1) % numberOfSongs;  // Next song
        println("Now playing: " + actualMusicNames[currentSongIndex]);
        songs[currentSongIndex].play();  // Play the next song
      }

      // Previous Song
      if (getControlLabel(i) == "|<") {
        songs[currentSongIndex].pause();  // Pause the current song
        songs[currentSongIndex].rewind(); // Rewind the song
        currentSongIndex = (currentSongIndex - 1 + numberOfSongs) % numberOfSongs;  // Previous song
        println("Now playing: " + actualMusicNames[currentSongIndex]);
        songs[currentSongIndex].play();  // Play the previous song
      }

      // Fast Forward
      if (getControlLabel(i) == ">>") {
        songs[currentSongIndex].skip(1000);
      }

      // Fast Rewind
      if (getControlLabel(i) == "<<") {
        songs[currentSongIndex].skip(-1000);
      }

      // Loop Forever
      if (getControlLabel(i) == "Loop") {
        songs[currentSongIndex].loop();
      }
    }
  }

  // Check if the quit button is clicked
  if (quitHovered) {
    quitClicked = true;
    println("Quit button clicked!");
    exit();  // Exit the program
  }
}
