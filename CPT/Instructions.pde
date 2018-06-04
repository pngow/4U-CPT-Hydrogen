class Instructions {
  
  void draw() {
    background(#FFFFFF);
    
    fill(#EC7063);
    textSize(40);
    text("INSTRUCTIONS", 160, 100);
    
    fill(0);
    textSize(20);
    text("-Use the mouse pad to move side to side", 75, 155);
    text("-Collect the specific cells to gain points", 75, 195);
    text("-Complete the requirements to gain extra points", 75, 235);
    text("-Collect the wrong cells and you'll lose points", 75, 275);
    
    textSize(15);
    text("PRESS BACKSPACE TO RETURN TO MENU", 150, 580);
  }
}