int listValueNum = 0;
int activeButtons = 0;
int totalTime;
int microTime;

Start startButton; 

void setup() {
  size(500, 500);
  startButton = new Start(0, "Start Game", 30, 30);
}

void draw() {
  background(0);
  startButton.display();
  startButton.ifClicked();
  timingDevice();
  listValueNumRestrictions();
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