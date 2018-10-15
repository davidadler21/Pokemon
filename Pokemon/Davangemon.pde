public abstract class Davangemon {
  int xP = 0;
  int GR;
  int atk;
  int speed;
  int def;
  int SPA;
  int SPD;
  int HP;
  int atkGR;
  int speedGR;
  int defGR;
  int SPAGR;
  int SPDGR;
  int HPGR;
  int MHP;
  int level;
  int evasion;
  int evolLevel;
  int partyNum;
  String name;
  
  public void setStats(int atkB, int speedB, int defB, int SPAB, int SPDB, int HPB) {
    atk = atkB + level*atkGR;
    speed = speedB + level*speedGR;
    def = defB + level*defGR;
    SPA = SPAB + level*SPAGR;
    SPD = SPDB + level*SPDGR;
    MHP = HPB + level*HPGR;
  }
  
  public abstract void display();

  public void levelUP() {
    if (xP > 20 + level*GR) {
      level++;
      xP = xP - 20 + level*GR;
    }
  }

  public abstract void moves();

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
