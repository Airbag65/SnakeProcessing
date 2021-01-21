class Fruit{

  boolean eaten = false;
  boolean generated = false; 
  
  int fruitXpos;
  int fruitYpos;
  
  
  void generateNew(){
    if(generated == false){
      fruitXpos = round(random(29)) * scale;
      fruitYpos = round(random(29)) * scale;
      generated = true;
    }
  }
  
  void show(){
    generateNew();
    while(get(fruitXpos + 10, fruitYpos + 10) == color(255)){
      generateNew();
    }
    noStroke();
    fill(255, 0, 0);
    rect(fruitXpos, fruitYpos, scale,scale);
    fruitEaten();
  }
  
  void fruitEaten(){
    if(xCoords.get(0) == fruitXpos && yCoords.get(0) == fruitYpos){
      score++;
      l++;
      xCoords.add(l-1, xCoords.get(l-1));
      yCoords.add(l-1, yCoords.get(l-1));
      eaten = true;
      generated = false;
    }
  }
}
