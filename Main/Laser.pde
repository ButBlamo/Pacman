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
    
    if (laserX == temp[0] || laserX - temp[0] >= 30 || laserX - temp[0] <= 30 )
    {
      hurt();
      
    }
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
  
  boolean is_between(int laserX, int temp[])
  {
    if (laserX - temp[0] == 10 || laserX - temp[0] == 9 || laserX - temp[0] == 8  || laserX - temp[0] == 7
         || laserX - temp[0] == 6  || laserX - temp[0] == 5  || laserX - temp[0] == 4  || laserX - temp[0] == 3
          || laserX - temp[0] == 2  || laserX - temp[0] == 1  || laserX - temp[0] == 0
           || laserX - temp[0] == -10  || laserX - temp[0] == -9  || laserX - temp[0] == -8 
            || laserX - temp[0] == -7  || laserX - temp[0] == -6  || laserX - temp[0] == -5
             || laserX - temp[0] == -4  || laserX - temp[0] == -3  || laserX - temp[0] == -2
              || laserX - temp[0] == -1)
      {
        return true;
      }
      else
      {
        return false;
      }
  }
}