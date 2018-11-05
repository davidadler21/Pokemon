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
