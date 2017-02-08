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
    
    r1X = width / 4;
    r1Y = height / 4;
    
    rW = width / 6;
    rH = height / 6;
    
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
        fill(255, 0, 0);
        
      }
      else
      {
        fill(0);
      }
      rect(r1X, r1Y, rW, rH);
      //Text
      textSize(rH / 4);
      text("Start game", r1X, r1Y - 35);
    
  }
  
  //Function to check if mouse is over the rectangle
  //Boolean function to check if mouse is over one of the buttons
  boolean mouseOverRect(float x, float y, float w, float h)
  {
    return (mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h );
      
  }
  
}