class Wall {
  PVector pos; // position of block
  
  
  //---------------------------------------------------------------------------------------------------------------------------------------------------------
  // constructor
  
  Wall(float posX, float posY){
    pos = new PVector();
    pos.x = posX;
    pos.y = posY;
  }
  
  //---------------------------------------------------------------------------------------------------------------------------------------------------------
  
  void show(){
  fill(150, 150, 150);
  rect(pos.x, pos.y, 100, 100);
  }
  
   
}
