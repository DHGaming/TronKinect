class Player extends Parts 
{
  ArrayList<Parts> tailList = new ArrayList<Parts>();
  private int score = 4;
  
  private int direction;
  private int id;
  
  private PImage car1 = loadImage("car1.png");
  private PImage car2 = loadImage("car2.png");
  
  Player(int x, int y, int w, int h, int d, int idd)
  {
    super(x,y,w,h);
     direction = d;
     id=idd;
  }
  //adds to the 
  void turn()
  {
    setDirection((direction + 1)%4);
  }
  
<<<<<<< HEAD
}
int getId()
{
  return id;
}

void addTail()
{
  
  if((tail.size()>=3))
  {
  PVector lastBlock= tail.get(tail.size()-1).getPosition();
  tail.add(new Parts((int)lastBlock.x ,(int)lastBlock.y, super.getWidth(), super.getHeight()));
  }
  do{
    tail.add(new Parts(0,0,super.getWidth(),super.getHeight()));
  } while(tail.size()<3);
  
}
=======
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
    for(Parts t : tailList)
    {
      image(t.getImage(), getX(), getY(),super.getWidth(),super.getHeight());
    }
  }
  
  void displayPlayer(int i)
  {
    if (id==0);
    {
      image(car1,getX(),getY(),super.getWidth(),super.getHeight());
    }
    if(id!=0)
    {
      image(car2,getX(), getY(),super.getWidth(),super.getHeight());
    }
    
  }
  int getId()
  {
    return id;
  }
  float getX()
  {
   return super.getPosition().x;
  }
  float getY()
  {
   return super.getPosition().y;
  }
  
  /*
  void moveTail(float a,float b)
  {
    float previousX= a;
    float previousY= b;
    float currentX = tail.get(0).getPosition().x;
    float currentY = tail.get(0).getPosition().Y;
    tail.get(0).setPosition(a,b);
    for(int i=1; int i < tail.size()-1;i++)
    {
      tail.get(i).setPosition(currentX,currentY);
      previousX=currentX;
      previousY=currentY;
      
      currentX=tail.get(i+1).getPosition().x;
      currentY=tail.get(i+1).getPosition().y;
    }
  }
  */
>>>>>>> ede0c4f227d57c43075fae72288ddcbd949e53cc
}
