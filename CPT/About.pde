PImage img4;
PImage img5;

class About {
  void draw() {
    background(0);
    
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
    
    
    fill(255, 255, 255);
    textFont(font);
    textSize(70);
    text("STEM CELLS", 100, 80);
    
    textFont(f);
    textSize(17);
    text("Stem cells are immature cells in the\nbloodstream that have the ability to\nspecialize into nerve, blood, muscle,\nand liver cells.", 75, 125);
    image(img4, 375, 110, width/4, height/4.5);
    
    text("Healthy stem cells can be\ntransplanted into patients with\ncancer, Alzheimer’s, and bone\nmarrow diseases as an effective\ntreatment", 300, 270);
    image(img2, 90, 240, width/4, height/4);
    
    text("There is currently a significant deficit\nof stem cell donors as only 50% of\neligible patients find a suitable match ", 75, 440);
    image(img5, 350, 400);
    
    textSize(15);
    text("PRESS BACKSPACE TO RETURN TO MENU", 150, 580);
  }
}
