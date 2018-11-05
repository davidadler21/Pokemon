//This was made by David.
public class PokemonButton extends Button {
  //PokeButton shaymin;

  boolean myPokemon = false;

  PokemonButton(String Name, int xx, int xy) {
    //shaymin = new PokeButton("Shaymin", 110);
    x = xx;
    y = xy;
    name = Name;
  }

  public void display() {
    super.display();
    if (wildEnc.inBattle) {
      this.listValue = 1;
      size = 24;
      x = 380;
      y = 390;
    }
    else {
      this.listValue = 0;
      size = 12;
      x = 380;
      y = 40;
    }
  }

  public void ifClicked() {
    if (keyPressed) {
      if (isSelected && key == 'a') {
        myPokemon = true;
        menu = false;
      }
    }
    pokeStatus();
  }

  public void pokeStatus() {
    if (myPokemon) {
      listValueNum = 0;
      if (key == 's' && enterP.myPokemon) {
        enterP.myPokemon = false;
        for (int x = 0; x < capturedPok.size(); x++) {
          pokemonStatus.add (new PokeButton(capturedPok.get(x).name, 120+x*20));
          pokemonStatus.get(x).menuIsOpen = false;
        }
        if (!wildEnc.inBattle) {
          activeButtons = 0;
        }
      }
      for (int x = 0; x < capturedPok.size(); x++) {
        pokemonStatus.add (new PokeButton(capturedPok.get(x).name, 120+x*20));
        pokemonStatus.get(x).menuIsOpen = true;
        pokemonStatus.get(x).display();
      }
    }
  }
}
