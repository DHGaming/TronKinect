class Grid
{

  ArrayList<Parts> coordinates; 
  
  Grid(int startX, int startY, int w)
  {
    coordinates = new ArrayList();
    for(int x = 0; x<startX; x+=w)
    {
      println(x);
      for(int y = 0; y<startY; y+=w)
      {
        println(y);
        coordinates.add(new Parts(x,y,w,w));
      }
    }
  }
     
  void displayGrid()
  {
     for(int i = 0; i<coordinates.size(); i++)
     {
       stroke(50,50,255);
       fill(0);
      
       coordinates.get(i).displayParts();
     }
  }
}
