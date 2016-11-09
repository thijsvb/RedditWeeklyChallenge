class Fire {
  PVector start;
  float dir, len, vel;

  Fire(float x, float y, float d, float v) {
    start = new PVector(x, y);
    dir = d;
    len = 1;
    vel = v;
  }

  void grow() {
    len += vel;
  }

  void show() {   
    float angle = dir;
    float dAngle;
    if (dir > HALF_PI && dir < PI+HALF_PI) {
      dAngle = -0.0005;
    } else {
      dAngle = 0.0005;
    }
    for (float f=0; f<len; f+=0.5) {
      float s = map(f, 0, len, 0, 256);
      float r = 255;
      float g = s;
      float b = -255/(s-256);
      float a = s/2;
      fill(r, g, b, a);

      float x = start.x + cos(angle)*f;
      float y = start.y + sin(angle)*f;
      ellipse(x, y, 2, 2);
      angle += dAngle;
    }
  }
}