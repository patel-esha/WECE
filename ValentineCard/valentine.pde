// Step 1: Give a hex color for the front page [ex: #FFC0CB;]
color frontPageColor = #(-------------);;  

// Step 2: Give a hex color for the "Open Card" and "Back" buttons
color buttonColor = #(-------------);;  

// Step 3: Give a hex color for the "inside" page of the card
color backColor = #(-------------);;  

// Step 4: Give a hex color for the "Yes" and "No" buttons
color yesButtonColor = #(-------------);;  
boolean buttonClicked = false;
boolean yesButtonClicked = false;
boolean noButtonClicked = false;
ArrayList<ConfettiParticle> confettiParticles = new ArrayList<ConfettiParticle>();

void setup() {
  size(400, 400);
  background(frontPageColor);
  
  // Draw cutesy text on front page
  fill(255);  // White color for text

// Step 5: Choose a size for the message on the front page of the card [ex: textSize(24);]
  textSize(-------------);
  textAlign(CENTER, CENTER);

// Step 6: Choose a font for the message on the front page of the card[ex: textFont(createFont("Comic Sans MS", 24));]
  textFont(createFont("-------------", 24));

// Step 7: Write what you would like to be on the front page of the card
  text("-------------", width / 2, 150);

  // Draw red rectangle button on front page
  fill(buttonColor);
  rect(150, 220, 100, 40);
  
  // Add text to the button
  fill(255);  // White color for text
  textSize(12);
  textAlign(CENTER, CENTER);

// Step 8: Write the message you would like on the button to open the card
  text("-------------", 200, 240);
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

// Step 9: Write the message you would like on the button to close the card
    text("-------------", 50, 37.5);

    // Add "valentine?" text
    fill(255);  // White color for text
    textSize(24);
    textAlign(CENTER, CENTER);

// Step 10: Write your message for the inside of the card
    text("-------------", width / 2, 150);
    
    // Draw Yes and No buttons
    drawYesNoButtons();
    
    // If "Yes" button is clicked, trigger confetti effect
    if (yesButtonClicked) {
      confettiPop();
      yesButtonClicked = false;
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
  if (buttonClicked) {
    // Check if the mouse is clicked inside the half-sized back button
    if (mouseX > 25 && mouseX < 75 && mouseY > 25 && mouseY < 50) {
      buttonClicked = false;
      background(frontPageColor);
      
      // Draw cutesy text on front page
      fill(255);  // White color for text

// Step 11: The following 10 lines of code are repeats to be able to "return" to the front of the card after clicking the back button. Enter the same information as before for the front of the card
      // Step 11a: Change the text size of the message on the front of the card 
      textSize(-------------);
      textAlign(CENTER, CENTER);

      // Step 11b: Change the font of the message on the front of the card
      textFont(createFont("-------------", 24));  // Set font to cutesy

      // Step 11c: Change the message on the front of the card
      text("-------------", width / 2, 150);
      
      // Draw red rectangle button on front page
      fill(buttonColor);
      rect(150, 220, 100, 40);
      
      // Add text to the button
      fill(255);  // White color for text
      textSize(12);
      textAlign(CENTER, CENTER);

      // Step 11d: Write the message you would like on the button that opens the card
      text("-------------", 200, 240);
      
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
  } 
}

// Step 12: The "yes" or "no" buttons made sense for the example card. You may get rid of the buttons, or may implement a different type of button usage!
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

// Step 13 (OPTIONAL): Change the shape of the confetti (maybe try heart shapes <3)???
  void display() {
    fill(particleColor);
    rect(x, y, size, size/2);
  }
  
  boolean isOffscreen() {
    return (y > height);
  }
}
