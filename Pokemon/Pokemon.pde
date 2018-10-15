int listValueNum = 0;
int activeButtons = 0;
int totalTime;
int microTime;

Start startButton; 
Start test;
TrymButton tb;
Player trym;
Background b;
PokemonButton enterP;
BagButton enterBag;

PImage tsd;
PImage m;
PImage SF;

void setup() {
  size(500, 500);
  startButton = new Start("Start Game", 200, 200);
  tb = new TrymButton("Trym", 200, 200);
  tsd = loadImage("TSD.png");
  trym = new Player();
  b = new Background();
  enterP = new PokemonButton("Pokemon", 380, 40);
  m = loadImage("menu.png");
  enterBag = new BagButton("Bag", 380, 80);
  SF = loadImage("shaymin.png");
}

void draw() {
  background(0);
  listValueNumRestrictions();
  startButton.display();
  listValueNumRestrictions();
  tb.display();
  timingDevice();
  if (startButton.gameStarted) {
    if (!enterP.myPokemon) {
      b.movement();
      trym.display();
      b.grass();
    }
    playerMenu();
  }
}

void timingDevice() {
  totalTime = ((60*60*hour()) + (60*minute()) + second());
  microTime++;
}

void listValueNumRestrictions() {
  if (listValueNum < 0) {
    listValueNum++;
  } else if (listValueNum >= activeButtons) {
    listValueNum--;
  }
}
