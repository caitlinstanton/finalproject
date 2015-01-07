//ballX and ballY start the ball in the middle of the screen
float ballX = 500;
float ballY = 350;

//MAY NEED TO TOGGLE SPEED
float dX = random(3, 4);
float dY = random(3, 4);

paddle h1 = new paddle(10,10);
paddle h2 = new paddle(974,10);
  
void setup() {
  size(1000, 700);
  background(0);
  rect(10,10,15,100);
  rect(974,10,15,100);
  rect(500,0,10,700);
  
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
  h1.update(); 
  h2.update();  
  
  background(0,0,0);
  fill(255,255,255);
  ellipse(ballX, ballY, 20, 20);
  
  //CONTROLS MOVEMENT OF THE BALL
  //Negating dX/dY makes the ball go in the opposite direction, making it bounce realistically
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
 
class paddle { 
  float ypos, xpos; 
  boolean Cgoingdown;
  paddle (float x, float y, boolean down) {  
    ypos = y; 
    xpos = x;
    Cgoingdown = down;
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
