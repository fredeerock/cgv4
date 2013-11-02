String[] cList;
int[] companyValues;
String[] companyNames;
float[] companySizes;
int count;
Circle[] circles;
Circle myCircle = new Circle(200, 200, 25, color(255), "");
float biggest = 0;
float smallest = 0;
float mBiggest = 0;
float mSmallest = 0;
PFont f;
int fs = 12;
boolean rs = false;
boolean showName = false;
boolean showNameR = false;
String Name = "";

void setup() {
  size(screenWidth, screenHeight);
  textMode(SCREEN);
  textAlign(CENTER);
  noStroke();
  noCursor();
  cList = loadStrings("list.php");
  count = cList.length;
  f = createFont("Flamenco", fs);
  textFont(f);
  circles = new Circle[count/2];
  companyValues = new int[count/2];
  companyNames = new String[count/2]; 
  companySizes = new float[count/2]; 

  int vi = 0;
  int vn = 0;

  for (int i = 0; i < cList.length; i++) {    

    if (i%2==1) {
      companyValues[vi++] = int(cList[i]);
    }

    if (i%2==0) {
      companyNames[vn++] = cList[i];
    }
  }

  biggest = max(companyValues);
  smallest = min(companyValues);

  for (int i = 0; i < companyValues.length; i++) {
    companySizes[i] = map(companyValues[i], smallest, biggest, width/100, width/3);

    circles[i] = new Circle(random(width), (companySizes[i]*-2)-random(height), companySizes[i], color(255), companyNames[i]);

    if (myCircle.r > companySizes[i]) {
      circles[i].c = color(0, 255, 0, 128);
    } 

    if (myCircle.r < companySizes[i]) {
      circles[i].c = color(255, 0, 0, 128);
    }
  }

  mBiggest = max(companySizes);
  mSmallest = min(companySizes);

  //  println(width);
  //  println(height);
  //  println(companyValues);
  //  println(smallest);
  //  println(biggest);
  //  println(companySizes);
  //  println(mSmallest);
  //  println("mB "+ mBiggest);
}

void draw() {

  background(25);
  myCircle.x = mouseX;
  myCircle.y = mouseY;

  if (myCircle.r < 25) {
    myCircle.r = 25;
  }

  myCircle.render();

  for (int i = 0; i < companySizes.length; i++) {
    float s = (map(companySizes[i], mSmallest, mBiggest, mBiggest, mSmallest))/50;

    if (s < 1) {
      s = 1;
    } 

    if (s > 20) {
      s = 20;
    }

    circles[i].y = circles[i].y + s;

    if (circles[i].y/2>height) {
      circles[i].y=companySizes[i]*-3;
    }

    if (dist(myCircle.x, myCircle.y, circles[i].x, circles[i].y) < myCircle.r + circles[i].r) {
      circles[i].y=(companySizes[i]*-2)-random(height);
      circles[i].x=random(width);

      if (myCircle.r > companySizes[i]) {
        myCircle.r = myCircle.r + companySizes[i]/5;
        showName = true;
        showNameR = false;
        Name = companyNames[i];
      } 

      if (myCircle.r < companySizes[i]) {
        myCircle.r = myCircle.r - companySizes[i]/5;
        showNameR = true;
        showName = false;
        Name = companyNames[i];
      }
    }

    if (myCircle.r > companySizes[i]) {
      circles[i].c = color(0, 255, 0, 128);
    } 

    if (myCircle.r < companySizes[i]) {
      circles[i].c = color(255, 0, 0, 128);
    }

    circles[i].render();
  }

  if (keyPressed) {
    if (key == 'p') {
      myCircle.r = 500;
    }
  }

  fill(255);
  rect(0, 0, width, (myCircle.r*1.8)+4);
  fill(0);
  rect(0, 0, width, myCircle.r*1.8);

  if (showName) {
    fill(0, 255, 0);
    textFont(f, 38);
    text(Name, width/1.1, height-(height/1.04));
  }

  if (showNameR) {
    fill(255, 0, 0);
    textFont(f, 38);
    text(Name, width/1.1, height-(height/1.04));
  }


  if (myCircle.r > width*6 && mousePressed) {
    rs = false;
    myCircle.r = 25;
  }

  if (myCircle.r > width*6) {
    rs = true;
  }

  if (rs) {
    fill(0);
    rect(0, 0, width, height);
    fill(255);
    textFont(f, 24);
    text("Tap to play again.", width/2, height/2);
  }
}

class Circle {

  float x;
  float y;
  float r;
  color c;
  String cName;

  Circle(float tx, float ty, float tr, color tc, String tcName) {
    x = tx;
    y = ty;
    r = tr;
    c = tc;
    cName = tcName;
  }

  void render() {
    fill(c);
    ellipse(x, y, r*2, r*2);
    fill(255, 128);
    textSize(map(r, smallest, biggest, 4, 170));
    text(cName, x, y);
  }
}
