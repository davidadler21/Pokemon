//There is too much mixing of both our codes in here for us to differentiate so it can be acredited to both of us.
int listValueNum = 0;
int activeButtons = 0;
int totalTime;
int microTime;
int lagB = 0;

Start startButton;
TrymButton tb;
Player trym;
Background b;
// Drib a;
PokemonSight wildEnc;
PokemonButton enterP;
BagButton enterBag;
FightButton fightB;
RunButton runB;
GrowlButton growl;
TackleButton tackle;
EnergyBallButton energyBall;
PotionButton potionB;
PokeballButton pokeBB;
CloseBagButton closeBag;
Davangemon randomWild;
Potion hpBoost;
EnemyPlayer enemy1;


PImage tsd;
PImage m;
PImage SF;
PImage battleScene;
PImage battleThing;
PImage box;
PImage pokeball;
PImage bagImg;

ArrayList <Davangemon> capturedPok;
ArrayList <PokeButton> pokemonStatus;

void setup() {
  size(500, 500);
  startButton = new Start("Start Game", 200, 200);
  tb = new TrymButton("Trym", 200, 200);
  tsd = loadImage("TSD.png");
  trym = new Player();
  b = new Background();
  wildEnc = new PokemonSight();
  // a =  new Drib();
  enterP = new PokemonButton("Pokemon", 380, 40);
  fightB = new FightButton("Fight", 290, 390);
  runB = new RunButton("Run", 410, 450);
  growl = new GrowlButton("Growl", 50, 390);
  tackle = new TackleButton("Tackle", 380, 390);
  energyBall = new EnergyBallButton("EnergyBall", 50, 450);
  enterBag = new BagButton("Bag", 380, 80);
  potionB = new PotionButton("Potion", 250, 150);
  pokeBB =  new PokeballButton("Pokeball", 250, 100);
  closeBag = new CloseBagButton("Close Bag", 250, 450);
  hpBoost = new Potion();
  enemy1 = new EnemyPlayer();
  // move4 = new FightButton("Fight", 380, 40);
  m = loadImage("menu.png");
  SF = loadImage("shaymin.png");
  battleScene = loadImage("BattleGroundGrass.png");
  box = loadImage("Box.png");
  pokeball = loadImage("pokeball.png");
  bagImg = loadImage("Bag.png");
  battleThing = loadImage("BattleThing.png");
  capturedPok = new ArrayList <Davangemon>();
  capturedPok.add (new Shaymin());
  pokemonStatus = new ArrayList <PokeButton>();
  pokemonStatus.add (new PokeButton(capturedPok.get(0).name, 120));
}

void draw() {
  background(0);
  listValueNumRestrictions();
  startButton.display();
  tb.display();
  timingDevice();
  if (startButton.gameStarted && !wildEnc.inBattle && !enterP.myPokemon && !enterBag.myBag) {
    b.movement();
    trym.display();
    enemy1.display();
    b.grass();
    fightB.menuIsOpen = false;
    runB.menuIsOpen = false;
    enterP.menuIsOpen = false;
    enterBag.menuIsOpen = false;
  }

  else if(wildEnc.inBattle == true && !enterP.myPokemon) {
    image(battleScene, 0, 0);
    if(wildEnc.inBattle == true && microTime - wildEnc.lag + wildEnc.pokeballNum >= 263){
      for (int x = 0; x < capturedPok.size(); x++) {
        if (capturedPok.get(x).pokeOrder == 0) {
          capturedPok.get(x).display();
          runB.runX = x;
        }
        x = capturedPok.size();
      }
    }
    image(battleThing, 0, 350, 500, 145);
    wildEnc.pokeAppear();
    if (!fightB.fightMenu) {
      image(box, 250, 355, 250, 145);
      fightB.menuIsOpen = true;
      runB.menuIsOpen = true;
      enterP.menuIsOpen = true;
      enterBag.menuIsOpen = true;
      for (int x = 0; x < capturedPok.size(); x++) {
        if (capturedPok.get(x).pokeOrder == 0) {
          capturedPok.get(x).moves(false);
        }
        x = capturedPok.size();
      }
      fightB.display();
      runB.display();
      enterP.display();
      enterBag.display();
    }
    else if(fightB.fightMenu && !enterP.myPokemon){
      image(box, 0, 355, 500, 145);
      fightB.menuIsOpen = false;
      runB.menuIsOpen = false;
      enterP.menuIsOpen = false;
      enterBag.menuIsOpen = false;
      for (int x = 0; x < capturedPok.size(); x++) {
        if (capturedPok.get(x).pokeOrder == 0) {
          capturedPok.get(x).moves(true);
        }
        x = capturedPok.size();
      }
    }
  }
  if (!wildEnc.inBattle && startButton.gameStarted) {
    playerMenu();
  }
  if(enterBag.myBag == true){
      image(bagImg, 0, 0, 500, 500);
      potionB.display();
      pokeBB.display();
      closeBag.display();
      potionB.menuIsOpen = true;
      pokeBB.menuIsOpen = true;
      closeBag.menuIsOpen = true;
  }
  wildEnc.wildBattle();
  buttonCounting();
  enterP.pokeStatus();
  wildEnc.randoPoke();
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

void buttonCounting() {
  startButton.countActiveButtons();
  tb.countActiveButtons();
  enterP.countActiveButtons();
  fightB.countActiveButtons();
  runB.countActiveButtons();
  growl.countActiveButtons();
  tackle.countActiveButtons();
  energyBall.countActiveButtons();
  enterBag.countActiveButtons();
  potionB.countActiveButtons();
  pokeBB.countActiveButtons();
  closeBag.countActiveButtons();
  for (int x = 0; x < capturedPok.size(); x++) {
    pokemonStatus.get(x).countActiveButtons();
  }
}
