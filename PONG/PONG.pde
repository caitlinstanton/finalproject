//NEED TO DOWNLOAD SOUND LIBRARYYYYYYYYY
//image stuff works, just need to set layout

//import processing.sound.*;
//SoundFile paddlesound, wallsound;
PImage imgw1, imgw2, imgw3, imgw4, imgw5;
PImage imgl1, imgl2, imgl3, imgl4, imgl5;


//ballX and ballY start the ball in the middle of the screen
float ballX = 500;
float ballY = 350;
float radius = 20;

//MAY NEED TO TOGGLE SPEED
float dX = random(4, 5);
float dY = random(4, 5);

float paddle1X = 50;
float paddle2X = 934;

float paddleWidth = 15;
float paddleHeight = 100;

float paddle1Y = 350;
float paddle2Y = 350;

boolean paddle1Up;
boolean paddle1Down;
boolean paddle2Up;
boolean paddle2Down;

int paddleSpeed = 5;

int p1Score = 0;
int p2Score = 0;
String winner = "";

int circle1X, circle1Y;
int circle2X, circle2Y;
int circleSize = 100;
color circle1Color, circle2Color;
color circle1Highlight, circle2Highlight;
boolean circle1Over = false;
boolean circle2Over = false;

boolean startgame = false;
boolean vsPlayer = false;
boolean vsComputer = false;
// need to differentiate btw player vs. computer && player vs. player

void setup() {
  size(1000, 700);
  background(0);
  circle1Color = color(255,0,0);
  circle2Color = color (0,0,255);
  circle1Highlight = color (255,100,100);
  circle2Highlight = color(0, 100, 255);
  circle1X = width/2 - circleSize*2;
  circle1Y = height/2;
  circle2X = width/2 + circleSize*2;
  circle2Y = height/2;
  
//  paddlesound = new SoundFile(this, "mushroom.wav");
//  wallsound = new SoundFile(this,"beeping.flac");
  
  imgw1 = loadImage("winner1.jpg");
  imgw2 = loadImage("winner2.jpg");
  imgw3 = loadImage("winner3.jpg");
  imgw4 = loadImage("winner4.jpg");
  imgw5 = loadImage("winner5.jpg");

  imgl1 = loadImage("loser1.png");
  imgl2 = loadImage("loser2.jpg");
  imgl3 = loadImage("loser3.jpg");
  imgl4 = loadImage("loser4.png");
  imgl5 = loadImage("loser5.jpg");
}


