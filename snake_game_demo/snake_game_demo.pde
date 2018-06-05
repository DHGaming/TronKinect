  
  /*These are parts relevent to the SNAKE GAME ITSELF*/
  Grid tron;
  Player first;
  Player second;
  private PImage theBack;
  ArrayList<Player> players = new ArrayList();
  void setup()
  {
    theBack = loadImage("tronworld.png");
    width = 640;
    height = 480;
    int w = 40;
    size(640,480);
    tron = new Grid(width,height,w);
    
    players.add(new Player(3 * w, w, w, w, 3, 0)); //player 1
    players.add(new Player(width - 2 * w, height - 2 * w, w, w, 2, 1)); //player 2
  }
  
  void draw()
  {
    if(frameCount%30==0)
    {
      //tron.displayGrid();
      image(theBack,0,0,640,480);
      
      for(int i = 0; i < 2; i++)
      {
        
        players.get(i).move();
        players.get(i).displayParts();
        players.get(i).displayPlayer();
        
        //for collision
        float tempX = players.get(i).getX();
        float tempY = players.get(i).getY();
        players.get(0).collision(tempX, tempY);
        players.get(1).collision(tempX, tempY);
      }
      //player1.checkSkeleton();
      //player2.checkSkeleton();
      //placeWorld();
    }
  }

  void placeWorld()
  {
    loadPixels();
    theBack.loadPixels();
    for(int x =0; x <640; x++)
    {
      for(int y =0; x <380; y++)
      {
        int location = x+y*640;
        println(location);
        float r = red(theBack.pixels[location]);
        float b = blue(theBack.pixels[location]);
        float g = green(theBack.pixels[location]);
        pixels[location]=color(int(r),int(g),int(b));
        updatePixels();
      }
    }
  }
  void playerMove(Player player)
  {
    //float thisX = player.getX();
    //float thisY = player.getY();
    player.move();
    //player.moveTrail(stored x, stored y)
    //updateGridIds();
  }

  
  
