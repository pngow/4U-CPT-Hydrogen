public class Obstacle extends Object {
  private int l = 20;
  private int w = 50;
  private PImage img;
  
  public Obstacle (PVector loc, PVector speed, String url) {
    super(loc, speed);
    
    this.img = loadImage(url, "png");
  }
  
  public boolean collides(float x, float y) {
    PVector point = new PVector(x, y);
    float dist = PVector.dist(getLoc(), point);
    
    return dist <= (l+w)/2;
  }
  
  void draw() {
    float locX = getXLoc();
    float locY = getYLoc();
    
    noStroke();
    fill(0);
    rect(locX, locY, l, w);
    
    image(img, locX-15, locY-20, width/8, height/8);
  }
}
