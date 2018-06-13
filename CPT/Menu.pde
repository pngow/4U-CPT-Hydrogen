class Button {
  private int x;
  private int y;
  private int l;
  private int w;
  
  String text;
  int textXPos;
  int textYPos;
  
  public Button(int x, int y) {
    this.x = x;
    this.y = y;
    l = 150;
    w = 100;
  }
  
  public void setFunction(String text, int textXPos, int textYPos) {
    this.text = text;
    this.textXPos = textXPos;
    this.textYPos = textYPos;
  }
  
  public int getX() {
    return x;
  }
  
  public int getY() {
    return y;
  }
  
  public int getLength() {
    return l;
  }
  
  public int getWidth() {
    return w;
  }
  
  void draw() {
    image(loadImage("https://smart.servier.com/wp-content/uploads/2016/10/cellule_souche_multipotente.png", "png"), x, y, width/4, height/4);
    
    noStroke();
    fill(255);
    textSize(18);
    text(text, textXPos, textYPos);
  }
}

public class Menu {
  void draw() {
    background(0);
    
    fill(255);
    textSize(60);
    text("GAME", 200, 150);

    instrButton.draw();
    aboutButton.draw();
    text("STEM CELLS", 375, 265);
    startButton.draw();
  } 
}