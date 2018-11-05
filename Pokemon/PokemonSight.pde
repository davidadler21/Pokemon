//This was made by both because there are components throughout made by both of us.
public class PokemonSight{
  boolean wildEncounter = false;
  boolean inBattle = false;
  int randoNum =  (int) (Math.random() * 99);
  int lag = 0;
  int pokeballNum;
  int randomNum = 2;

  PokemonSight(){

  }

  public void wildBattle(){
//This method provides the chance of running into a pokemon when within the patch of grass.
//Additionally, there is a random chance of actually encountering it.
    randoNum =  (int) (Math.random() * 99);
    if(trym.x <= -190 && trym.y <= -190 && trym.x >= -385 && trym.y >= -275 && randoNum == 50 && trym.move == true){
      wildEncounter = true;
      lag = microTime;
    }
//If the conditions for meeting a pokemon has been met and a pokemon has been encountered, then the sequence screen before battle shows up.
    if (wildEncounter && !inBattle) {
      fill(0);
//The screen consists of rectangles moving through for loops across the screen. Until it reaches the middle, in which the battle starts.
      for(int x = 0; x < 26; x++) {
        for(int y = 0; y < 26; y++) {
          if (lag+x+y == microTime) {
            for (int i = 0; i < 26; i++) {
              rect(20*x - 20*i, 20*y, 20, 20);
              rect(500 - 20*x, 500 - 20*y + 20*i, 20, 20);
              rect(500 - 20*x + 20*i, 20*y, 20, 20);
              rect(20*x - 20*i, 500 - 20*y, 20, 20);
              if (x == 25) {
                inBattle = true;
              }
            }
          }
        }
      }
    }
    if (enemy1.playBattle && !inBattle) {
      fill(0);
      for(int x = 0; x < 26; x++) {
        for(int y = 0; y < 26; y++) {
          if (lag+x+y == microTime) {
            for (int i = 0; i < 26; i++) {
              rect(20*x - 20*i, 20*y, 20, 20);
              rect(500 - 20*x, 500 - 20*y + 20*i, 20, 20);
              rect(500 - 20*x + 20*i, 20*y, 20, 20);
              rect(20*x - 20*i, 500 - 20*y, 20, 20);
              if (x == 25) {
                inBattle = true;
              }
            }
          }
        }
      }
    }
  }

  public void randoPoke () {
//If a pokemon is encountered in the wild, then there is a random chance system for what it is going to be.
    if (wildEnc.wildEncounter && wildEnc.inBattle == true && !enterP.myPokemon && enterBag.myBag == false) {
      if(randomNum == 2){
      randomNum = (int) (Math.random() * 2);
    }
//So that the initialized random pokemon is not constantly initialized, a system where the random number is only  accessed once was created.
      if(randomNum == 0){
        randomWild = new Shaymin();
//Initialization of random pokemon.
        ((Shaymin)randomWild).wildDisplay();

      }

      else if(randomNum == 1){
//Initialization of random pokemon.
        randomWild = new Drib((int) random(7, 15));
          ((Drib)randomWild).wildDisplay();

      }
    }
    if (!wildEnc.wildEncounter) {
      randomNum = 2;
    }
  }

//Additionally, it was made so that a pokeBall image would spiral from the left of the screen when a battle started.
  public void pokeAppear() {
    for(pokeballNum = 0; pokeballNum < 130; pokeballNum++) {
      if (lag+pokeballNum == microTime) {
      pushMatrix();
      translate(-10+pokeballNum, 200+ pokeballNum);
      rotate(pokeballNum/2);
      image(pokeball, -10, -10, 20, 20);
      popMatrix();
    }
    }
  }

  // public void personBattle(){
  //
  //       }
  //     }
  //
  //   }
  //
  //
  //   }
}
