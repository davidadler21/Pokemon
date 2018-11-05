//This button was made by David.
public class BagButton extends Button {
  boolean myBag = false;

  BagButton(String Name, int xx, int xy) {
    x = xx;
    y = xy;
    name = Name;
    this.listValue = 1;
  }

  public void display() {
    super.display();
    if (wildEnc.inBattle == true) {
      this.listValue = 2;
      size = 24;
      x = 300;
      y = 450;
    }
    else {
      this.listValue = 1;
      size = 12;
      x = 380;
      y = 80;
    }
  }

  public void ifClicked() {
    if (keyPressed) {
      if (isSelected && key == 'a') {
        myBag = true;
        menu = false;
      }
    }
  }
}
