/*Kinect*/
import kinect4WinSDK.Kinect;
import kinect4WinSDK.SkeletonData;
  
int dialation;
int translationX;
int translationY;
  
Grid tron;
Player first;
Player second;
PVector powerPosition = new PVector(0,0);

int w = 40;

private PImage power;
private PImage theBack;
ArrayList<Player> players = new ArrayList();

Kinect kinect;
ArrayList <SkeletonData> bodies;

int gameState = 0;
int gameWinner;

void setup()
{
  power = loadImage("power.png");
  theBack = loadImage("tronworld.png");
  width = 640;
  height = 480;
  size(640, 480);
  tron = new Grid(width, height, w);
  players.add(new Player(3 * w, w, w, w, 3, 0)); //player 1
  //players.add(new Player(width - 2 * w, height - 2 * w, w, w, 2, 1)); //player 2
  kinect = new Kinect(this);
  smooth();
  bodies = new ArrayList<SkeletonData>(); 
  dialation = 1;
  translationX = 0;
  translationY = 0;
  generatePower();
}
  
void draw()
{
  image(theBack, 0, 0, 640, 480);
  image(kinect.GetMask(), 160, 120, 320, 240);
  if(bodies.size() > 0)
  {
    for(int i = 0; i < bodies.size(); i++)
    {
      if(frameCount % 15 == 0)
      {
        players.get(i).setDirection(getDirection(bodies.get(i)));
        players.get(i).move();
        checkPowerUp(players.get(i));
      } 
      image(power, powerPosition.x, powerPosition.y, w, w);

      //display Player and Tail
      players.get(i).displayParts();
      players.get(i).displayPlayer();

      //collision
      float tempX = players.get(i).getX();
      float tempY = players.get(i).getY();
      if(players.get(i).collision(tempX, tempY))
      {
        gameState = 1;
      }
    }
  }
  checkGameState();
}

void placeWorld()
{
  loadPixels();
  theBack.loadPixels();
  for(int x = 0; x < 640; x++)
  {
    for(int y = 0; x < 380; y++)
    {
      int location = x + y * 640;
      println(location);
      float r = red(theBack.pixels[location]);
      float b = blue(theBack.pixels[location]);
      float g = green(theBack.pixels[location]);
      pixels[location] = color(int(r), int(g), int(b));
      updatePixels();
    }
  }
}

//kinect half of the methods 
void appearEvent(SkeletonData _s) 
{
  if (_s.trackingState == Kinect.NUI_SKELETON_NOT_TRACKED) 
  {
    return;
  }
  synchronized(bodies) {
    bodies.add(_s);
  }
}

void disappearEvent(SkeletonData _s) 
{
  synchronized(bodies) {
    for (int i = bodies.size() - 1; i >= 0; i--) 
    {
      if (_s.dwTrackingID == bodies.get(i).dwTrackingID) 
      {
        bodies.remove(i);
      }
    }
  }
}

void moveEvent(SkeletonData _b, SkeletonData _a) 
{
  if (_a.trackingState == Kinect.NUI_SKELETON_NOT_TRACKED) 
  {
    return;
  }
  synchronized(bodies) {
    for (int i = bodies.size() - 1; i >= 0; i--) 
    {
      if (_b.dwTrackingID == bodies.get(i).dwTrackingID) 
      {
        bodies.get(i).copy(_a);
        break;
      }
    }
  }
}

int getDirection(SkeletonData _s)
{
  PVector leftHand = _s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_HAND_LEFT];
  PVector rightHand =_s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_HAND_RIGHT];
  PVector torso = _s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER];
   
  boolean leftUp = leftHand.y < torso.y;
  boolean rightUp = rightHand.y < torso.y;
  
  if(leftUp)
  {
    if(rightUp)
    {
      System.out.println("Up");
      return 1;
    }
    else
    {
      System.out.println("Left");
      return 2;
    }
  }
  else
  {
    if (rightUp)
    {
      System.out.println("Right");
      return 0;
    }
  }
  if(!rightUp && !leftUp)
  {
       System.out.println("Down");
       return 3;
  }
  return 0;
}

//generate power position randomly & display position
void generatePower()
{
  //grabs the index of a random coordinate
  int randomCoordinateIndex = (int)(Math.random() * 192);
  //gets the coordinate 
  powerPosition = tron.getCoordinate(randomCoordinateIndex);
}

void checkPowerUp(Player p)
{
  if(p.getX() == powerPosition.x && p.getY() == powerPosition.y)
  {
    p.addScore();
    generatePower();
  } 
}

void checkGameState()
{
  if (gameState == 1)
  {
    System.out.println("Game Over!");
    System.out.println("You scored " + (players.get(0).score - 3) + " points!");
    System.out.println("Relaunch the game to play again.");
    while(true);
  }
}
