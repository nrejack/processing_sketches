// coarse simulation of a bouncing ball on earth
// nrejack 2024

float g = 9.8; // based on 9.8 m/s/s acceleration
float velocity = 1;
int curX = 50;
int curY = 50;
int radius = 50;
int direction = 1; // use to control whether we are falling or bouncing
int xStep = 5; // step to right so we can see progress

void setup() {
  size(800, 800);
  frameRate(30);
}

void draw() {
  if (curY <= height - radius /2 && velocity >= 0) {
    background(0);
    circle(curX, curY, radius);
    curY += velocity * direction;
    velocity += g * direction;
    print(velocity + "\n");
    curX += xStep;
  }
  else {
    print("Changed direction\n");
    if (velocity < 0) {
      velocity = 1;
    } else {
      velocity = velocity / 2 - 0.9; // scalar for 'real-world' sim
    }  
    direction = -direction;
    curY += radius * direction;
  }
}
