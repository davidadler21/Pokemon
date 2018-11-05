//This was made by Trym.
public class Potion {


Potion(){
//This takes the boolean which tell whether the button corresponding to potion has beenn pressed and how much it will restore of health.
//If the amount of health is ten less than the max health, then the hp is given 10+.
  if(potionB.potionUsed == true && capturedPok.get(runB.runX).MHP - capturedPok.get(runB.runX).HP >= 10){
    capturedPok.get(runB.runX).HP += 10;
  }
//If not, then it is given the amount away from the max.
  else if (potionB.potionUsed == true && capturedPok.get(runB.runX).MHP - capturedPok.get(runB.runX).HP < 10){
    capturedPok.get(runB.runX).HP += capturedPok.get(runB.runX).MHP - capturedPok.get(runB.runX).HP;
  }
}

}
