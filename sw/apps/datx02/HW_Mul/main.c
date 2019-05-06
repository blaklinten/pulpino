/*
 *  ___  ___  ___       __           ________  ________  ________  _______   ___       _______   ________  ________  _________  ________  ________     
 * |\  \|\  \|\  \     |\  \        |\   __  \|\   ____\|\   ____\|\  ___ \ |\  \     |\  ___ \ |\   __  \|\   __  \|\___   ___\\   __  \|\   __  \    
 * \ \  \\\  \ \  \    \ \  \       \ \  \|\  \ \  \___|\ \  \___|\ \   __/|\ \  \    \ \   __/|\ \  \|\  \ \  \|\  \|___ \  \_\ \  \|\  \ \  \|\  \   
 *  \ \   __  \ \  \  __\ \  \       \ \   __  \ \  \    \ \  \    \ \  \_|/_\ \  \    \ \  \_|/_\ \   _  _\ \   __  \   \ \  \ \ \  \\\  \ \   _  _\  
 *   \ \  \ \  \ \  \|\__\_\  \       \ \  \ \  \ \  \____\ \  \____\ \  \_|\ \ \  \____\ \  \_|\ \ \  \\  \\ \  \ \  \   \ \  \ \ \  \\\  \ \  \\  \| 
 *    \ \__\ \__\ \____________\       \ \__\ \__\ \_______\ \_______\ \_______\ \_______\ \_______\ \__\\ _\\ \__\ \__\   \ \__\ \ \_______\ \__\\ _\ 
 *     \|__|\|__|\|____________|        \|__|\|__|\|_______|\|_______|\|_______|\|_______|\|_______|\|__|\|__|\|__|\|__|    \|__|  \|_______|\|__|\|__|
 *
 */
 
#include <stdio.h>
#include <string.h>

#include "fileManagement.h"
#include "memory.h"

/*
void
printHelp()
{
  printf("Usage:\n\thwmul -f [FILENAME 1] [FILENAME 2]\n\tOptional: -t => Calculate the time it takes\n");
}
*/

void
runAccelerator(void)
{
  unsigned int addr = HW_ACCELERATOR_BASE_ADDR;

  *(volatile unsigned char*) (addr) = 1;
}

int
main(int argc, char *argv[])
{
  char* Done = "Done!\n";
  struct Matrises matrix;

  getFromFile(&matrix);
  
  // Place matrixA and matrixB in memory
  placeDataInMemory(&matrix);
  
  // TODO: Run the accelerator
//  runAccelerator();
  
  // Print out the resulting data from memory
    printOutData(4);
//  adamsWay(&matrix);

  //testGetData();

  printf("%s", Done);
  
  return 0;
}
