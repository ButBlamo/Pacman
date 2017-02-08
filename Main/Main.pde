PImage game_map;
Menu main_menu = new Menu();
Player pacman;

void setup()
{
  pacman = new Player();
  //First generate collision map
  pacman.generate_collision_map();
  background(0);
  size(720, 500);
  //Load the game map and main menu images
  game_map = loadImage("pacman_map.jpg");
  
}


void draw()
{
  if (main_menu.game_started_check() == false)
  {
    // image(game_map, 0, 0, width, height);
    main_menu.update_screen();
    main_menu.display_menu();
  }
  else
  {
  }
}