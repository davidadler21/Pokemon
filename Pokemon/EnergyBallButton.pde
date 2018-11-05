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
