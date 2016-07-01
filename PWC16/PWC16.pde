Orbit[] orbits = new Orbit[1000];
int num = 0;
Orbit o;

void setup() {
  size(500, 500);
  translate(width/2, height/2);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  PVector v = new PVector(mouseX-width/2, mouseY-height/2);
  o = new Orbit(dist(width/2, height/2, mouseX, mouseY), 1, 0.67, v.heading());
  stroke(192);
  o.showOrbit();
  for (int i=0; i!=num; ++i) {
    orbits[i].moveStar();
    orbits[i].showStar();
  }

  if (keyPressed) {
    num = 0;
    orbits = new Orbit[1000];
  }
}

void mousePressed() {
  orbits[num] = o;
  ++num;
}


class Orbit {

  float r;
  float ca;
  float cb;
  float ang;
  float sAng = 0;
  color c;

  Orbit(float R, float A, float B, float ANG) {
    assert(A > 0 && A <= 1 && B > 0 && B<= 1);
    r = R;
    ca = A;
    cb = B;
    ang = ANG;
    float rand = millis()%100;
    if (rand < 10) {
      c = color(255, 0, 0);
    } else if (rand < 20) {
      c = color(0, 0, 255);
    } else {
      c = color(255);
    }
  }

  void showOrbit() {
    pushMatrix();
    rotate(ang);
    for (float a=0; a<TWO_PI; a+=PI/1000) {
      point(r*ca*cos(a), r*cb*sin(a));
    }
    popMatrix();
  }

  void moveStar() {
    sAng+=PI/100;
  }

  void showStar() {
    pushMatrix();
    rotate(ang);
    for (int i=0; i!=10; ++i) {
      fill(c, map(i, 9, 0, 0, 255));
      ellipse(r*ca*cos(sAng), r*cb*sin(sAng), i, i);
    }
    popMatrix();
  }
}