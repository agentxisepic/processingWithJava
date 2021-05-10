class GameManager{
  GraphicsController graphicsController;
  Player[] players; 
  int whosTurn;
  int boardSize; 
  
  
  public GameManager(GraphicsController graphicsController){
    this.graphicsController = graphicsController;
    
    //Initalize our player objects and stick them in an array to make things easy. 
    players = new Player[2];
    Player user = new Player();
    Bot computer = new Bot();
    players[0] = user; players[1] = computer;
    whosTurn = 0; 
    boardSize = 3;
  }

//GAME LOGIC
public boolean AttemptToMarkSpot(Spot clicked){
  switch(clicked.OWNER) {
    case NONE: 
      clicked.UpdateOwner(players[whosTurn].WHO);
      graphicsController.DrawFrame(bCheckForWin());
      break;
    case BOT:
    case PLAYER:
      return false;
  }
  
  //Check for a game state change. IE did someone just win?
  //Update the game state to the next round. IE do whatever needs to be done to queue players
  return false;
}

//Make a function to check for a win state after marking a such has completed. 

//GETTERS //<>//
 public Player GetCurrentPlayer(){
   return players[whosTurn];
 }
 
 boolean bCheckForWin(){
   //Send all variation of spots belonging to a player to check if they are adjacent. 
   int[][] playerSpots = spotsBelongingToPlayer(GetCurrentPlayer());
   if (playerSpots.length <= 1) { return false; }
   int[][][] adjacentSpots = GenerateSetsOfAdjacentSpots(playerSpots);
   
   //GeneralFunctions.Print3DArray(adjacentSpots);
   return false;
 }
 
 int[][][] GenerateSetsOfAdjacentSpots(int[][] spots){
   int setLength = MathLibrary.getNumberOfUniqueCombinations(spots.length);
   int index = 0;
   int[][][] adjacentSpotPairs = new int[setLength][2][2];
   for (int i = 0; i < spots.length; i++)
   {
     for (int j = i + 1; j < spots.length; j++){
       if (bAreSpotsAdjacent(spots, i, j)){
         int[][] spotPair = {spots[i], spots[j]};
         adjacentSpotPairs[index] = spotPair;
         index++;
       }
       }
     }
    GeneralFunctions.Print3DArray(adjacentSpotPairs);
   return adjacentSpotPairs;
 }
 
 int[][][] GenerateSetsBiggerThanPairs(int[][] set, int[][] newItem, int[][][] pairs)
 {
   int[][][] setsOfN = new int[1][boardSize][2];
   for (int i = 0; i < pairs.length; i++){
     //is new item in the current pair
     //is the current pair already a part of our set? 
       //if the new item is in the current pair and not part of our set. Append the new item found to the set. 
     //If the new set length is the maximum allowed length return the new set
     //Otherwise send the new set into a call to this function. 
     
   }
   return setsOfN; 
 }
 
int[][] spotsBelongingToPlayer(Player player){
  Spot[][] currentBoardStatus = graphicsController.SPOTS;
  int[][] playerOwnedPositions = {};
  for (int i = 0; i < currentBoardStatus.length * currentBoardStatus[0].length; i++){
    int x = i % 3; int y = i / 3; 
    if (currentBoardStatus[x][y].OWNER == player.WHO) {
    int[][] newItem = {{x, y}};
    playerOwnedPositions = GeneralFunctions.ArrayAppend(playerOwnedPositions, newItem);
   }
  }
  //GeneralFunctions.Print2DArray(playerOwnedPositions);print("\n \n \n");
  //print("X: " + playerOwnedPositions[0][0] + " Y: " + playerOwnedPositions[0][1]);
  return playerOwnedPositions;
}

boolean bAreSpotsAdjacent(int[][] spots, int spotX, int spotY){
  float distance = round(MathLibrary.distanceFormula(spots[spotX][0],spots[spotY][0],spots[spotX][1],spots[spotY][1]));
  if (distance == 1) { return true; }
  return false;
}


}