void draw() { 
//  background(34);
  update (mouseX, mouseY);
  background(0);
  
  if (circle1Over == true) {
    fill(circle1Highlight);
  } else {
    fill(circle1Color);
  }
  ellipse(circle1X, circle1Y, circleSize*2, circleSize);
  
  if (circle2Over == true) {
    fill(circle2Highlight);
  } else {
    fill(circle2Color);
  }
  ellipse(circle2X, circle2Y, circleSize*2, circleSize);
  
  fill(255,255,255);
  textSize(100);
  text("PONG", 356, 175);
  textSize(25);
  text("You take the red pill", 180, 500); 
  //146 if size 32
  text("-", circle1X-1, 530);
  text("you play against a player", 156, 560);
  text("You take the blue pill", 575, 500);
  text("-", circle2X-1, 530);
  text("you play against a computer", 540, 560);
  
  if (startgame == true){
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
      
      background(0,0,0);
      rect(500,0,5,height);
      rect(p1RightEdge,0,2,height);
      rect(p2LeftEdge,0,2,height);
      
      fill(255,255,255);
      ellipse(ballX, ballY, radius, radius);
      
    //How ball interacts with sides of the screen and paddles
    //bottom and top edge of screen
    if (ballTopEdge < 0 || ballBottomEdge > height) {
      dY = -dY;
//      wallsound.play();
    }
    //interacting with paddle edges
    if (ballLeftEdge < p1RightEdge) {
      if (ballTopEdge > p1BottomEdge || ballBottomEdge < p1TopEdge) {
        p2Score = p2Score + 1;
        ballX = 500;
        ballY = 350;
      } else {
        dX = -dX;
//        paddlesound.play();
      }
    }
    if (ballRightEdge > p2LeftEdge) {
      if (ballTopEdge > p2BottomEdge || ballBottomEdge < p2TopEdge) {
        p1Score = p1Score + 1;
        ballX = 500;
        ballY = 350;
      } else {
        dX = -dX;
//        paddlesound.play();
      }
    }
  
    ballX = ballX + dX;
    ballY = ballY + dY;
    
    /*************************** vs Player *****************************/
    if (vsPlayer == true) {
      if (paddle1Up == true) {
        if (paddle1Y - paddleSpeed > 0) {
          paddle1Y = paddle1Y - paddleSpeed;
        }
      }
      if (paddle1Down == true) {
        if (paddle1Y + paddleSpeed + paddleHeight < height) {
          paddle1Y = paddle1Y + paddleSpeed;
        }
      }
      if (paddle2Up == true) {
        if (paddle2Y - paddleSpeed > 0) {
          paddle2Y = paddle2Y - paddleSpeed;
        }
      }
      if (paddle2Down == true) {
        if (paddle2Y + paddleSpeed + paddleHeight < height) {
          paddle2Y = paddle2Y + paddleSpeed;
        }
      }
      rect(paddle1X, paddle1Y, paddleWidth, paddleHeight);
      rect(paddle2X, paddle2Y, paddleWidth, paddleHeight);

      textSize(30);
      text(p1Score, 400, 50);
      text(p2Score, 600, 50);
    }
    
    /****************************** vs Computer ****************************/
    //FIX COMPUTER PLAYER THING UGH
 
    if (vsComputer == true) {
      if (paddle1Up == true) {
        if (paddle1Y - paddleSpeed > 0) {
          paddle1Y = paddle1Y - paddleSpeed;
        }
      }
      if (paddle1Down == true) {
        if (paddle1Y + paddleSpeed + paddleHeight < height) {
          paddle1Y = paddle1Y + paddleSpeed;
        }
      }
      
/*      while (startgame == true) {
        float upVal = random(1,10);
        float downVal = 20 - upVal;
        float val;
        for (val = 0; val < 20; val++) {
         if (val < downVal) {
           if (val < upVal) {
             paddle2Up = true;
           } else {
             paddle2Down = true;
           }
         }
        }
        val = 0;
       }
       */
       
/*      if (startgame == true) {
       float upVal = random(1,10);
       float downVal = 20 - upVal;
       float val;
       for (val = 0; val < 20; val++) {
        if (val < downVal) {
          if (val < upVal) {
            paddle2Up = true;
          } else {
            paddle2Down = true;
          }
        }
       }
       val = 0;
      }

*/
      rect(paddle1X, paddle1Y, paddleWidth, paddleHeight);
      rect(paddle2X, paddle2Y, paddleWidth, paddleHeight);

      textSize(30);
      text(p1Score, 400, 50);
      text(p2Score, 600, 50);
  }
  
  
    if (p1Score == 1 || p2Score == 1) {
      startgame = false;
      if (p1Score > p2Score) {
        winner = "Player One WINS!";
      }
      if (p2Score > p1Score) {
        winner = "Player Two WINS!";
      }
      background(0,0,0);
      text(winner, 370, 250);
      text(p1Score,445,300);
      text("--", 475, 300);
      text(p2Score, 525, 300);
      text("Press 'space' to restart or 'enter' to end the game", 146, 500);
      
      if (winner == "Player One WINS!"){
        image(imgw1, 0, 0);
        image(imgw2, 0, 100);
        image(imgw3, 0, 200);
        image(imgw4, 0, 300);
        image(imgw5, 0, 400);

        image(imgl1, 350, 0); 
        image(imgl2, 350, 100);
        image(imgl3, 350, 200);
        image(imgl4, 350, 300);
        image(imgl5, 350, 400);
      } 
      if (winner == "Player Two WINS!") {
        image(imgw1, 350, 0);
        image(imgw2, 350, 100);
        image(imgw3, 350, 200);
        image(imgw4, 350, 300);
        image(imgw5, 350, 400);

        image(imgl1, 0, 0); 
        image(imgl2, 0, 100);
        image(imgl3, 0, 200);
        image(imgl4, 0, 300);
        image(imgl5, 0, 400);
      }
      noLoop();
    }
   }
}

void update(int x, int y) {
  if (overCircle(circle1X, circle1Y, circleSize)){
    circle1Over = true;
    circle2Over = false;
  } else if (overCircle(circle2X, circle2Y, circleSize)) {
    circle1Over = false;
    circle2Over = true;
  } else {
    circle1Over = false;
    circle2Over = false;
  }
}

void mousePressed(){
  if (circle1Over == true){
     //circle1Color = circle1Color+10;
     startgame = true;
     vsPlayer = true;
  }
  if (circle2Over == true){
    //circle2Color = circle2Color+10;
    startgame = true;
    vsComputer = true;
  }
}

boolean overCircle(int x, int y, int diameter){
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}

//FIX PADDLE MOVEMENT
void keyPressed(){
  if (keyCode == UP){
    if (paddle2Y >= 0) {
      paddle2Up = true;
    }
  } else if (keyCode == DOWN){
    if (paddle2Y < height) {
      paddle2Down = true;
    }
  } else if (keyCode == 87){
    if (paddle1Y > 0) {
      paddle1Up = true;
    }
  } else if (keyCode == 83) {
    if (paddle1Y < height) {
      paddle1Down = true;
    }
  } else if (keyCode == 32) {
    p1Score = 0;
    p2Score = 0;
    loop();
  } else if (keyCode == ENTER && winner.equals("") == false){
    exit();
  }
}

void keyReleased() {
      if (keyCode == UP) {
        paddle2Up = false;
      }
      else if (keyCode == DOWN) {
        paddle2Down = false;
      }
      else if (keyCode == 87) {
        paddle1Up = false;
      }
      else if (keyCode == 83) {
        paddle1Down = false;
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
