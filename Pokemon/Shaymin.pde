//This was originally made by David; however, we both heavily added on to it throughout the project.
public class Shaymin extends Davangemon{
  PImage SB;

  Shaymin() {
    name = "Shaymin";
    level = 5;
    GR = 2;
    setStats(12, 13, 10, 10);
    HP = MHP;
    SB = loadImage("shayminBack.png");
    type = "Grass";
  }
//One display for the player's pokemon.
  public void display() {
    setStats(12, 13, 10, 10);
    image(SB, 20, 120, 250, 250);
    text(name, 295, 270);
    textSize(18);
    text("Lv: " + level, 410, 270);
    text("HP: " + HP + "/" + MHP, 330, 300);
  }
//One display for the wild pokemon.
  public void wildDisplay() {
    setStats(12, 13, 10, 10);
    image(SF, 250, 60, 200, 200);
    text(name, 40, 80);
    textSize(18);
    text("Lv: " + level, 165, 80);
    text("HP: " + HP + "/" + MHP, 95, 100);

  }

  public void moves(boolean a) {
    growl.menuIsOpen = a;
    tackle.menuIsOpen = a;
    energyBall.menuIsOpen = a;
    growl.display();
    tackle.display();
    energyBall.display();
  }

  public void moveLearn() {
  }

  public void evolution() {
  }

}

//  public abstract void display();

//  public abstract void moves();

//  public abstract void moveLearn();

//  public abstract void evolution();
