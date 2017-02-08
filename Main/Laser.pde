class Laser extends Menu
{
  float laserX, laserY;
  int initialX, initialY;
  boolean is_laser_firing;
  
  
  Laser()
  {
    laserX = 0;
    laserY = 0;
    
    initialX = 0;
    initialY = 0;
    
    is_laser_firing = false;
  }
  
  
  void laser_fire_medium(int[] temp)
  {
    if (initialX == 0 && initialY == 0)
    {
      initialX = temp[0];
      initialY = temp[1];
    }
    
    //Random every 3 seconds
    if (is_laser_firing == false)
    {
    if (random(0, 10) <= 3)
    {
        laserX = random(30, width);
        is_laser_firing = true;
    }
    }
      
      //make a red dot to warn player

      fill(255, 0, 0);
      ellipse(laserX, laserY, 40, 40);

      
      //2 seconds after
      if (frameCount % 120 == 0)
      {
        strokeWeight(10);
        line(laserX, laserY, laserX, height);
        strokeWeight(1);
        
        is_laser_firing = false;
      }
    
    if (dist(laserX, laserY, temp[0], temp[1]) < 30)
    {
      hurt();
      
    }
          println(dist(laserX, laserY, temp[0], temp[1]));
  }
  
  
  int hurt()
  {
    println("Ow");
    //Reduce players lives
    return lives;
    
      
  }
  
  void game_over()
  {
      background(0);
      textSize(rW * 2);
      text("Game over! ;(", width / 8, height / 6);
  }
  
}