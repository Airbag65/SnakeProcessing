//initiella variablar
int xPos = 200;
int yPos = 200;
int l = 3;
int score = 0;
int scale = 20;
int difficulty = 15;

char dir = 'n';

boolean playing = true;

// Listor som lagrar ormens positioner
ArrayList<Integer> xCoords = new ArrayList<Integer>(l);
ArrayList<Integer> yCoords = new ArrayList<Integer>(l);

//Frukten skapas (se Fruit filen)
Fruit f = new Fruit();


void setup() {
   //ritar spelytan
   size(600, 600);
   noStroke();
   
   //Stä?ller in ursprungspositionerna fö?r ormen
     //x-koordinaterna  
   xCoords.add(new Integer(xPos));
   xCoords.add(new Integer(xPos-20));
   xCoords.add(new Integer(xCoords.get(1)-20));
   
     //y-koordinaterna
   yCoords.add(new Integer(yPos));
   yCoords.add(new Integer(yPos));
   yCoords.add(new Integer(yPos));
   
   //Bestä?mmer hur snabbt spelet ska gå? (svå?righetsgrad)
   frameRate(difficulty);
}

//Ritar ut sjä?lva spelet med alla funktioner nedan
void draw() {
   background(0);
   if(playing){
     game();
   }else{
     lose();
   }
}


//funktion fom få?r ormen att rö?ra sig 
void player(){
   fill(255);
   for(int i=0; i < l; i++){
     strokeWeight(3);
     stroke(0);
     rect(xCoords.get(i), yCoords.get(i), 20, 20);
   }
   switch (dir){
     case 'd':
       xCoords.add(0, xCoords.get(0) + 20);
       yCoords.add(0, yCoords.get(0));
       break;
     case 's':
       yCoords.add(0, yCoords.get(0) + 20);
       xCoords.add(0, xCoords.get(0));
       break;
     case 'a':
       xCoords.add(0, xCoords.get(0) - 20);
       yCoords.add(0, yCoords.get(0));
       break;
     case 'w':
       yCoords.add(0, yCoords.get(0) - 20);
       xCoords.add(0, xCoords.get(0));
       break;
   }
}


//Funktion som kä?nner av vilken eller vilka knappar som trycks ned
//Anvä?nds fö?r att ä?ndra riktningsvariablens vä?rde
void keyPressed(){
  //HÖ?GER och VÄ?NSTER
  if(keyCode == RIGHT||key == 'd'){
    if(dir != 'a'){
      dir = 'd';
    }
  }
  if(keyCode == LEFT||key == 'a'){
    if(dir != 'd'){
      dir = 'a';
    }
  }
  
  //UPPÅ?T och NEDÅ?T
  if(keyCode == UP||key == 'w'){
    if(dir != 's'){
      dir = 'w';
    }
  }
  if(keyCode == DOWN||key == 's'){
    if(dir != 'w'){
      dir = 's';
    }
  }
}


//Funktion som kä?nner av vilka fall som spelet fö?rloras
void losingCaseWall(){
  if(xCoords.get(0) >= 600 || xCoords.get(0) <= 0 - scale || yCoords.get(0) >= 600 || yCoords.get(0) <= 0 - scale){
    lose();
  }
}

void losingCaseSelf(){
  for(int i = l - 1; i > 1; i--){
    int headPosX = xCoords.get(0);
    int headPosY = yCoords.get(0);
    if(headPosX == xCoords.get(i) && headPosY == yCoords.get(i)){
       lose();
    }
  }
}


//funktion som kö?rs nä?r spelet fö?rloras
void lose(){
  playing = false;
  textSize(24);
  text("Your score was: " + score, 100, 100);
}


//funktion som samlar alla andra funktioner. Gö?r DRAW funktionen mer optimerad
void game(){
  player();
  f.show();
  losingCaseWall();
  losingCaseSelf();
}
