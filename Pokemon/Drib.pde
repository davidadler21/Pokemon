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
