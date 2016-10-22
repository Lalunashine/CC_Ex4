class Tangram {
  float upX, dnX, upY, dnY;  // declare var

  Tangram() {  // initialize var
    upX = width/2; 
    dnX = width/2;    
    upY = height/2; 
    dnY = height/2;
  }  

  // move a tangram
  void move() {
    dnX = dnX - 1.2; // go left
    dnY = dnY - 0.8; // go up
    upX = upX + 1.2; // go right
    upY = upY + 0.8; // go down
  }  

  // display a tangram
  void display() {    
    noStroke();
    fill(180, 0, 0);  // red tri
    triangle(dnX, 200, dnX-50, 150, dnX-50, 250);  // if move, go left

    fill(0, 0, 120);  // blue tri
    triangle(300, dnY, 250, dnY-50, 350, dnY-50);  // if move, go up

    fill(0, 200, 100);  // green tri
    triangle(upX+50, dnY-50, upX+25, dnY-25, upX+50, dnY);  // if move, go right top

    fill(255, 255, 120);  // parallelogram
    quad(dnX-50, upY+50, dnX-25, upY+25, dnX+25, upY+25, dnX, upY+50);  // if move, go left bottom

    fill(100, 200, 200, 90);  // square
    quad(upX, 200, upX+25, 175, upX+50, 200, upX+25, 225);  // if move, go right

    fill(200);  // quarter circle
    arc(upX+50, upY+50, 50*sqrt(2), 50*sqrt(2), PI, PI+HALF_PI);  // if move, go right bottom
  }
}   