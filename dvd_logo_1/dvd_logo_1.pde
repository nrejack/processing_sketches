// A home entertainment classic
// nrejack 2024-02-20
// once in a while it just 'hops' along the bottom, probably bad random start values
PImage img;
int speedX = 10;
int speedY = 5;
int startX = int(random(1, 800));
int startY = int(random(1, 600));
int imgWidth = 210;
int imgHeight = 107;
float startR = random(0, 255);
float startG = random(0, 255);
float startB = random(0, 255);
float incR = random(0, 4);
float incG = random(0, 4);
float incB = random(0, 4);

void setup() {
  size(800, 600);
  frameRate(60);
}

void draw() {
  background(255);
  startR += incR;
  startG += incG;
  startB += incB;
  println(startR, startG, startB);
  if (startR >= 255) startR = 0;
  if (startG >= 255) startG = 0;
  if (startB >= 255) startB = 0;
  tint(startR, startG, startB, 255);
  img = loadImage("DVD_logo_invert.png");
  image(img, startX, startY);
  startX += speedX;
  startY += speedY;
  // very primitive collision detection
  if (startX + imgWidth >= width || startX <= 0) {
    speedX = -speedX;
  }
  if (startY + imgHeight >= height || startY <= 0) {
    speedY = -speedY;
  }
}
