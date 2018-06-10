public class Obstacle extends Object {
  private int l = 20;
  private int w = 50;
  
  public Obstacle (PVector loc, PVector speed) {
    super(loc, speed);
  }
  
  public boolean collides(float x, float y) {
    PVector point = new PVector(x, y);
    float dist = PVector.dist(getLoc(), point);
    
    return dist <= (l+w)/2;
  }
  
  void draw() {
    noStroke();
    fill(0);
    rect(getXLoc(), getYLoc(), l, w);
  }
}
