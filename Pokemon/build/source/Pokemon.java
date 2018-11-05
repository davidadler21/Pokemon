import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Pokemon extends PApplet {

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

public void setup() {
  
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

public void draw() {
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

public void timingDevice() {
  totalTime = ((60*60*hour()) + (60*minute()) + second());
  microTime++;
}

public void listValueNumRestrictions() {
  if (listValueNum < 0) {
    listValueNum++;
  }
  else if (listValueNum >= activeButtons) {
    listValueNum--;
  }
}

public void buttonCounting() {
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
public interface Attack {
  public void statusEffect (Davangemon enemyPokemon);
}
//The background was made by David. He made the art and wrote all the code for it.
public class Background {
  int grassX = trym.x-20;
  int grassY = trym.y-20;

  PImage ground;
  PImage tree;
  PImage trees;
  PImage pond;
  PImage grass;

  Background() {
    ground = loadImage("grassB.PNG");
    tree = loadImage("tree.png");
    trees = loadImage("trees.PNG");
    pond = loadImage("pond.PNG");
    grass = loadImage("tallGrass.png");
  }

  public void movement() {
    image(ground, trym.x, trym.y);
    pond();
    trees();
  }

  public void grass() {
    image(grass, trym.x+450, trym.y+450, 200, 100);
  }

  public void pond() {
//The ponds have restrictions which stop the player from going through them.
    image(pond, trym.x+430, trym.y+590, 400, 400);
    if (trym.x+530 < 250 && trym.y+590 < 250) {
      if (keyCode == RIGHT) {
        trym.x+=2;
        } else if (keyCode == DOWN) {
          trym.y+=2;
        }
      }

      image(pond, trym.x, trym.y+100, 400, 400);
      if (trym.x+340 > 250 && trym.y+350 > 250) {
        if (keyCode == LEFT) {
          trym.x-=2;
          } else {
            trym.y-=2;
          }
        }
      }

      public void trees() {
//The trees are generated in 4 different patches which makes up the border of the map.
//Each patch is comprised of 4 tree patch images.
//There are also restriction on the players movement for the border of the tree patches.
        for (int i = 0; i<4; i++) {
          image(trees, trym.x + i*252, trym.y);
        }
        if (trym.y+230 > 250) {
          trym.y-=2;
        }
        for (int i = 0; i<4; i++) {
          image(trees, trym.x, trym.y + 200*i);
        }
        if (trym.x+252 > 250) {
          trym.x-=2;
        }
        for (int i = 0; i<4; i++) {
          image(trees, trym.x+756, trym.y + 200*i);
        }
        if (trym.x+725 < 250) {
          trym.x+=2;
        }
        for (int i = 0; i<4; i++) {
          image(trees, trym.x + i*252, trym.y+800);
        }
        if (trym.y+760 < 250) {
          trym.y+=2;
        }
      }
    }
//This button was made by David.
public class BagButton extends Button {
  boolean myBag = false;

  BagButton(String Name, int xx, int xy) {
    x = xx;
    y = xy;
    name = Name;
    this.listValue = 1;
  }

  public void display() {
    super.display();
    if (wildEnc.inBattle == true) {
      this.listValue = 2;
      size = 24;
      x = 300;
      y = 450;
    }
    else {
      this.listValue = 1;
      size = 12;
      x = 380;
      y = 80;
    }
  }

  public void ifClicked() {
    if (keyPressed) {
      if (isSelected && key == 'a') {
        myBag = true;
        menu = false;
      }
    }
  }
}
// public class Battle{
// Boolean inBattle;
//
//
// public void display(){
// battle();
//
// }
//
//
//
// public void battle(){
//   if(inBattle == true){
//   image
//
//   }
// }
//
//
// }
//The Superclass Button was made by David so we could have an easier time creating other buttons.
public abstract class Button {
  boolean isSelected;
  boolean clicked;
  boolean menuIsOpen;
  int listValue = 0;
  int x;
  int y;
  String name;
  int lag = 0;
  int size = 12;
  boolean isActive = false;

  Button() {

  }

  public void display() {
    if (menuIsOpen) {
      this.ifClicked();
      fill(150);
      textSize(size);
      text(name, x, y+5);
      if (isSelected) {
        if (microTime > lag+50) {
          triangle(x-7, y, x-17, y+5, x-17, y-5);
          lag = microTime;
        }
        else {
          triangle(x-10, y, x-20, y+5, x-20, y-5);
        }
      }
      if (listValue == 0) {
        this.listChange();
      }
    }
    this.isSelected();
    this.countActiveButtons();
  }

  public abstract void ifClicked();

  public void listChange() {
    if (menuIsOpen) {
      if (keyPressed && microTime-lagB > 5) {
        lagB = microTime;
        if (keyCode == UP) {
          listValueNum--;
        }
        else if (keyCode == DOWN) {
          listValueNum++;
        }
      }
    }
  }

  public void isSelected() {
    if (menuIsOpen) {
      if (listValueNum == listValue) {
        isSelected = true;
      }
      else {
        isSelected = false;
      }
    }
    // else {
    //   this.listValue = activeButtons-1;
    // }
  }

  public void countActiveButtons() {
    if(menuIsOpen && !isActive) {
      activeButtons++;
      //this.listValue = activeButtons-1;
      isActive = true;
    }
    else if (!menuIsOpen && isActive) {
      activeButtons--;
      isActive = false;
    }
  }
}
//Trym made this subclass.
public class CloseBagButton extends Button{

  CloseBagButton(String Name, int xx, int xy){
    x = xx;
    y = xy;
    name = Name;
    this.listValue = 2;
    size = 24;
  }

  public void display() {
    super.display();

  }

  public void ifClicked() {
//There are two ways of closing the bag, or the bagMenu. There is selecting the closeBag button and pressing a and there is just pressing s.
    if (keyPressed) {
      if (isSelected && key == 'a' && microTime-lagB > 5) {
        lagB = microTime;
        enterBag.myBag = false;
      }
      else if(key == 's'){
        enterBag.myBag = false;
      }
    }
  }
}
//This class was worked on and edited by both of us.
public abstract class Davangemon {
  int xP = 0;
  int GR = 1;
  int atk;
  int speed;
  int def;
  int HP;
  int atkGR = 1;
  int speedGR = 1;
  int defGR = 1;
  int HPGR = 1;
  int MHP;
  int level;
  int evolLevel;
  int partyNum;
  int pokeOrder = 0;
  String name;
  String type;
//Takes the base stats of a given pokemon and returns its current stats based on level and its rate of change.
  public void setStats(int atkB, int speedB, int defB, int HPB) {
    atk = atkB + level*atkGR;
    speed = speedB + level*speedGR;
    def = defB + level*defGR;
    MHP = HPB + level*HPGR;
  }

  public abstract void display();

  public void levelUP() {
    if (xP > 20 + level*GR) {
      level++;
      xP = xP - 20 + level*GR;
    }
  }

  public abstract void moves(boolean a);

  public abstract void moveLearn();

  public abstract void evolution();
}

//public int getxP() {
//  return xP;
//}

//public abstract int setxP();

//public int getaTTK() {
//  return aTTK;
//}

//public void setaTTK(int attackValue) {
//  aTTK = attackValue;
//}

//public int getspeed() {
//  return speed;
//}

//public void setspeed(int speedValue) {
//  speed = speedValue;
//}

//public int getdef() {
//  return def;
//}

//public void setdef(int defValue) {
//  def = defValue;
//}

//public int getSPA() {
//  return SPA;
//}

//public void setSPA(int SPAValue) {
//  SPA = SPAValue;
//}

//public int getSPD() {
//  return SPD;
//}

//public void setSPD(int SPDValue) {
//  SPD = SPDValue;
//}

//public int getMHP() {
//  return MHP;
//}

//public void setMHP(int MHPValue) {
//  MHP = MHPValue;
//}

//public int getlevel() {
//  return level;
//}

//public void setlevel(int levelValue) {
//  level = levelValue;
//}

//public int getevasion() {
//  return evasion;
//}

//public void setevasion(int evasionValue) {
//  evasion = evasionValue;
//}

//public int getHP() {
//  return HP;
//}

//public void setHP(int HPValue) {
//  HP = HPValue;
//}

//public int getevolLevel() {
//  return evolLevel;
//}

//public void setevolLevel(int evolLevelValue) {
//  evolLevel = evolLevelValue;
//}

//public void pokeName(String pokeName) {
//  name = pokeName;
//}

//public String getName() {
//  return name;
//}
//This was worked on by both of us.
public class Drib extends Davangemon {
  private int baseA, baseS, baseD, baseSPA, baseSPD, baseHP;
  PImage dribBattle;

  Drib(int Level, int a, int s, int d, int hp) {
    baseA = a;
    baseS = s;
    baseD = d;
    baseHP = hp;
    Level = level;
    atkGR = 2;
    speedGR = 3;
    defGR = 2;
    type = "Flying";
  }
  Drib(int Level) {
    //dribBattle = loadImage(Drib.PNG);
    //Since drib, will be a pokemon that a player randomly encounters.  There needs to be random stats attributed to it. That is what this does.
    baseA = (int) (Math.random()*11+5);
    baseS = (int) (Math.random()*11+5);
    baseD = (int) (Math.random()*11+5);
    baseHP = (int) (Math.random()*11+5);
    Level = level;
    atkGR = 2;
    speedGR = 3;
    defGR = 2;
    type = "Flying";
  }
//The display is for pokemons that your player has.
  public void display(){
    // dribBattle = loadImage(Drib.PNG);
    // image(dribBattle, )
    setStats(baseA, baseS, baseD, baseHP);
  }
//While the wildDisplay, is for the pokemons that either are wild or are from an NPC.
  public void wildDisplay(){
    // dribBattle = loadImage(Drib.PNG);
    // image(dribBattle, 100, 100, 100, 100);
    image(SF, 250, 60, 200, 200);
    setStats(baseA, baseS, baseD, baseHP);

  }

  public void moves(boolean a){
  }

  public void moveLearn(){
  }

  public void evolution(){
  }
}
//This was made by both of us.
public class EnemyPlayer {
int enemyY = 20;

boolean ivii = false;
boolean walk = false;
boolean playerMove = false;
boolean playBattle = false;
boolean encountered = false;



PImage leftStep;
PImage rightStep;
PImage standing;

EnemyPlayer(){
  standing = loadImage("DSNPC1.png");
  leftStep = loadImage("DSWRNPC1.png");
  rightStep = loadImage("DWLNPC1.png");

}

public void display(){
  engageBattle();
}

public void engageBattle(){
//If the coordinates we made for our player are in line with the coordinate under the NPC, then the first that will  happen will be the NPC will start moving.
  if(trym.x <= -465 && trym.y <= 10 && trym.y >= -340 && enemyY + trym.y + 210 <= 210 && walk == false && !playBattle){
    enemyY += 2;
    playerMove = true;
//There are two images for walking therefore we made it alternate through a boolean system.
    if (enemyY % 15 == 0 && !ivii) {
      ivii = true;
    }
    else if (enemyY % 15 == 0 && ivii) {
      ivii = false;
    }
    if (ivii) {
      image(leftStep, trym.x + 720, enemyY + trym.y + 210, 30, 30);
    }
    else {
      image(rightStep, trym.x + 720, enemyY + trym.y + 210, 30, 30);
    }
    if(enemyY + trym.y + 210 == 210){
      walk = true;
      playerMove = true;
    }
  }
//Here if the NPC has walked all the way to the  player, then a battle will ensue.
//The NPC will also stop when a certain distance from the player's coordinates. 
  else if (enemyY > 0 && enemyY + trym.y + 210 <= 210  && walk == true && !playBattle) {
      image(standing, trym.x + 720, enemyY + trym.y + 210, 30, 30);
      playBattle = true;
      wildEnc.lag = microTime;
      wildEnc.inBattle = false;
    }
//Additionally, the NPC will be standing in the corner when it hasn't been "provoked."
  else {
      image(standing, trym.x + 720, enemyY + trym.y + 210, 30, 30);
      playerMove = false;
  }


  }
}
//This was made by Trym and David
public class EnergyBallButton extends Button implements Comparable, Attack {
  String type = "Grass";

  EnergyBallButton(String Name, int xx, int xy) {
    x = xx;
    y = xy;
    name = Name;
    this.listValue = 2;
    size = 24;
  }

  public void display(){
    super.display();
    if (keyPressed) {
      if (key == 's' && menuIsOpen) {
        lagB = microTime;
        fightB.fightMenu = false;
      }
    }
  }

  public void ifClicked() {
    if (keyPressed) {
      if (isSelected && key == 'a' && microTime-lagB > 5) {
        lagB = microTime;
      }
    }
  }

  public void statusEffect(Davangemon a) {
    // add implimentation later
  }

  public int compareTo(Object a) {
    // checks type effectiveness and will later deal damage accordingly
    if (type == ((Davangemon) a).type || ((Davangemon) a).type == "Flying" || ((Davangemon) a).type == "Fire") {
      return -1;
    }
    else if (((Davangemon) a).type == "Water" || ((Davangemon) a).type == "Ground" || ((Davangemon) a).type == "Rock") {
      return 1;
    }
    else {
      return 0;
    }
  }
}
//This was made by David.
public class FightButton extends Button {
  boolean fightMenu;

  FightButton(String Name, int xx, int xy) {
    x = xx;
    y = xy;
    name = Name;
    size = 24;
  }

  public void ifClicked() {
//If the fight button is both selected and a is pressed, then the boolean fightMenu will become true which will be used to close the option menu and open a seperate menu with moves.
    if (keyPressed) {
      if (isSelected && key == 'a' && microTime-lagB > 5) {
        lagB = microTime;
        fightMenu = true;
      }
    }
  }
}
//This was made by Trym.
public class GrowlButton extends Button implements Attack {

  GrowlButton(String Name, int xx, int xy) {
    x = xx;
    y = xy;
    name = Name;
    this.listValue = 0;
    size = 24;
  }

  public void display(){
    super.display();


  }

  public void ifClicked() {
    if (keyPressed) {
      if (isSelected && key == 'a' && microTime-lag > 5) {
        lag = microTime;
      }
    }
  }

  public void statusEffect(Davangemon a) {
    // add implimentation later
  }
}
//This was originally made by Trym, but we heavily edited it together. Therefore, the credit has to go to both of us.
public class Player {
  PImage tsl;
  PImage tsr;
  PImage tsu;
  PImage twd1;
  PImage twl1;
  PImage twr1;
  PImage twu1;
  PImage twd2;
  PImage twl2;
  PImage twr2;
  PImage twu2;

  boolean upKey = false;
  boolean downKey = false;
  boolean rightKey = false;
  boolean leftKey = false;
  boolean ivii = false;
  boolean move = false;

  int x = -100;
  int y = -100;

  Player() {
    tsl = loadImage("TSL.png");
    tsr = loadImage("TSR.png");
    tsu = loadImage("TSU.png");
    twd1 = loadImage("TWD1.png");
    twl1 = loadImage("TWL1.png");
    twr1 = loadImage("TWR1.png");
    twu1 = loadImage("TWU1.png");
    twd2 = loadImage("TWD2.png");
    twl2 = loadImage("TWL2.png");
    twr2 = loadImage("TWR2.png");
    twu2 = loadImage("TWU2.png");
  }

  public void display() {
//This is a system which is best understood by reading the keyCoded method first.
//The true or false system in keyCoded comes into play when determining both the direction the player is heading and the positioning of the image for the player.
    if (upKey == true) {
//There have been put restrictions on movement based on whether a certain scenario has been met or not.
      if (keyPressed == true && !menu && !wildEnc.wildEncounter && enemy1.playerMove == false) {
//The player never moves from the middle of the screen; however, we created coordinates for the player that effects everything on the map.
        if (keyCode == UP) {
          y+=2;
          move = true;
//This modulus system determines which foot in the players picture should be first.
          if (y % 15 == 0 && !ivii) {
            ivii = true;
            } else if (y % 15 == 0 && ivii) {
              ivii = false;
            }
            if (ivii) {
              image(twu1, 250, 250, 375, 250);
              } else {
                image(twu2, 250, 250, 375, 250);
              }
            }
//If the player is not moving, then an image of the player standing is displayed.
            else {
              image(tsu, 250, 250, 375, 250);
            }
          }
          else {
            image(tsu, 250, 250, 375, 250);
            move = false;
          }
//This is the same for all of the other directions.
        }
        else if (downKey == true) {
          if (keyPressed == true && !menu && !wildEnc.wildEncounter && enemy1.playerMove == false) {
            if (keyCode == DOWN) {
              y-=2;
              move = true;
              if (y % 15 == 0 && !ivii) {
                ivii = true;
                } else if (y % 15 == 0 && ivii) {
                  ivii = false;
                }
                if (ivii) {
                  image(twd1, 250, 250, 375, 250);
                  } else {
                    image(twd2, 250, 250, 375, 250);
                  }
                  } else {
                    image(tsd, 250, 250, 375, 250);

                  }
                  } else {
                    image(tsd, 250, 250, 375, 250);
                    move = false;
                  }
                }
                else if (leftKey == true) {
                  if (keyPressed == true && !menu && !wildEnc.wildEncounter && enemy1.playerMove == false) {
                    if (keyCode == LEFT) {
                      x+=2;
                      move = true;
                      if (x % 15 == 0 && !ivii) {
                        ivii = true;
                        } else if (x % 15 == 0 & ivii) {
                          ivii = false;
                        }
                        if (ivii) {
                          image(twl1, 250, 250, 375, 250);
                          } else {
                            image(twl2, 250, 250, 375, 250);
                          }
                          } else {
                            image(tsl, 250, 250, 375, 250);
                          }
                          } else {
                            image(tsl, 250, 250, 375, 250);
                            move = false;
                          }
                        }
                        else {
                          if (keyPressed == true && !menu && !wildEnc.wildEncounter && enemy1.playerMove == false) {
                            if (keyCode == RIGHT) {
                              x-=2;
                              move = true;
                              if (x % 15 == 0 && !ivii) {
                                ivii = true;
                                } else if (x % 15 == 0 & ivii) {
                                  ivii = false;
                                }
                                if (ivii) {
                                  image(twr1, 250, 250, 375, 250);
                                  } else {
                                    image(twr2, 250, 250, 375, 250);
                                  }
                                  } else {
                                    image(tsr, 250, 250, 375, 250);
                                  }
                                  } else {
                                    image(tsr, 250, 250, 375, 250);
                                    move = false;
                                  }
                                }
                                this.keyCoded();
                              }


                              public void keyCoded() {
//This method determines which button has been pressed last and makes it so only one of the buttons can be true out of the four directions.
                                if (keyCode == UP) {
                                  upKey = true;
                                  downKey = false;
                                  rightKey = false;
                                  leftKey = false;
                                  } else if (keyCode == DOWN) {
                                    upKey = false;
                                    downKey = true;
                                    rightKey = false;
                                    leftKey = false;
                                    } else if (keyCode == RIGHT) {
                                      upKey = false;
                                      downKey = false;
                                      rightKey = true;
                                      leftKey = false;
                                      } else if (keyCode == LEFT) {
                                        upKey = false;
                                        downKey = false;
                                        rightKey = false;
                                        leftKey = true;
                                      }
                                    }
                                  }
//This was made by David.
public class PokeButton extends Button {

  PokeButton(String Name, int xy) {
    y = xy;
    name = Name;
  }

  public void display() {
    super.display();
    x = 120;
  }

  public void ifClicked() {
  }
}
//This was made by Trym.
public class PokeballButton extends Button{

  PokeballButton(String Name, int xx, int xy){
    x = xx;
    y = xy;
    name = Name;
    this.listValue = 0;
    size = 24;
  }

  public void display() {
    super.display();

  }

  public void ifClicked() {
    if (keyPressed) {
      if (isSelected && key == 'a' && microTime-lagB > 5) {
        lagB = microTime;
      }
    }
  }


}
//This was made by David.
public class PokemonButton extends Button {
  //PokeButton shaymin;

  boolean myPokemon = false;

  PokemonButton(String Name, int xx, int xy) {
    //shaymin = new PokeButton("Shaymin", 110);
    x = xx;
    y = xy;
    name = Name;
  }

  public void display() {
    super.display();
    if (wildEnc.inBattle) {
      this.listValue = 1;
      size = 24;
      x = 380;
      y = 390;
    }
    else {
      this.listValue = 0;
      size = 12;
      x = 380;
      y = 40;
    }
  }

  public void ifClicked() {
    if (keyPressed) {
      if (isSelected && key == 'a') {
        myPokemon = true;
        menu = false;
      }
    }
    pokeStatus();
  }

  public void pokeStatus() {
    if (myPokemon) {
      listValueNum = 0;
      if (key == 's' && enterP.myPokemon) {
        enterP.myPokemon = false;
        for (int x = 0; x < capturedPok.size(); x++) {
          pokemonStatus.add (new PokeButton(capturedPok.get(x).name, 120+x*20));
          pokemonStatus.get(x).menuIsOpen = false;
        }
        if (!wildEnc.inBattle) {
          activeButtons = 0;
        }
      }
      for (int x = 0; x < capturedPok.size(); x++) {
        pokemonStatus.add (new PokeButton(capturedPok.get(x).name, 120+x*20));
        pokemonStatus.get(x).menuIsOpen = true;
        pokemonStatus.get(x).display();
      }
    }
  }
}
//This was made by both because there are components throughout made by both of us.
public class PokemonSight{
  boolean wildEncounter = false;
  boolean inBattle = false;
  int randoNum =  (int) (Math.random() * 99);
  int lag = 0;
  int pokeballNum;
  int randomNum = 2;

  PokemonSight(){

  }

  public void wildBattle(){
//This method provides the chance of running into a pokemon when within the patch of grass.
//Additionally, there is a random chance of actually encountering it.
    randoNum =  (int) (Math.random() * 99);
    if(trym.x <= -190 && trym.y <= -190 && trym.x >= -385 && trym.y >= -275 && randoNum == 50 && trym.move == true){
      wildEncounter = true;
      lag = microTime;
    }
//If the conditions for meeting a pokemon has been met and a pokemon has been encountered, then the sequence screen before battle shows up.
    if (wildEncounter && !inBattle) {
      fill(0);
//The screen consists of rectangles moving through for loops across the screen. Until it reaches the middle, in which the battle starts.
      for(int x = 0; x < 26; x++) {
        for(int y = 0; y < 26; y++) {
          if (lag+x+y == microTime) {
            for (int i = 0; i < 26; i++) {
              rect(20*x - 20*i, 20*y, 20, 20);
              rect(500 - 20*x, 500 - 20*y + 20*i, 20, 20);
              rect(500 - 20*x + 20*i, 20*y, 20, 20);
              rect(20*x - 20*i, 500 - 20*y, 20, 20);
              if (x == 25) {
                inBattle = true;
              }
            }
          }
        }
      }
    }
    if (enemy1.playBattle && !inBattle) {
      fill(0);
      for(int x = 0; x < 26; x++) {
        for(int y = 0; y < 26; y++) {
          if (lag+x+y == microTime) {
            for (int i = 0; i < 26; i++) {
              rect(20*x - 20*i, 20*y, 20, 20);
              rect(500 - 20*x, 500 - 20*y + 20*i, 20, 20);
              rect(500 - 20*x + 20*i, 20*y, 20, 20);
              rect(20*x - 20*i, 500 - 20*y, 20, 20);
              if (x == 25) {
                inBattle = true;
              }
            }
          }
        }
      }
    }
  }

  public void randoPoke () {
//If a pokemon is encountered in the wild, then there is a random chance system for what it is going to be.
    if (wildEnc.wildEncounter && wildEnc.inBattle == true && !enterP.myPokemon && enterBag.myBag == false) {
      if(randomNum == 2){
      randomNum = (int) (Math.random() * 2);
    }
//So that the initialized random pokemon is not constantly initialized, a system where the random number is only  accessed once was created.
      if(randomNum == 0){
        randomWild = new Shaymin();
//Initialization of random pokemon.
        ((Shaymin)randomWild).wildDisplay();

      }

      else if(randomNum == 1){
//Initialization of random pokemon.
        randomWild = new Drib((int) random(7, 15));
          ((Drib)randomWild).wildDisplay();

      }
    }
    if (!wildEnc.wildEncounter) {
      randomNum = 2;
    }
  }

//Additionally, it was made so that a pokeBall image would spiral from the left of the screen when a battle started.
  public void pokeAppear() {
    for(pokeballNum = 0; pokeballNum < 130; pokeballNum++) {
      if (lag+pokeballNum == microTime) {
      pushMatrix();
      translate(-10+pokeballNum, 200+ pokeballNum);
      rotate(pokeballNum/2);
      image(pokeball, -10, -10, 20, 20);
      popMatrix();
    }
    }
  }

  // public void personBattle(){
  //
  //       }
  //     }
  //
  //   }
  //
  //
  //   }
}
//This was made by Trym.
public class Potion {


Potion(){
//This takes the boolean which tell whether the button corresponding to potion has beenn pressed and how much it will restore of health.
//If the amount of health is ten less than the max health, then the hp is given 10+.
  if(potionB.potionUsed == true && capturedPok.get(runB.runX).MHP - capturedPok.get(runB.runX).HP >= 10){
    capturedPok.get(runB.runX).HP += 10;
  }
//If not, then it is given the amount away from the max.
  else if (potionB.potionUsed == true && capturedPok.get(runB.runX).MHP - capturedPok.get(runB.runX).HP < 10){
    capturedPok.get(runB.runX).HP += capturedPok.get(runB.runX).MHP - capturedPok.get(runB.runX).HP;
  }
}

}
//This was made by Trym.
public class PotionButton extends Button{
boolean potionUsed = false;

int potionAmt = 5;

  PotionButton(String Name, int xx, int xy){
    x = xx;
    y = xy;
    name = Name;
    this.listValue = 1;
    size = 24;
  }

  public void display() {
    super.display();

  }

  public void ifClicked() {
    if(potionAmt >= 1){
      if (keyPressed) {
        if (isSelected && key == 'a' && microTime-lagB > 5) {
          lagB = microTime;
          potionUsed = true;
        }
      }
    }
//There is also a system which takes away potions each time it is used.
  else{
    potionUsed = false;
  }
  if(potionB.potionUsed = true){
    potionAmt -= 1;
  }
}
}
//This was made by Trym.
//This interface determines whether a player can run from a battle or not.
public interface RunAble {

public void ableToRun (Davangemon enemyPokemon);

}
//This was made by the both of us.
public class RunButton extends Button {
  boolean runClicked = false;
  boolean canRun = false;

  int runX;
  int randomNumber;

  RunButton(String Name, int xx, int xy){
    x = xx;
    y = xy;
    name = Name;
    this.listValue = 3;
    size = 24;
  }

  public void display() {
    super.display();
    runSuccess();
  }

  public void ifClicked() {
    if (keyPressed) {
      if (isSelected && key == 'a') {
        runClicked = true;
      }
    }
  }

  public void runSuccess(){
//This method provides two instances of when clicking the run button. One is a succesful escape. The other is one where the player is unable to escape the battle.
    if (!runClicked) {
      randomNumber = 3;
    }
    else if (runClicked && randomNumber == 4 && canRun == false){
      wildEnc.inBattle = true;
    }
    else {
      wildEnc.inBattle = false;
      wildEnc.wildEncounter = false;
      runClicked = false;
    }
  }

//The void was used to determine if a player can escape by comparing the health of the wild pokemon to that of the player's pokemon.
  public void ableToRun(Davangemon randomWild){
    if(capturedPok.get(runX).HP >= randomWild.HP){
      canRun = true;
    }
  }

}
//This was originally made by David; however, we both heavily added on to it throughout the project.
public class Shaymin extends Davangemon{
  PImage SB;

  Shaymin() {
    name = "Shaymin";
    level = 5;
    GR = 2;
    setStats(12, 13, 10, 10);
    HP = MHP;
    SB = loadImage("shayminBack.png");
    type = "Grass";
  }
//One display for the player's pokemon.
  public void display() {
    setStats(12, 13, 10, 10);
    image(SB, 20, 120, 250, 250);
    text(name, 295, 270);
    textSize(18);
    text("Lv: " + level, 410, 270);
    text("HP: " + HP + "/" + MHP, 330, 300);
  }
//One display for the wild pokemon.
  public void wildDisplay() {
    setStats(12, 13, 10, 10);
    image(SF, 250, 60, 200, 200);
    text(name, 40, 80);
    textSize(18);
    text("Lv: " + level, 165, 80);
    text("HP: " + HP + "/" + MHP, 95, 100);

  }

  public void moves(boolean a) {
    growl.menuIsOpen = a;
    tackle.menuIsOpen = a;
    energyBall.menuIsOpen = a;
    growl.display();
    tackle.display();
    energyBall.display();
  }

  public void moveLearn() {
  }

  public void evolution() {
  }

}

//  public abstract void display();

//  public abstract void moves();

//  public abstract void moveLearn();

//  public abstract void evolution();
//This was made by David.
public class Start extends Button {
  boolean gameStarted = false;

  Start(String Name, int xx, int xy) {
    menuIsOpen = true;
    x = xx;
    y = xy;
    name = Name;
  }

  public void ifClicked() {
    if (keyPressed) {
      if (isSelected && key == 'a') {
        lagB = microTime;
        this.menuIsOpen = false;
        tb.menuIsOpen = true;
      }
    }
  }
}
//This was made by Trym and David
public class TackleButton extends Button implements Comparable, Attack {
  String type = "Normal";

  TackleButton(String Name, int xx, int xy) {
    x = xx;
    y = xy;
    name = Name;
    this.listValue = 1;
    size = 24;
  }

  public void display(){
    super.display();


  }

  public void ifClicked() {
    if (keyPressed) {
      if (isSelected && key == 'a' && microTime-lag > 5) {
        lag = microTime;
      }
    }
  }

  public void statusEffect(Davangemon a) {
    // add implimentation later
  }

  public int compareTo(Object a) {
    // checks type effectiveness and will later deal damage accordingly
    if (type == ((Davangemon) a).type || ((Davangemon) a).type == "Fighting") {
      return -1;
    }
    else if (((Davangemon) a).type == "Ghost") {
      return 0;
    }
    else {
      return 1;
    }
  }
}
//This was made by David.
public class TrymButton extends Button {
  boolean trymSelected;

  TrymButton(String Name, int xx, int xy) {
    x = xx;
    y = xy;
    name = Name;
  }

  public void display() {
    super.display();
    if (isSelected && menuIsOpen) {
      image(tsd, 200, 150, 375, 250);
    }
  }

  public void ifClicked() {
    if (keyPressed) {
      if (isSelected && key == 'a' && microTime-lagB > 5) {
        lagB = microTime;
        startButton.gameStarted = true;
        this.menuIsOpen = false;
      }
    }
  }
}
//This was made by David.
boolean menu = false;

public void playerMenu() {
  if (keyPressed) {
    if ((key == 'w' || key == 's') && microTime > enterP.lag+10) {
      if (!enterP.myPokemon) {
        enterP.lag = microTime;
        if (!menu && key == 'w') {
          menu = true;
        } else {
          menu = false;
        }
      }
    }
  }
  if (menu) {
    image(m, 330, 0, 200, 350);
    enterP.menuIsOpen = true;
    enterP.display();
    enterBag.menuIsOpen = true;
    enterBag.display();
  } else {
    enterP.menuIsOpen = false;
    enterBag.menuIsOpen = false;
  }
  enterP.pokeStatus();
}
  public void settings() {  size(500, 500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Pokemon" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
