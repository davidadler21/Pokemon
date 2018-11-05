//This was made by David.
public class PokeButton extends Button {

  PokeButton(String Name, int xy) {
    y = xy;
    name = Name;
  }

  public void display() {
    super.display();
    x = 120;
  }

  public void ifClicked() {
  }
}
