class Food {

  int x;
  int y;
  int type  = 2;
  Player player;
  

  Food(int x, int y, Player player) {
    this.x = x;
    this.y = y;
    this.player = player;
  }

  void moveAwayFromPlayer()
  {
    int xDistance = Math.abs(player.x - x);
    int yDistance = Math.abs(player.y - y);
    int random = rnd.nextInt(4);

    // random chance (~25% chance) for at enemy flytter sig i en tilfældig retning. 

    if (frameCount % 15 == 0) {
      if (random == 0) {
        random = rnd.nextInt(3);

        switch (random)
        {
        case 0:
          if (x > 1) {
            x--;
          }
          break;

        case 1:
          if (x < grid.length-1) {
            x++;
          }
          break;

        case 2:
          if (y > 1) {
            y--;
          }
          break;

        case 3:
          if (y < grid.length-1) {
            y++;
          }
          break;
        }
      }

      if (xDistance > yDistance)
      {
        if (player.x < x) {
          x++;
        } else {
          x--;
        }

        if (x < 1) {
          x = 0;
        }

        if (x > 18) {
          x = 19;
        }
      } else
      {
        if (player.y < y) {
          y++;
        } else {
          y--;
        }

        if (y < 1) {
          y = 0;
        }
        if (y > 18) {
          y = 19;
        }
      }
    }
  }

  void checkCollison() {
    if (player.x == x && player.y == y) {
      player.gainHealth();
      x = rnd.nextInt(19);
      y = rnd.nextInt(19);
      player.score++;
    }
  }
}
