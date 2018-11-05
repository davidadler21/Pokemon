//This was made by David.
boolean menu = false;

void playerMenu() {
  if (keyPressed) {
    if ((key == 'w' || key == 's') && microTime > enterP.lag+10) {
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
