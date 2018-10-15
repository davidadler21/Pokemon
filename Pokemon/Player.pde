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
    if (upKey == true) {
      if (keyPressed == true) {
        if (keyCode == UP && !menu) {
          y+=2;
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
        } else {
          image(tsu, 250, 250, 375, 250);
        }
      } else {
        image(tsu, 250, 250, 375, 250);
      }
    } else if (downKey == true) {
      if (keyPressed == true) {
        if (keyCode == DOWN && !menu) {
          y-=2;
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
      }
    } else if (leftKey == true) {
      if (keyPressed == true) {
        if (keyCode == LEFT && !menu) {
          x+=2;
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
      }
    } else {
      if (keyPressed == true) {
        if (keyCode == RIGHT && !menu) {
          x-=2;
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
      }
    }
    this.keyCoded();
  }


  public void keyCoded() {
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
