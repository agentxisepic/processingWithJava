class Spot{
  owner OWNER;
  int[] corner;
  
  
//CONSTRUCTORS
  public Spot(int[] Corner){
    OWNER = owner.NONE;
    corner = Corner; 
  }
  
  public Spot(){
    corner = new int[3];
  }
  
//SETTERS
  public void UpdateOwner(owner newOwner){ OWNER = newOwner;}
}




public enum owner{
  PLAYER,
  BOT,
  NONE
}
