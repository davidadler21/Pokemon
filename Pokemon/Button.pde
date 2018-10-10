public abstract class Button {
  boolean isSelected;
  boolean clicked;
  boolean menuIsOpen;
  int listValue = 0;
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
      text(name, x, y+5);
      if (isSelected) {
        if (microTime > lag+50) {
          triangle(x-7, y, x-17, y+5, x-17, y-5);
          lag = microTime; 
        }
        else {
          triangle(x-10, y, x-20, y+5, x-20, y-5);
        }
      }
    }
    this.listChange();
    this.countActiveButtons();
    this.ifClicked();
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
    else {
      this.listValue = activeButtons + 1;
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
