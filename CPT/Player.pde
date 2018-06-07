public class Player {
  private PVector loc;
  private PVector speed;
  private int l = 70;  
  private int w = 70;
  private int col;
  private PImage stemImg;
  
  public Player(PVector loc, PVector speed) {
    this.loc = loc;
    this.speed = speed;
  }
  
  public void setGraphics(PImage stemImg, int col) {
    this.col = col;
    this.stemImg = stemImg;
  }
  
  public void setColor(int col){
    this.col = col; 
  }
  
  public int getColor() {
    return this.col;
  }
  
  public PImage getImg() {
    return this.stemImg;
  }
  
  public boolean collides(float x, float y) {
    PVector point = new PVector(x, y);
    float dist = PVector.dist(this.loc, point);
    
    return dist <= l;
  }
  
  void draw() {
    noStroke();
    fill(col);
    ellipse(loc.x, loc.y, l, w);
   
    image(stemImg, loc.x-35, 465);
    stemImg.resize(0, 70);
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