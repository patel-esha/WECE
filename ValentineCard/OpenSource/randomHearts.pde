void setup() {
  size(300, 300);
  background(64);
}

void draw() {

  float heartSize = random(10, 100);
  float heartX = random(width);
  float heartBottomY = random(height+heartSize);

  float r = random(255);

  fill(r, 0, 0);
  stroke(r, 0, 0);

  //fill in line that sometimes appears between halves
  line(heartX, heartBottomY, heartX, heartBottomY-heartSize*.75);

  //dark hearts have light outlines and vice versa
  stroke(255-r);

  //left half of heart
  beginShape();
  curveVertex(heartX, heartBottomY+heartSize); //anchor point
  curveVertex(heartX, heartBottomY); //bottom tip
  curveVertex(heartX - heartSize/2, heartBottomY-heartSize/1.5); //left edge
  curveVertex(heartX - heartSize/3, heartBottomY-heartSize); //top of left edge
  curveVertex(heartX, heartBottomY-heartSize*.75); //top middle dip
  curveVertex(heartX, heartBottomY); //guiding point
  endShape();

  //right half of heart
  beginShape();
  curveVertex(heartX, heartBottomY);
  curveVertex(heartX, heartBottomY-heartSize*.75);
  curveVertex(heartX + heartSize/3, heartBottomY-heartSize);
  curveVertex(heartX + heartSize/2, heartBottomY-heartSize/1.5);
  curveVertex(heartX, heartBottomY);
  curveVertex(heartX, heartBottomY + heartSize);
  endShape();
}
