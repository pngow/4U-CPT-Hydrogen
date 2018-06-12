public class Cell {
  private PVector loc;
  private PVector speed;
  private int diameter;
  private int col;
  private PImage img;
  
  public Cell(PVector loc, PVector speed) {
    this.loc = loc;
    this.speed = speed;
    diameter = 70;
  }
  
  public void setGraphics(int col, String url) {
    this.col = col;
    this.img = loadImage(url, "png");
  }
  
  public void setColor(int col) {
    this.col = col;
  }
  
  public int getColor() {
    return this.col;
  }
  
  public PImage getImg() {
    return this.img;
  }
  
  public boolean collides(float x, float y) {
    PVector point = new PVector(x, y);
    float dist = PVector.dist(this.loc, point);
    
    return dist <= diameter/2;
  }
  
  void draw() {
    noStroke();
    fill(col);
    ellipse(loc.x, loc.y, diameter, diameter);

    image(img, loc.x-35, loc.y-35, width/8, height/8);
    img.resize(0, 70);
  }
  
  public float getXLoc() {
    return loc.x;
  }
  
  public float getYLoc() {
    return loc.y;
  }
  
  public PVector getLoc() {
    return loc;
  }
  
  public PVector getSpeed() {
    return speed;
  }
  
  public int getDiameter() {
    return diameter;
  }
  
  public void setLoc(float x, float y) {
    loc = new PVector(x, y);
  }
  
  public void setLoc(PVector loc) {
    this.loc = loc;
  }
  
  public void setSpeed(PVector speed) {
    this.speed = speed;
  }
  
  public void move() {
    this.loc.y += speed.y;
  }
}
