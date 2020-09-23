float x, y, h, w;
float speedX,speedY;
int score_left = 0, score_right = 0;
int paddle_xleft, paddle_yleft, paddle_xright, paddle_yright,paddle_w, paddle_h,paddle_s;
boolean up_left, down_left;
boolean up_right, down_right;

class PongPaddle{
  public void scores() {
    fill(255);
    text(score_left, 100, 50);
    text(score_right, width-100, 50);
  }
  
  public void bounce_ball(){
    if ( x > width - w/2) {
      //setup();
      speedX = -speedX;
      score_left = score_left + 1;
    }
    else if ( x < 0 + w/2) {
      //setup();
      score_right = score_right + 1;
    }
    if ( y > height - h/2) {
      speedY = -speedY;
    }  
    else if ( y < 0 + h/2) {
      speedY = -speedY;
    }
   }  

  public void drawPaddle(){
    fill(89);
    rect(paddle_xleft, paddle_yleft, paddle_w, paddle_h);
    fill(89);
    rect(paddle_xright, paddle_yright, paddle_w, paddle_h);
  }
  
  public void movePaddle(){
    if(up_left){
      paddle_yleft = paddle_yleft - paddle_s;
    }
    if(down_left){
      paddle_yleft = paddle_yleft + paddle_s;
    }
    if(up_right){
      paddle_yright = paddle_yright - paddle_s;
    }
    if(down_right){
      paddle_yright = paddle_yright + paddle_s;
    }
    drawPaddle();
  }
}

class PongBall{
  public void ball(int x1,int y1,int h1, int w1){
    x = x1;
    y = y1;
    h = h1;
    w = w1;
  }
  
  public void drawBall() {
  fill(255);
  ellipse(x, y, w, h);
  }
  
  public void moveBall(){
    x = x + speedX*2.8;
    y = y + speedY*2.8;
    drawBall();
  }
  
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
PongPaddle pongP = new PongPaddle();

void draw() {
  background(555);
  pong.moveBall();
  pongP.movePaddle();
  pongP.bounce_ball();
  pongP.scores();
  
}

void setup(){
  size(500,500);
  x = width/2; 
  y = height/2;
  w = 50;
  h = 50;
  
  speedX = 1;
  speedY = 1;
  
  textSize(30);
  textAlign(CENTER, CENTER); 
  rectMode(CENTER); 
  
  paddle_xleft = 30;
  paddle_yleft = height/2;
  paddle_xright = width-30;
  paddle_yright = height/2;
  paddle_w = 30;
  paddle_h = 100;
  paddle_s = 5;
  pong.ball(100,100,100,100);
}
