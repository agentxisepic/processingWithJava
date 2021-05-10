class Bot extends Player{
  
 
//CONSTRUCTOR
  public Bot(){
    WHO = owner.BOT;
  }


//AI FUNCTIONS

public void TakeTurn(){
//Check to see if the player is in a winning position
//Based on difficulty level selected make a random choice to either block the player or "not realize". IE the more difficult the more likely it is that the AI will choose to block the player. 
//Send choice to the input handler to do its input handling things. 
}

public int[] bShouldBlockPlayer(){
  //Will return an array where the first integer can be interpreted as a boolean to decide whether or not there is a reason to block the player from a winning play. 
  //The second and third integer in the array will be the 2D array coordinates to the Spot to place a mark in order to stop the player from winning. 
  int[] placeholder = {0, 0};
  return placeholder;
}
}
