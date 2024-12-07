class Pallina{
  
  int posX, posY;
  color c1 = color(255, 0, 0);
  
  Pallina(int x, int y){
    this.posX = x;
    this.posY = y;
  }
  
  void showBall(){
    fill(c1);
    strokeWeight(0.5);
    ellipse(posX, posY, 20, 20);
  }
}
