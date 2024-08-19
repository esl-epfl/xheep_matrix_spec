#include "config.h"
#include "matrix_unit.h"
#include "processor.h"
#include "arith.h"

void matrixUnit_t::matrixUnit_t::reset()
{
  free(reg_file);
  RLEN = get_rlen();
  // size of register file in bytes
  reg_file = calloc(RLEN * 2 * NUM_MATRIX_REGS, 1);
}

void matrixUnit_t::matrixUnit_t::setLens(reg_t cfg) {
    // byte 0 = M
    sizeM = cfg & 0xFF;
    // byte 1 = N
    sizeM = (cfg >> 8) & 0xFF;
    // half 1 = K;
    sizeK = (cfg >> 16) & 0xFFFF;
}