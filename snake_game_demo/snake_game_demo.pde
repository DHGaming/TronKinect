Grid tron;
Player first;
Player second;
private PImage theBack;

void setup(){
  theBack= loadImage("tronworld.png");
 
  width =640;
  height = 480;
  int w = 40;

  
  size(640,480);
   tron = new Grid(width,height,w);
   first = new Player(320, 240, w, w, 0, 0);
   second = new Player(320, 240+w,w, w, 1, 1);
  
}
void draw(){
  
  if(frameCount%30==0){
  // tron.displayGrid();
   image(theBack,0,0,640,480);
   //player1.checkSkeleton();
   //player2.checkSkeleton();
   //placeWorld();
   first.move();
   second.move();
   first.displayPlayer(first.getId());
   second.displayPlayer(second.getId());
  }
}
/*
void placeWorld()
{
  loadPixels();
  theBack.loadPixels();
  for(int x =0; x <640; x++){
  for(int y =0; x <380; y++){
  int location = x+y*640;
  println(location);
  float r = red(theBack.pixels[location]);
  float b = blue(theBack.pixels[location]);
  float g = green(theBack.pixels[location]);
  pixels[location]=color(int(r),int(g),int(b));
  updatePixels();
  }}
}*/
  
  
