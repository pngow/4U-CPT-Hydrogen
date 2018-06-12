class Button {
  private int x;
  private int y;
  private int l;
  private int w;
  
  String text;
  int textXPos;
  int textYPos;
  
  public Button (int x, int y) {
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
    fill(#EC7063);
    rect(x, y, l, w, 20);
    
    noStroke();
    fill(0);
    textSize(18);
    text(text, textXPos, textYPos);
  }
}

public class Menu {
  void draw() {
    background(#FFFFFF);
    
    fill(0);
    textSize(60);
    text("GAME", 200, 150);

    instructions.draw();
    aboutButton.draw();
    text("STEM CELLS", 375, 265);
    start.draw();
  }
}
