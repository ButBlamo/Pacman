PImage game_map;

void setup()
{
  size(1280, 720);
  //Load the game map and main menu images
  game_map = loadImage("pacman_map.jpg");
  imageMode(CENTER);
  
}


void draw()
{
  image(game_map, width/2, height/2);
}