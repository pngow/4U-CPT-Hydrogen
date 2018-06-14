import java.util.Random;

public class Game {
  
  ArrayList<Cell> cells = new ArrayList();
  ArrayList<Obstacle> obstacles = new ArrayList();
  int levelCheck = 0;
  int levelScore = 0;
  
  void draw() {
    background(bg);
    
    fill(57, 0, 0);
    ellipse(600, 0, 80, 80);
    ellipse(600, 50, 80, 80);
    ellipse(600, 100, 80, 80);
    ellipse(600, 200, 80, 80);
    ellipse(600, 300, 80, 80);
    ellipse(600, 400, 80, 80);
    ellipse(600, 500, 80, 80);

    ellipse(600, 35, 60, 60);
    ellipse(600, 75, 60, 60);
    ellipse(600, 150, 60, 60);
    ellipse(600, 250, 60, 60);
    ellipse(600, 350, 60, 60);
    ellipse(600, 450, 60, 60);
    ellipse(600, 550, 60, 60);
    ellipse(600, 600, 60, 60);
    
    ellipse(0, 0, 80, 80);
    ellipse(0, 50, 80, 80);
    ellipse(0, 100, 80, 80);
    ellipse(0, 200, 80, 80);
    ellipse(0, 300, 80, 80);
    ellipse(0, 400, 80, 80);
    ellipse(0, 500, 80, 80);

    ellipse(0, 35, 60, 60);
    ellipse(0, 75, 60, 60);
    ellipse(0, 150, 60, 60);
    ellipse(0, 250, 60, 60);
    ellipse(0, 350, 60, 60);
    ellipse(0, 450, 60, 60);
    ellipse(0, 550, 60, 60);
    ellipse(0, 600, 60, 60);


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
      if (frameCount % 140 == 0) {
      generateObstacles();
      }
      if (frameCount % 120 == 0) {
      generateObstacles();
      }
    } else if (levelCheck == 3) {
      if (frameCount % 100 == 0) {
        generateObstacles();  
      }
      if (frameCount % 80 == 0) {
      generateObstacles();
      }
    } else if (levelCheck == 4) {
      if (frameCount % 60 == 0) {
      generateObstacles();
      }
      if (frameCount % 40 == 0) {
      generateObstacles();
      }
    } else if (levelCheck >= 5) {
      if (frameCount % 30 == 0) {
        generateObstacles(); 
      }
      if (frameCount % 20 == 0) {
        generateObstacles(); 
      }
    }
   
    //draw and move cells, adjust speed according to level
    for (Cell cell : cells) {
      if (levelCheck >= 2) {
        cell.setSpeed(new PVector(0, +4));
      } 
      if (levelCheck >= 4) {
        cell.setSpeed(new PVector(0, +5));
      }
      if (levelCheck == 6) {
        cell.setSpeed(new PVector(0, +6)); 
      }
      if (levelCheck >= 7) {
        cell.setSpeed(new PVector(0, +7));
      }
      
      cell.draw();
      cell.move();
    }
    
    //draw and move obstacles, adjust speed according to level
    for (Obstacle obstacle : obstacles) {
      if (levelCheck >= 2) {
        obstacle.setSpeed(new PVector(0, +4));
      }
      if (levelCheck >= 4) {
        obstacle.setSpeed(new PVector(0, +5));
      }
      if (levelCheck == 6) {
        obstacle.setSpeed(new PVector(0, +6)); 
      }
      if (levelCheck >= 7) {
        obstacle.setSpeed(new PVector(0, +7)); 
      }
      
      obstacle.draw();
      obstacle.move();
    }
     
    player.draw();
    
    //check cell collision && if cell passed screen boundaries
    for (int i = 0; i < cells.size(); i++) {
      if (cells.get(i).collides(player.getXLoc(), player.getYLoc()) && cells.get(i).getColor() == player.getColor()) {
        cells.remove(i);
        score ++;
        levelScore ++;
        
        //change player character
        if (levelScore > 4) {
          player.randColor();
          levelScore = 0;
          levelCheck ++;
          score += 10;
        }
        
      } else if (cells.get(i).collides(player.getXLoc(), player.getYLoc()) && cells.get(i).getColor() != player.getColor()) {
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
      if (obstacles.get(n).collides(player.getXLoc(), player.getYLoc())) {
        gameScreen = 4;
        restart();
      } else if (obstacles.get(n).getYLoc() >= 600) {
        obstacles.remove(n);
      }
    }
    
    //draw score counter and requirements for what to collect
    fill(255);
    textFont(font);
    textSize(30);
    text("SCORE: ", 10, 30);

    textFont(f);
    textSize(30);
    
    text(score, 118, 30);
    
    noStroke();
    fill(player.getColor());
    ellipse(25, 60, 25, 25);
    PImage img = player.getImg();
    image(img, 14, 39, width/16, height/16);
    
    text(" x " + (5 - levelScore), 50, 65);
    
  }
  
  void generateCells() {
    //Random rand = new Random();
    //int colorLoc = rand.nextInt(imgs.length);
    
    PVector cLoc = new PVector(random(35, width-35), 0);
    PVector cSpeed = new PVector(0, +3);
    Cell newCell = new Cell(cLoc, cSpeed);
    newCell.randColor();
    cells.add(newCell);
  }
  
  void generateObstacles() {
    PVector oLoc = new PVector(random(20, width-20), 0);
    PVector oSpeed = new PVector(0, +3);
    Obstacle newObst = new Obstacle(oLoc, oSpeed, obstacleImg);
    obstacles.add(newObst);
  }

  void restart() {
    gameOver.roundScore(score);
    score = 0;
    levelScore = 0;
    levelCheck = 0;
    cells.clear();
    obstacles.clear();
  }
}
