class Menu
{
  int lives;
  boolean is_game_started;
  
  //Button rectangle for starting game
  float r1X;
  float r1Y;
  //Width and height of button
  float rW;
  float rH;
  
  
  //Default constructor
  Menu()
  {
    lives = 3;
    is_game_started = false;
    
    r1X = width / 2 ;
    r1Y = height / 2.0f;
    
    rW = width / 4.0f;
    rH = height / 4.0f;
    
  }
  
  void update_screen()
  {
    r1X = width / 3;
    r1Y = height / 3;
  }
  
  //Displaying menu
  void display_menu()
  {
      //Checking if both mouse over certain rectangle and if mouse is pressed
      //Button to start game
      if (mouseOverRect(r1X, r1Y, rW, rH))
      {
        if (mousePressed == true)
        {
          background(0);
          return;
        }
        fill(0, 0, 255);
        
      }
      else
      {
        fill(255);
      }
      rect(r1X, r1Y, rW, rH);
      //Text
      textSize(rW);
      text("Start game", r1X, r1Y);
      println(r1Y);
    
  }
  
  //Function to check if mouse is over the rectangle
  //Boolean function to check if mouse is over one of the buttons
  boolean mouseOverRect(float x, float y, float w, float h)
  {
    return (mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h );
      
  }
  
}