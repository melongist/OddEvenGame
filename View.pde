PImage oddeven_img;

void view_oddeven(int r)
{
  if(started==1 || paused==1)
  {
    if(r == 0)
    {
      oddeven_img = loadImage("odd.png");
    }
    else if(r == 1)
    {
      oddeven_img = loadImage("even.png");    
    }
  }
  else
  {
    if(second()%2 == 0)
    {
      oddeven_img = loadImage("odd.png");
    }
    else
    {
      oddeven_img = loadImage("even.png");
    }
  }
  
  image(oddeven_img, width/2-218/2, height/3-218/2, 218, 218);
}
