Cloud cloud;
boolean cloudIsRainy = false;

void setup() {
  size(1000, 500);
  cloud = new Cloud(random(width), random(height), random(5));
}

void draw() {
  background(100, 192, 255);
  if (cloudIsRainy != cloud.rainy) {
    cloud.toggleRainy();
  }

  cloud.move();
  cloud.show();
}

void mousePressed() {
  cloudIsRainy = !cloudIsRainy;
}

void keyPressed() {
  cloud = new Cloud(random(width), random(height), random(5));
}

class Cloud {
  boolean rainy = false;
  float x, y, v;
  int rainIndex = 0;
  final int rainMax = 1000;
  Rain[] rain = new Rain[rainMax];

  Cloud(float cx, float cy, float cv) {
    x = cx;
    y = cy;
    v = cv;

    for (int i=0; i!=rainMax; ++i) {
      rain[i] = new Rain(-10, 0);
    }
  }

  void move() {
    x+=v;
    if (x>width || x < -200) {
      x = (x+width)%width;
    }


    if (rainy) {
      for (int i=0; i!=rainMax; ++i) {
        rain[i].fall();
      }

      for (int i=-100+int(random(10)); i<100; i+=random(10, 20)) {
        rainIndex = (rainIndex+1)%rainMax;
        rain[rainIndex] = new Rain(x+i, y);
      }
    }
  }

  void show() {
    if (rainy) {
      fill(150);
      for (int i=0; i!=rainMax; ++i) {
        rain[i].show();
      }
    } else {
      fill(255);
    }
    noStroke();

    triangle(x-100, y, x, y-50, x+100, y);
    ellipse(x+40, y-50, 100, 70);
    ellipse(x-30, y-40, 60, 60);
    ellipse(x-60, y-20, 50, 30);
  }

  void toggleRainy() {
    rainy = !rainy;
    for (int i=0; i!=rainMax; ++i) {
      rain[i] = new Rain(-10, 0);
    }
  }
}

class Rain {
  float x, y;
  color shade;

  Rain(float X, float Y) {
    x = X;
    y = Y;
    shade = color(random(128, 192));
  }

  void fall() {
    y+=5;
  }

  void show() {
    stroke(shade);
    line(x, y, x, y+50);
  }
}