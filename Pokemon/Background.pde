public class Background {
  int grassX = trym.x-20;
  int grassY = trym.y-20;
  
  PImage ground;
  PImage tree;
  
  Background() {
    ground = loadImage("grassB.PNG");
    tree = loadImage("tree.png");
  }
  
  public void movement() {
    grass();
    ground();
    trees();
  }
  
  public void ground() {
   for (int i = 0; i<2; i++) {
      for (int x = 0; x< 2; x++) {
        image(ground, trym.x+ 250*i, trym.y+ x*250, 250, 250);
      }
    }
  }
  
  public void grass() {
  }
  
  public void trees() {
    int treeX = trym.x;
    int treeY = trym.y;
    for (int i = 0; i<10; i++) {
      image(tree, treeX + i*50, treeY, 50, 70);
    }
  }
}


// if (grassX == 250) {}
// System.out.println(grassX);
