float x, y, h, w;
float speedX,speedY;
int score_left = 0, score_right = 0;
float paddle_xleft, paddle_yleft, paddle_xright, paddle_yright,paddle_w, paddle_h;

class PongPaddle{
  public void drawPaddle(){
    fill(89);
    rect(paddle_xleft, paddle_yleft, paddle_w, paddle_h);
    fill(89);
    rect(paddle_xright, paddle_yright, paddle_w, paddle_h);
  }
 
  public void movePaddle() {
    if(dist(paddle_xleft, paddle_yleft, mouseX, mouseY) < paddle_h){
      //cursor(HAND);
      if(mousePressed){
        paddle_yleft = mouseY;
        strokeWeight(3);
      }
      else{
        strokeWeight(2);
      }
    }
    
    if(dist(paddle_xright, paddle_yright, mouseX, mouseY) < paddle_h){
      //cursor(HAND);
      if(mousePressed){
        paddle_yright = mouseY;
        strokeWeight(3);
      }
      else{
        strokeWeight(2);
      }
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
    x = x + speedX*2.5;
    y = y + speedY*2.5;
    if ( x > width - w/2) {
      x = width /2;
      y = height /2;
      score_left = score_left + 1;
    }
    else if ( x < 0 + w/2) {
      x = width /2;
      y = height /2;
      score_right = score_right + 1;
    }
    if ( y > height - h/2) {
      speedY = -speedY;
    }  
    else if ( y < 0 + h/2) {
      speedY = -speedY;
    }
    drawBall();
  }
  
}

class PongGame{
  public void scores() {
    fill(255);
    text(score_left, 100, 50);
    text(score_right, width-100, 50);
  }
  
  public void paddle() {
    if (x - w/2 < paddle_xleft + paddle_w/2 && y - h/2 < paddle_yleft + paddle_h/2 && y + h/2 > paddle_yleft - paddle_h/2 ) {
      if (speedX < 0) {
        speedX = -speedX*1;
      }
    }
    else if (x + w/2 > paddle_xright - paddle_w/2 && y - h/2 < paddle_yright + paddle_h/2 && y + h/2 > paddle_yright - paddle_h/2 ) {
      if (speedX > 0) {
        speedX = -speedX*1;
      }
    }
    scores();
  }
}

PongGame pongG = new PongGame();
PongBall pong = new PongBall();
PongPaddle pongP = new PongPaddle();

void draw() {
  background(555);
  pong.moveBall();
  pongG.scores();
  pongG.paddle();
  pongP.movePaddle();
}

void setup(){
  size(700,700);
  x = width/2; 
  y = height/2;
  w = 60;
  h = 60;
  
  speedX = 1;
  speedY = 1;
  
  textSize(30);
  textAlign(CENTER, CENTER); 
  rectMode(CENTER); 
  
  paddle_xleft = 20;
  paddle_yleft = height/2;
  paddle_xright = width-20;
  paddle_yright = height/2;
  paddle_w = 40;
  paddle_h = 150;
  pong.ball(100,100,100,100);
}
