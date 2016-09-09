//These colors are from preferences.txt. Some of them are duplicates, but I left those in to represent how often the color appears.
color[] c = {
  #666666, 
  #666666, 
  #006699, 
  #006699, 
  #669900, 
  #006699, 
  #666666, 
  #33997e, 
  #33997e, 
  #669900, 
  #d94a7a, 
  #e2661a, 
  #33997e, 
  #666666, 
  #7D4793, 
  #718a62, 
  #006699
};

PFont f = createFont("Source Code Pro", 32);
textFont(f);
textAlign(CENTER, CENTER);

size(300, 100);
background(255);

for (int i=0; i!=c.length; ++i) {
  stroke(c[i]);
  fill(c[i], 128);
  quad(i*width/c.length, noise(1)*height/2, i*width/c.length, noise(i+1)*height/2+height/2, (i+2)*width/c.length, noise(i+1)*height/2, (i+2)*width/c.length, noise(i)*height/2+height/2);
}

String p = "r/processing";

for (int i=0; i!=p.length(); ++i) {
  fill(255);
  text(p.charAt(i), (i+1)*width/(1+p.length()), height/2);
}

save("ad300x100.png");
exit();