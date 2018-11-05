//This was made by Trym.
public class PotionButton extends Button{
boolean potionUsed = false;

int potionAmt = 5;

  PotionButton(String Name, int xx, int xy){
    x = xx;
    y = xy;
    name = Name;
    this.listValue = 1;
    size = 24;
  }

  public void display() {
    super.display();

  }

  public void ifClicked() {
    if(potionAmt >= 1){
      if (keyPressed) {
        if (isSelected && key == 'a' && microTime-lagB > 5) {
          lagB = microTime;
          potionUsed = true;
        }
      }
    }
//There is also a system which takes away potions each time it is used.
  else{
    potionUsed = false;
  }
  if(potionB.potionUsed = true){
    potionAmt -= 1;
  }
}
}
