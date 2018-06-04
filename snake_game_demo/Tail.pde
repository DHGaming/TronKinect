public class Tail extends Parts
{
  public PImage nos = loadImage("ver_tail.png");
  public PImage eow = loadImage("hor_tail.png");
  //private int lifeSpan;
  private int direction;
  
  public Tail(float x, float y, int w, int h, int d)
  {
    super((int)x,(int)y,w,h);
    direction = d%2;
  }
  
  public int getDirection()
  {
    return direction;
  }
  
  float getX()
  {
   return super.getX();
  }
  
  float getY()
  {
   return super.getY();
  }
  
  public PImage getImage()
  {
    if (direction % 2 == 1) return nos;
    return eow;
  }
  
}