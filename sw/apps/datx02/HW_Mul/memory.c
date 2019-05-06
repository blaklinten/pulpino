#include "memory.h"

/*    -- STRUCTURE OF DATA --
 *  MATRIX_A   0x100001 -> 0x100400
 *  MATRIX_B 8  0x100401 -> 0x100800
 *  MATRIX_ANS 0x100801 -> 0x100C00
 */
// ^ NOT ANYMORE!!! ^

// Take the struct containing the values and place it in memory
void
placeDataInMemory(struct Matrises *matrix)
{
  // This whole process can be optimized if we read
  // one word from memory instead of 4 reads per word.
  // If there is time... 
    
    
  // start address of input matrix A in accelerator
  // one word in from BASE_ADDR
  unsigned int addr = HW_ACCELERATOR_BASE_ADDR + 4;

  // Start with matrix A:
  // for each row in matrix; do
  for(int y = 0; y < MATRIX_ELEMENT; y++)
  {
    // for each word in row; do
    for (int w = 0; w < MATRIX_ELEMENT / 4; w++)
    {
      int word = 0;
      // for each byte in word; do
      for (int b = 0; b < 4; b++)
      {
        // add next byte to the word
        // by SHIFT:ing and OR:ing
        word = word | (matrix->matrixA[y][w * 4 + b] << (b * 8));
      }
      // write word to accelerator
      *(volatile unsigned int*) (addr) = word;
      // inc addr to next word
      addr = addr + 4;
    }
  }

  // Same for matrix B
  // for each row in matrix; do
  for(int y = 0; y < MATRIX_ELEMENT; y++)
  {
    // for each word in row; do
    for (int w = 0; w < MATRIX_ELEMENT / 4; w++)
    {
      int word = 0;
      // for each byte in word; do
      for (int b = 0; b < 4; b++)
      {
        // add next byte to the word
        // by SHIFT:ing and OR:ing
        word = word | (matrix->matrixB[y][w * 4 + b] << (b * 8));
      }
      // write word to accelerator
      *(volatile unsigned int*) (addr) = word;
      // inc addr to next word
      addr = addr + 4;
    }
  }
}


// Print the data that the accelerator have calculated
void
printOutData(int start)
{
  // Find address to start printing from
  int addr = HW_ACCELERATOR_BASE_ADDR + start;

  for(int i = 0; i < 4; i++){
    for(int i = 0; i < 2; i++){
      // Read a word from this address
      volatile unsigned int data = *(volatile unsigned int*) (addr);

      // Extract the two half word (short)
      unsigned short first = data & 0xFFFF;
      unsigned short second = data >> 16;

      // Print the two half words (shorts)
      printf("%d ", first);
      printf("%d ", second);
      // Increment addr to point to next int
      addr = addr + 4;
    }
    printf("\n");
  }
  printf("\n");
}
