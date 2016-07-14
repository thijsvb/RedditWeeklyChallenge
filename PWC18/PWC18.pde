float[] w = new float[42];
color[] c = new color[42];

void setup() {
  size(594, 594);
  colorMode(HSB);
  noFill();
  for(int i=0; i!=42; ++i){
    w[i] = i * 20;
    c[i] = color(random(255),255,255);
  }
}

void draw() {
  background(0);
  
  for(int i=0; i!=42; ++i){
    stroke(c[i]);
    ellipse(width/2, height/2, w[i], w[i]);
    w[i] = (w[i] + 1) % 840;
  }
  
}