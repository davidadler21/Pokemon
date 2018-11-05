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
