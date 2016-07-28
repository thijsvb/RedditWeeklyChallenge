

void setup(){
  size(1000,500);
}

void draw(){
  background(8,8,32);
  
  stroke(0);
  for(int x=width/16; x<width; x+=width/8){
    line(x,0,x,height);
  }
  for(int y=height/16; y<height; y+=height/4){
    line(0,y,width,y);
  }
}

class Window{
  color Color = color(255,255,0);
  float x;
  float y;
  Window(){
    
  }
}