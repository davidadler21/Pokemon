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
