ArrayList<Spot> spots = new ArrayList<Spot>();

boolean mState = false;
float mx, my, t;
PVector mVec;
color mCol;

void setup() {
  size(1000, 500);
  noStroke();
  colorMode(HSB);
}

void draw() {
  background(128);

  for (Spot s : spots) {
    s.move();
    s.show();
  }

  if (mState != mousePressed) {
    if (mousePressed) {
      mx = mouseX;
      my = mouseY;
      t = millis();
    } else {
      Spot spot = new Spot(mx, my, dist(mx, my, mouseX, mouseY)*2, mCol);
      spots.add(spot);
    }
  } else {
    if (mState) {
      mVec = new PVector(mouseX-mx, mouseY-my);
      mCol = color(map(mVec.heading(), -PI, PI, 0, 256), 255, 255, map((millis()-t)%1000, 0, 1000, 0, 255));
      fill(mCol);
      ellipse(mx, my, dist(mx, my, mouseX, mouseY)*2, dist(mx, my, mouseX, mouseY)*2);
    }
  }

  mState = mousePressed;
}

class Spot {
  float x, y, w;
  color c;
  PVector v;

  Spot(float X, float Y, float W, color C) {
    x = X;
    y = Y;
    w = W;
    c = C;
    v = new PVector(random(-5, 5), random(-5, 5));
  }

  void move() {
    x=(width+x+v.x)%width;
    y=(height+y+v.y)%height;
  }

  void show() {
    fill(c);
    ellipse(x, y, w, w);
  }
}