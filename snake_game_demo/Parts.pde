class Parts
{
  private int x;
  private int y;
  private int w;
  private int h;
  private PVector position;
  Parts(int xx, int yy, int ww, int hh)
  {
    x=xx;
    y=yy;
    w=ww;
    h=hh;
    position = new PVector(x,y);
  }
void displayParts()
{
  rect(x,y,w,h);
}
PVector getPosition() 
{return position;
}
boolean isEqual(Parts other)
{
  if(other.getPosition().x==this.getPosition().x&&
  other.getPosition().y==this.getPosition().y)
  return true;
  else 
  return false;
}
int getWidth(){
  return w;
}
int getHeight(){
  return h;
}
PVector getPart()
{
  return position; 
}
}
