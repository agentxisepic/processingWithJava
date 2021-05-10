GraphicsController graphicsController;
InputHandler inputHandler; 
GameManager gameManager; 

void setup(){
  size(900, 900);
  noLoop(); //Makes it so the draw function only runs once. We will call it ourself since our program is not real time. 
  graphicsController = new GraphicsController();
  graphicsController.DrawFrame(false);
  gameManager = new GameManager(graphicsController);
  inputHandler = new InputHandler(graphicsController, gameManager);
  
}

void draw(){
  graphicsController.DrawSpots();
  graphicsController.DrawMarks();
  graphicsController.DrawHeader();
  
}

void mouseClicked(){
  submitEvent(mouseX, mouseY);
}



void submitEvent(int x, int y){
  inputHandler.submitEvent(x, y);
}
