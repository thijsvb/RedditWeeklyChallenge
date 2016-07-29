Window[] windows = new Window[15];

void setup() {
  size(1000, 500);

  int index = 0;
  for (float x=10; x<width; x+=width/5) {
    for (float y=10; y<height; y+=height/3) {
      windows[index] = new Window(x, y);
      ++index;
    }
  }
}

void draw() {
  background(8, 8, 32);

  noStroke();
  for (int i=0; i!=windows.length; ++i) {
    windows[i].show();
  }

  stroke(8, 8, 32);
  for (int x=width/10; x<width; x+=width/5) {
    line(x, 0, x, height);
  }
  for (int y=height/12; y<height; y+=height/3) {
    line(0, y, width, y);
  }
}

class Window {
  float x;
  float y;
  color light;
  boolean party;
  boolean sleep;
  float time;

  Window(float X, float Y) {
    x = X;
    y = Y;
    light = color(random(192, 255), random(192, 255), random(0, 64));
    if(random(10) > 1){
      party = false;
    } else {
      party = true;
    }
    time = millis();
  }

  void show() {
    if(party && millis()-time > 100){
      light = color(random(255), random(255), random(255));
      time = millis();
    }
    if(random(1000) < 1){
      sleep = true;
    }
    if(sleep){
      light = color(0);
    }
    fill(light);
    rect(x, y, width/5-20, height/3-20);
  }
}