class Box{
  
  void Box(){}
  
  void showBox(){
    /*prima tabella*/
    stroke(0);
    strokeWeight(2);
    line(20, 20, 20, height-20);
    line(20, height-20, 500, height-20);
    line(500, height-20, 500, 20);
    /*seconda tabella*/
    stroke(0);
    strokeWeight(2);
    line(530, 20, 530, height-20);
    line(530, height-20, 1000, height-20);
    line(1000, height-20, 1000, 20);  
  }
  
}
