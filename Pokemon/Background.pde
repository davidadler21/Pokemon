public class Background {
  int grassX = trym.x-20;
  int grassY = trym.y-20;

  PImage ground;
  PImage tree;
  PImage trees;
  PImage pond;
  PImage grass;

  Background() {
    ground = loadImage("grassB.PNG");
    tree = loadImage("tree.png");
    trees = loadImage("trees.PNG");
    pond = loadImage("pond.PNG");
    grass = loadImage("tallGrass.png");
  }

  public void movement() {
    image(ground, trym.x, trym.y);
    pond();
    trees();
  }

  public void grass() {
    image(grass, trym.x+450, trym.y+450, 200, 100);
  }

  public void pond() {
    image(pond, trym.x+430, trym.y+590, 400, 400);
    if (trym.x+530 < 250 && trym.y+590 < 250) {
      if (keyCode == RIGHT) {
        trym.x+=2;
      } else if (keyCode == DOWN) {
        trym.y+=2;
      }
    }
    
    image(pond, trym.x, trym.y+100, 400, 400);
    if (trym.x+340 > 250 && trym.y+350 > 250) {
      if (keyCode == LEFT) {
        trym.x-=2;
      } else {
        trym.y-=2;
      }
    }
  }

  public void trees() {
    for (int i = 0; i<4; i++) {
      image(trees, trym.x + i*252, trym.y);
    }
    if (trym.y+230 > 250) {
      trym.y-=2;
    }
    for (int i = 0; i<4; i++) {
      image(trees, trym.x, trym.y + 200*i);
    }
    if (trym.x+252 > 250) {
      trym.x-=2;
    }
    for (int i = 0; i<4; i++) {
      image(trees, trym.x+756, trym.y + 200*i);
    }
    if (trym.x+725 < 250) {
      trym.x+=2;
    }
    for (int i = 0; i<4; i++) {
      image(trees, trym.x + i*252, trym.y+800);
    }
    if (trym.y+760 < 250) {
      trym.y+=2;
    }
  }
}


// if (grassX == 250) {}
// System.out.println(grassX);
