class Laser extends Menu
{
  float laserX, laserY;
  int initialX, initialY;
  
  
  Laser()
  {
    laserX = 0;
    laserY = 0;
    
    initialX = 0;
    initialY = 0;
  }
  
  
  void laser_fire_medium(int[] temp)
  {
    if (initialX == 0 && initialY == 0)
    {
      initialX = temp[0];
      initialY = temp[1];
    }
    
    //Random every 3 seconds
    if (random(0, 10) <= 3)
    {
      laserX = random(30, width);
      
      //make a red dot to warn player
      fill(255, 0, 0);
      ellipse(laserX, laserY, 20, 20);
      
      //2 seconds after
      if (frameCount % 120 == 0)
      {
        strokeWeight(10);
        line(laserX, laserY, laserX, height);
        strokeWeight(1);
      }
    }
    
    if (dist(laserX, laserY, temp[0], temp[0]) < 30)
    {
      hurt();
    }
  }
  
  
  void hurt()
  {
    //Reduce players lives
    if (lives > 0)
    {
      lives--;
      
      //Check if dead
      if (lives == 0)
      {
        game_over();
      }
      else
      {
        respawn();
      }
    }
  }
  
  void respawn(int temp[])
  {
    
    //Set xpos and ypos (named initialX and initialY to original position)
    temp[0] = initialX;
    temp[1] = initialY;
    
  }
  
}