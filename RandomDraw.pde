Pencil pencil;
float[] rgbValues;

void settings() {
  size(400, 400);
}

void setup() {
  frameRate(60);
  pencil = new Pencil();
  rgbValues = pencil.getRandomRgbValues(); //THis should be in a seperate class
}
 
void draw() {
  background(rgbValues[0], rgbValues[1], rgbValues[2]);
  pencil.move();
  pencil.display();
}