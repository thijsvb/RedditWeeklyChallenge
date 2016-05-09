float r = 25;
int mode = 0;
int number = 200;
Thing[] things;

void setup() {
  size(1000, 600);
  textAlign(CENTER, CENTER);
  reset(number);
}

void draw() {
  stroke(0, 255, 0);
  fill(0, 255, 255, 64);
  background(0);
  for (int i=0; i!=things.length; ++i) {
    switch(mode) {
    case 0:
      things[i].adjustLin(things, r);
      break;
    case 1:
      things[i].adjustConst(things, r);
      break;
    case 2:
      things[i].adjustSpi(things, r);
      break;
    case 3:
      things[i].adjustRand(things, r);
      break;
    }
    things[i].move();
    things[i].display();
  }

  noStroke();
  fill(255);
  rect(0, 500, width, 100);
  stroke(0);
  line(width/4, 500, width/4, 600);
  line(width/2, 500, width/2, 600);
  line(width*3/4, 500, width*3/4, 600);
  line(width/2, 550, width, 550);
  stroke(255, 0, 0);
  float rx = map(r, 0, 100, 0, width/4);
  line(rx, 500, rx, 600);
  float nx = map(number, 0, 500, width/4, width/2);
  line(nx, 500, nx, 600);
  for (float i=0; i!=width/4; ++i) {
    point(width/2+i, map(i, 0, width/4, 500, 550));
    point(width/2+i, 555);
    point(width*3/4 + i, map(pow(i, 0.25), 0, pow(width/4, 0.25), 500, 550));
    point(width*3/4 + i, random(550, 600));
  }
  fill(0);
  text("Range: " + nf(r), width/8, 550);
  text("Number: "+ nf(number), width*3/8, 550);
  switch(mode) {
  case 0:
    text("Linear", width*5/8, 525);
    break;
  case 1:
    text("Constant", width*5/8, 575);
    break;
  case 2:
    text("Spike", width*7/8, 525);
    break;
  case 3:
    text("Random", width*7/8, 575);
    break;
  }
}

void mousePressed() {
  if (mouseY > 500) {
    if (mouseX < width/4) {
      r = map(mouseX, 0, width/4, 0, 100);
    } else if (mouseX < width/2) {
      number = (int)map(mouseX, width/4, width/2, 0, 500);
    } else if (mouseX < width*3/4) {
      if (mouseY < 550) {
        mode = 0;
      } else {
        mode = 1;
      }
    } else {
      if (mouseY < 550) {
        mode = 2;
      } else {
        mode = 3;
      }
    }
  }
}

void mouseReleased() {
  reset(number);
}

void reset(int Number) {
  things = new Thing[Number];
  for (int i=0; i!=things.length; ++i) {
    things[i] = new Thing(random(width), random((height-100)), random(-5, 5), random(-5, 5));
  }
}

class Thing {
  PVector p;
  PVector v;

  Thing(float px, float py, float vx, float vy) {
    p = new PVector(px, py);
    v = new PVector(vx, vy);
  }

  void move() {
    p = p.add(v);
    if (p.x < 0 || p.x > width) {
      p.set((p.x + width)%width, p.y);
    }
    if (p.y < 0 || p.y > (height-100)) {
      p.set(p.x, (p.y + (height-100))%(height-100));
    }
  }

  void adjustLin(Thing[] stuff, float range) {
    float n = 0;
    float tx = 0;
    float ty = 0;

    for (int i=0; i!=stuff.length; ++i) {
      if (dist(p.x, p.y, stuff[i].p.x, stuff[i].p.y) < range) {
        float f = map(dist(p.x, p.y, stuff[i].p.x, stuff[i].p.y), 0, range, 1, 0);
        tx += stuff[i].v.x * f;
        ty += stuff[i].v.y * f;
        n+=f;
      }
    }

    v.set(tx/n, ty/n);
  }

  void adjustConst(Thing[] stuff, float range) {
    float n = 0;
    float tx = 0;
    float ty = 0;

    for (int i=0; i!=stuff.length; ++i) {
      if (dist(p.x, p.y, stuff[i].p.x, stuff[i].p.y) < range) {
        tx += stuff[i].v.x;
        ty += stuff[i].v.y;
        ++n;
      }
    }

    v.set(tx/n, ty/n);
  }

  void adjustSpi(Thing[] stuff, float range) {
    float n = 0;
    float tx = 0;
    float ty = 0;

    for (int i=0; i!=stuff.length; ++i) {
      if (dist(p.x, p.y, stuff[i].p.x, stuff[i].p.y) < range) {
        float d = dist(p.x, p.y, stuff[i].p.x, stuff[i].p.y);
        float f = map(pow(d, 0.25), 0, pow(range, 0.25), 1, 0);
        tx += stuff[i].v.x * f;
        ty += stuff[i].v.y * f;
        n+=f;
      }
    }

    v.set(tx/n, ty/n);
  }

  void adjustRand(Thing[] stuff, float range) {
    float n = 0;
    float tx = 0;
    float ty = 0;

    for (int i=0; i!=stuff.length; ++i) {
      if (dist(p.x, p.y, stuff[i].p.x, stuff[i].p.y) < range) {
        float f = random(1);
        tx += stuff[i].v.x * f;
        ty += stuff[i].v.y * f;
        n+=f;
      }
    }

    v.set(tx/n, ty/n);
  }

  void display() {
    ellipse(p.x, p.y, 10, 10);
  }
}