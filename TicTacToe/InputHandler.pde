class InputHandler{
  GraphicsController graphicsController;
  GameManager gameManager;
  
  public InputHandler(GraphicsController graphicsController, GameManager gameManager){
    this.graphicsController = graphicsController;
    this.gameManager = gameManager;
  }
  
  public void submitEvent(int x, int y){
    if (graphicsController.bMouseClickedOnGrid(x, y)) 
    { 
      Spot clicked = graphicsController.SpotClickedOn(x, y); //<>//
      if (clicked.corner.length == 3) { return; }
      gameManager.AttemptToMarkSpot(clicked);
    }
    
  }

}
