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
  // Start at address 0x1A108004

  // Place out matrixA
  
//for(int y = 0; y < MATRIX_ELEMENT; y++)
//  {
//    for (int w = 0; w < 8; w++)
//    {
//      int word = 0;
//      for (int b = 0; b < 4; b++)
//      {
//        word = word | (matrix->matrixA[y][w * 4 + b] << (b * 4));
//      }
//      addr = addr + 4;
//      *(volatile unsigned int*) (addr) = 0x04030201; //word;
//    }
//  }
  // Place out matrixB
//for(int y = 0; y < MATRIX_ELEMENT; y++)
//  {
//    for (int w = 0; w < 8; w++)
//    {
//      int word = 0;
//      for (int b = 0; b < 4; b++)
//      {
//        word = word | (matrix->matrixB[y][w * 4 + b] << (b * 4));
//      }
//      *(volatile unsigned int*) (addr) = word;
//      addr = addr + 4;
//    }
//  }
  unsigned int addr = HW_ACCELERATOR_BASE_ADDR + 4;
  *(volatile unsigned int*) (addr) = 0x04030201;
}


// Print the data that the accelerator have calculated
void
printOutData(int start)
{
  int addr = HW_ACCELERATOR_BASE_ADDR + start;
  volatile unsigned int data = *(volatile unsigned int*) (addr);
  unsigned short first = data & 0xFFFF;
  unsigned short second = data >> 16;
  printf("Address is %d and contains: \n", addr);
  printf("%d \n", first);
  printf("%d \n", second);
//
//for(int y = 0; y < MATRIX_ELEMENT; y++)
//  {
//    for(int x = 0; x < MATRIX_ELEMENT; x++)
//      {
//        volatile unsigned short data = *(volatile unsigned short*) (addr);
//        printf("%d ", data);
//        addr = addr + 2;
//      }
//    printf("\n");
//  }
//printf("\n");
}
