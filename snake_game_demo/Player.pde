class Player extends Parts 
{
  ArrayList<Parts> tailList = new ArrayList<Parts>();
  private int score = 5;
  
  /* Directions are like those on the Unit Circle.
   * d = 0 corresponds to right
   * d = 1 is up
   * d = 2 is left
   * d = 3 is down
   */
  private int direction;
  
  // Identifies which player, 1(id = 0) or 2 (id = 1)
  private int id;
  
  //images for the objects
  private PImage car1 = loadImage("car1.png");
  private PImage car2 = loadImage("car2.png");
  
  Player(int x, int y, int w, int h, int d, int idd)
  {
    super(x,y,w,h);
     direction = d;
     id=idd;
  }
  
  //moves player and tail together
  void move()
  {
    updateTail();
    //right
    if(direction==0){super.getPosition().x+=super.getWidth();}
    //up
    if(direction==1){{super.getPosition().y+=super.getWidth();}}
    //left
    if(direction==2){{super.getPosition().x-=super.getWidth();}}
    //down
    if(direction==3){{super.getPosition().y+=super.getWidth();}}
  }
  
  void updateTail()
  {
    tailList.add(new Tail(getX(), getY(), super.getWidth(), super.getHeight(), direction%2));
    
    if(tailList.size() > score)
    {
      tailList.remove(0);
    }
  }
  
  void setDirection(int d)
  {
    direction = d;
  }
  
  int getDirection()
  {
    return direction;
  }
  
  @Override
  void displayParts()
  {
    displayPlayer();
    for(int i = 0; i < tailList.size(); i++)
    {
      image(tailList.get(i).getImage(), (int) tailList.get(i).getX(), tailList.get(i).getY(),super.getWidth(),super.getHeight());
    }
  }
  
  void displayPlayer()
  {
      image(getImage(),getX(),getY(),super.getWidth(),super.getHeight());
  }
  int getId()
  {
    return id;
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
    if (id == 0) return car1;
    return car2;
  }
  
  //checks if a position overlaps with Parts within this object.
  boolean collision(float x, float y) //parameters are the position of object being tested for collision.
  {
    for(Parts t : tailList)
    {
      if (x == t.getX() && y == t.getY())
      {
        System.out.print(1);
        return true;
      }
    }
    return false;
  }
  
}
