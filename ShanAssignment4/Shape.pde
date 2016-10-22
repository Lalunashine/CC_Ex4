class Shape {
  float x, y, w, c, speed, gravity;  // declare var

  Shape(float x_, float y_) {  // initialize var
    x = x_;
    y = y_;
    w = 20;
    c = 255;
    speed = 0;
    gravity = 0.1;
  }  

  void gravity() {  // add gravity to speed
    speed = speed + gravity;
  }  

  void move() {
    y = y + speed;  // shape drops faster gradually
    c = c - speed;  // its color changes gradually

    if (y > height) {         // if the shape reaches the bottom,
      speed = speed * -0.98;  // make the speed reverse(-)
      y = height;             // and add a "dampening" effect(0.98, not 1)
    }
  }

  void display() { 
   // deliberately left empty
   // A generic shape does not really know how to be displayed.
   // This will be overridden in the child classes. 
  }
}  

class Circle extends Shape {  // child class : Circle
  Circle(float x_, float y_) {
    super(x_, y_);
  }  

  // inherits gravity(), move() from parent
  
  void display() {        // display circle
    noStroke();
    fill(c, 120, 120);    // red value of color changes
    ellipseMode(CENTER);
    ellipse(x, y, w, w);
  }
}

class Box extends Shape {  // child class : Box
  Box(float x_, float y_) {
    super(x_, y_);
  }  

  // inherits gravity(), move() from parent

  void display() {       // display box
    noStroke(); 
    fill(220, 130, c);   // blue value of color changes
    rectMode(CENTER);
    rect(x, y, w, w);
  }
}  