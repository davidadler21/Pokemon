//This was made by Trym.
public class GrowlButton extends Button implements Attack {

  GrowlButton(String Name, int xx, int xy) {
    x = xx;
    y = xy;
    name = Name;
    this.listValue = 0;
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
}
