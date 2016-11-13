class Sparkle {
  float x, y, a;
  
  Sparkle(float X, float Y) {
    x = X;
    y = Y;
    a = 255;
  }
  
  void show(){
    stroke(255, 255, 200, a);
    point(x, y);
    a *= 0.9;
    a = max(a, 0);
  }
}