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


