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
  int levelCheck = 0;
  
  void draw() {
    background(255, 255, 255);
   
    //adjust generation of cells according to level
    if (frameCount % 180 == 0) {
      generateCells();
    } else if (levelCheck == 1 && frameCount % 160 == 0) {
      generateCells();
    } else if (levelCheck == 2 && frameCount % 140 == 0) {
      generateCells();
    } else if (levelCheck == 3) {
      if (frameCount % 120 == 0) {
        generateCells();
      }
      if (frameCount % 90 == 0) {
        generateCells();
      }
    } else if (levelCheck == 4) {
      if (frameCount % 100 == 0) {
        generateCells();
      }
      if (frameCount % 70 == 0) {
        generateCells();
      }
    } else if (levelCheck >= 5) {
      if (frameCount % 80 == 0) {
        generateCells();
      } 
      if (frameCount % 50 == 0) {
        generateCells(); 
      }
    }
    
    if (frameCount % 200 == 0) {
      generateObstacles();
    } else if (levelCheck == 1 && frameCount % 160 == 0) {
      generateObstacles();
    } else if (levelCheck == 2) {
      if (frameCount % 120 == 0) {
      generateObstacles();
      }
      if (frameCount % 90 == 0) {
      generateObstacles();
      }
    } else if (levelCheck == 3) {
      if (frameCount % 80 == 0) {
        generateObstacles();  
      }
      if (frameCount % 50 == 0) {
      generateObstacles();
      }
    } else if (levelCheck == 4) {
      if (frameCount % 50 == 0) {
      generateObstacles();
      }
      if (frameCount % 40 == 0) {
      generateObstacles();
      }
    } else if (levelCheck >= 5) {
      if (frameCount % 40 == 0) {
        generateObstacles(); 
      }
      if (frameCount % 20 == 0) {
        generateObstacles(); 
      }
    }
   
    //draw and move cells, adjust speed according to level
    for (Object cell : cells) {
      if (levelCheck >= 2) {
        cell.setSpeed(new PVector(0, +6));
      } 
      if (levelCheck >= 4) {
        cell.setSpeed(new PVector(0, +7));
      }
      if (levelCheck == 6) {
        cell.setSpeed(new PVector(0, +8)); 
      }
      if (levelCheck >= 7) {
        cell.setSpeed(new PVector(0, +9));
      }
      
      cell.draw();
      cell.move();
    }
    
    //draw and move obstacles, adjust speed according to level
    for (Obstacle obstacle : obstacles) {
      if (levelCheck >= 2) {
        obstacle.setSpeed(new PVector(0, +6));
      }
      if (levelCheck >= 4) {
        obstacle.setSpeed(new PVector(0, +7));
      }
      if (levelCheck == 6) {
        obstacle.setSpeed(new PVector(0, +8)); 
      }
      if (levelCheck >= 7) {
        obstacle.setSpeed(new PVector(0, +9)); 
      }
      
      obstacle.draw();
      obstacle.move();
    }
     
    player.draw();
    
    //check cell collision && if cell passed screen boundaries
    for (int i = 0; i < cells.size(); i++) {
      if (cells.get(i).collides(player.loc.x, player.loc.y) && cells.get(i).getColor() == player.getColor()) {
        cells.remove(i);
        score ++;
        levelScore ++;
        
        //change player character
        if (levelScore > 4) {
          Random rand = new Random();
          player.setColor(colors[rand.nextInt(colors.length)]);
          levelScore = 0;
          levelCheck ++;
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
    
    //check obstacle collision
    for (int n = 0; n < obstacles.size(); n++) {
       if (obstacles.get(n).collides(player.loc.x, player.loc.y)) {
        gameScreen = 4;
        restart();
      } else if (obstacles.get(n).getYLoc() >= 600) {
        obstacles.remove(n);
      }
    }
    
    //draw score counter and requirements for what to collect
    fill(0);
    textSize(20);
    text("SCORE: " + score, 10,30);
    
    noStroke();
    fill(player.getColor());
    ellipse(25, 60, 25, 25);
    text("x" + (5 - levelScore), 45, 65);
  }
  
  void generateCells() {
    Random rand = new Random();
    int colorLoc = rand.nextInt(colors.length);
    
    PVector cLoc = new PVector(random(35, width-35), 0);
    PVector cSpeed = new PVector(0, +5);
    Object newCell = new Object(cLoc, cSpeed);
    newCell.setColor(colors[colorLoc]);
    cells.add(newCell);
  }
  
  void generateObstacles() {
    PVector oLoc = new PVector(random(20, width-20), 0);
    PVector oSpeed = new PVector(0, +5);
    Obstacle newObst = new Obstacle(oLoc, oSpeed);
    obstacles.add(newObst);
  }

  void restart() {
    gameOver.roundScore(score);
    score = 0;
    levelScore = 0;
    cells.clear();
    obstacles.clear();
  }
}
