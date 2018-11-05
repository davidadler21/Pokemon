//Trym made this subclass.
public class CloseBagButton extends Button{

  CloseBagButton(String Name, int xx, int xy){
    x = xx;
    y = xy;
    name = Name;
    this.listValue = 2;
    size = 24;
  }

  public void display() {
    super.display();

  }

  public void ifClicked() {
//There are two ways of closing the bag, or the bagMenu. There is selecting the closeBag button and pressing a and there is just pressing s.
    if (keyPressed) {
      if (isSelected && key == 'a' && microTime-lagB > 5) {
        lagB = microTime;
        enterBag.myBag = false;
      }
      else if(key == 's'){
        enterBag.myBag = false;
      }
    }
  }
}
