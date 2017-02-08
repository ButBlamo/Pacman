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
  
  
  //Boolean and arcs will be used to get the mouth affects for pacman
  float mouth_angle;
  float mouth_change;
  boolean is_opening;
  
  //Default constructor
  Player()
  {
    this.xpos = 358;
    this.ypos = 377;
    this.speed = 4;
    this.size = width / 28;
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
    
    
    //Mouth variables
    this.mouth_angle = 0;
    this.mouth_change = TWO_PI / 180;
    this.is_opening = true;
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
    background(0);
      image(collision_image , 0, 0, width, height);
      this.is_map_drawn = true;
    
    
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
          println(xpos);
        
          //When moving left at center there will be the portal
          if (xpos <= 15)
          {
            xpos = width - 15;
          }
          
          //Displaying pacman left
          face_left();
          
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
        
        //Displaying pacman right
        face_right();
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
        ypos +=speed;
        
        //When moving left at center there will be the portal
        if (xpos <= 15)
        {
          xpos = width - 15;
        }
        
        //Displaying pacman down
        face_down();
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
        ypos -=speed;
        
        //When moving left at center there will be the portal
        if (xpos <= 15)
        {
          xpos = width - 15;
        }
        
        //Call for arc displaying pacman up
        face_up();
      }
    }
    }
  }
  
  //Make functions for displaying pacman facing in various directions
  void face_left()
  {
    fill(255, 255, 0);
    
    if (is_opening == true)
    {
      mouth_angle += mouth_change;
    }
    else
    {
      mouth_angle -= mouth_change;
    }
    
    if (mouth_angle >= TWO_PI / 8 || mouth_angle <= 0) 
    {
      is_opening = !is_opening;
    }
    
    arc(xpos, ypos, size, size, 0 + mouth_angle, TWO_PI - mouth_angle);
    
  }
  
  
  void face_right()
  {
    fill(255, 255, 0);
    
    if (is_opening == true)
    {
      mouth_angle += mouth_change;
    }
    else
    {
      mouth_angle -= mouth_change;
    }
    
    if (mouth_angle >= TWO_PI / 8 || mouth_angle <= 0) 
    {
      is_opening = !is_opening;
    }
    
    arc(xpos, ypos, size, size, 0 + mouth_angle, TWO_PI - mouth_angle);

  }
  
  
  void face_up()
  {
    fill(255, 255, 0);
    
    if (is_opening == true)
    {
      mouth_angle += mouth_change;
    }
    else
    {
      mouth_angle -= mouth_change;
    }
    
    if (mouth_angle >= TWO_PI / 8 || mouth_angle <= 0) 
    {
      is_opening = !is_opening;
    }
    
    arc(xpos, ypos, size, size, 0 + mouth_angle, TWO_PI - mouth_angle);

  }
  
  
  void face_down()
  {
    fill(255, 255, 0);
    
    if (is_opening == true)
    {
      mouth_angle += mouth_change;
    }
    else
    {
      mouth_angle -= mouth_change;
    }
    
    if (mouth_angle >= TWO_PI / 8 || mouth_angle <= 0) 
    {
      is_opening = !is_opening;
    }
    
    arc(xpos, ypos, size, size, 0 + mouth_angle, TWO_PI - mouth_angle);

  }
  
  
}