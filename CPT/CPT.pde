/* if gameScreen =
0, menu
1, startButton game
2, instrButton
3, about
4, game over*/
int gameScreen = 0;

Menu menu;

Button instrButton;
Instructions instr;

Button aboutButton;
About about;

Button startButton;
Game game;
GameOver gameOver;

PImage bg;
PFont font;
PFont f;

Cell player;

String[] imgs = { 
  "cell1.png",
  "cell2.png",
  "cell3.png",
  "cell4.png",
  "cell5.png"
};

String obstacleImg = "obstCell.png";

String instrImg = "cursor.png";
String instrImg2;
String instrImg3;
String instrImg4 = "aboutImg.png";
String instrImg5 = "bloodImg.png";

int score;
int levelScore;

void setup() {
  size(600, 600);
  
  bg = loadImage("background.jpg");
  
  img = loadImage(instrImg, "png");
  img2 = loadImage(imgs[0], "png");
  img3 = loadImage(obstacleImg, "png");
  img4 = loadImage(instrImg4, "png");
  img5 = loadImage(instrImg5, "png");
  
  font = createFont("RAINFALL.otf", 70);
  f = createFont("Arial", 12);
  
  menu = new Menu();
  gameOver = new GameOver();
  
  
  //initalize instrButton screen and button
  instr = new Instructions();
  instrButton = new Button(100, 200);
  instrButton.setFunction("INSTRUCTIONS", 110, 280);
  
  //initialize about screen and button
  about = new About();
  aboutButton = new Button(350, 200);
  aboutButton.setFunction("ABOUT", 395, 265);
  
  //initalize game and button to startButton game
  game = new Game();
  startButton = new Button(225, 350);
  startButton.setFunction("START", 272, 430);

  //initalize beginning score and level for game
  score = 0;
  levelScore = 0;

  //initalize player
  PVector pLoc = new PVector(300, 500);
  PVector pSpeed = new PVector(0, 0);
  player = new Cell(pLoc, pSpeed);
  player.setGraphics(#3498DB, imgs[0]);
}

void draw() {
  if (gameScreen == 0) {
    cursor();
    menu.draw();
  } else if (gameScreen == 1) {
    noCursor();
    game.draw();
  } else if (gameScreen == 2) {
    instr.draw();
  } else if (gameScreen == 3) {
    about.draw();
  } else if (gameScreen == 4) {
    gameOver.draw();
  }
}

void mouseClicked() {
  if (gameScreen == 0 && mouseX > instrButton.getX() && mouseX < instrButton.getX() + instrButton.getLength() 
      && mouseY > instrButton.getY() && mouseY < instrButton.getY() + instrButton.getWidth()) {
    gameScreen = 2;
  }
  
  if (gameScreen == 0 && mouseX > aboutButton.getX() && mouseX < aboutButton.getX() + aboutButton.getLength() && mouseY > aboutButton.getY()
      && mouseY < aboutButton.getY() + aboutButton.getWidth()) {
    gameScreen = 3;
  }
  
  if (gameScreen == 0 && mouseX > startButton.getX() && mouseX < startButton.getX() + startButton.getLength() && mouseY > startButton.getY()
      && mouseY < startButton.getY() + startButton.getWidth()) {
    gameScreen = 1;
  }
}

void keyReleased() {
  if (key == BACKSPACE) {
    gameScreen = 0;
  }
}

//move player in game according to mouse
void mouseMoved() {
  player.setLoc(mouseX, 500);
   
  if (mouseX <= (player.getDiameter()/2)) {
    player.setLoc(0 + (player.getDiameter()/2), 500);
  } else if (mouseX >= 600 - (player.getDiameter()/2)) {
    player.setLoc(600 - (player.getDiameter()/2), 500);
  }
}
