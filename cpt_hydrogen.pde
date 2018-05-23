int x;
int y;

void setup() {
  // Character
  x = 70;
  y = 500;
  
  size(600, 600);
}

void draw() {
  background(100, 100, 100);
  rect(x, y, 50, 50);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT && x > 0) {
      x -= 20;
    } else if (keyCode == RIGHT && x < 550) {
      x += 20;
    }
  }
}
 
 