ArrayList<Fire> firework;

void setup() {
  firework  = new ArrayList<Fire>();
  size(600, 600);
  background(0);
  for (int i=0; i!=2000; ++i) {
    Fire f = new Fire(width/2, height/2, random(TWO_PI), random(1, 5));
    firework.add(f);
  }
}

void draw() {
  background(0);
  for (Fire f : firework) {
    f.show();
    f.grow();
  }
  saveFrame("frames/firework-##.png");
  if (frameCount == 60) exit();
}