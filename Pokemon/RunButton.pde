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
