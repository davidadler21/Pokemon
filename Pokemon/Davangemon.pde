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
