class Pencil {
  PVector location;
  float[] rgbColours;
  ArrayList<PVector> history;
  Boolean noFill;
  float randomSteps;

  Pencil() {
    location = new PVector(random(0, width), random(0, height));
    history = new ArrayList<PVector>();
    rgbColours = getRandomRgbValues();
    noFill = getRandomBoolean();
    randomSteps = random(0, 50);
  }

  void display() {
    stroke(rgbColours[0], rgbColours[1], rgbColours[2]);
    fill(rgbColours[0], rgbColours[1], rgbColours[2]);
    rectMode(CENTER);//makes the "rectangle" render from the center not the corner
    rect(location.x, location.y, 0, 0); //0,0 is the size of the rectangle
    displayLine();
  }
  
  void displayLine() {
     beginShape(); 
    if (noFill) noFill();
    for (PVector v: history) {
      vertex(v.x, v.y);
    }
    endShape();
  }
  
  boolean getRandomBoolean() {
    return random(0, 2) > 1;
  }
  
  float[] getRandomRgbValues() {
    float[] newRgbColours = new float[3];
    for (int i = 0; i < 3; i++) {
      newRgbColours[i] = random(0, 255);
    }
    return newRgbColours;
  }

  void move() {
    PVector vel = new PVector(random(-randomSteps, randomSteps), random(-randomSteps, randomSteps));
    location.add(vel);

    // Stay on the screen
    location.x = constrain(location.x, 0, width-1);
    location.y = constrain(location.y, 0, height-1);
    
    history.add(location.get());
  }
}