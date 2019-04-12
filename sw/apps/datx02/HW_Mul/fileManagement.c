#include "fileManagement.h"

void
setMatrixToZero(struct Matrises *matrix)
{
  for(int y = 0; y < MATRIX_ELEMENT; y++)
    {
      for(int x = 0; x < MATRIX_ELEMENT; x++)
	{
	  matrix->matrixA[y][x] = 0;
	  matrix->matrixB[y][x] = 0;
	}
    }
}

void
getFromFile(struct Matrises *matrix)
{
//  setMatrixToZero(matrix);
  for(int y = 0; y < 3; y++)
    {
      for(int x = 0; x < 3; x++)
	{
	  matrix->matrixA[y][x] = 2;
	  matrix->matrixB[y][x] = 3;
	}
    }
}
