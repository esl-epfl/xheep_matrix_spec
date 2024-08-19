#ifndef _RISCV_MATRIX_EXT_MACROS_H
#define _RISCV_MATRIX_EXT_MACROS_H

#include "matrix_unit.h"

#define M_ST(elt_width) \
  require_extension(EXT_XMATRIX); \
  const reg_t baseAddr = RS1; \
  const reg_t stride = RS2; \
  const reg_t ms3 = insn.matrix_md_ms3(); \
  const size_t reg_size = P.MU.get_rlen() * 2; \
  const size_t elt_size = sizeof(elt_width ## _t); \
  auto source_reg = (elt_width##_t*)((uint8_t*)P.MU.reg_file + ms3 * reg_size); \
  for (int i = 0; i < P.MU.sizeM; i++) { \
    for (int j = 0; j < P.MU.sizeK; j++) { \
      auto val = source_reg[i*P.MU.sizeK + j]; \
      MMU.store<elt_width##_t>(baseAddr + i*stride + j*elt_size, val); \
      /*printf("mem[%d + %d]=%f\n", baseAddr, i*stride+j, val); \*/ \
    } \
  } 

#define M_LD(elt_width) \
  require_extension(EXT_XMATRIX); \
  const reg_t baseAddr = RS1; \
  const reg_t stride = RS2; \
  const reg_t md = insn.matrix_md_ms3(); \
  const size_t reg_size = P.MU.get_rlen() * 2; \
  const size_t elt_size = sizeof(elt_width ## _t); \
  auto dest_reg = (elt_width##_t*)((uint8_t*)P.MU.reg_file + md * reg_size); \
  for (int i = 0; i < P.MU.sizeM; i++) { \
    for (int j = 0; j < P.MU.sizeK; j++) { \
      auto val = MMU.load<elt_width##_t>(baseAddr + i*stride + j*elt_size); \
      dest_reg[i*P.MU.sizeK + j] = val; \
      /*printf("reg[%d] = %x\n", stride, i*P.MU.sizeK + j, val);\*/ \
    } \
  } 

#define M_MMA(op_dtype, acc_dtype) \
  require_extension(EXT_XMATRIX); \
  const reg_t ms1 = insn.matrix_ms1(); \
  const reg_t ms2 = insn.matrix_ms2(); \
  const reg_t md = insn.matrix_md(); \
  const size_t reg_size = P.MU.get_rlen() * 2; \
  auto ms1_reg = (op_dtype*)((uint8_t*)P.MU.reg_file + ms1 * reg_size); \
  auto ms2_reg = (op_dtype*)((uint8_t*)P.MU.reg_file + ms2 * reg_size); \
  auto md_reg = (acc_dtype*)((uint8_t*)P.MU.reg_file + md * reg_size); \
  for (int i = 0; i < P.MU.sizeM; i++) { \
      for (int j = 0; j < P.MU.sizeN; j++) { \
          auto temp = md_reg[i*P.MU.sizeN + j]; \
          auto K_LEN = (P.MU.sizeK*4)/(sizeof(op_dtype));\
          for (int k = 0; k < K_LEN; k++) { \
              /*printf("%d %d %f %f\n", i*P.MU.sizeK + k, j*P.MU.sizeK + k, ms1_reg[i*P.MU.sizeK + k], ms2_reg[j*P.MU.sizeK + k]);*/\
              temp += ms1_reg[i*K_LEN + k] * ms2_reg[j*K_LEN + k]; \
          } \
          md_reg[i*P.MU.sizeN + j] = temp; \
      } \
  }
#endif // _RISCV_MATRIX_EXT_MACROS_H