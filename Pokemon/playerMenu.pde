boolean menu = false;

void playerMenu() {
  if (keyPressed) {
    if ((key == 'w' || key == 's') && microTime > enterP.lag+5) {
      if (!enterP.myPokemon) {
        enterP.lag = microTime;
        if (!menu && key == 'w') {
          menu = true;
        } else {
          menu = false;
        }
      }
    }
  }
  if (menu) {
    image(m, 330, 0, 200, 350);
    enterP.menuIsOpen = true;
    enterP.display();
    enterBag.menuIsOpen = true;
    enterBag.display();
  } else {
    enterP.menuIsOpen = false;
    enterBag.menuIsOpen = false;
  }
  enterP.pokeStatus();
}

public class PokemonButton extends Button {
  PokeButton shaymin;
  
  boolean myPokemon = false;

  PokemonButton(String Name, int xx, int xy) {
    shaymin = new PokeButton("Shaymin", 110);
    x = xx;
    y = xy;
    name = Name;
  }

  public void ifClicked() {
    if (keyPressed) {
      if (isSelected && key == 'a' && microTime-lag > 5) {
        lag = microTime;
        myPokemon = true;
        menu = false;
      }
    }
  }

  public void pokeStatus() {
    if (myPokemon) {
      fill(0, 100, 255);
      rect(0, 100, 500, 300);
      shaymin.display();
    }
    if (keyPressed) {
      if (key == 's' && microTime-lag > 5) {
        lag = microTime;
        myPokemon = false;
        menu = true;
      }
    }
  }
}

public class PokeButton extends Button {
  int order;
  
  PokeButton(String Name, int xy) {
    y = xy;
    name = Name;
  }
  
  public void display() {
    super.display();
    this.menuIsOpen = true;
    x = 120 + order*20;
  }
  
  public void ifClicked() {
  }
}


public class BagButton extends Button {
  boolean myBag = false;

  BagButton(String Name, int xx, int xy) {
    x = xx;
    y = xy;
    name = Name;
    this.listValue = 1;
  }

  public void ifClicked() {
    if (keyPressed) {
      if (isSelected && key == 'a' && microTime-lag > 5) {
        lag = microTime;
        myBag = true;
        menu = false;
      }
    }
  }
}
