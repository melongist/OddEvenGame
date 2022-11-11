import processing.sound.*;

int seed;
int r;
int started, paused;
int rewards;
int continued;

imgButton start_button, go_button, stop_button;
imgButton odd_button, even_button;
imgButton succeeded_button, failed_button;

//The Processing Foundation Sound Library install needed
//Tool - Manage Tools - Libraries - Sound
SoundFile sounds;

void setup()
{
  size(640, 640);  //window size
  smooth();
  frameRate(30);   //set framerate
  
  seed = (int)random(0,256);
  randomSeed(seed);
  
  start_button = new imgButton(211, 75, width/2-211/2, height/3*2-75/2, "start.png", "start.png");
  go_button = new imgButton(211, 75, width/4*1-211/2, height/3*2-75/2, "go.png", "go.png");
  stop_button = new imgButton(211, 75, width/4*3-211/2, height/3*2-75/2, "stop.png", "stop.png");
  odd_button = new imgButton(211, 75, width/4*1-211/2, height/5*4-75/2, "sodd0.png", "sodd1.png");
  even_button = new imgButton(211, 75, width/4*3-211/2, height/5*4-75/2, "seven0.png", "seven1.png");
  succeeded_button = new imgButton(280, 280, width/2-280/2, height/2-280/2, "succeeded.png", "succeeded.png");
  failed_button = new imgButton(280, 280, width/2-280/2, height/2-280/2, "failed.png", "failed.png");
  
  game_init();
}

void draw()
{
  background(255,255,255);  //clear

  r = (int)random(0, 2);
  
  if(paused == 0)
  {
    view_oddeven(r);
  }
  
  start_button.view();
  go_button.view();
  stop_button.view();
  odd_button.view();
  even_button.view();
  
  succeeded_button.view();
  failed_button.view();
  
  if(paused == 0)
  {
    text_print();
  }
}


void mouseClicked()
{
  start_button.check();
  odd_button.check();
  even_button.check();

  succeeded_button.check();
  failed_button.check();

  go_button.check();
  stop_button.check();
  
  if(start_button.clicked == 1)
  {
    start_button.disable();

    odd_button.enable();
    even_button.enable();

    started = 1;
  }
  
  if(odd_button.clicked == 1)
  {
    if(r%2 == 1)
    {
      odd_button.disable();
      even_button.disable();
      
      //mp3 file from pixabay.com
      sounds = new SoundFile(this, "success.wav");
      sounds.play();
      
      succeeded_button.enable();
      rewards = rewards*2;
      continued = continued+1;
    }
    else
    {
      odd_button.disable();
      even_button.disable();

      //mp3 file from pixabay.com
      sounds = new SoundFile(this, "fail.wav");
      sounds.play();
      
      failed_button.enable();
    }

    paused = 1;
  }
  
  if(even_button.clicked == 1)
  {
    if(r%2 == 0)
    {
      odd_button.disable();
      even_button.disable();

      //mp3 file from pixabay.com
      sounds = new SoundFile(this, "success.wav");
      sounds.play();
      
      succeeded_button.enable();
      rewards = rewards*2;
      continued = continued+1;
    }
    else
    {
      odd_button.disable();
      even_button.disable();

      sounds = new SoundFile(this, "fail.wav");
      sounds.play();
            
      failed_button.enable();  
    }
    paused = 1;
  }

  if(succeeded_button.clicked == 1)
  {
    succeeded_button.disable();
    
    go_button.enable();
    stop_button.enable();
    
    paused = 0;
  }
  
  if(failed_button.clicked == 1)
  {
    failed_button.disable();

    game_init();
  }

  if(go_button.clicked == 1)
  {
    go_button.disable();
    stop_button.disable();
    
    odd_button.enable();
    even_button.enable();
  }
  
  if(stop_button.clicked == 1)
  {
    go_button.disable();
    stop_button.disable();
    
   game_init();
  }
  
  
}


void game_init()
{
  started = 0;
  paused = 0;
  rewards = 1;
  continued = 0;
  start_button.enable();  
}
