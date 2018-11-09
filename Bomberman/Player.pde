class Player {
  int number;
  boolean isAlive = true;
  PVector pos;
  PVector vel;
  int health = 1;
  int bombs = 1;
  int speed = 5;
  ArrayList<Wall> wallList = new ArrayList<Wall>();
  ArrayList<Block> blockList = new ArrayList<Block>();
  char keystroke;
  

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
  
//---------------------------------------------------------------------------------------------------------------------------------------------------------
 
  
  void show(){
    fill(255, 0, 0);
    ellipse(pos.x, pos.y, 50, 50);
  }
  
  //---------------------------------------------------------------------------------------------------------------------------------------------------------
  
  void move(){
    if(keyPressed == false){
      vel.x = 0;
      vel.y = 0;
    } else {
    pos.add(setVelocity(keystroke, wallList, blockList));  
    }
  }
 
 //---------------------------------------------------------------------------------------------------------------------------------------------------------
  
  PVector setVelocity(char keystroke, ArrayList<Wall> wallList, ArrayList<Block> blockList){
      if(isAlive){
      
        // get maximum movement range in desired direction
        float maxMov = maxmov(pos, keystroke, wallList, blockList);
        int comparation = Float.compare(maxMov, 0.0F);
        PVector vel = new PVector();
        
      if(comparation >= 0){      
        switch(keystroke){
        case 'a':
            vel.x = -speed;
            vel.y = 0;  
            return vel;
          
        case 's':
            vel.x = 0;
            vel.y = speed;
            return vel;
           
        case 'd':
           vel.x = speed;
           vel.y = 0;
           return vel;
           
        case 'w':
           vel.x = 0;
           vel.y = -speed;
           return vel;
        }
      }
    }

    return vel;
  }
  
  //---------------------------------------------------------------------------------------------------------------------------------------------------------
  
  float maxmov(PVector pos, char keystroke, ArrayList<Wall> wallList, ArrayList<Block> blockList){
    float maxmov = 99999;
    for(int i = 0; i < wallList.size(); i++){
      if(sameLevel(pos, keystroke, wallList.get(i))){ // check if the wall is potentially in the way
        switch(keystroke){
          case 'a':
            if(pos.x - wallList.get(i).pos.x - 150 <= maxmov && wallList.get(i).pos.x < pos.x){
              maxmov = pos.x - wallList.get(i).pos.x - 150;
            }
          case 's': 
            if(wallList.get(i).pos.y - pos.y - 50 <= maxmov && wallList.get(i).pos.y  > pos.y){
              maxmov = wallList.get(i).pos.y - pos.y - 50;
            }          
          case 'd':
            if(wallList.get(i).pos.x - pos.x - 50 <= maxmov && wallList.get(i).pos.x > pos.x){
              maxmov = wallList.get(i).pos.x - pos.x - 50;
            }         
          case 'w': 
            if(pos.y - wallList.get(i).pos.y - 150 <= maxmov && wallList.get(i).pos.y < pos.y){
              maxmov = pos.y - wallList.get(i).pos.y - 150;
            }
        }
      }    
    }  
    //for(int i = 0; i < blockList.size(); i++){
    //  if(sameLevel(pos, keystroke, blockList.get(i))){ // check if the wall is potentially in the way
    //    switch(keystroke){
    //      case 'a':
    //        if(pos.x - blockList.get(i).pos.x - 150 <= maxmov && blockList.get(i).pos.x < pos.x){
    //          maxmov = pos.x - blockList.get(i).pos.x - 150;
    //        }
    //      case 's': 
    //        if(blockList.get(i).pos.y - pos.y - 50 <= maxmov && blockList.get(i).pos.y > pos.y){
    //          maxmov = blockList.get(i).pos.y - pos.y - 50;
    //        }          
    //      case 'd':
    //        if(blockList.get(i).pos.x - pos.x - 50 <= maxmov && blockList.get(i).pos.x > pos.x){
    //          maxmov = blockList.get(i).pos.x - pos.x - 50;
    //        }         
    //      case 'w': 
    //        if(pos.y - blockList.get(i).pos.y - 150 <= maxmov && blockList.get(i).pos.y < pos.y){
    //          maxmov = pos.y - blockList.get(i).pos.y - 150;
    //        }
    //    }
    //  }    
    //} 

    return maxmov;
  }
  
  //---------------------------------------------------------------------------------------------------------------------------------------------------------

  boolean sameLevel(PVector pos, char keystroke, Wall wall){
    switch(keystroke){
      case 'a':
        if(pos.y > wall.pos.y && pos.y < wall.pos.y){
          return true;
        }
      case 's':
        if(pos.x > wall.pos.x && pos.x < wall.pos.x){
          return true;
        }
      case 'd':
        if(pos.y > wall.pos.y && pos.y < wall.pos.y){
          return true;
        }
      case 'w':
        if(pos.x > wall.pos.x && pos.x < wall.pos.x){
          return true;
        }    
    }
    return false; 
  }
  
   //---------------------------------------------------------------------------------------------------------------------------------------------------------

  boolean sameLevel(PVector pos, char keystroke, Block block){
    switch(keystroke){
      case 'a':
        if(pos.y > block.pos.y - 49 && pos.y < block.pos.y + 149){
          return true;
        }
      case 's':
        if(pos.x > block.pos.x - 49 && pos.x < block.pos.x + 149){
          return true;
        }
      case 'd':
        if(pos.y > block.pos.y - 49 && pos.y < block.pos.y + 149){
          return true;
        }
      case 'w':
        if(pos.x > block.pos.x - 49 && pos.x < block.pos.x + 149){
          return true;
        }    
    }
    return false; 
  }

}
