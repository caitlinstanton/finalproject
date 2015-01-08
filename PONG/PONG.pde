
//ballX and ballY start the ball in the middle of the screen
float ballX = 500;
float ballY = 350;

//MAY NEED TO TOGGLE SPEED
float dX = random(3, 4);
float dY = random(3, 4);

paddle h1 = new paddle(10,10);
paddle h2 = new paddle(974,10);
float paddle1Y = 350;
float paddle2Y = 350;
float Dpaddle1 = 0;
float Dpaddle2 = 0;

  
void setup() {
  size(1000, 700);
  background(0);
  
  /* FIGURE OUT HOW TO UPDATE SCORE
  int x = 0;
  String s = str(x); 
  x = x + 1;
  s = str(x);
  textSize(32);
  text(s, 450, 50);
  textSize(32);
  text(s, 535,50);
  */
};

void draw() { 
  background(0,0,0);
  rect(10,paddle1Y,15,100);
  rect(974,paddle2Y,15,100);
  rect(500,0,10,700);
  
  paddle1Y = paddle1Y + Dpaddle1;
  paddle2Y = paddle2Y + Dpaddle2;
  Dpaddle1 = 0;
  Dpaddle2 = 0;
  
  fill(255,255,255);
  ellipse(ballX, ballY, 20, 20);
  
  //CONTROLS MOVEMENT OF THE BALL
  //Negating dX/dY makes the ball go in the opposite direction, making it bounce realistically
  
  if (ballX < 25 && ballY >= paddle1Y && ballY <= (paddle1Y+100)) {
    dX = -dX;
  }
  if (ballX > 974 && ballY >= paddle2Y && ballY <= (paddle2Y+100)) {
    dX = -dX;
  }
  if (ballX > width) {
    dX = -dX;
  }
  if (ballX < 0) {
    dX = -dX;
  }
  if (ballY > height) {
    dY = -dY;
  }
  if (ballY < 0) {
    dY = -dY;
  }
  ballX = ballX + dX;
  ballY = ballY + dY;
  
  
} 

void keyPressed(){
  if (keyCode == UP){
    if (paddle1Y >= 0) {
      Dpaddle1 = -10;
    }
  } else if (keyCode == DOWN){
    if (paddle1Y < 600) {
      Dpaddle1 = 10;
    }
  } else if (keyCode == 87){
    if (paddle2Y > 0) {
      Dpaddle2 = -10;
    }
  } else if (keyCode == 83) {
    if (paddle2Y < 600) {
      Dpaddle2 = 10;
    }
  } else {
    Dpaddle1 = 0;
  }
}
 
class paddle { 
  float ypos, xpos; 
  boolean Cgoingdown = true;
  paddle (float x, float y) {  
    ypos = y; 
    xpos = x;
  } 
  void update() { 
    /*
    if (Cgoingdown == true){
        if (ypos >= 700){
          ypos = ypos + 1;;
        } else {
          Cgoingdown = false;
        }
      } else {
        if (ypos <= 0){
          ypos = ypos - 1;
        } else {
          Cgoingdown = true;
        }
      }
    */
    if (0 < ypos && ypos <= 300 && Cgoingdown == true) {
      ypos = ypos + 1;
    } else if (ypos <= 299 && ypos > 0 && Cgoingdown == false) {
      ypos = ypos - 1;
    } else {
      Cgoingdown = !Cgoingdown;
    
    rect(xpos,ypos,15,100);
    }
  }
}

// using Caitlin's class stuff

void computermoves (){
  boolean Cgoingdown = true;
  if (Cgoingdown == true){
    if (h2.ypos >= 700){
      h2.ypos++;
    }
    else {
      Cgoingdown = false;
    }
  }
  else {
    if (h2.ypos <= 0){
      h2.ypos--;
    }
    else {
      Cgoingdown = true;
    }
  }
};
