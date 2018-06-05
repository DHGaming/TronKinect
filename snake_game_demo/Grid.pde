class Grid
{

  ArrayList<PVector> coordinates; 
  
  Grid(int startX, int startY, int w)
  {
    coordinates = new ArrayList();
    for(int x = 0; x<startX; x+=w)
    {
      println(x);
      for(int y = 0; y<startY; y+=w)
      {
        println(y);
        coordinates.add(new PVector(x,y));
      }
    }
  }
  PVector getCoordinate(int c)
  {
    return coordinates.get(c);
  }
  void displayGrid()
  {
     for(int i = 0; i<coordinates.size(); i++)
     {
       stroke(50,50,255);
       fill(0);
      
       rect(coordinates.get(i).x,coordinates.get(i).y,w,w);;
     }
  }
}
