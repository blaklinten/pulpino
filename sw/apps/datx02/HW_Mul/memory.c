#include "memory.h"

/*    -- STRUCTURE OF DATA --
 *  MATRIX_A   0x100001 -> 0x100400
 *  MATRIX_B   0x100401 -> 0x100800
 *  MATRIX_ANS 0x100801 -> 0x100C00
 */
// ^ NOT ANYMORE!!! ^

// Take the struct containing the values and place it in memory
void
placeDataInMemory(struct Matrises *matrix)
{
  // Start at address 0x1A108001
  unsigned int addr = HW_ACCELERATOR_BASE_ADDR + 1;

  // Place out matrixA
  
  for(int y = 0; y < MATRIX_ELEMENT; y++)
    {
      for(int x = 0; x < MATRIX_ELEMENT; x++)
	{
	  *(volatile unsigned char*) (addr) = matrix->matrixA[y][x];
	  addr++;
	}
    }
  // Place out matrixB
  for(int y = 0; y < MATRIX_ELEMENT; y++)
    {
      for(int x = 0; x < MATRIX_ELEMENT; x++)
	{
	  *(volatile unsigned char*) (addr) = matrix->matrixB[y][x];
	  addr++;
	}
    }
}

void
adamsWay(struct Matrises *matrix)
{
  unsigned int addr = HW_ACCELERATOR_BASE_ADDR;
  unsigned int word = 0x05060701;

  *(volatile unsigned int*) (addr) = word;
  *(volatile unsigned int*) (addr + 4) = word;
  *(volatile unsigned int*) (addr + 1024) = word;
  *(volatile unsigned int*) (addr + 1028) = word;
}

// Print the data that the accelerator have calculated
void
printOutData(int start)
{
  int addr = HW_ACCELERATOR_BASE_ADDR + start;
  
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
  printf("\n");
}
