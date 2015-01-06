void update() {

};

void setup() {
  size(1000, 700);
  background(0);
  rect(10,10,15,100);
  rect(974,10,15,100);
  rect(500,0,10,700);
  int x = 0;
  String s = str(x); 
  x = x + 1;
  s = str(x);
  textSize(32);
  text(s, 450, 50);
  textSize(32);
  text(s, 535,50);
};

paddle h1 = new paddle(10,10);
  paddle h2 = new paddle(974,10);
  
void setup() {
  size(1000, 700);
  background(0);
  rect(500,0,10,700);
  int x = 0;
  String s = str(x); 
  x = x + 1;
  s = str(x);
  textSize(32);
  text(s, 450, 50);
  textSize(32);
  text(s, 535,50);
}

void draw() { 
  h1.update(); 
  h2.update();  
} 
 
class paddle { 
  float ypos, xpos; 
  paddle (float x, float y) {  
    ypos = y; 
    xpos = x;
  } 
  void update() { 
    //MAKE BOOLEAN TO DETERMINE WHETHER ITS GOING UP OR DOWN
    if (0 < ypos && ypos <= 300) {
      ypos = ypos + 1;
    } else if (ypos <= 299 && ypos > 0) {
      ypos = ypos - 1;
    }
    rect(xpos,ypos,15,100);
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

