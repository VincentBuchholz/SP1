class Player
{
  int x; 
  int y; 
  int type = 3; 
  int health;
  int score;
  boolean isDead;



  Player(int x, int y)
  {
    this.x = x;
    this.y = y;
    health = 100;
    isDead = false;
    score = 0;
  }


  void takeDamage()
  {

    health--;    
    
    if (health <= 0){
      isDead = true;
      noLoop();
    }
  }
  
  void gainHealth(){
    health++;
  }
  
  int getScore(){
   return score; 
  }
  
  int getHealth(){
   return health; 
  }
}
