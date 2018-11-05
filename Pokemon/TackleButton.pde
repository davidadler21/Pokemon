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
