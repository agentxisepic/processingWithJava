class GraphicsController {
  Spot[][] SPOTS;
  int[] gridDimensions;
  int[] displayDimensions;
  int[] gridCorner;
  int drawIncrement; 
  int boardExtents;
  int yOffset; 
  
  
//CONSTRUCTOR
  public GraphicsController(){
    displayDimensions = new int[2]; for (int i = 0; i < displayDimensions.length; i++) { displayDimensions[i] = 900; }
    gridDimensions = new int[2]; gridDimensions[0] = 3; gridDimensions[1] = 3;
    boardExtents = int(displayDimensions[0] * 0.75); 
    gridCorner = new int[2]; gridCorner[0] = displayDimensions[0] / 2 - boardExtents / 2; gridCorner[1] = displayDimensions[1] / 2 - boardExtents / 2;
    yOffset = 70; gridCorner[1] += yOffset;
    drawIncrement = int(boardExtents / gridDimensions[0]); 
    initializeSpots(gridDimensions);
  }


//TEXT DRAWING
public void DrawHeader(){
   String HEADER = "TIC-TAC-TOE";
   int headerX = gridCorner[0] + (boardExtents / 2); int headerY = gridCorner[1] - 110; //Text Coordinates
   textSize(70); fill(0); textAlign(CENTER, CENTER); //Text Settings
   text(HEADER, headerX, headerY);
 }
 
//DISPLAY UPDATING
  public void DrawFrame(boolean b){
   fill(255); //Reset fill so everything is updated correctly each frame
   redraw();
  }

  
  
//CLICK DETECTION
boolean bMouseClickedOnGrid(int x, int y){
  return(bWithinAreaOfRectangle(x, y, gridCorner, boardExtents));
}

boolean bWithinAreaOfRectangle(int x, int y, int[] corner, int sideLength){
  if ((x >= (corner[0]) & x <= (corner[0] + sideLength) & (y >= (corner[1]) & y <= (corner[1] + sideLength)))) { return true;  }
  return false;
}

Spot SpotClickedOn(int x, int y){
  Spot clicked = new Spot();
  for (int i = 0; i < SPOTS.length; i++)
  {
    for (int j = 0; j < SPOTS.length; j++)
    {
      if (bWithinAreaOfRectangle(x, y, SPOTS[i][j].corner, drawIncrement)) {clicked = SPOTS[i][j]; break;}
    }
  }
  return clicked;
}
  
  
  
  
  
//SPOT DRAWING
  public void initializeSpots(int[] dimensions)
  {
    gridDimensions = dimensions; 
    SPOTS = new Spot[gridDimensions[0]][gridDimensions[1]];
    for (int i = 0; i < gridDimensions[0]; i++)
    {
      for (int j = 0; j < gridDimensions[1]; j++)
      {
        SPOTS[i][j] = new Spot(generateSpotCoordinate(i, j));
      }
    }
  }
 
  void DrawSpots(){
    for (int i = 0; i < gridDimensions[0]; i++)
    {
      for (int j = 0; j < gridDimensions[0]; j++)
      {
        int[] spotCoordinate = SPOTS[i][j].corner;
        square(spotCoordinate[0], spotCoordinate[1], drawIncrement); 
      }
    }
  }
  
  int[] generateSpotCoordinate(int x, int y){
    float[] initialCoordinates = {(displayDimensions[0] / 2) - (boardExtents / 2), (displayDimensions[1] / 2) - (boardExtents / 2) + yOffset};
    int[] spotCoordinate = {int(initialCoordinates[0] + x * drawIncrement), int(initialCoordinates[1] + y * drawIncrement)};
    return spotCoordinate;
  }
  
  
  
//MARK DRAWING
  public void DrawMarks(){
    Spot current;
    for (int i = 0; i < SPOTS.length * SPOTS[0].length; i++)
    {
       int x = i / 3; int y = i % 3;
       current = SPOTS[x][y]; 
       switch (current.OWNER){
         case PLAYER:
         drawEX(current.corner);
         break;
         case BOT: 
         drawCircle(current.corner);
         break;
         case NONE:
         break;
       }
    }
    
  }
  
  void drawEX(int[] coordinates ){
    int T_LeftX = coordinates[0]; int T_LeftY = coordinates[1]; int T_RightX = coordinates[0] + drawIncrement; int T_RightY = coordinates[1]; 
    int B_LeftX = coordinates[0]; int B_LeftY = coordinates[1] + drawIncrement; int B_RightX = coordinates[0] + drawIncrement; 
    int B_RightY = coordinates[1] + drawIncrement; 
    line(T_LeftX, T_LeftY, B_RightX, B_RightY);
    line(B_LeftX, B_LeftY, T_RightX, T_RightY);
  }
  
  void drawCircle(int[] coordinates){
    int halfSideLength = drawIncrement / 2;
    int x = coordinates[0] + halfSideLength; int y = coordinates[1] + halfSideLength;
    circle(x, y, drawIncrement * 0.90);
  }
}
