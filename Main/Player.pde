class Player
{
  int xpos, ypos;
  int speed;
  int size;
  int half_size;
  
  //Set up map for collision detection implementation (using get function in pimage to label colours)
  boolean[][] collision_map;
  PImage collision_image;
  color black;
  
  //Default constructor
  Player()
  {
    this.speed = 4;
    this.size = width / 20;
    this.half_size = size / 2;
    
    this.collision_image = loadImage("pacman_map.jpg");
    
    collision_map = new boolean[collision_image.width][collision_image.height];
    
    black = color(0);
  }
  
  //Collision map generation through nested for loops with boolean 2darray
  void generate_collision_map()
  {
    //Rows
    for (int i = 0; i < collision_image.width; i++)
    {
      //Columns
      for (int j = 0; j < collision_image.height; j++)
      {
      }
    }
  }
  
}