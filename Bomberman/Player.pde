class Player {
  int number;
  boolean isAlive = true;
  PVector pos;
  PVector vel;
  int health = 1;
  int bombs = 1;
  int speed = 5;
  float[] maxmov;

  Player(int no){
    vel = new PVector(1,0);
    switch(no){
      case 1:
        pos = new PVector(1.5*100, 1.5*100);
        break;
      case 2:
        pos = new PVector(13.5*100, 11.5*100);
        break;
    }
    
  }
  
  void show(){
    fill(255, 0, 0);
    ellipse(pos.x, pos.y, 50, 50);
  }
  
  void move(){
    if(keyPressed == false){
      vel.x = 0;
      vel.y = 0;
    }
    pos.add(vel);  
  }
  
  void setVelocity(char keystroke, ArrayList<Wall> wallList, ArrayList<Block> blockList){
      if(isAlive){
      switch(keystroke){
      case 'a':
        if(maxmov(pos, keystroke)){
          vel.x = -speed;
          vel.y = 0;  
        }
        break;
        
      case 's':
        if(maxmov(pos, keystroke)){
          vel.x = 0;
          vel.y = speed;
        }
         break;
         
      case 'd':
        if(maxmov(pos, keystroke)){
         vel.x = speed;
         vel.y = 0;
        }
         break;
         
      case 'w':
        if(maxmov(pos, keystroke)){
         vel.x = 0;
         vel.y = -speed;
        }
         break;
        
      }
    }
    
  }
  
  boolean maxmov(PVector pos, char dir){
    
    PVector wall = new PVector();
    
    switch(dir){
      //north
      case 'w':
        //check walls
        for(int i = 0; i < wallList.size(); i++){
           // write down coords for simplicity
           wall.x = wallList.get(i).pos.x;
           wall.y = wallList.get(i).pos.y;  
           
           println(pos.y - wall.y);
           if(wall.x - pos.x < 50 && pos.x - wall.x < 150){
             println("below wall");
             if(pos.y - wall.y < 150){
               return false;
             }
           } 
         }              
      }  
    return true;  
    }

}
