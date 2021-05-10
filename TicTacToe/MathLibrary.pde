static class MathLibrary{
  public static boolean bAreThePointsCoLinear(int[][] pointsToCheck){
    float[] slopes = new float[getNumberOfUniqueCombinations(pointsToCheck.length)];
    int index = 0; 
    float sum = 0; 
    for (int i = 0; i < pointsToCheck.length; i++){
      for (int j = i + 1; j < pointsToCheck.length; j++){
        float slope = getSlopeOfPoints(pointsToCheck[i][1], pointsToCheck[j][1], pointsToCheck[i][0], pointsToCheck[j][0]);
        slopes[index] = getSlopeOfPoints(pointsToCheck[i][1], pointsToCheck[j][1], pointsToCheck[i][0], pointsToCheck[j][0]);
        index++;
      }
    }
    
    for (int i = 0; i < slopes.length; i++)
    {
      sum += slopes[i];
    }
    
    if (sum / slopes.length == slopes[0]) { return true;}
    return false;
  }
  
  

  static float getSlopeOfPoints(int x1, int x2, int y1, int y2){
    float denominator = x2 - x1; 
    if (denominator == 0) { return -6969; }
    float slope = (y2 - y1) / (x2 - x1);
    return slope;
  }

  static int getNumberOfUniqueCombinations(int n){ return n * (n - 1) / 2;  }
  
  static float distanceFormula(int x1, int x2, int y1, int y2){ return sqrt(sq(x2 - x1) + sq(y2 - y1));}

}
