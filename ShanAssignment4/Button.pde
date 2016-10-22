class Button {
  float x, y, w, h, bgColor, g, gChange;  // declare var
  boolean isButton;

  Button() {  // initialize var
    x = 500; 
    y = 340;      
    w = 80; 
    h = 60;
    g = 0;   
    gChange = 1;
    isButton = false;
  }  

  void update() {
    g = g + gChange;         // let the g value of color change automatically.
    if (g < 0 || g > 255) {  // if g value is out of range 0-255,
      gChange *= -1;         // let g value returns the range
    }

    if (mouseX > x && mouseX < x+w/2 && mouseY > y && mouseY < y+h/2) {
      isButton = !isButton;  // only when mouse is on button area,
    } else {                 // can background color change
      isButton = false;
    }  

    if (frameCount%60 == 0) {        // frequency of background color changing
      if (isButton) {                // if mouse is on button area,
        bgColor = random(150, 250);  // change the background color every 1 second
      } else {
        bgColor = 255;               // otherwise, let it be white
      }
    }
  }  

  void display() { 
    background(bgColor);
    noStroke();
    fill(200, g, 200);
    rectMode(CENTER);
    rect(x, y, w, h, 80);  // draw a rect button
  }
}