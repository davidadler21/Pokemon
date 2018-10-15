public class TrymButton extends Button {
  boolean trymSelected;
  
  TrymButton(String Name, int xx, int xy) {
    x = xx;
    y = xy;
    name = Name;
  }
  
  public void display() {
    super.display();
    if (isSelected && menuIsOpen) {
      image(tsd, 200, 150, 375, 250);
      image(SF, 225, 145, 60, 60);
    }
  }
  
  public void ifClicked() {
    if (keyPressed) {
      if (isSelected && key == 'a' && microTime-lag > 5) {
        lag = microTime;
        startButton.gameStarted = true;
        this.menuIsOpen = false; 
      }
    }
  }
}
