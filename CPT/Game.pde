import java.util.Random;

public class Game {
  
  ArrayList<Object> cells = new ArrayList();
  ArrayList<Obstacle> obstacles = new ArrayList();
  
  void draw() {
    background(255, 255, 255);
   
    //initalize cells, add into an arraylist to store
    if (score < 20 && frameCount % 180 == 0) {
      generateCells();
    } else if (score >= 20 && frameCount % 120 == 0) {
      generateCells();
    }
    
    if (frameCount % 200 == 0) {
      generateObstacles();
    } else if (score >= 20 && frameCount % 140 == 0) {
      generateObstacles();
    }
    
    //if (score == 20) {
    //  if (frameCount % 60 == 0) {
    //  generateCells();
    //  }
    //} else if (score == 40) {
    //  if (frameCount % 30 == 0) {
    //    generateCells();
    //  }
    //}
   
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
        println("collision");
        cells.remove(i);
        score ++;
      } else if (cells.get(i).getYLoc() >= 660) {
        println("removed cell");
        cells.remove(i);
      }
    }
    
    for (int n = 0; n < obstacles.size(); n++) {
       if (obstacles.get(n).collides(player.loc.x, player.loc.y)) {
        println("game over");
        gameScreen = 4;
        restart();
      } else if (obstacles.get(n).getYLoc() >= 600) {
        println("removed obstacle");
        obstacles.remove(n);
      }
    }
     
    fill(0);
    textSize(20);
    text("SCORE: " + score, 10,30);
  }
  
  void generateCells() {
    Random rand = new Random();
    
    int[] colors = {
      #3498DB, //blue
      #A569BD, //purple
      #E67E22, //orange
      #28B463, //green
      #F4D03F, //yellow
      #8B4513, //brown
      #808080 //gray
    };
    int colorLoc = rand.nextInt(colors.length);
    
    PVector cLoc = new PVector(random(35, width-35), 0);
    PVector cSpeed = new PVector(0, +2);
    Object newCell = new Object(cLoc, cSpeed);
    newCell.setColor(colors[colorLoc]);
    cells.add(newCell);
  }
  
  void generateObstacles() {
    PVector oLoc = new PVector(random(20, width-20), 0);
    PVector oSpeed = new PVector(0, +2);
    Obstacle newObst = new Obstacle(oLoc, oSpeed);
    obstacles.add(newObst);
  }

  void restart() {
    gameOver.roundScore(score);
    score = 0;
    cells.clear();
    obstacles.clear();
  }
}
