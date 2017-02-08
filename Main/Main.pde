Menu main_menu = new Menu();
Player pacman;
Laser laser_medium = new Laser();

//Global for holding xpos ypos value for laser
int laser_player_pos[] = new int[2];


//Lives counter
int lives;


void setup()
{
  pacman = new Player();
  //First generate collision map
  pacman.generate_collision_map();
  background(0);
  size(1024, 1024);
  
}


void draw()
{
  if (main_menu.game_started_check() == false)
  {
    main_menu.update_screen();
    main_menu.display_menu();
  }
  else
  {
    
    pacman.draw_map();
    
    laser_player_pos = pacman.update();
    
    pacman.spawn_food();
    
    pacman.food_touched();
    
    pacman.display_score();
    
    laser_medium.laser_fire_medium(laser_player_pos);
    
    
  }
}