ArrayList<Fire> firework;

void setup() {
  firework  = new ArrayList<Fire>();
  size(600, 600);
  background(0);
  noStroke();
  for (int i=0; i!=1000; ++i) {
    Fire f = new Fire(width/2, height/2, random(TWO_PI), random(1, 5));
    firework.add(f);
  }
}

void draw() {
  background(0);
  for (Fire f : firework) {
    f.show();
    f.grow();
    if (f.len > 300) {
      firework.remove(f);
    }
  }
}