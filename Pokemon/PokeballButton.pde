//This was made by Trym.
public class PokeballButton extends Button{

  PokeballButton(String Name, int xx, int xy){
    x = xx;
    y = xy;
    name = Name;
    this.listValue = 0;
    size = 24;
  }

  public void display() {
    super.display();

  }

  public void ifClicked() {
    if (keyPressed) {
      if (isSelected && key == 'a' && microTime-lagB > 5) {
        lagB = microTime;
      }
    }
  }


}
