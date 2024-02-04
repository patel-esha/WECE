color frontPageColor = #FFC0CB;  // Light pink color for front page
color buttonColor = #FF0000;  // Red color for buttons
color backColor = #F76D82;  // Updated dark pink color
color noButtonColor = #000000;  // Black color for "No" button
color yesButtonColor = #FFC0CB;  // Pink color for "Yes" button
boolean buttonClicked = false;
boolean yesButtonClicked = false;
boolean noButtonClicked = false;
boolean areYouSureClicked = false;
ArrayList<ConfettiParticle> confettiParticles = new ArrayList<ConfettiParticle>();

void setup() {
  size(400, 400);
  background(frontPageColor);
  
  // Draw cutesy text on front page
  fill(255);  // White color for text
  textSize(24);
  textAlign(CENTER, CENTER);
  textFont(createFont("Comic Sans MS", 24));  // Set font to cutesy
  text("Will you be my...", width / 2, 150);
  
  // Draw red rectangle button on front page
  fill(buttonColor);
  rect(150, 220, 100, 40);
  
  // Add text to the button
  fill(255);  // White color for text
  textSize(12);
  textAlign(CENTER, CENTER);
  text("Open Card", 200, 240);
}

void draw() {
  if (buttonClicked) {
    // Display updated dark pink screen with back button
    background(backColor);
    
    // Draw half-sized back button
    fill(buttonColor);
    rect(25, 25, 50, 25);
    
    // Add text to the back button
    fill(255);  // White color for text
    textSize(10);
    textAlign(CENTER, CENTER);
    text("Back", 50, 37.5);
    
    // Add "valentine?" text
    fill(255);  // White color for text
    textSize(24);
    textAlign(CENTER, CENTER);
    text("valentine?", width / 2, 150);
    
    // Draw Yes and No buttons
    drawYesNoButtons();
    
    // If "Yes" button is clicked, trigger confetti effect
    if (yesButtonClicked) {
      confettiPop();
      yesButtonClicked = false;
    }
    
    // If "No" button is clicked, replace with "Are you sure???🥺"
    if (noButtonClicked) {
      if (!areYouSureClicked) {
        fill(noButtonColor);
        rect(200, 300, 50, 40);
        
        fill(255);  // White color for text
        textSize(10);
        textAlign(CENTER, CENTER);
        text("Are you sure???🥺", 225, 320);
      } else {
        fill(noButtonColor);
        rect(175, 300, 100, 60);
        
        fill(255);  // White color for text
        textSize(12);
        textAlign(CENTER, CENTER);
        text("Are you sure???🥺", 225, 330);
      }
    }
    
    // Display and update confetti particles
    for (int i = confettiParticles.size() - 1; i >= 0; i--) {
      ConfettiParticle particle = confettiParticles.get(i);
      particle.update();
      particle.display();
      if (particle.isOffscreen()) {
        confettiParticles.remove(i);
      }
    }
  }
}

void mousePressed() {
    if (noButtonClicked) {
    if (!areYouSureClicked) {
      fill(noButtonColor);
      rect(200, 300, 100, 40); // Adjusted dimensions for the rectangle

      fill(255);  // White color for text
      textSize(10);
      textAlign(CENTER, CENTER);
      text("Are you sure???🥺", 250, 320); // Adjusted position
    } else {
      fill(noButtonColor);
      rect(175, 300, 200, 80); // Adjusted dimensions for the larger rectangle

      fill(255);  // White color for text
      textSize(16); // Adjusted text size
      textAlign(CENTER, CENTER);
      text("Are you sure???🥺", 275, 340); // Adjusted position
    }
  }
  if (buttonClicked) {
    // Check if the mouse is clicked inside the half-sized back button
    if (mouseX > 25 && mouseX < 75 && mouseY > 25 && mouseY < 50) {
      buttonClicked = false;
      areYouSureClicked = false;
      background(frontPageColor);
      
      // Draw cutesy text on front page
      fill(255);  // White color for text
      textSize(24);
      textAlign(CENTER, CENTER);
      textFont(createFont("Comic Sans MS", 24));  // Set font to cutesy
      text("Will you be my...", width / 2, 150);
      
      // Draw red rectangle button on front page
      fill(buttonColor);
      rect(150, 220, 100, 40);
      
      // Add text to the button
      fill(255);  // White color for text
      textSize(12);
      textAlign(CENTER, CENTER);
      text("Open Card", 200, 240);
      
      // Reset buttons
      yesButtonClicked = false;
      noButtonClicked = false;
      // Clear confetti particles
      confettiParticles.clear();
    }
  } else {
    // Check if the mouse is clicked inside the original button
    if (mouseX > 150 && mouseX < 250 && mouseY > 220 && mouseY < 260) {
      buttonClicked = true;
    }
  }
  
  // Check if the mouse is clicked inside the Yes or No buttons
  if (buttonClicked && mouseX > 100 && mouseX < 150 && mouseY > 300 && mouseY < 340) {
    yesButtonClicked = true;
  } else if (buttonClicked && mouseX > 200 && mouseX < 300 && mouseY > 300 && mouseY < 340) {
    if (!areYouSureClicked) {
      noButtonClicked = true;
    } else {
      areYouSureClicked = true;
    }
  }
}

void drawYesNoButtons() {
  // Draw Yes button
  fill(yesButtonColor);
  rect(100, 300, 50, 40);
  
  fill(buttonColor);
  textSize(12);
  textAlign(CENTER, CENTER);
  text("Yes", 125, 320);
  
  // Draw No button
  fill(yesButtonColor);
  rect(200, 300, 50, 40);
  
  fill(buttonColor);
  textSize(12);
  textAlign(CENTER, CENTER);
  text("No", 225, 320);
}
  
void confettiPop() {
  // Add confetti pop effect
  for (int i = 0; i < 50; i++) {
    float angle = random(TWO_PI);
    float radius = random(50, 200);
    float confettiX = width / 2 + cos(angle) * radius;
    float confettiY = height / 2 + sin(angle) * radius;
    float confettiSpeedX = random(-2, 2);
    float confettiSpeedY = random(-5, -1);
    float confettiSize = random(5, 15);
    int confettiColor = color(random(255), random(255), random(255));
    
    ConfettiParticle confetti = new ConfettiParticle(confettiX, confettiY, confettiSpeedX, confettiSpeedY, confettiSize, confettiColor);
    confettiParticles.add(confetti);
  }
}

class ConfettiParticle {
  float x, y, speedX, speedY, size;
  color particleColor;
  
  ConfettiParticle(float x, float y, float speedX, float speedY, float size, color particleColor) {
    this.x = x;
    this.y = y;
    this.speedX = speedX;
    this.speedY = speedY;
    this.size = size;
    this.particleColor = particleColor;
  }
  
  void update() {
    x += speedX;
    y += speedY;
    speedY += 0.1;  // Gravity effect
    
    // Bounce off the edges
    if (x < 0 || x > width) {
      speedX *= -1;
    }
    if (y > height) {
      y = height;
      speedY *= -0.6;  // Add some damping to simulate bouncing on the ground
    }
  }
  
  void display() {
    fill(particleColor);
    rect(x, y, size, size/2);
  }
  
  boolean isOffscreen() {
    return (y > height);
  }
}
