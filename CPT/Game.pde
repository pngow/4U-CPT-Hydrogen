import java.util.Random;

int[] colors = {
  #3498DB, //blue
  #A569BD, //purple
  #E67E22, //orange
  #28B463, //green
  #F4D03F, //yellow
};

public class Game {
  
  ArrayList<Object> cells = new ArrayList();
  ArrayList<Obstacle> obstacles = new ArrayList();
  
  void draw() {
    background(bg);
   
    //initalize cells, add into an arraylist to store
    int frameAdjust = 40;
    int scoreCheck = 0;
    if (frameCount % 180 == 0) {
      generateCells();
    } else if (score > 0 && score - 9 >= scoreCheck && frameCount % (180 - frameAdjust) == 0) {
      generateCells();
      //frameAdjust += 40;
      scoreCheck = score;
    }
    
    if (frameCount % 200 == 0) {
      generateObstacles();
    } else if (score > 0 && score - 9 >= scoreCheck && frameCount % (120 - frameAdjust) == 0) {
      generateObstacles();
    } 
   
    //draw and move cells
    for (Object cell : cells) {
      cell.draw();
      cell.move();
    }
    
    //draw and move obstacles 
    for (Obstacle obstacle : obstacles) {
      obstacle.draw();
      obstacle.move();
    }
     
    player.draw();
    
    //check collision && if cell passed screen boundaries
    for (int i = 0; i < cells.size(); i++) {
      if (cells.get(i).collides(player.loc.x, player.loc.y) && cells.get(i).getColor() == player.getColor()) {
        cells.remove(i);
        score ++;
        levelScore ++;
        
        //change player character
        if (levelScore > 4) {
          Random rand = new Random();
          int randI = rand.nextInt(colors.length);
          player.setGraphics(colors[randI], imgs[randI]);
          levelScore = 0;
          score += 10;
        }
        
      } else if (cells.get(i).collides(player.loc.x, player.loc.y) && cells.get(i).getColor() != player.getColor()) {
        cells.remove(i);
        score --;
        
        if (score < 1) {
          gameScreen = 4;
          restart();
        }
        
      } else if (cells.get(i).getYLoc() >= 660) {
        cells.remove(i);
      }
    }
    
    for (int n = 0; n < obstacles.size(); n++) {
       if (obstacles.get(n).collides(player.loc.x, player.loc.y)) {
        gameScreen = 4;
        restart();
      } else if (obstacles.get(n).getYLoc() >= 600) {
        obstacles.remove(n);
      }
    }
     
    fill(0);
    textSize(25);
    text("SCORE: " + score, 10,30);
    
    noStroke();
    fill(player.getColor());
    ellipse(25, 60, 25, 25);
    PImage img = player.getImg();
    image(img, 9, 39, width/17, height/17);
    
    
    text("x" + (5 - levelScore), 45, 65);
  }
  
  void generateCells() {
    Random rand = new Random();
    int colorLoc = rand.nextInt(colors.length);
    
    PVector cLoc = new PVector(random(35, width-35), 0);
    PVector cSpeed = new PVector(0, +5);
    Object newCell = new Object(cLoc, cSpeed);
    newCell.setGraphics(colors[colorLoc], imgs[colorLoc]);
    cells.add(newCell);
  }
  
  void generateObstacles() {
    PVector oLoc = new PVector(random(20, width-20), 0);
    PVector oSpeed = new PVector(0, +5);
    Obstacle newObst = new Obstacle(oLoc, oSpeed, obstacleImg);
    obstacles.add(newObst);
  }

  void restart() {
    gameOver.roundScore(score);
    score = 0;
    cells.clear();
    obstacles.clear();
  }
}