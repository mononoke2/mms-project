/* 
 1° STEP : creare le tabelle "contenitori" delle palline -> 2 Box - fatto
 2° STEP : creare gli oggetti Palline - fatto
 3° STEP : visualizzare le palline, rimuovere le palline e cancellarle dal disegno - fatto
 4° STEP : estrarre la pallina dal contenitore X ed inserirla nel contenitore Y - fatto
 5° STEP : estrarre randomicamente le palline dal contenitore X ed inserirle nel contenitore Y - fatto
 provare che per un certo numero N di estrazioni la distrib. limite e' la binomiale 
 
 raffinamenti: sistemare le classi, rimuovere gli if in eccesso e creare dei metodi appositi per essi
 
 sistemare l'estrazione in particolare quando le palline si impilano una sopra l'altra - fatto
 
 es: se si vuole inserire una pallina dopo aver estratto un'intera riga soprastante tipo la riga 2 fatto
 allora la pallina si deve re-inserire nella riga 1 e "salire" e impilarsi nella riga 2            

*/

PrintWriter output1, output2;
int i = 0;
int c = 1;
boolean activ;
boolean e = false;
Box b;
ArrayList<Pallina> p, p2;
int x, y, x2, y2;

void setup(){

  size(1024, 980);
  activ = true;
  
  x = 40;
  y = height-40;
  x2 = 550;
  y2 = height-40;

  p = new ArrayList<Pallina>();
  p2 = new ArrayList<Pallina>();
  b = new Box();
  
  output1 = createWriter("output1.txt");
  output2 = createWriter("output2.txt");
  
}

void draw(){
  background(255);
  /*for per visualizzare palline nel box 1*/
  for (Pallina p1 : p){
    p1.showBall();
  }
  /*for per visualizzare palline nel box 2*/
  for (Pallina p3 : p2){
    p3.showBall();
  }
  /*visualizza box*/
   b.showBox();
  /*estrazione*/
  if(e && activ){
    extractFromBox();
    check();
    output1.println(p.size());
    output2.println(p2.size());
    contatoreBox2();
  }
}

void addBall(){
  p.add(new Pallina(x, y));
  x += 20;
  if (x >= 500){
    y -= 20;
    x = 40;
  }
}

void extractFromBox(){
  if (round(random(0, 1)) == 0){
    if (p.size() == 0) {
      moveToBox1();
    }
    moveToBox2();
  }
  else{  
    if (p2.size() == 0) {
      moveToBox2();
    }
    moveToBox1();
  }
}

void check(){
  i++;
  println("Estrazione n. " + i);
  if(i == 6000)
    activ = false;
}

void moveToBox1(){
  /** condizioni per rimuovere pallina da box2 **/
  p2.remove(p2.size()-1);
  x2 -= 20;
  if (x2 < 550) {
    x2 = 970;
    y2 += 20;
  }
  /**condizioni per aggiungere pallina in box1 **/
  p.add(new Pallina(x, y));
  x += 20;
  if (x >= 500){
    x = 40;
    y -= 20;
  }
}

void moveToBox2(){
  /**condizioni per rimuovere pallina dal box1 **/
  p.remove(p.size()-1);
  x -=20;
  if (x < 40) {
    x = 480;
    y += 20;
  }
  /**condizioni per aggiungere pallina nel box2 **/
  p2.add(new Pallina(x2, y2));
  x2 += 20;
  if (x2 >= 980){
    x2 = 550;
    y2 -= 20;
  }
}

void contatoreBox1(){
  println("Palline nel contatore 1: " + p.size());
}

void contatoreBox2(){
  println("Palline nel contatore 2: " + p2.size());
}

void keyPressed(){
  
  if(key == 'c'){
    output1.flush();
    output1.close();
    output2.flush();
    output2.close();
    exit();
  }
  
  /** aggiungi pallina **/
  if (key == 'n' || key == 'N') {
    for(int i = 0; i < 1000; i++){
      addBall();
    }
  }
  if(key == 'S'){
    for(int i = 0; i < 500; i++){
      moveToBox2();
    }
  }
  
  /** aggiungi pallina **/
  if (key == 's'){
    for(int i = 0; i < 2; i++){
      moveToBox2();
    }
    for(int i = 0; i < 15; i++){
    extractFromBox();
    }
    contatoreBox1();
    contatoreBox2();
    output2.println(p2.size());
    output1.println(p.size());
  }

  /** cancella il disegno **/
  if (key == 'r' || key == 'R'){
    setup();
  }
  
  if(key == 'v'){
    contatoreBox1();
  }
  /** estrazione della pallina **/
  if (key == 'e' || key == 'E'){
    e = true;
  }
}
