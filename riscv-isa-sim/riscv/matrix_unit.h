#ifndef _RISCV_MATRIX_UNIT_H
#define _RISCV_MATRIX_UNIT_H

#include <array>
#include <cstdint>

#include "decode.h"
#include "csrs.h"

#define NUM_MATRIX_REGS 8

class matrixUnit_t
{
public:
  processor_t* p;
  void *reg_file;
  int sizeM, sizeK, sizeN;
  reg_t RLEN;

public:

  void reset();

  matrixUnit_t():
    p(0),
    reg_file(0),
    sizeM(4),
    sizeK(4),
    sizeN(4),
    RLEN(128)
  {}

  ~matrixUnit_t() {
    free(reg_file);
    reg_file = 0;
  }

  void setLens(reg_t cfg);

  reg_t get_rlen() { return RLEN; }
};

#endif // _RISCV_MATRIX_UNIT_H