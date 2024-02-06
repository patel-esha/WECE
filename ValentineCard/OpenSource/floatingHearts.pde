ArrayList<Heart> hearts;
int maxHearts = 30;

void setup() {
  size(700, 700, P2D);
  frameRate(60);
  hearts = new ArrayList<Heart>();
}

void draw() {
  background(0);
  
  // Generate new hearts randomly
  if (hearts.size() < maxHearts && random(1) < 0.05) {
    hearts.add(new Heart(random(width), height, 1)); // Adjusted size parameter
  }
  
  // Update and display hearts
  for (int i = hearts.size() - 1; i >= 0; i--) {
    Heart h = hearts.get(i);
    h.update();
    h.display();
    if (h.finished()) {
      hearts.remove(i);
    }
  }
}

class Heart {
  float x, y;
  float size;
  float speed;
  
  Heart(float x_, float y_, float size_) {
    x = x_;
    y = y_;
    size = size_;
    speed = random(1, 3);
  }
  
  void update() {
    y -= speed;
  }
  
  void display() {
    stroke(250, 0, 0);
    strokeWeight(2);
    for (float t = 0; t <= 2*PI; t += .01) {
      float px = map((-16*size*pow(sin(t), 3)), -16*size, 16*size, x - width/2, x + width/2);
      float py = map((-(13*size*cos(t)-5*size*cos(2*t)-2*size*cos(3*t)-cos(4*t))), -13*size, 13*size, y - height/2, y + height/2);
      point(px, py);
    }
  }
  
  boolean finished() {
    return y < -size*13;
  }
}
