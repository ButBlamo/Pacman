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
  color read_colour;
  
  //Draw map variable
  boolean is_map_drawn;
  
  //Void update variables
  boolean up_left, up_right, down_left, down_right;
  
  //Default constructor
  Player()
  {
    this.xpos = 358;
    this.ypos = 377;
    this.speed = 4;
    this.size = width / 20;
    this.half_size = size / 2;
    
    is_map_drawn = false;
    
    this.collision_image = loadImage("pacman_map.jpg");
    
    collision_map = new boolean[collision_image.width][collision_image.height];
    
    black = color(0);
    
    //Default values of collision validation variables are false
    up_left = false;
    up_right = false;
    down_left = false;
    down_right = false;
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
        //Initialize read_colour to value of pixel
        read_colour = collision_image.get(i, j);
        
        //Checking if black pixel (black pixels are valid terrain)
        if (read_colour == black)
        {
          collision_map[i][j] = true;
        }
        
        else
        {
          collision_map[i][j] = false;
        }
      }
    }
  }
  
  //Fxn for drawing map
  void draw_map()
  {
    if (this.is_map_drawn == false)
    {
      image(collision_image , 0, 0, width, height);
      this.is_map_drawn = true;
    }
    
    
  }
  
  
  //Update method for each game frame
  void update()
  {
    //Use boolean variables to work with collision map to generate a path you can walk on
    if (keyCode == LEFT)
    {
      //Checking if within the map boundaries
      if (xpos >= half_size + speed)
      {
      
        //Checking all four corners 
        up_left = collision_map[xpos - speed - half_size][ypos - half_size];
        up_right = collision_map[xpos - speed + half_size][ypos - half_size];
        down_left = collision_map[xpos - speed - half_size][ypos + half_size];
        down_right = collision_map[xpos - speed + half_size][ypos + half_size];
      
        //Check if all are true before moving
        if (up_left && up_right && down_left && down_right)
        {
          //Move left
          xpos -=speed;
        
          //When moving left at center there will be the portal
          if (xpos <= 15)
          {
            xpos = width - 15;
          }
        }
      }
    }
    
    //Code is just copied for each direction
    if (keyCode == RIGHT)
    {
      if (xpos <= width - half_size - speed)
      {
      
      //Checking all four corners 
      up_left = collision_map[xpos + speed - half_size][ypos - half_size];
      up_right = collision_map[xpos + speed + half_size][ypos - half_size];
      down_left = collision_map[xpos + speed + half_size][ypos + half_size];
      down_right = collision_map[xpos + speed - half_size][ypos + half_size];
      
      //Check if all are true before moving
      if (up_left && up_right && down_left && down_right)
      {
        //Move left
        xpos +=speed;
        
        //When moving left at center there will be the portal
        if (xpos >= width - 15)
        {
          xpos = 15;
        }
      }
      }
    }
    
    if (keyCode == DOWN)
    {
      if (ypos <= height - half_size - speed)
      {
      //Checking all four corners 
      up_left = collision_map[xpos - half_size][ypos + speed - half_size];
      up_right = collision_map[xpos + half_size][ypos + speed - half_size];
      down_left = collision_map[xpos + half_size][ypos + speed + half_size];
      down_right = collision_map[xpos - half_size][ypos + speed + half_size];
      
      //Check if all are true before moving
      if (up_left && up_right && down_left && down_right)
      {
        //Move left
        xpos -=speed;
        
        //When moving left at center there will be the portal
        if (xpos <= 15)
        {
          xpos = width - 15;
        }
      }
    }
    }
    
    
    //Finally last of validation of map boundaries
    if (keyCode == UP)
    {
      if (ypos >= half_size + speed)
      {
      //Checking all four corners 
      up_left = collision_map[xpos - half_size][ypos - speed - half_size];
      up_right = collision_map[xpos + half_size][ypos - speed - half_size];
      down_left = collision_map[xpos + half_size][ypos - speed + half_size];
      down_right = collision_map[xpos - half_size][ypos - speed + half_size];
      
      //Check if all are true before moving
      if (up_left && up_right && down_left && down_right)
      {
        //Move left
        xpos -=speed;
        
        //When moving left at center there will be the portal
        if (xpos <= 15)
        {
          xpos = width - 15;
        }
      }
    }
    }
  }
  
}