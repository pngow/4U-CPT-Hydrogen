import java.util.Random;

public class Cell extends Object{
  private int diameter;
  private int col;
  private PImage img;
  
  public Cell(PVector loc, PVector speed) {
    super(loc, speed);
    diameter = 70;
  }
  
  public boolean collides(float x, float y) {
    PVector point = new PVector(x, y);
    float dist = PVector.dist(getLoc(), point);
    
    return dist <= diameter;
  }
  
  public void setGraphics(int col, String url) {
    this.col = col;
    this.img = loadImage(url);
  }
  
  public void randColor() {
    Random rand = new Random();
    int colorLoc = rand.nextInt(imgs.length);  
    setGraphics(colors[colorLoc], imgs[colorLoc]);
  }
  
  public int getColor() {
    return this.col;
  }
  
  public PImage getImg() {
    return this.img;
  }
  
  public int getDiameter() {
    return diameter;
  }
  
  void draw() {
    noStroke();
    fill(col);
    ellipse(getXLoc(), getYLoc(), diameter, diameter);

    image(img, getXLoc()-35, getYLoc()-35, width/8, height/8);
    img.resize(0, 70);
  }
}
