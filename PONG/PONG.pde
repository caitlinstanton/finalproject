import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer soundPaddles, soundWalls;

PImage imgw1, imgw2, imgw3, imgw4, imgw5;
PImage imgl1, imgl2, imgl3, imgl4, imgl5;


//ballX and ballY start the ball in the middle of the screen
float ballX = 500;
float ballY = 350;
float radius = 20;

float dX;
float dY;

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

int rect1X;
int rect2X;
int rect3X;
int rectY;
int rectHeight = 30;
int rectLength = 100;
color currentColor1, currentColor2, currentColor3;
color rectColor;
color rectHighlight;
boolean rect1Over = false;
boolean rect2Over = false;
boolean rect3Over = false;

boolean levelEasy = false;
boolean levelMedium = false;
boolean levelHard = false;

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
  
  rectColor = color(0,153,0);
  currentColor1 = currentColor2 = currentColor3 = rectColor;
  rectHighlight = color(0,255,0);
  rect1X = 400;
  rect2X = 550;
  rect3X = 700;
  rectY = 255+50;
  
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

  minim = new Minim(this);
  soundPaddles = minim.loadFile("mushroom.wav");
  //soundWalls = minim.loadFile("beeping.flac");
}

void draw() { 
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
  text("-", circle1X-1, 530);
  text("you play against a player", 156, 560);
  text("You take the blue pill", 575, 500);
  text("-", circle2X-1, 530);
  text("you play against a computer", 540, 560);
  
  if (vsPlayer == true || vsComputer == true){
    background(0);

    if (rect1Over == true){
      fill(rectHighlight);
    } else {
      fill(currentColor1);
    }
    rect(rect1X, rectY, rectLength, rectHeight);
  
    if (rect2Over == true){
      fill(rectHighlight);
    } else {
    fill(currentColor2);
    }
    rect(rect2X, rectY, rectLength, rectHeight);
 
    if (rect3Over == true){
      fill(rectHighlight);
    } else {
      fill(currentColor3);
    }
    rect(rect3X, rectY, rectLength, rectHeight); 
  
    fill(255,255,255);
    textSize(20);
    text("Select difficulty:", 200, 275+50);
    textSize(15);
    text("easy", 435, 275+50);
    text("medium", 573, 275+50);
    text("hard", 732, 275+50);
  }
  
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
      //soundWalls.play();
    }
    //interacting with paddle edges
    if (ballLeftEdge < p1RightEdge) {
      if (ballTopEdge > p1BottomEdge || ballBottomEdge < p1TopEdge) {
        p2Score = p2Score + 1;
        ballX = 500;
        ballY = 350;
      } else {
        dX = -dX;
        soundPaddles.play();
      }
    }
    if (ballRightEdge > p2LeftEdge) {
      if (ballTopEdge > p2BottomEdge || ballBottomEdge < p2TopEdge) {
        p1Score = p1Score + 1;
        ballX = 500;
        ballY = 350;
      } else {
        dX = -dX;
        soundPaddles.play();
      }
    }
  
    ballX = ballX + dX;
    ballY = ballY + dY;

    /*************************** vs Player *****************************/
    if (vsPlayer == true && startgame == true) {
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
    if (vsComputer == true && startgame == true) {
    move();
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
      
      rect(paddle1X, paddle1Y, paddleWidth, paddleHeight);
      rect(paddle2X, paddle2Y, paddleWidth, paddleHeight);

      textSize(30);
      text(p1Score, 400, 50);
      text(p2Score, 600, 50);
  }
  
  
    if (p1Score == 5 || p2Score == 5) {
        vsPlayer = false;
        vsComputer = false;
        startgame = false;
        levelEasy = false;
        levelMedium = false;
        levelHard = false;
      if (p1Score > p2Score) {
        winner = "Player One WINS!";
        rect1Over = false;
        rect2Over = false;
        rect3Over = false;
        currentColor1 = currentColor2 = currentColor3 = rectColor;
      }
      if (p2Score > p1Score) {
        winner = "Player Two WINS!";
        rect1Over = false;
        rect2Over = false;
        rect3Over = false;
        currentColor1 = currentColor2 = currentColor3 = rectColor;
      }
      background(0,0,0);
      fill(0,153,255);
      text(winner, 370, 250);
      text(p1Score,445,350);
      text("--", 475, 350);
      text(p2Score, 525, 350);
      text("Press 'space' to restart or 'enter' to end the game", 146, 675);
      
      if (winner == "Player One WINS!"){
        scale(.80);
        image(imgw1, 0, 0);
        scale(.77);
        image(imgw2, 0, 300);
        scale(.28);
        image(imgw3, 0, 2000);
        scale(.25);
        image(imgw4, 4150, 3000);
        scale(20);
        image(imgw5, 200, 450);

        scale(1);
        tint(255,255,255);
        image(imgl1, 925, 450); 
        scale(.5);
        image(imgl2, 2040, 0);
        scale(1.25);
        image(imgl3, 1125, 800);
        scale(1);
        image(imgl4, 1200, 50);
        scale(1.25);
        image(imgl5, 990, 400);
      } 
      if (winner == "Player Two WINS!") {
        scale(.80);
        image(imgw1, 1028, 0);
        scale(.77);
        image(imgw2, 1215, 300);
        scale(.28);
        image(imgw3, 4895, 2100);
        scale(.25);
        image(imgw4, 15100, 2550);
        scale(20);
        image(imgw5, 730, 450);

        scale(1);
        image(imgl1, 0, 450); 
        scale(.5);
        image(imgl2, 0, 0);
        scale(1.25);
        image(imgl3, 400, 800);
        scale(1);
        image(imgl4, 250, 50);
        scale(1.25);
        image(imgl5, 0, 400);
      }
      p1Score = 0;
      p2Score = 0;
      paddle1X = 50;
      paddle2X = 934;
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
  if (overRect(rect1X, rectY, rectLength, rectHeight)){
    rect1Over = true;
    rect2Over = false;
    rect3Over = false;
  } else if (overRect(rect2X, rectY, rectLength, rectHeight)){
    rect1Over = false;
    rect2Over = true;
    rect3Over = false;
  } else if (overRect(rect3X, rectY, rectLength, rectHeight)){
    rect1Over = false;
    rect2Over = false;
    rect3Over = true;
  } else {
    rect1Over = false;
    rect2Over = false;
    rect3Over = false;
  }
}

void mousePressed(){
  if (circle1Over == true){
     startgame = false;
     vsPlayer = true;
  }
  if (circle2Over == true){
    startgame = false;
    vsComputer = true;
  }
  if (vsPlayer == true || vsComputer == true){
    float speed;
    if (rect1Over == true){
      startgame = true;
      currentColor1 = rectHighlight;
      currentColor2 = rectColor;
      currentColor3 = rectColor;
      levelEasy = true;
      levelMedium = false;
      levelHard = false;
      speed = random(1,2) * -1;
      dX = speed; //ball speed = easy
      dY = speed; //ball speed = easy
    } else if (rect2Over == true){
      startgame = true;
      currentColor1 = rectColor;
      currentColor2 = rectHighlight;
      currentColor3 = rectColor;
      levelEasy = false;
      levelMedium = true;
      levelHard = false;
      speed = random(4,5) * -1;
      dX = speed; //ball speed = medium
      dY = speed; //ball speed = medium
    } else if (rect3Over == true){
      startgame = true;
      currentColor1 = rectColor;
      currentColor2 = rectColor;
      currentColor3 = rectHighlight;
      levelEasy = false;
      levelMedium = false;
      levelHard = true;
      speed = random(9,10) * -1;
      dX = speed; //ball speed = hard
      dY = speed; //ball speed = hard
    } else {
      startgame = false;
    }
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

boolean overRect(int x, int y, int width, int height){
  if (mouseX >= x && mouseX <= x+width&& mouseY >= y && mouseY <= y+height){
    return true;
  } else {
    return false;
  }
}

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
  } else if (keyCode == 32 && winner.equals("") == false) {
    p1Score = 0;
    p2Score = 0;
    paddle1Y = 350;
    paddle2Y = 350;
    vsPlayer = false;
    vsComputer = false;
    startgame = false;
    levelEasy = false;
    levelMedium = false;
    levelHard = false;
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

/** this method moves the computer */ 
public void move () {
// calculate the middle of the paddle 
  float middleY = paddle2Y + (paddleHeight / 2); 
  
  //Ball is moving away from the paddle
  //Poses no danger to the computer
  if (ballX < 500) {
    // if the paddle's position is over the middle y - position 
    if (paddle2Y < 350) {
      paddle2Y = paddle2Y + paddleSpeed;
    } 
// Paddle is under the middle y - position 
    else if (paddle2Y > 350) {
      paddle2Y = paddle2Y - paddleSpeed; 
    }
  } 
// ball is moving towards paddle 
  else if (ballX > 500) {
// As long as ball's y - position and paddle's y - position are different 
    if (paddle2Y != ballY) {
// If ball's position smaller than paddle's, move up 
      if (ballY < paddle2Y - (paddleHeight / 4)) {
        paddle2Y = paddle2Y - paddleSpeed; 
      } 
// If ball's position greater than paddle's, move down 
      else if (ballY > paddle2Y + (paddleHeight / 4)) {
        paddle2Y = paddle2Y + paddleSpeed; 
      } 
    }
  }
}
