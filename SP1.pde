String score;
String health;
int size = 40;
int amountOfEnemies = 4;
int amountOfFood = 4;
int[][] grid = new int[20][20];
Enemy[] enemy = new Enemy[amountOfEnemies];
Food[] food = new Food[amountOfFood];

Player player;


void setup()
{

  frameRate(60);
  size(1000, 800);


  player = new Player(3, 4);



  for (int i = 0; i < enemy.length; i++) {
    enemy[i] = new Enemy(grid.length-enemy.length+i, grid.length-enemy.length+i, player);
  }


  for (int i = 0; i < food.length; i++) {
    food[i] = new Food(rnd.nextInt(20), rnd.nextInt(20), player);
  }
}

void draw()
{
  updateEntities();
  scoreBoard();
  drawBoard();
  clearBoard();
}

void clearBoard()
{
  for (int x = 0; x < grid.length; x++)
  {
    for (int y = 0; y < grid[0].length; y++)
    {
      grid[x][y] = 0;
    }
  }
}

void drawBoard()
{
  for (int x = 0; x < grid.length; x++)
  {
    for (int y = 0; y < grid[0].length; y++)
    {
      fill(getColorFromType(grid[x][y]));
      rect(x * size, y * size, size, size);
    }
  }
  if (player.isDead == true) {
    fill(255, 0, 0);
    textSize(100);
    textAlign(CENTER, BOTTOM);
    text("GAME OVER", 400, 400);
    textAlign(CENTER, TOP);
    score = "FINAL SCORE: " + String.valueOf(player.getScore());
    text(score, 400, 400, 5);
  }
}

void updateEntities()
{
  grid[player.x][player.y] = player.type;

  for (int i = 0; i < enemy.length; i++) {
    grid[enemy[i].x][enemy[i].y] = enemy[i].type;
    enemy[i].moveTowardsPlayer();
    enemy[i].checkCollison();
  }

  for (int i = 0; i < food.length; i++) {
    grid[food[i].x][food[i].y] = food[i].type;
    food[i].moveAwayFromPlayer();
    food[i].checkCollison();
  }
}



color getColorFromType(int type) 
{
  color c = color(255);

  switch(type)
  {
  case 0: 
    c = color(127);
    break;
  case 1: 
    c = color(255, 0, 0);
    break;
  case 2: 
    c = color(0, 255, 0);
    break;
  case 3: 
    c = color(0, 0, 255);
    break;
  case 4: 
    c = color (0, 255, 255);
    break;
  }    

  return c;
}


void keyPressed()
{
  if (key == 'w' || keyCode == 38)
  {
    player.y--;
    if (player.y < 1) {
      player.y = 0;
    }
  }
  if (key == 'a' || keyCode == 37)
  {
    player.x--;
    if (player.x < 1) {
      player.x = 0;
    }
  }
  if (key == 's' || keyCode == 40)
  {
    player.y++;
    if (player.y > 18) {
      player.y =19;
    }
  }
  if (key == 'd' || keyCode == 39)
  {
    player.x++;
    if (player.x > 18) {
      player.x = 19;
    }
  }
}

void scoreBoard() {
  fill(0, 0, 0);
  rect(800, 0, 1000, 800);
  textSize(25);
  fill(255, 255, 0);
  score = "SCORE: " + String.valueOf(player.getScore());
  text(score, 825, 50, 5);
  health = "HEALTH: " + String.valueOf(player.getHealth());
  
  if (player.health > 74) {
    fill(0, 255, 0);
  } 
  else if (player.health > 25) {
    fill(255, 140, 0);
  } else {
  fill(255, 0, 0);
  }
  text(health, 825, 100, 5);
}
