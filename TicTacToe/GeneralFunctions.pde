static class GeneralFunctions{
 
  
  
//UTILITY
  static int[][] ArrayAppend(int[][] originalArray, int[][] itemsToAppend){
    if (bArrayEmpty(originalArray)) { return itemsToAppend; }
    int NewLengthRequired = itemsToAppend.length + originalArray.length; 
    int[][] newArray = new int[NewLengthRequired][originalArray[0].length];
    for (int i = 0; i < originalArray.length; i++){
      newArray[i] = originalArray[i]; 
    }
    for (int i = originalArray.length; i < NewLengthRequired; i++)
    {
      newArray[i] = itemsToAppend[i - originalArray.length];
    }
    return newArray;
  }
  
  
  static int[] ArrayAppend(int[] originalArray, int itemToAppend){
    if (bArrayEmpty(originalArray)) 
    { 
      int[] newArray = new int[1];
      newArray[0] = itemToAppend;
      return newArray; 
    }
    int[] newArray = new int[originalArray.length + 1]; 
    for (int i = 0; i < originalArray.length; i++)
    {
      newArray[i] = originalArray[i];
    }
    newArray[newArray.length - 1] = itemToAppend;
    return newArray;
  }
  
  static int[][] ArrayAppend(int[][] originalArray, int[] itemToAppend){
    int[][] newArray = new int[1][originalArray[0].length]; 
    if (bArrayEmpty(originalArray))
    {
      newArray[0] = itemToAppend;
      return newArray;
    }
    newArray = new int[originalArray.length + 1][originalArray[0].length]; 
    for (int i = 0; i < originalArray.length; i++)
    {
      return newArray;
    }
    return newArray;
  }
  
  
   static boolean bArraysHaveSameData(int[][] array1, int[][] array2){
     for (int i = 0; i < array1.length; i++)
     {
       int[] searchFor = array1[i];
       for (int j = 0; j < array2.length; j++)
       {
         if (bArraysHaveSameData(searchFor, array2[j]))
         {
           array2 = DeleteArrayElement(array2, j);
         }
       }
     }
     return bArrayEmpty(array2);
   }
   
   static boolean bArraysHaveSameData(int[] array1, int[] array2){
     for (int i = 0; i < array1.length; i++)
     {
       int searchFor = array1[i];
       for (int j = 0; j < array2.length; j++)
       {
         if (searchFor == array2[j])
         {
           array2 = DeleteArrayElement(array2, j);
         }
       }
     }
     return bArrayEmpty(array2);
   }
   
   
   static int[] DeleteArrayElement(int[] array, int element)
   {
     int[] newArray = new int[1]; 
     for (int i = 0; i < array.length; i++)
     {
       if (i != element) { newArray = ArrayAppend(newArray, array[i]); } 
     }
     return newArray;
   }
   
   static int[][] DeleteArrayElement(int[][] array, int element)
   {
     int[][] newArray = new int[1][array[0].length]; 
     for (int i = 0; i < array.length; i++)
     {
       if (i != element) { newArray = ArrayAppend(newArray, array[i]); } 
     }
     return newArray;
   }
  
  
  
  static boolean bArrayEmpty(int[][] array){
    if (array.length == 0) {return true;}
    return false;
  }
  static boolean bArrayEmpty(int[][][] array){
    if (array.length == 0) {return true;}
    return false;
  }
  
  static boolean bArrayEmpty(int[] array){
    if (array.length == 0) { return true; }
    return false;
  }
  
  
///DEBUGGING
static void Print2DArray(int[][] arrayToPrint)
{
  if (bArrayEmpty(arrayToPrint)) { return; }
  print("2D ARRAY PRINT\n");
  for (int i = 0; i < arrayToPrint.length; i++)
  {
    print("\n Top Layer (" + i + "): ");
    print("\n    Second Layer: " );
    for (int j = 0; j < arrayToPrint[i].length; j++)
    {
      print(arrayToPrint[i][j] + ", ");
    }
  }
  print("\n________________________________________________________________________\n");
}

static void Print2DArray(int[][] arrayToPrint, int level)
{
  if (bArrayEmpty(arrayToPrint)) { return; }
  print(arrayToPrint.length);
  for (int i = 0; i < arrayToPrint.length; i++)
  {
    print("\n    Second Layer (" + i + "): ");
    print("\n      Third Layer: " );
    for (int j = 0; j < arrayToPrint[i].length; j++)
    {
      print(arrayToPrint[i][j] + ", ");
    }
  }
  
}

static void Print3DArray(int[][][] arrayToPrint)
{
  if (bArrayEmpty(arrayToPrint)) { return; }
  print("3D ARRAY PRINT\n");
  //print("ARRAY LENGTH: " + arrayToPrint.length);
  for (int i = 0; i < arrayToPrint.length; i++){
      print("\n Top Layer (" + i + "): ");
      Print2DArray(arrayToPrint[i], 2);
  }
  print("\n________________________________________________________________________\n");
}
}
