//ballX and ballY start the ball in the middle of the screen
//FIGURE OUT HOW TO SEND BALL TO SIDE THAT DIDN'T SCORE
float ballX = 500;
float ballY = 350;
float radius = 20;

//MAY NEED TO TOGGLE SPEED
float dX = random(2, 3);
float dY = random(2, 3);

float paddle1X = 30;
float paddle2X = 954;

float paddleWidth = 15;
float paddleHeight = 100;

float paddle1Y = 350;
float paddle2Y = 350;
float Dpaddle1 = 0;
float Dpaddle2 = 0;

boolean paddle1Up;
boolean paddle1Down;
boolean paddle2Up;
boolean paddle2Down;

int paddleSpeed = 10;

int p1Score = 0;
int p2Score = 0;

void setup() {
  size(1000, 700);
  background(0);
};

void draw() { 
  background(0,0,0);
  rect(500,0,5,700);
  
  fill(255,255,255);
  ellipse(ballX, ballY, radius, radius);
  
  //Defines edges of paddles and ball in order to ensure realistic bouncing
  float ballLeftEdge = ballX - radius + dX;
  float ballRightEdge = ballX + radius + dX;
  float ballTopEdge = ballY - radius + dY;
  float ballBottomEdge = ballY + radius + dY;
  
  float p1RightEdge = paddle1X + paddleWidth;
  float p1TopEdge = paddle1Y;
  float p1BottomEdge = paddle1Y + paddleHeight;

  float p2LeftEdge = paddle2X;
  float p2TopEdge = paddle2Y;
  float p2BottomEdge = paddle2Y + paddleHeight;
  
  //How ball interacts with sides of the screen and paddles
  //bottom and top edge of screen
  if (ballTopEdge < 0 || ballBottomEdge > height) {
    dY = -dY;
  }
  //interacting with paddle edges
  if (ballLeftEdge < p1RightEdge) {
    if (ballTopEdge > p1BottomEdge || ballBottomEdge < p1TopEdge) {
      p2Score = p2Score + 1;
      ballX = 500;
      ballY = 350;
    } else {
      dX = -dX;
    }
  }
  if (ballRightEdge > p2LeftEdge) {
    if (ballTopEdge > p2BottomEdge || ballBottomEdge < p2TopEdge) {
      p1Score = p1Score + 1;
      ballX = 500;
      ballY = 350;
    } else {
      dX = -dX;
    }
  }
  
  ballX = ballX + dX;
  ballY = ballY + dY;
  
  paddle1Y = paddle1Y + Dpaddle1;
  paddle2Y = paddle2Y + Dpaddle2;
  Dpaddle1 = 0;
  Dpaddle2 = 0;
  
  rect(paddle1X, paddle1Y, paddleWidth, paddleHeight);
  rect(paddle2X, paddle2Y, paddleWidth, paddleHeight);

  textSize(30);
  text(p1Score, 400, 50);
  text(p2Score, 600, 50);
  
  String winner = "";
  if (p1Score == 5 || p2Score == 5) {
    if (p1Score > p2Score) {
      winner = "Player One WINS!";
    }
    if (p2Score > p1Score) {
      winner = "Player Two WINS!";
    }
    background(0,0,0);
    text(winner, 500, 350);
    text(p1Score,500,400);
    text("--", 550, 400);
    text(p2Score, 600, 400);
    noLoop();
  }
} 

//FIX PADDLE MOVEMENT
void keyPressed(){
  if (keyCode == UP){
    if (paddle1Y >= 0) {
      paddle1Up = true;
    }
  } else if (keyCode == DOWN){
    if (paddle1Y < 600) {
      paddle1Down = true;
    }
  } else if (keyCode == 87){
    if (paddle2Y > 0) {
      paddle2Up = true;
    }
  } else if (keyCode == 83) {
    if (paddle2Y < 600) {
      paddle2Down = true;
    }
  }
}

void keyReleased() {
      if (keyCode == UP) {
        paddle1Up = false;
      }
      else if (keyCode == DOWN) {
        paddle1Down = false;
      }
      else if (keyCode == 87) {
        paddle2Up = false;
      }
      else if (keyCode == 83) {
        paddle2Down = false;
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

/* using Caitlin's class stuff
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
*/
