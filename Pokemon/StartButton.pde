public class Start extends Button {
  boolean gameStarted = false;

  Start(String Name, int xx, int xy) {
    menuIsOpen = true;
    x = xx;
    y = xy;
    name = Name;
  }

  public void ifClicked() {
    if (keyPressed) {
      if (isSelected && key == 'a') {
        gameStarted = true;
        this.menuIsOpen = false; 
        tb.menuIsOpen = true;
      }
    }
  }
}
