class Fire {
  PVector start;
  float dir, len, vel, bend;
  ArrayList<Sparkle> sparkles;

  Fire(float x, float y, float d, float v) {
    start = new PVector(x, y);
    dir = d;
    len = 1;
    vel = v;
    sparkles = new ArrayList<Sparkle>();

    float maxBend = random(0.005);
    bend = cos(dir)*maxBend;
  }

  void grow() {
    len += vel;
  }

  void show() {   
    noStroke();
    float angle = dir;
    float locBend = bend;
    float x = 0, y =0;
    for (float f=0; f<len; f+=0.5) {
      float s = map(f, 0, len, 0, 256);
      float r = 255;
      float g = s;
      float b = -255/(s-256);
      float a = s/2;
      fill(r, g, b, a);

      x = start.x + cos(angle)*f;
      y = start.y + sin(angle)*f;
      ellipse(x, y, 2, 2);
      angle += locBend;
      locBend *= 0.995;
    }
    
    for(int i=floor(random(4)); i!=0; --i){
      Sparkle s = new Sparkle(x + random(-5, 5), y + random(-5, 5));
      sparkles.add(s);
    }
    
    for(Sparkle s: sparkles){
      s.show();
    }
  }
}