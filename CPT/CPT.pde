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

Cell player;

String[] imgs = { 
  "https://smart.servier.com/wp-content/uploads/2016/10/cellule_souche_multipotente.png",
  "https://smart.servier.com/wp-content/uploads/2016/10/cellule_progenitrice_lymphoide.png",
  "https://smart.servier.com/wp-content/uploads/2016/10/basophile_04.png",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Multipotential_hematopoietic_stem_cell.svg/2000px-Multipotential_hematopoietic_stem_cell.svg.png",
  "https://smart.servier.com/wp-content/uploads/2016/10/neutrophile_05.png"
};

String obstacleImg = "https://smart.servier.com/wp-content/uploads/2016/10/CelluleC_5.png";

int score;
int levelScore;

void setup() {
  size(600, 600);
  
  bg = loadImage("background.jpg");
  
  menu = new Menu();
  gameOver = new GameOver();
  
  //initalize instrButton screen and button
  instr = new Instructions();
  instrButton = new Button(100, 200);
  instrButton.setFunction("INSTRUCTIONS", 110, 255);
  
  //initialize about screen and button
  about = new About();
  aboutButton = new Button(350, 200);
  aboutButton.setFunction("ABOUT", 395, 245);
  
  //initalize game and button to startButton game
  game = new Game();
  startButton = new Button(225, 350);
  startButton.setFunction("START", 272, 408);

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
    System.out.println("instrButton");
    gameScreen = 2;
  }
  
  if (gameScreen == 0 && mouseX > aboutButton.getX() && mouseX < aboutButton.getX() + aboutButton.getLength() && mouseY > aboutButton.getY()
      && mouseY < aboutButton.getY() + aboutButton.getWidth()) {
    System.out.println("about");
    gameScreen = 3;
  }
  
  if (gameScreen == 0 && mouseX > startButton.getX() && mouseX < startButton.getX() + startButton.getLength() && mouseY > startButton.getY()
      && mouseY < startButton.getY() + startButton.getWidth()) {
    System.out.println("startButton");
    gameScreen = 1;
  }
}

void keyReleased() {
  if (key == BACKSPACE) {
    gameScreen = 0;
    System.out.println("back");
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