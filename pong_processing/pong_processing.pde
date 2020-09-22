int x, y, h, w;
class PongPaddle{
  int score; 
  void bounce_ball(){
  }
}

class PongBall{
  public void ball(int x1,int y1,int h1, int w1){
    x = x1;
    y = y1;
    h = h1;
    w = w1;
  }
  public void drawCircle() {
  fill(255);
  ellipse(x, y, w, h);
}
  //void move(){
  //  x = x + speedX*2;
  //  y = y + speedY*2;
  //}
}

class PongGame{
  int player1;
  int player2;

  void update() {  //bouce of paddles
  
  }
  void serveBall() {
    
  }
  
  void moveTouch() {
  //if mouseClick 
  }
}

PongBall pong = new PongBall();
void draw() {
  pong.drawCircle();
}

void setup(){
  size(500,500);
  pong.ball(100,100,100,100);
}
