// Intergrate OOP to previous Exercise 3
boolean shift = false;  // switch button

// declare all objects
Button button;                    
Tangram tanGram;                        
Shape[] shapes = new Shape[1];        // array of Shapes, starting with 1 element
Spaceship[] ships = new Spaceship[4]; // arrya of Spaceship, containing 4 elements

void setup() { 
  size(600, 400);
  // initialize all objects
  button = new Button();
  tanGram = new Tangram(); 
  shapes[0] = new Shape(140, 180);
  ships[0] = new Spaceship(120, 160, 120, 100);
  ships[1] = new Spaceship(220, 50, 50, 200);
  ships[2] = new Spaceship(320, 240, 160, 50);
  ships[3] = new Spaceship(480, 80, 200, 150);
}  

void draw() {
  background(0); 
  tanGram.display();  // draw a tangram
  tanGram.move();     // make it move away gradually

  if (shift) {        // when key is pressed, switch to a new window without tangram
    button.update();  // button color changes
    button.display(); // draw a button  

    for (int i = 0; i < ships.length; i++) {  // draw 4 spaceships
      ships[i].display();
    }     
    for (int i = 0; i < shapes.length; i ++ ) {  // update and draw all shapes
      shapes[i].gravity();
      shapes[i].move();
      shapes[i].display();
    }
    
    flowerCursor();  // draw a flower cursor
  }
}
/* ------------------------------------------------------------------------*/
void keyPressed () {
  shift = true;
}  

// mouse press leads to a new shape
void mousePressed() {
  Shape s; // declare a new shape object
  if (random(1) < 0.5) {  // randomly determine to draw a circle or box
    s = new Circle(mouseX, mouseY); // make a new Shape object at the mouse location.
  } else {
    s = new Box(mouseX, mouseY);
  }
  shapes = (Shape[])append(shapes, s); // add this new shape to the shapes[] array
}

// draw flower cursor for mouse
void flowerCursor() {
  for (int a = 0; a < 360; a += 72) {  // 5 petals
    float xoff = cos(radians(a)) * 10; // x coordinate offset for petals 
    float yoff = sin(radians(a)) * 10; // y coordiante offset for petals
    noStroke();
    fill(255, 100, 150);                               // draw petals around
    ellipse(mouseX-5 + xoff, mouseY-5 + yoff, 10, 10); // (mouseX, mouseY)
  }
  ellipse(mouseX-5, mouseY-5, 5, 5);  // draw the flower heart
} 