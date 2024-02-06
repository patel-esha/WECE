/**
 * Simple Linear Gradient 
 * 
 * The lerpColor() function is useful for interpolating
 * between two colors.
 */

// Constants
int Y_AXIS = 1;
int X_AXIS = 2;
color c1, c2;

void setup() {
  size(640, 360);



// Step 14: Change the RGB values to get the color you want [ex: c1 = color(204, 102, 0);]
  c1 = color(-------------); 
  c2 = color(-------------);

  noLoop();
}

void draw() {
  // Gradient covering the whole screen
  setGradient(0, 0, width, height, c1, c2, Y_AXIS);
}

void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {
  noFill();
  if (axis == Y_AXIS) {  // TOP TO BOTTOM GRADIENT
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }  
}
