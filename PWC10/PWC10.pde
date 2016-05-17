Flower[] flowers = new Flower[0];

void setup() {
  size(1000, 500);
  textSize(40);
}

void draw() {
  background(0);
  fill(255);
  text("Click to make a flower, press a key to reset", 50, 50);

  for (int i=0; i!=flowers.length; ++i) {
    flowers[i].grow();
    flowers[i].show();
  }
}

void mousePressed() {
  flowers = (Flower[]) append(flowers, new Flower(mouseX, mouseY));
  textSize(0.1);
}

void keyPressed() {
  flowers = new Flower[0];
  textSize(40);
}

int fib(int i) {
  if (i == 0 || i == 1) {
    return 1;
  } else {
    return fib(i-1) + fib(i-2);
  }
}

class Flower {
  int paddles, seeds;
  float x, y, diameter, max, speed, padPro, seePro, floPro;
  color padCol, seeCol;

  Flower(float px, float py) {
    x = px; 
    y = py;
    int i = floor(random(5, 10));
    paddles = fib(i);
    seeds = fib(i-1);
    diameter = random(30, 50);
    max = random(50, 80);
    speed = random(5);
    padPro = random(1);
    seePro = random(1);
    floPro = random(0.33);
    pushStyle();
    colorMode(HSB);
    padCol = color(random(256), 255, 255);
    seeCol = color(random(256), 255, 64);
  }

  void grow() {
    if (diameter<max) {
      diameter+=speed;
    }
  }

  void show() {
    pushMatrix();
    pushStyle();
    translate(x, y);
    stroke(0);

    fill(padCol);
    for (float a=0; a<TWO_PI; a+=TWO_PI/paddles) {
      pushMatrix();
      rotate(a);
      ellipse(diameter/2, 0, diameter, diameter*padPro);
      popMatrix();
    }

    fill(seeCol);
    for (float a=0; a<TWO_PI; a+=TWO_PI/seeds) {
      pushMatrix();
      rotate(a);
      ellipse(diameter*floPro/2, 0, diameter*floPro, diameter*seePro);
      popMatrix();
    }
    popStyle();
    popMatrix();
  }
}