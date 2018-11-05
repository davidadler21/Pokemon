//The Superclass Button was made by David so we could have an easier time creating other buttons.
public abstract class Button {
  boolean isSelected;
  boolean clicked;
  boolean menuIsOpen;
  int listValue = 0;
  int x;
  int y;
  String name;
  int lag = 0;
  int size = 12;
  boolean isActive = false;

  Button() {

  }

  public void display() {
    if (menuIsOpen) {
      this.ifClicked();
      fill(150);
      textSize(size);
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
      if (listValue == 0) {
        this.listChange();
      }
    }
    this.isSelected();
    this.countActiveButtons();
  }

  public abstract void ifClicked();

  public void listChange() {
    if (menuIsOpen) {
      if (keyPressed && microTime-lagB > 5) {
        lagB = microTime;
        if (keyCode == UP) {
          listValueNum--;
        }
        else if (keyCode == DOWN) {
          listValueNum++;
        }
      }
    }
  }

  public void isSelected() {
    if (menuIsOpen) {
      if (listValueNum == listValue) {
        isSelected = true;
      }
      else {
        isSelected = false;
      }
    }
    // else {
    //   this.listValue = activeButtons-1;
    // }
  }

  public void countActiveButtons() {
    if(menuIsOpen && !isActive) {
      activeButtons++;
      //this.listValue = activeButtons-1;
      isActive = true;
    }
    else if (!menuIsOpen && isActive) {
      activeButtons--;
      isActive = false;
    }
  }
}
