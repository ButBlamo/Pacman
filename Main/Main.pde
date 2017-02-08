Menu main_menu = new Menu();
Player pacman;

void setup()
{
  pacman = new Player();
  //First generate collision map
  pacman.generate_collision_map();
  background(0);
  size(720, 500);
  
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
    fill(250, 250, 0);
    
    pacman.draw_map();
    
    
  }
}