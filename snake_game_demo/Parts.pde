abstract class Parts
{

  private int w;
  private int h;
  private PVector position;
  
  Parts(int xx, int yy, int ww, int hh)
  {
    w=ww;
    h=hh;
    position = new PVector(xx,yy);
  }
  
  void displayParts()
  {
    rect(getX(),getY(),w,h);
  }
  
  public abstract PImage getImage();
  
  PVector getPosition() 
  {
    return position;
  }
  
  boolean isEqual(Parts other)
  {
    if(other.getPosition().x==this.getPosition().x&&
    other.getPosition().y==this.getPosition().y)
    return true;
    else 
    return false;
  }
  
  float getX()
  {
   return getPosition().x;
  }
  
  float getY()
  {
   return getPosition().y;
  }
  
  int getWidth()
  {
    return w;
  }
  
  int getHeight()
  {
    return h;
  }
  
  PVector getPart()
  {
    return position; 
  }
  
  void setPosition(float a, float b)
  {
    position.x=a;
    position.y=b;
  }
}
