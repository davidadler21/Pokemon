int listValueNum = 0;
int activeButtons = 0;
int totalTime;
int microTime;

Start startButton; 
Start test;
TrymButton tb;
Player trym;
Background b;

PImage tsd;

void setup() {
  size(500, 500);
  startButton = new Start("Start Game", 200, 200);
  tb = new TrymButton("Trym", 200, 200);
  tsd = loadImage("TSD.png");
  trym = new Player();
  b = new Background();
}

void draw() {
  background(0);
  listValueNumRestrictions();
  startButton.display();
  listValueNumRestrictions();
  tb.display();
  timingDevice();
  if (startButton.gameStarted) {
    b.movement();
    trym.display();
  }
}

void timingDevice() {
  totalTime = ((60*60*hour()) + (60*minute()) + second());
  microTime++;
}

void listValueNumRestrictions() {
  if (listValueNum < 0) {
    listValueNum++;
  }
  else if (listValueNum >= activeButtons) {
    listValueNum--;
  }
}
