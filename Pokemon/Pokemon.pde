int listValueNum = 0;
int activeButtons = 0;
int totalTime;
int microTime;

Start startButton; 
TrymButton tb;

void setup() {
  size(500, 500);
  startButton = new Start("Start Game", 200, 200);
  tb = new TrymButton("Trym", 200, 200);
}

void draw() {
  background(0);
  startButton.display();
  tb.display();
  timingDevice();
  listValueNumRestrictions();
  if (startButton.gameStarted) {
    
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
  else if (listValueNum > activeButtons) {
    listValueNum--;
  }
}
