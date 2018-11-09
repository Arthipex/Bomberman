import java.io.File;

World world;
Player player1;
Player player2;
ArrayList<Block> blockList;
ArrayList<Wall> wallList;


// window size
int tileSize = 1500/15;

// game speed
int speed = 60;



void setup(){
  frameRate(speed);
  size(1500, 1300);  //match with settings in "World"
   world = new World();
   player1 = world.player1;
   player2 = world.player2;
   blockList = world.blockList;
   wallList = world.wallList;
}

//---------------------------------------------------------------------------------------------------------------------------------------------------------

void draw(){
  background(40);
  //drawData();
  world.update();
}

//---------------------------------------------------------------------------------------------------------------------------------------------------------

void drawData(){
  fill(255);
}

void keyPressed(){
  char keyChar = key;
  if(key == CODED){

      if(keyCode == LEFT){
          keyChar = 'a';
      } 
      if(keyCode == DOWN){
          keyChar = 's';
      }  
      if(keyCode == RIGHT){
          keyChar = 'd';
      }  
      if(keyCode == UP){
          keyChar = 'w';
      } 

  }  
    switch(keyChar){
    case 'a':
      player1.setVelocity('a', wallList, blockList);
      break;
    case 's':
      player1.setVelocity('s', wallList, blockList);
      break;
    case 'd':
      player1.setVelocity('d', wallList, blockList);
      break;
    case 'w':
      player1.setVelocity('w', wallList, blockList);
      break;
    }
}
