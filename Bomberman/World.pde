class World{
  
  // window size
  int sizeX = 1500;
  int sizeY = 1300;

  int tileSize = sizeX/15;
  
  boolean flag;
  PVector temp;
  ArrayList<PVector> blockPos;
  ArrayList<Block> blockList;
  ArrayList<PVector> wallPos;
  ArrayList<Wall> wallList;
  
  Player player1;
  Player player2;
  
  //---------------------------------------------------------------------------------------------------------------------------------------------------------  
 
  // constructor
  World(){ 
    createWalls();
    createBlocks();
    player1 = new Player(1);
    player2 = new Player(2);
  }

  //---------------------------------------------------------------------------------------------------------------------------------------------------------  
  
  // does an entry with given pos exist?  
  boolean isInList(PVector pos, ArrayList<PVector> array){
    for(int i = 0; i < array.size(); i++){
       if(!array.isEmpty() && pos.x == array.get(i).x && pos.y == array.get(i).y){ 
         return true;
       }
    } 
       
       // make sure START isn't occupied
     
     // starting position player 1
     if((pos.x == tileSize && pos.y < tileSize * 4) || (pos.y == tileSize && pos.x < tileSize * 4)){
         return true;
     }
     // starting position player 2
     if((pos.x == tileSize * 13 && pos.y > tileSize * 8) || (pos.y == tileSize * 11 && pos.x > tileSize * 10)){
        return true;
     } 
     return false;
   }
 
  //---------------------------------------------------------------------------------------------------------------------------------------------------------   
   
 void createWalls(){
   //create wall pos
    wallPos = new ArrayList<PVector>();
    wallList = new ArrayList<Wall>();
    PVector temp = new PVector();
    
    //middle part
    for(int i = 2; i < 13; i+=2){
      for(int j = 2; j < 11; j+=2){
        temp.x = i * tileSize;
        temp.y = j * tileSize;
        wallPos.add(temp);
        wallList.add(new Wall(temp.x, temp.y));
      }
    }
    
    //top row
    for (int i = 0; i < 15; i++){
        temp.x = i * tileSize;
        temp.y = 0; 
    wallPos.add(temp);
    wallList.add(new Wall(temp.x, temp.y));
    }
    //bottom row
    for (int i = 0; i < 15; i++){
        temp.x = i * tileSize;
        temp.y = 12 * tileSize; 
    wallPos.add(temp);
    wallList.add(new Wall(temp.x, temp.y));
    }
    //left row
    for (int i = 0; i < 13; i++){
        temp.x = 0;
        temp.y = i * tileSize; 
    wallPos.add(temp);
    wallList.add(new Wall(temp.x, temp.y));
    }
    //right row
    for (int i = 0; i < 13; i++){
        temp.x = 14 * tileSize;
        temp.y = i * tileSize; 
    wallPos.add(temp);
    wallList.add(new Wall(temp.x, temp.y));
    }
 }  

  //--------------------------------------------------------------------------------------------------------------------------------------------------------- 
 
 void createBlocks(){
   //create block pos
    blockPos = new ArrayList<PVector>();
    blockList = new ArrayList<Block>();
    PVector temp = new PVector();
        
  
    for (int i = 0; i < 72; i++){
        temp.x = floor(random(1, 14)) * tileSize;
        temp.y = floor(random(1, 12)) * tileSize;
   
         
         while(isInList(temp, wallPos)){
           temp.x = floor(random(1, 14)) * tileSize; 
           temp.y = floor(random(1, 12)) * tileSize;
         }
     
    blockPos.add(temp);
    blockList.add(new Block(temp.x, temp.y));
    }
 }  
 
 
  void update(){
    for(int i = 0; i < blockList.size(); i++){
      blockList.get(i).show();
    }
    for(int i = 0; i < wallList.size(); i++){
      wallList.get(i).show();
    }
    player1.show();
    player2.show();
    player1.move();
    player2.move();
  }
   
}
