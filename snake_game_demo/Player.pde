class Player extends Parts 
{
ArrayList<Parts> tail;
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
{}
void move()
{  
  //right
  if(direction==0){super.getPosition().x+=super.getWidth();}
  //up
  if(direction==1){{super.getPosition().y+=super.getWidth();}}
  //left
  if(direction==2){{super.getPosition().x-=super.getWidth();}}
  //down
  if(direction==3){{super.getPosition().y+=super.getWidth();}}
}
void setDirection(int d)
{
direction = d;
}
int getDirection(){
return direction;
}
@Override
void displayParts(){}
void displayPlayer(int i)
{
  if (id==0);
  {
    image(car1,super.getPosition().x, super.getPosition().y,super.getWidth(),super.getHeight());
  }
  if(id!=0)
  {
    image(car2,super.getPosition().x, super.getPosition().y,super.getWidth(),super.getHeight());
  }
  
}
int getId()
{
  return id;
}
}
