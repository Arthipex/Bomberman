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
 // boolean rectBall(int rx, int ry, int rw, int rh, int bx, int by, int d) {}
  
  
  PVector setVelocity(char keystroke, ArrayList<Wall> wallList, ArrayList<Block> blockList){
      if(isAlive){
      
        // get maximum movement range in desired direction
        PVector obstacle = maxmov(pos, keystroke, wallList, blockList);
//        int comparation = Float.compare(maxMov, 0.0F);
        PVector vel = new PVector();
        
  //    if(comparation >= 0){      
        switch(keystroke){
        case 'a':
          if(rectBall(obstacle.x, obstacle.y, 100, 100, pos.x-speed, pos.y, 50)){
            vel.x = pos.x - obstacle.x - 150;
          } else {
            vel.x = -speed;
            vel.y = 0;  
          }
            return vel;
          
        case 's':
          if(rectBall(obstacle.x, obstacle.y, 100, 100, pos.x, pos.y+speed, 50)){
            vel.y = obstacle.y - pos.y - 50;
          } else {
            vel.x = 0;
            vel.y = speed;
          }
            return vel;
           
        case 'd':
          if(rectBall(obstacle.x, obstacle.y, 100, 100, pos.x+speed, pos.y, 50)){
            vel.x = obstacle.x - pos.x - 50;
          } else {
           vel.x = speed;
           vel.y = 0;
          }
          return vel;
          
        case 'w':
        if(rectBall(obstacle.x, obstacle.y, 100, 100, pos.x, pos.y-speed, 50)){
            vel.y = pos.y - obstacle.y - 150;
          } else {
           vel.x = 0;
           vel.y = -speed;
           return vel;
        }
      }
    }

    return vel;
  }
  
  //---------------------------------------------------------------------------------------------------------------------------------------------------------
  
  PVector maxmov(PVector pos, char keystroke, ArrayList<Wall> wallList, ArrayList<Block> blockList){
    PVector obstacle = new PVector();
    obstacle.x = 99999;
    obstacle.y = 99999;
    
    
    for(int i = 0; i < wallList.size(); i++){
      if(sameLevel(pos, keystroke, wallList.get(i))){ // check if the wall is potentially in the way
        switch(keystroke){
          case 'a':
            if(pos.x - wallList.get(i).pos.x < obstacle.x){
              obstacle.x = pos.x - wallList.get(i).pos.x;
            }
          case 's': 
            if(wallList.get(i).pos.y - pos.y < obstacle.y){
              obstacle.y = wallList.get(i).pos.y - pos.y;
            }          
          case 'd':
            if(wallList.get(i).pos.x - pos.x < obstacle.x){
              obstacle.x = wallList.get(i).pos.x - pos.x;
            }         
          case 'w': 
            if(pos.y - wallList.get(i).pos.y < obstacle.y){
              obstacle.y = pos.y - wallList.get(i).pos.y;
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
    println(obstacle.x + " " + obstacle.y);
    return obstacle;
  }
  
  //---------------------------------------------------------------------------------------------------------------------------------------------------------

  boolean sameLevel(PVector pos, char keystroke, Wall wall){
    switch(keystroke){
      case 'a':
        if(pos.y > wall.pos.y-50 && pos.y < wall.pos.y+150 && wall.pos.x > pos.x){
          return true;
        }
      case 's':
        if(pos.x > wall.pos.x-50 && pos.x < wall.pos.x+150 && wall.pos.y > pos.y){
          return true;
        }
      case 'd':
        if(pos.y > wall.pos.y-50 && pos.y < wall.pos.y+150 && wall.pos.x < pos.x){
          return true;
        }
      case 'w':
        if(pos.x > wall.pos.x-50 && pos.x < wall.pos.x+150 && wall.pos.y < pos.y){
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
  
  //---------------------------------------------------------------------------------------------------------------------------------------------------------
  /*
  
  Takes 7 arguments:
 + x,y position of the first ball - in this case "you"
 + width and height of rect
 + x,y position of the second ball
 + diameter of second ball
 
 */

boolean rectBall(float rx, float ry, int rw, int rh, float bx, float by, int d) {

  // first test the edges (this is necessary if the rectangle is larger
  // than the ball) - do this with the Pythagorean theorem

  // if ball entire width position is between rect L/R sides
  if (bx+d/2 >= rx-rw/2 && bx-d/2 <= rx+rw/2 && abs(ry-by) <= d/2) {
    return true;
  }
  // if not, check if ball's entire height is between top/bottom of the rect
  else if (by+d/2 >= ry-rh/2 && by-d/2 <= ry+rh/2 && abs(rx-bx) <= d/2) {
    return true;
  }

  // if that doesn't return a hit, find closest corner
  // this is really just a point, so we can test if we've hit it 
  // upper-left
  float xDist = (rx-rw/2) - bx;  // same as ball/ball, but first value defines point, not center
  float yDist = (ry-rh/2) - by;
  float shortestDist = sqrt((xDist*xDist) + (yDist * yDist));

  // upper-right
  xDist = (rx+rw/2) - bx;
  yDist = (ry-rh/2) - by;
  float distanceUR = sqrt((xDist*xDist) + (yDist * yDist));
  if (distanceUR < shortestDist) {  // if this new distance is shorter...
    shortestDist = distanceUR;      // ... update
  }

  // lower-right
  xDist = (rx+rw/2) - bx;
  yDist = (ry+rh/2) - by;
  float distanceLR = sqrt((xDist*xDist) + (yDist * yDist));
  if (distanceLR < shortestDist) {
    shortestDist = distanceLR;
  }

  // lower-left
  xDist = (rx-rw/2) - bx;
  yDist = (ry+rh/2) - by;
  float distanceLL = sqrt((xDist*xDist) + (yDist * yDist));
  if (distanceLL < shortestDist) {
    shortestDist = distanceLL;
  }

  // test for collision
  if (shortestDist < d/2) {  // if less than radius
    return true;             // return true
  }
  else {                     // otherwise, return false
    return false;
  }
}

}
