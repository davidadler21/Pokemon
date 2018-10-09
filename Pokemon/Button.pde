public abstract class Button {
  boolean isSelected;
  boolean clicked;
  boolean menuIsOpen;
  int listValue;
  int x;
  int y;
  String name;
  int lag = 0;
  boolean isActive = true;
  Button() {
    
  }
  public void display() {
    if (menuIsOpen) {
      fill(150);
      textSize(12);
      text(name, x, y);
      if (isSelected) {
        fill(150);
        triangle(x-10, y, x-20, y+10, x-20, y-10);
      }
    }
    this.listChange();
    this.countActiveButtons();
  }

  public abstract void ifClicked();
  
  public void listChange() {
    if (menuIsOpen) {
      if (keyPressed && microTime-lag > 5) {
        lag = microTime;
        if (keyCode == UP) {
          listValueNum--;
        }
        else if (keyCode == DOWN) {
          listValueNum++;
        }
      }
      if (listValueNum == listValue) {
        isSelected = true;
      }
      else {
        isSelected = false;
      }
    }
  }
  
  public void countActiveButtons() {
    if(menuIsOpen && !isActive) {
      activeButtons++;
      isActive = true;
    }
    else if (!menuIsOpen && isActive) {
      activeButtons--;
      isActive = false;
    }
  }
}
