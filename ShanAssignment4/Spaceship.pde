class Spaceship {       
  float x, y, w, c;  // declare var

  Spaceship(float x_, float y_, float w_, float c_) {  // initialize var
    x = x_;
    y = y_;
    w = w_;
    c = c_;
  }  

  void display() {  // draw a spaceship
    noStroke();
    ellipseMode(CENTER);
    float d = w * 0.08;  // diameter of eye   
    
    fill(c);
    x = x + random(-0.5, 0.5);  // ship jiggles slightly along x axis 
    y = y + random(-0.5, 0.5);  // ship jiggles slightly along y axis
    ellipse(x, y, w, w/4);      // base
    ellipse(x, y-w/10, w/3, w/3);  // head

    fill(255);
    ellipse(x - d*2, y, d, d);  // left eye
    ellipse(x + d*2, y, d, d);  // right eye
  }
}  