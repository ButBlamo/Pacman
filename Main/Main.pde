import processing.sound.*;
SoundFile file2;



Menu main_menu = new Menu();
Player pacman;
Laser laser_medium = new Laser();
PImage pacman_dead;

//Global for holding xpos ypos value for laser
int laser_player_pos[] = new int[2];


//Lives counter
int lives;

int game_over = 0;


void setup()
{
  pacman = new Player();
  //First generate collision map
  pacman.generate_collision_map();
  background(0);
  size(1024, 1024);
  pacman_dead = loadImage("pacman_dead.png");
  
  file2 = new SoundFile(this, "pacman_death.wav");

  
  
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
    
    
    if (game_over == 1)
    {      
      laser_medium.game_over();
      image(pacman_dead, 100, height / 2);
      

    }
      
    
    
  }
}