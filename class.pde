class imgButton
{
  PImage img;
  
  int bw, bh;
  int px, py;
  String img0, img1;
 
  int enabled;
  int clicked;
    
  imgButton(int bw_, int bh_, int px_, int py_, String img0_, String img1_)
  {
    bw = bw_;
    bh = bh_;
    px = px_;
    py = py_;
    img0 = img0_;
    img1 = img1_;
    enabled = 0;
    clicked = 0;
  }
  
  void view()
  {
    if(enabled == 1)
    {
      if((px<=mouseX) && (mouseX<=px+bw) && (py<=mouseY) && (mouseY<=py+bh))
      {
        img = loadImage(img1);
      }
      else
      {
        img = loadImage(img0);
      }
      image(img, px, py, bw, bh);
    }
  }
  
  void disable()
  {
    enabled=0;
  }
  
  void enable()
  {
    enabled=1;
  }

  void check()
  {
    if(enabled==1 && (px<=mouseX) && (mouseX<=px+bw) && (py<=mouseY) && (mouseY<=py+bh))
    {
      clicked = 1;
    }
    else
    {
      clicked = 0;
    }
  }
}
