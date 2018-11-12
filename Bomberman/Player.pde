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
        pos = new PVector(1.25*100, 1.25*100);
        break;
      case 2:
        pos = new PVector(13.25*100, 11.25*100);
        break;
    }
    
  }
  
//---------------------------------------------------------------------------------------------------------------------------------------------------------
 
  
  void show(){
    fill(255, 0, 0);
    rect(pos.x, pos.y, 50, 50);;
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
 // boolean rectBall(int rx, int ry, int rw, int rh, int bx, int by, int d) {}
  
  
  PVector setVelocity(char keystroke, ArrayList<Wall> wallList, ArrayList<Block> blockList){
      if(isAlive){
      
        switch(keystroke){
        case 'a':
        
          for(int i = 0; i < wallList.size(); i++){
            if(rectRect(pos.x-speed, pos.y, 50, 50, wallList.get(i).pos.x, wallList.get(i).pos.y, 100, 100)){
              vel.x = 0;
              vel.y = 0;
              return vel;
            } else {
              vel.x = -speed;
              vel.y = 0;
              return vel;
            }   
          }

          
        case 's':
        
        for(int i = 0; i < wallList.size(); i++){
            if(rectRect(pos.x, pos.y+speed, 50, 50, wallList.get(i).pos.x, wallList.get(i).pos.y, 100, 100)){
              vel.x = 0;
              vel.y = 0;
              return vel;
            } else {
              vel.x = 0;
              vel.y = speed;
              return vel;
            }   
          }

           
        case 'd':
        
        for(int i = 0; i < wallList.size(); i++){
            if(rectRect(pos.x+speed, pos.y, 50, 50, wallList.get(i).pos.x, wallList.get(i).pos.y, 100, 100)){
              vel.x = 0;
              vel.y = 0;
              return vel;
            } else {
              vel.x = speed;
              vel.y = 0;
              return vel;
            }   
          }

           
        case 'w':
        
        for(int i = 0; i < wallList.size(); i++){
            if(rectRect(pos.x, pos.y-speed, 50, 50, wallList.get(i).pos.x, wallList.get(i).pos.y, 100, 100)){
              vel.x = 0;
              vel.y = 0;
              return vel;
            } else {
              vel.x = 0;
              vel.y = -speed;
              return vel;
            }   
          }
           

        }
      }
      return vel;
    }

  
  
  //---------------------------------------------------------------------------------------------------------------------------------------------------------
  
  //PVector maxmov(PVector pos, char keystroke, ArrayList<Wall> wallList, ArrayList<Block> blockList){
  //  PVector obstacle = new PVector();
  //  obstacle.x = 99999;
  //  obstacle.y = 99999;
    
    
  //  for(int i = 0; i < wallList.size(); i++){
  //    if(sameLevel(pos, keystroke, wallList.get(i))){ // check if the wall is potentially in the way
  //      switch(keystroke){
  //        case 'a':
  //          if(pos.x - wallList.get(i).pos.x < obstacle.x){
  //            obstacle.x = pos.x - wallList.get(i).pos.x;
  //          }
  //        case 's': 
  //          if(wallList.get(i).pos.y - pos.y < obstacle.y){
  //            obstacle.y = wallList.get(i).pos.y - pos.y;
  //          }          
  //        case 'd':
  //          if(wallList.get(i).pos.x - pos.x < obstacle.x){
  //            obstacle.x = wallList.get(i).pos.x - pos.x;
  //          }         
  //        case 'w': 
  //          if(pos.y - wallList.get(i).pos.y < obstacle.y){
  //            obstacle.y = pos.y - wallList.get(i).pos.y;
  //          }
  //      }
  //    }    
  //  }  
  //  //for(int i = 0; i < blockList.size(); i++){
  //  //  if(sameLevel(pos, keystroke, blockList.get(i))){ // check if the wall is potentially in the way
  //  //    switch(keystroke){
  //  //      case 'a':
  //  //        if(pos.x - blockList.get(i).pos.x - 150 <= maxmov && blockList.get(i).pos.x < pos.x){
  //  //          maxmov = pos.x - blockList.get(i).pos.x - 150;
  //  //        }
  //  //      case 's': 
  //  //        if(blockList.get(i).pos.y - pos.y - 50 <= maxmov && blockList.get(i).pos.y > pos.y){
  //  //          maxmov = blockList.get(i).pos.y - pos.y - 50;
  //  //        }          
  //  //      case 'd':
  //  //        if(blockList.get(i).pos.x - pos.x - 50 <= maxmov && blockList.get(i).pos.x > pos.x){
  //  //          maxmov = blockList.get(i).pos.x - pos.x - 50;
  //  //        }         
  //  //      case 'w': 
  //  //        if(pos.y - blockList.get(i).pos.y - 150 <= maxmov && blockList.get(i).pos.y < pos.y){
  //  //          maxmov = pos.y - blockList.get(i).pos.y - 150;
  //  //        }
  //  //    }
  //  //  }    
  //  //} 
  //  println(obstacle.x + " " + obstacle.y);
  //  return obstacle;
  //}
  
  //---------------------------------------------------------------------------------------------------------------------------------------------------------

  //boolean sameLevel(PVector pos, char keystroke, Wall wall){
  //  switch(keystroke){
  //    case 'a':
  //      if(pos.y > wall.pos.y-50 && pos.y < wall.pos.y+150 && wall.pos.x > pos.x){
  //        return true;
  //      }
  //    case 's':
  //      if(pos.x > wall.pos.x-50 && pos.x < wall.pos.x+150 && wall.pos.y > pos.y){
  //        return true;
  //      }
  //    case 'd':
  //      if(pos.y > wall.pos.y-50 && pos.y < wall.pos.y+150 && wall.pos.x < pos.x){
  //        return true;
  //      }
  //    case 'w':
  //      if(pos.x > wall.pos.x-50 && pos.x < wall.pos.x+150 && wall.pos.y < pos.y){
  //        return true;
  //      }    
  //  }
  //  return false; 
  //}
  
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
  

//---------------------------------------------------------------------------------------------------------------------------------------------------------

/* 
RECT/RECT COLLISION FUNCTION
Jeff Thompson // v0.9 // November 2011 // www.jeffreythompson.org

Takes 8 arguments:
  + x,y position of object 1 - in this case "you"
  + width and height of object 1 - also "you"
  + x,y position of object 2 - in this case the static rectangle
  + width and height of object 2
  
*/
boolean rectRect(float x1, float y1, int w1, int h1, float x2, float y2, int w2, int h2) {
  
  // test for collision
  if (x1+w1/2 >= x2-w2/2 && x1-w1/2 <= x2+w2/2 && y1+h1/2 >= y2-h2/2 && y1-h1/2 <= y2+h2/2) {

    return true;    // if a hit, return true
  }
  else {            // if not, return false
    return false;
  }
}

}
