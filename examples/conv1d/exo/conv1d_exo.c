#include "conv1d_exo.h"

#include <stdio.h>
#include <stdlib.h>

#include <stdio.h>
#include <stdlib.h>


// exo_conv1d_tile_lt_kw(
//     data : i32[4, 16] @DRAM,
//     kernels : i32[16, 4, 4] @DRAM,
//     out : i32[16, 16] @DRAM
// )
void exo_conv1d_tile_lt_kw( void *ctxt, const int32_t* data, const int32_t* kernels, int32_t* out ) {
for (int_fast32_t hi = 0; hi < 1; hi++) {
  for (int_fast32_t tile_j = 0; tile_j < 4; tile_j++) {
    #define output_tile_0 "m7"
    #define output_tile_1 "m6"
    #define output_tile_2 "m5"
    #define output_tile_3 "m4"
    asm volatile("mzero "output_tile_0);
    asm volatile("mzero "output_tile_1);
    asm volatile("mzero "output_tile_2);
    asm volatile("mzero "output_tile_3);
    for (int_fast32_t c = 0; c < 4; c++) {
      static int32_t __attribute__((section(".xheep_data_interleaved"))) y[4 * 4];
      for (int_fast32_t j = 0; j < 4; j++) {
        for (int_fast32_t r = 0; r < 4; r++) {
          y[j * 4 + r] = ((int32_t) 0);
          if (j + r + 4 * tile_j < 16) {
            y[j * 4 + r] = data[c * 16 + j + r + 4 * tile_j];
          }
        }
      }
      #define data_tile "m3"
      asm volatile("mld.w "data_tile", (%1), %0" :: "r"(4*(((struct exo_win_2i32c){ &y[0], { 4, 1 } }).strides[0])), "r"(&y[0]));
      #define kernel_tile_0 "m2"
      #define kernel_tile_1 "m1"
      #define kernel_tile_2 "m0"
      asm volatile("mld.w "kernel_tile_0", (%1), %0" :: "r"(4*(((struct exo_win_2i32c){ &kernels[(16 * hi) * (16) + (c) * 4], { 16, 1 } }).strides[0])), "r"(&kernels[(16 * hi) * (16) + (c) * 4]));
      asm volatile("mmasa.w "output_tile_0", "data_tile", "kernel_tile_0);
      asm volatile("mld.w "kernel_tile_1", (%1), %0" :: "r"(4*(((struct exo_win_2i32c){ &kernels[(4 + 16 * hi) * (16) + (c) * 4], { 16, 1 } }).strides[0])), "r"(&kernels[(4 + 16 * hi) * (16) + (c) * 4]));
      asm volatile("mmasa.w "output_tile_1", "data_tile", "kernel_tile_1);
      #undef kernel_tile_1
      asm volatile("mld.w "kernel_tile_2", (%1), %0" :: "r"(4*(((struct exo_win_2i32c){ &kernels[(8 + 16 * hi) * (16) + (c) * 4], { 16, 1 } }).strides[0])), "r"(&kernels[(8 + 16 * hi) * (16) + (c) * 4]));
      asm volatile("mmasa.w "output_tile_2", "data_tile", "kernel_tile_2);
      #undef kernel_tile_2
      asm volatile("mld.w "kernel_tile_0", (%1), %0" :: "r"(4*(((struct exo_win_2i32c){ &kernels[(12 + 16 * hi) * (16) + (c) * 4], { 16, 1 } }).strides[0])), "r"(&kernels[(12 + 16 * hi) * (16) + (c) * 4]));
      asm volatile("mmasa.w "output_tile_3", "data_tile", "kernel_tile_0);
      #undef kernel_tile_0
      #undef data_tile
    }
    asm volatile("mst.w "output_tile_0", (%1), %0" :: "r"(4*(((struct exo_win_2i32){ &out[(16 * hi) * (16) + 4 * tile_j], { 16, 1 } }).strides[0])), "r"(&out[(16 * hi) * (16) + 4 * tile_j]));
    #undef output_tile_0
    asm volatile("mst.w "output_tile_1", (%1), %0" :: "r"(4*(((struct exo_win_2i32){ &out[(4 + 16 * hi) * (16) + 4 * tile_j], { 16, 1 } }).strides[0])), "r"(&out[(4 + 16 * hi) * (16) + 4 * tile_j]));
    #undef output_tile_1
    asm volatile("mst.w "output_tile_2", (%1), %0" :: "r"(4*(((struct exo_win_2i32){ &out[(8 + 16 * hi) * (16) + 4 * tile_j], { 16, 1 } }).strides[0])), "r"(&out[(8 + 16 * hi) * (16) + 4 * tile_j]));
    #undef output_tile_2
    asm volatile("mst.w "output_tile_3", (%1), %0" :: "r"(4*(((struct exo_win_2i32){ &out[(12 + 16 * hi) * (16) + 4 * tile_j], { 16, 1 } }).strides[0])), "r"(&out[(12 + 16 * hi) * (16) + 4 * tile_j]));
    #undef output_tile_3
  }
}
}


/* relying on the following instruction..."
rvm_mld(dst,src)
asm volatile("mld.w "{dst_int}", (%1), %0" :: "r"(4*({src}.strides[0])), "r"(&{src_data}));
*/

/* relying on the following instruction..."
rvm_mmasa(md,ms1,ms2)
asm volatile("mmasa.w "{md_int}", "{ms1_int}", "{ms2_int});
*/

/* relying on the following instruction..."
rvm_mst(src,dst)
asm volatile("mst.w "{src_int}", (%1), %0" :: "r"(4*({dst}.strides[0])), "r"(&{dst_data}));
*/

/* relying on the following instruction..."
rvm_mzero(dst)
asm volatile("mzero "{dst_int});
*/
