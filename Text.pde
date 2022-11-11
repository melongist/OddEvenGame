PFont font;

void text_print()
{
  font = createFont("Ariel", 15);
  textFont(font);
  textAlign(CENTER);
  fill(100);
  text("빅뱅 때부터 이미 정해져 있는", width/2, 25);
  
  font = createFont("Ariel", 40);
  textFont(font);
  text("운명의 홀짝 게임", width/2, 70);
  
  if(started == 0)
  {
    font = createFont("Ariel", 15);
    textFont(font);
    text("Start! 를 누르면 게임이 시작됩니다.", width/2, 360);
  }
  
  if(started==1 && continued==0)
  {
    font = createFont("Ariel", 15);
    textFont(font);
    text("홀 짝 중 하나를 선택하세요! 이미 운명은 결정되어있습니다.", width/2, 360);
  }
  
  if(continued>=1)
  {
    font = createFont("Ariel", 15*continued);
    textFont(font);
    String str = "X"+str(int(pow(2, continued)));
    text(str, width/2, 360);
  }
}
