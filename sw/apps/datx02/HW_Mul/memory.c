#include "memory.h"

/*    -- STRUCTURE OF DATA --
 *  MATRIX_A   0x100001 -> 0x100400
 *  MATRIX_B   0x100401 -> 0x100800
 *  MATRIX_ANS 0x100801 -> 0x100C00
 */

// Take the struct containing the values and place it in memory
void
placeDataInMemory(struct Matrises *matrix)
{
  // Start at address 0x100001
  unsigned int addr = DATA_RAM_BASE_ADDR + 1;

  // Place out matrixA
  
  for(int y = 0; y < MATRIX_ELEMENT; y++)
    {
      for(int x = 0; x < MATRIX_ELEMENT; x++)
	{
	  *(volatile unsigned char*) (addr) = matrix->matrixA[y][x];
	  addr++;
	}
    }
  /*
  // Place out matrixB
  for(int y = 0; y < MATRIX_ELEMENT; y++)
    {
      for(int x = 0; x < MATRIX_ELEMENT; x++)
	{
	  *(volatile unsigned char*) (addr) = matrix->matrixB[y][x];
	  addr++;
	}
    }
  */
}

// Print the data that the accelerator have calculated
void
printOutData(int start)
{
  int addr = DATA_RAM_BASE_ADDR + start;
  
  for(int y = 0; y < MATRIX_ELEMENT; y++)
    {
      for(int x = 0; x < MATRIX_ELEMENT; x++)
	{
	  volatile unsigned char data = *(volatile unsigned char*) (addr);
	  printf("%d ", data);
	  addr++;
	}
      printf("\n");
    }
}

// Test function
void
testGetData()
{
  *(volatile int*) (DATA_RAM_BASE_ADDR) = 2;
  volatile int a = *(volatile int*) (DATA_RAM_BASE_ADDR);
  printf("Value: %d\n", a);
  //int test = 2;
  //printf("%d\n", test);
  //printf("%p\n", &test);
}
