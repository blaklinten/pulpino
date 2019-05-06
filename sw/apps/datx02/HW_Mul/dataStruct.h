#ifndef DATASTRUCT_H
#define DATASTRUCT_H

#include "pulpino.h"

#define MATRIX_ELEMENT 3

struct Matrises {
  // The two matrices
  unsigned char matrixA[MATRIX_ELEMENT][MATRIX_ELEMENT];
  unsigned char matrixB[MATRIX_ELEMENT][MATRIX_ELEMENT];
};

#endif
