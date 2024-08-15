; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple riscv32 -mattr=+m,+d,+zfh,+zvfh,+v -verify-machineinstrs < %s | FileCheck %s
; RUN: llc -mtriple riscv64 -mattr=+m,+d,+zfh,+zvfh,+v -verify-machineinstrs < %s | FileCheck %s

define <vscale x 8 x i32> @insert_nxv8i32_nxv4i32_0(<vscale x 8 x i32> %vec, <vscale x 4 x i32> %subvec) {
; CHECK-LABEL: insert_nxv8i32_nxv4i32_0:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vmv2r.v v8, v12
; CHECK-NEXT:    ret
  %v = call <vscale x 8 x i32> @llvm.vector.insert.nxv4i32.nxv8i32(<vscale x 8 x i32> %vec, <vscale x 4 x i32> %subvec, i64 0)
  ret <vscale x 8 x i32> %v
}

define <vscale x 8 x i32> @insert_nxv8i32_nxv4i32_4(<vscale x 8 x i32> %vec, <vscale x 4 x i32> %subvec) {
; CHECK-LABEL: insert_nxv8i32_nxv4i32_4:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vmv2r.v v10, v12
; CHECK-NEXT:    ret
  %v = call <vscale x 8 x i32> @llvm.vector.insert.nxv4i32.nxv8i32(<vscale x 8 x i32> %vec, <vscale x 4 x i32> %subvec, i64 4)
  ret <vscale x 8 x i32> %v
}

define <vscale x 8 x i32> @insert_nxv8i32_nxv2i32_0(<vscale x 8 x i32> %vec, <vscale x 2 x i32> %subvec) {
; CHECK-LABEL: insert_nxv8i32_nxv2i32_0:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vmv1r.v v8, v12
; CHECK-NEXT:    ret
  %v = call <vscale x 8 x i32> @llvm.vector.insert.nxv2i32.nxv8i32(<vscale x 8 x i32> %vec, <vscale x 2 x i32> %subvec, i64 0)
  ret <vscale x 8 x i32> %v
}

define <vscale x 8 x i32> @insert_nxv8i32_nxv2i32_2(<vscale x 8 x i32> %vec, <vscale x 2 x i32> %subvec) {
; CHECK-LABEL: insert_nxv8i32_nxv2i32_2:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vmv1r.v v9, v12
; CHECK-NEXT:    ret
  %v = call <vscale x 8 x i32> @llvm.vector.insert.nxv2i32.nxv8i32(<vscale x 8 x i32> %vec, <vscale x 2 x i32> %subvec, i64 2)
  ret <vscale x 8 x i32> %v
}

define <vscale x 8 x i32> @insert_nxv8i32_nxv2i32_4(<vscale x 8 x i32> %vec, <vscale x 2 x i32> %subvec) {
; CHECK-LABEL: insert_nxv8i32_nxv2i32_4:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vmv1r.v v10, v12
; CHECK-NEXT:    ret
  %v = call <vscale x 8 x i32> @llvm.vector.insert.nxv2i32.nxv8i32(<vscale x 8 x i32> %vec, <vscale x 2 x i32> %subvec, i64 4)
  ret <vscale x 8 x i32> %v
}

define <vscale x 8 x i32> @insert_nxv8i32_nxv2i32_6(<vscale x 8 x i32> %vec, <vscale x 2 x i32> %subvec) {
; CHECK-LABEL: insert_nxv8i32_nxv2i32_6:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vmv1r.v v11, v12
; CHECK-NEXT:    ret
  %v = call <vscale x 8 x i32> @llvm.vector.insert.nxv2i32.nxv8i32(<vscale x 8 x i32> %vec, <vscale x 2 x i32> %subvec, i64 6)
  ret <vscale x 8 x i32> %v
}

define <vscale x 4 x i8> @insert_nxv1i8_nxv4i8_0(<vscale x 4 x i8> %vec, <vscale x 1 x i8> %subvec) {
; CHECK-LABEL: insert_nxv1i8_nxv4i8_0:
; CHECK:       # %bb.0:
; CHECK-NEXT:    csrr a0, vlenb
; CHECK-NEXT:    srli a0, a0, 3
; CHECK-NEXT:    vsetvli zero, a0, e8, mf2, tu, ma
; CHECK-NEXT:    vmv.v.v v8, v9
; CHECK-NEXT:    ret
  %v = call <vscale x 4 x i8> @llvm.vector.insert.nxv1i8.nxv4i8(<vscale x 4 x i8> %vec, <vscale x 1 x i8> %subvec, i64 0)
  ret <vscale x 4 x i8> %v
}

define <vscale x 4 x i8> @insert_nxv1i8_nxv4i8_3(<vscale x 4 x i8> %vec, <vscale x 1 x i8> %subvec) {
; CHECK-LABEL: insert_nxv1i8_nxv4i8_3:
; CHECK:       # %bb.0:
; CHECK-NEXT:    csrr a0, vlenb
; CHECK-NEXT:    srli a0, a0, 3
; CHECK-NEXT:    slli a1, a0, 1
; CHECK-NEXT:    add a1, a1, a0
; CHECK-NEXT:    add a0, a1, a0
; CHECK-NEXT:    vsetvli zero, a0, e8, mf2, ta, ma
; CHECK-NEXT:    vslideup.vx v8, v9, a1
; CHECK-NEXT:    ret
  %v = call <vscale x 4 x i8> @llvm.vector.insert.nxv1i8.nxv4i8(<vscale x 4 x i8> %vec, <vscale x 1 x i8> %subvec, i64 3)
  ret <vscale x 4 x i8> %v
}

define <vscale x 16 x i32> @insert_nxv16i32_nxv8i32_0(<vscale x 16 x i32> %vec, <vscale x 8 x i32> %subvec) {
; CHECK-LABEL: insert_nxv16i32_nxv8i32_0:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vmv4r.v v8, v16
; CHECK-NEXT:    ret
  %v = call <vscale x 16 x i32> @llvm.vector.insert.nxv8i32.nxv16i32(<vscale x 16 x i32> %vec, <vscale x 8 x i32> %subvec, i64 0)
  ret <vscale x 16 x i32> %v
}

define <vscale x 16 x i32> @insert_nxv16i32_nxv8i32_8(<vscale x 16 x i32> %vec, <vscale x 8 x i32> %subvec) {
; CHECK-LABEL: insert_nxv16i32_nxv8i32_8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vmv4r.v v12, v16
; CHECK-NEXT:    ret
  %v = call <vscale x 16 x i32> @llvm.vector.insert.nxv8i32.nxv16i32(<vscale x 16 x i32> %vec, <vscale x 8 x i32> %subvec, i64 8)
  ret <vscale x 16 x i32> %v
}

define <vscale x 16 x i32> @insert_nxv16i32_nxv4i32_0(<vscale x 16 x i32> %vec, <vscale x 4 x i32> %subvec) {
; CHECK-LABEL: insert_nxv16i32_nxv4i32_0:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vmv2r.v v8, v16
; CHECK-NEXT:    ret
  %v = call <vscale x 16 x i32> @llvm.vector.insert.nxv4i32.nxv16i32(<vscale x 16 x i32> %vec, <vscale x 4 x i32> %subvec, i64 0)
  ret <vscale x 16 x i32> %v
}

define <vscale x 16 x i32> @insert_nxv16i32_nxv4i32_4(<vscale x 16 x i32> %vec, <vscale x 4 x i32> %subvec) {
; CHECK-LABEL: insert_nxv16i32_nxv4i32_4:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vmv2r.v v10, v16
; CHECK-NEXT:    ret
  %v = call <vscale x 16 x i32> @llvm.vector.insert.nxv4i32.nxv16i32(<vscale x 16 x i32> %vec, <vscale x 4 x i32> %subvec, i64 4)
  ret <vscale x 16 x i32> %v
}

define <vscale x 16 x i32> @insert_nxv16i32_nxv4i32_8(<vscale x 16 x i32> %vec, <vscale x 4 x i32> %subvec) {
; CHECK-LABEL: insert_nxv16i32_nxv4i32_8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vmv2r.v v12, v16
; CHECK-NEXT:    ret
  %v = call <vscale x 16 x i32> @llvm.vector.insert.nxv4i32.nxv16i32(<vscale x 16 x i32> %vec, <vscale x 4 x i32> %subvec, i64 8)
  ret <vscale x 16 x i32> %v
}

define <vscale x 16 x i32> @insert_nxv16i32_nxv4i32_12(<vscale x 16 x i32> %vec, <vscale x 4 x i32> %subvec) {
; CHECK-LABEL: insert_nxv16i32_nxv4i32_12:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vmv2r.v v14, v16
; CHECK-NEXT:    ret
  %v = call <vscale x 16 x i32> @llvm.vector.insert.nxv4i32.nxv16i32(<vscale x 16 x i32> %vec, <vscale x 4 x i32> %subvec, i64 12)
  ret <vscale x 16 x i32> %v
}

define <vscale x 16 x i32> @insert_nxv16i32_nxv2i32_0(<vscale x 16 x i32> %vec, <vscale x 2 x i32> %subvec) {
; CHECK-LABEL: insert_nxv16i32_nxv2i32_0:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vmv1r.v v8, v16
; CHECK-NEXT:    ret
  %v = call <vscale x 16 x i32> @llvm.vector.insert.nxv2i32.nxv16i32(<vscale x 16 x i32> %vec, <vscale x 2 x i32> %subvec, i64 0)
  ret <vscale x 16 x i32> %v
}

define <vscale x 16 x i32> @insert_nxv16i32_nxv2i32_2(<vscale x 16 x i32> %vec, <vscale x 2 x i32> %subvec) {
; CHECK-LABEL: insert_nxv16i32_nxv2i32_2:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vmv1r.v v9, v16
; CHECK-NEXT:    ret
  %v = call <vscale x 16 x i32> @llvm.vector.insert.nxv2i32.nxv16i32(<vscale x 16 x i32> %vec, <vscale x 2 x i32> %subvec, i64 2)
  ret <vscale x 16 x i32> %v
}

define <vscale x 16 x i32> @insert_nxv16i32_nxv2i32_4(<vscale x 16 x i32> %vec, <vscale x 2 x i32> %subvec) {
; CHECK-LABEL: insert_nxv16i32_nxv2i32_4:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vmv1r.v v10, v16
; CHECK-NEXT:    ret
  %v = call <vscale x 16 x i32> @llvm.vector.insert.nxv2i32.nxv16i32(<vscale x 16 x i32> %vec, <vscale x 2 x i32> %subvec, i64 4)
  ret <vscale x 16 x i32> %v
}

define <vscale x 16 x i32> @insert_nxv16i32_nxv2i32_6(<vscale x 16 x i32> %vec, <vscale x 2 x i32> %subvec) {
; CHECK-LABEL: insert_nxv16i32_nxv2i32_6:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vmv1r.v v11, v16
; CHECK-NEXT:    ret
  %v = call <vscale x 16 x i32> @llvm.vector.insert.nxv2i32.nxv16i32(<vscale x 16 x i32> %vec, <vscale x 2 x i32> %subvec, i64 6)
  ret <vscale x 16 x i32> %v
}

define <vscale x 16 x i32> @insert_nxv16i32_nxv2i32_8(<vscale x 16 x i32> %vec, <vscale x 2 x i32> %subvec) {
; CHECK-LABEL: insert_nxv16i32_nxv2i32_8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vmv1r.v v12, v16
; CHECK-NEXT:    ret
  %v = call <vscale x 16 x i32> @llvm.vector.insert.nxv2i32.nxv16i32(<vscale x 16 x i32> %vec, <vscale x 2 x i32> %subvec, i64 8)
  ret <vscale x 16 x i32> %v
}

define <vscale x 16 x i32> @insert_nxv16i32_nxv2i32_10(<vscale x 16 x i32> %vec, <vscale x 2 x i32> %subvec) {
; CHECK-LABEL: insert_nxv16i32_nxv2i32_10:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vmv1r.v v13, v16
; CHECK-NEXT:    ret
  %v = call <vscale x 16 x i32> @llvm.vector.insert.nxv2i32.nxv16i32(<vscale x 16 x i32> %vec, <vscale x 2 x i32> %subvec, i64 10)
  ret <vscale x 16 x i32> %v
}

define <vscale x 16 x i32> @insert_nxv16i32_nxv2i32_12(<vscale x 16 x i32> %vec, <vscale x 2 x i32> %subvec) {
; CHECK-LABEL: insert_nxv16i32_nxv2i32_12:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vmv1r.v v14, v16
; CHECK-NEXT:    ret
  %v = call <vscale x 16 x i32> @llvm.vector.insert.nxv2i32.nxv16i32(<vscale x 16 x i32> %vec, <vscale x 2 x i32> %subvec, i64 12)
  ret <vscale x 16 x i32> %v
}

define <vscale x 16 x i32> @insert_nxv16i32_nxv2i32_14(<vscale x 16 x i32> %vec, <vscale x 2 x i32> %subvec) {
; CHECK-LABEL: insert_nxv16i32_nxv2i32_14:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vmv1r.v v15, v16
; CHECK-NEXT:    ret
  %v = call <vscale x 16 x i32> @llvm.vector.insert.nxv2i32.nxv16i32(<vscale x 16 x i32> %vec, <vscale x 2 x i32> %subvec, i64 14)
  ret <vscale x 16 x i32> %v
}

define <vscale x 16 x i32> @insert_nxv16i32_nxv1i32_0(<vscale x 16 x i32> %vec, <vscale x 1 x i32> %subvec) {
; CHECK-LABEL: insert_nxv16i32_nxv1i32_0:
; CHECK:       # %bb.0:
; CHECK-NEXT:    csrr a0, vlenb
; CHECK-NEXT:    srli a0, a0, 3
; CHECK-NEXT:    vsetvli zero, a0, e32, m1, tu, ma
; CHECK-NEXT:    vmv.v.v v8, v16
; CHECK-NEXT:    ret
  %v = call <vscale x 16 x i32> @llvm.vector.insert.nxv1i32.nxv16i32(<vscale x 16 x i32> %vec, <vscale x 1 x i32> %subvec, i64 0)
  ret <vscale x 16 x i32> %v
}

define <vscale x 16 x i32> @insert_nxv16i32_nxv1i32_1(<vscale x 16 x i32> %vec, <vscale x 1 x i32> %subvec) {
; CHECK-LABEL: insert_nxv16i32_nxv1i32_1:
; CHECK:       # %bb.0:
; CHECK-NEXT:    csrr a0, vlenb
; CHECK-NEXT:    srli a0, a0, 3
; CHECK-NEXT:    add a1, a0, a0
; CHECK-NEXT:    vsetvli zero, a1, e32, m1, ta, ma
; CHECK-NEXT:    vslideup.vx v8, v16, a0
; CHECK-NEXT:    ret
  %v = call <vscale x 16 x i32> @llvm.vector.insert.nxv1i32.nxv16i32(<vscale x 16 x i32> %vec, <vscale x 1 x i32> %subvec, i64 1)
  ret <vscale x 16 x i32> %v
}

define <vscale x 16 x i32> @insert_nxv16i32_nxv1i32_6(<vscale x 16 x i32> %vec, <vscale x 1 x i32> %subvec) {
; CHECK-LABEL: insert_nxv16i32_nxv1i32_6:
; CHECK:       # %bb.0:
; CHECK-NEXT:    csrr a0, vlenb
; CHECK-NEXT:    srli a0, a0, 3
; CHECK-NEXT:    vsetvli zero, a0, e32, m1, tu, ma
; CHECK-NEXT:    vmv.v.v v11, v16
; CHECK-NEXT:    ret
  %v = call <vscale x 16 x i32> @llvm.vector.insert.nxv1i32.nxv16i32(<vscale x 16 x i32> %vec, <vscale x 1 x i32> %subvec, i64 6)
  ret <vscale x 16 x i32> %v
}

define <vscale x 16 x i8> @insert_nxv16i8_nxv1i8_0(<vscale x 16 x i8> %vec, <vscale x 1 x i8> %subvec) {
; CHECK-LABEL: insert_nxv16i8_nxv1i8_0:
; CHECK:       # %bb.0:
; CHECK-NEXT:    csrr a0, vlenb
; CHECK-NEXT:    srli a0, a0, 3
; CHECK-NEXT:    vsetvli zero, a0, e8, m1, tu, ma
; CHECK-NEXT:    vmv.v.v v8, v10
; CHECK-NEXT:    ret
  %v = call <vscale x 16 x i8> @llvm.vector.insert.nxv1i8.nxv16i8(<vscale x 16 x i8> %vec, <vscale x 1 x i8> %subvec, i64 0)
  ret <vscale x 16 x i8> %v
}

define <vscale x 16 x i8> @insert_nxv16i8_nxv1i8_1(<vscale x 16 x i8> %vec, <vscale x 1 x i8> %subvec) {
; CHECK-LABEL: insert_nxv16i8_nxv1i8_1:
; CHECK:       # %bb.0:
; CHECK-NEXT:    csrr a0, vlenb
; CHECK-NEXT:    srli a0, a0, 3
; CHECK-NEXT:    add a1, a0, a0
; CHECK-NEXT:    vsetvli zero, a1, e8, m1, tu, ma
; CHECK-NEXT:    vslideup.vx v8, v10, a0
; CHECK-NEXT:    ret
  %v = call <vscale x 16 x i8> @llvm.vector.insert.nxv1i8.nxv16i8(<vscale x 16 x i8> %vec, <vscale x 1 x i8> %subvec, i64 1)
  ret <vscale x 16 x i8> %v
}

define <vscale x 16 x i8> @insert_nxv16i8_nxv1i8_2(<vscale x 16 x i8> %vec, <vscale x 1 x i8> %subvec) {
; CHECK-LABEL: insert_nxv16i8_nxv1i8_2:
; CHECK:       # %bb.0:
; CHECK-NEXT:    csrr a0, vlenb
; CHECK-NEXT:    srli a1, a0, 3
; CHECK-NEXT:    srli a0, a0, 2
; CHECK-NEXT:    add a1, a0, a1
; CHECK-NEXT:    vsetvli zero, a1, e8, m1, tu, ma
; CHECK-NEXT:    vslideup.vx v8, v10, a0
; CHECK-NEXT:    ret
  %v = call <vscale x 16 x i8> @llvm.vector.insert.nxv1i8.nxv16i8(<vscale x 16 x i8> %vec, <vscale x 1 x i8> %subvec, i64 2)
  ret <vscale x 16 x i8> %v
}

define <vscale x 16 x i8> @insert_nxv16i8_nxv1i8_3(<vscale x 16 x i8> %vec, <vscale x 1 x i8> %subvec) {
; CHECK-LABEL: insert_nxv16i8_nxv1i8_3:
; CHECK:       # %bb.0:
; CHECK-NEXT:    csrr a0, vlenb
; CHECK-NEXT:    srli a0, a0, 3
; CHECK-NEXT:    slli a1, a0, 1
; CHECK-NEXT:    add a1, a1, a0
; CHECK-NEXT:    add a0, a1, a0
; CHECK-NEXT:    vsetvli zero, a0, e8, m1, tu, ma
; CHECK-NEXT:    vslideup.vx v8, v10, a1
; CHECK-NEXT:    ret
  %v = call <vscale x 16 x i8> @llvm.vector.insert.nxv1i8.nxv16i8(<vscale x 16 x i8> %vec, <vscale x 1 x i8> %subvec, i64 3)
  ret <vscale x 16 x i8> %v
}

define <vscale x 16 x i8> @insert_nxv16i8_nxv1i8_7(<vscale x 16 x i8> %vec, <vscale x 1 x i8> %subvec) {
; CHECK-LABEL: insert_nxv16i8_nxv1i8_7:
; CHECK:       # %bb.0:
; CHECK-NEXT:    csrr a0, vlenb
; CHECK-NEXT:    srli a1, a0, 3
; CHECK-NEXT:    sub a1, a0, a1
; CHECK-NEXT:    vsetvli zero, a0, e8, m1, ta, ma
; CHECK-NEXT:    vslideup.vx v8, v10, a1
; CHECK-NEXT:    ret
  %v = call <vscale x 16 x i8> @llvm.vector.insert.nxv1i8.nxv16i8(<vscale x 16 x i8> %vec, <vscale x 1 x i8> %subvec, i64 7)
  ret <vscale x 16 x i8> %v
}

define <vscale x 16 x i8> @insert_nxv16i8_nxv1i8_15(<vscale x 16 x i8> %vec, <vscale x 1 x i8> %subvec) {
; CHECK-LABEL: insert_nxv16i8_nxv1i8_15:
; CHECK:       # %bb.0:
; CHECK-NEXT:    csrr a0, vlenb
; CHECK-NEXT:    srli a1, a0, 3
; CHECK-NEXT:    sub a1, a0, a1
; CHECK-NEXT:    vsetvli zero, a0, e8, m1, ta, ma
; CHECK-NEXT:    vslideup.vx v9, v10, a1
; CHECK-NEXT:    ret
  %v = call <vscale x 16 x i8> @llvm.vector.insert.nxv1i8.nxv16i8(<vscale x 16 x i8> %vec, <vscale x 1 x i8> %subvec, i64 15)
  ret <vscale x 16 x i8> %v
}

define <vscale x 32 x half> @insert_nxv32f16_nxv2f16_0(<vscale x 32 x half> %vec, <vscale x 2 x half> %subvec) {
; CHECK-LABEL: insert_nxv32f16_nxv2f16_0:
; CHECK:       # %bb.0:
; CHECK-NEXT:    csrr a0, vlenb
; CHECK-NEXT:    srli a0, a0, 2
; CHECK-NEXT:    vsetvli zero, a0, e16, m1, tu, ma
; CHECK-NEXT:    vmv.v.v v8, v16
; CHECK-NEXT:    ret
  %v = call <vscale x 32 x half> @llvm.vector.insert.nxv2f16.nxv32f16(<vscale x 32 x half> %vec, <vscale x 2 x half> %subvec, i64 0)
  ret <vscale x 32 x half> %v
}

define <vscale x 32 x half> @insert_nxv32f16_nxv2f16_2(<vscale x 32 x half> %vec, <vscale x 2 x half> %subvec) {
; CHECK-LABEL: insert_nxv32f16_nxv2f16_2:
; CHECK:       # %bb.0:
; CHECK-NEXT:    csrr a0, vlenb
; CHECK-NEXT:    srli a0, a0, 2
; CHECK-NEXT:    add a1, a0, a0
; CHECK-NEXT:    vsetvli zero, a1, e16, m1, ta, ma
; CHECK-NEXT:    vslideup.vx v8, v16, a0
; CHECK-NEXT:    ret
  %v = call <vscale x 32 x half> @llvm.vector.insert.nxv2f16.nxv32f16(<vscale x 32 x half> %vec, <vscale x 2 x half> %subvec, i64 2)
  ret <vscale x 32 x half> %v
}

define <vscale x 32 x half> @insert_nxv32f16_nxv2f16_26(<vscale x 32 x half> %vec, <vscale x 2 x half> %subvec) {
; CHECK-LABEL: insert_nxv32f16_nxv2f16_26:
; CHECK:       # %bb.0:
; CHECK-NEXT:    csrr a0, vlenb
; CHECK-NEXT:    srli a0, a0, 2
; CHECK-NEXT:    add a1, a0, a0
; CHECK-NEXT:    vsetvli zero, a1, e16, m1, ta, ma
; CHECK-NEXT:    vslideup.vx v14, v16, a0
; CHECK-NEXT:    ret
  %v = call <vscale x 32 x half> @llvm.vector.insert.nxv2f16.nxv32f16(<vscale x 32 x half> %vec, <vscale x 2 x half> %subvec, i64 26)
  ret <vscale x 32 x half> %v
}

define <vscale x 32 x half> @insert_nxv32f16_undef_nxv1f16_0(<vscale x 1 x half> %subvec) {
; CHECK-LABEL: insert_nxv32f16_undef_nxv1f16_0:
; CHECK:       # %bb.0:
; CHECK-NEXT:    ret
  %v = call <vscale x 32 x half> @llvm.vector.insert.nxv1f16.nxv32f16(<vscale x 32 x half> undef, <vscale x 1 x half> %subvec, i64 0)
  ret <vscale x 32 x half> %v
}

define <vscale x 32 x half> @insert_nxv32f16_undef_nxv1f16_26(<vscale x 1 x half> %subvec) {
; CHECK-LABEL: insert_nxv32f16_undef_nxv1f16_26:
; CHECK:       # %bb.0:
; CHECK-NEXT:    csrr a0, vlenb
; CHECK-NEXT:    srli a1, a0, 3
; CHECK-NEXT:    srli a0, a0, 2
; CHECK-NEXT:    add a1, a0, a1
; CHECK-NEXT:    vsetvli zero, a1, e16, m1, ta, ma
; CHECK-NEXT:    vslideup.vx v14, v8, a0
; CHECK-NEXT:    ret
  %v = call <vscale x 32 x half> @llvm.vector.insert.nxv1f16.nxv32f16(<vscale x 32 x half> undef, <vscale x 1 x half> %subvec, i64 26)
  ret <vscale x 32 x half> %v
}

define <vscale x 32 x i1> @insert_nxv32i1_nxv8i1_0(<vscale x 32 x i1> %v, <vscale x 8 x i1> %sv) {
; CHECK-LABEL: insert_nxv32i1_nxv8i1_0:
; CHECK:       # %bb.0:
; CHECK-NEXT:    csrr a0, vlenb
; CHECK-NEXT:    srli a0, a0, 3
; CHECK-NEXT:    vsetvli zero, a0, e8, mf2, tu, ma
; CHECK-NEXT:    vmv.v.v v0, v8
; CHECK-NEXT:    ret
  %vec = call <vscale x 32 x i1> @llvm.vector.insert.nxv8i1.nxv32i1(<vscale x 32 x i1> %v, <vscale x 8 x i1> %sv, i64 0)
  ret <vscale x 32 x i1> %vec
}

define <vscale x 32 x i1> @insert_nxv32i1_nxv8i1_8(<vscale x 32 x i1> %v, <vscale x 8 x i1> %sv) {
; CHECK-LABEL: insert_nxv32i1_nxv8i1_8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    csrr a0, vlenb
; CHECK-NEXT:    srli a0, a0, 3
; CHECK-NEXT:    add a1, a0, a0
; CHECK-NEXT:    vsetvli zero, a1, e8, mf2, tu, ma
; CHECK-NEXT:    vslideup.vx v0, v8, a0
; CHECK-NEXT:    ret
  %vec = call <vscale x 32 x i1> @llvm.vector.insert.nxv8i1.nxv32i1(<vscale x 32 x i1> %v, <vscale x 8 x i1> %sv, i64 8)
  ret <vscale x 32 x i1> %vec
}

define <vscale x 4 x i1> @insert_nxv4i1_nxv1i1_0(<vscale x 4 x i1> %v, <vscale x 1 x i1> %sv) {
; CHECK-LABEL: insert_nxv4i1_nxv1i1_0:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a0, zero, e8, mf2, ta, ma
; CHECK-NEXT:    vmv.v.i v9, 0
; CHECK-NEXT:    vmerge.vim v9, v9, 1, v0
; CHECK-NEXT:    vsetvli a0, zero, e8, mf8, ta, ma
; CHECK-NEXT:    vmv.v.i v10, 0
; CHECK-NEXT:    vmv1r.v v0, v8
; CHECK-NEXT:    vmerge.vim v8, v10, 1, v0
; CHECK-NEXT:    csrr a0, vlenb
; CHECK-NEXT:    srli a0, a0, 3
; CHECK-NEXT:    vsetvli zero, a0, e8, mf2, tu, ma
; CHECK-NEXT:    vmv.v.v v9, v8
; CHECK-NEXT:    vsetvli a0, zero, e8, mf2, ta, ma
; CHECK-NEXT:    vmsne.vi v0, v9, 0
; CHECK-NEXT:    ret
  %vec = call <vscale x 4 x i1> @llvm.vector.insert.nxv1i1.nxv4i1(<vscale x 4 x i1> %v, <vscale x 1 x i1> %sv, i64 0)
  ret <vscale x 4 x i1> %vec
}

define <vscale x 4 x i1> @insert_nxv4i1_nxv1i1_2(<vscale x 4 x i1> %v, <vscale x 1 x i1> %sv) {
; CHECK-LABEL: insert_nxv4i1_nxv1i1_2:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a0, zero, e8, mf2, ta, ma
; CHECK-NEXT:    vmv.v.i v9, 0
; CHECK-NEXT:    vmerge.vim v9, v9, 1, v0
; CHECK-NEXT:    csrr a0, vlenb
; CHECK-NEXT:    srli a1, a0, 3
; CHECK-NEXT:    srli a0, a0, 2
; CHECK-NEXT:    add a1, a0, a1
; CHECK-NEXT:    vsetvli a2, zero, e8, mf8, ta, ma
; CHECK-NEXT:    vmv.v.i v10, 0
; CHECK-NEXT:    vmv1r.v v0, v8
; CHECK-NEXT:    vmerge.vim v8, v10, 1, v0
; CHECK-NEXT:    vsetvli zero, a1, e8, mf2, tu, ma
; CHECK-NEXT:    vslideup.vx v9, v8, a0
; CHECK-NEXT:    vsetvli a0, zero, e8, mf2, ta, ma
; CHECK-NEXT:    vmsne.vi v0, v9, 0
; CHECK-NEXT:    ret
  %vec = call <vscale x 4 x i1> @llvm.vector.insert.nxv1i1.nxv4i1(<vscale x 4 x i1> %v, <vscale x 1 x i1> %sv, i64 2)
  ret <vscale x 4 x i1> %vec
}

declare <vscale x 16 x i64> @llvm.vector.insert.nxv8i64.nxv16i64(<vscale x 16 x i64>, <vscale x 8 x i64>, i64)

define void @insert_nxv8i64_nxv16i64(<vscale x 8 x i64> %sv0, <vscale x 8 x i64> %sv1, ptr %out) {
; CHECK-LABEL: insert_nxv8i64_nxv16i64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vs8r.v v8, (a0)
; CHECK-NEXT:    csrr a1, vlenb
; CHECK-NEXT:    slli a1, a1, 3
; CHECK-NEXT:    add a0, a0, a1
; CHECK-NEXT:    vs8r.v v16, (a0)
; CHECK-NEXT:    ret
  %v0 = call <vscale x 16 x i64> @llvm.vector.insert.nxv8i64.nxv16i64(<vscale x 16 x i64> undef, <vscale x 8 x i64> %sv0, i64 0)
  %v = call <vscale x 16 x i64> @llvm.vector.insert.nxv8i64.nxv16i64(<vscale x 16 x i64> %v0, <vscale x 8 x i64> %sv1, i64 8)
  store <vscale x 16 x i64> %v, ptr %out
  ret void
}

define void @insert_nxv8i64_nxv16i64_lo(<vscale x 8 x i64> %sv0, ptr %out) {
; CHECK-LABEL: insert_nxv8i64_nxv16i64_lo:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vs8r.v v8, (a0)
; CHECK-NEXT:    ret
  %v = call <vscale x 16 x i64> @llvm.vector.insert.nxv8i64.nxv16i64(<vscale x 16 x i64> undef, <vscale x 8 x i64> %sv0, i64 0)
  store <vscale x 16 x i64> %v, ptr %out
  ret void
}

define void @insert_nxv8i64_nxv16i64_hi(<vscale x 8 x i64> %sv0, ptr %out) {
; CHECK-LABEL: insert_nxv8i64_nxv16i64_hi:
; CHECK:       # %bb.0:
; CHECK-NEXT:    csrr a1, vlenb
; CHECK-NEXT:    slli a1, a1, 3
; CHECK-NEXT:    add a0, a0, a1
; CHECK-NEXT:    vs8r.v v8, (a0)
; CHECK-NEXT:    ret
  %v = call <vscale x 16 x i64> @llvm.vector.insert.nxv8i64.nxv16i64(<vscale x 16 x i64> undef, <vscale x 8 x i64> %sv0, i64 8)
  store <vscale x 16 x i64> %v, ptr %out
  ret void
}

; We should be able to widen the <3 x i64> subvector to a <4 x i64> here because
; we know that the minimum vscale is 2
define <vscale x 2 x i64> @insert_nxv2i64_nxv3i64(<3 x i64> %sv) #0 {
; CHECK-LABEL: insert_nxv2i64_nxv3i64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    ret
  %vec = call <vscale x 2 x i64> @llvm.vector.insert.nxv2i64.v3i64(<vscale x 2 x i64> undef, <3 x i64> %sv, i64 0)
  ret <vscale x 2 x i64> %vec
}

; This shows a case where we were miscompiling because the index of the
; outer expects a scalable inner and the inner most subvector is fixed length.
; The code generated happens to be correct if VLEN=128, but is wrong if
; VLEN=256.
define <vscale x 8 x i32> @insert_insert_combine(<2 x i32> %subvec) {
; CHECK-LABEL: insert_insert_combine:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vmv1r.v v10, v8
; CHECK-NEXT:    ret
  %inner = call <vscale x 4 x i32> @llvm.vector.insert.nxv4i32.v2i32(<vscale x 4 x i32> undef, <2 x i32> %subvec, i64 0)
  %outer = call <vscale x 8 x i32> @llvm.vector.insert.nxv4i32.nxv8i32(<vscale x 8 x i32> undef, <vscale x 4 x i32> %inner, i64 4)
  ret <vscale x 8 x i32> %outer
}

; We can combine these two (even with non-zero index on the outer) because
; the vector must be an even multiple.
define <vscale x 8 x i32> @insert_insert_combine2(<vscale x 2 x i32> %subvec) {
; CHECK-LABEL: insert_insert_combine2:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vmv1r.v v10, v8
; CHECK-NEXT:    ret
  %inner = call <vscale x 4 x i32> @llvm.vector.insert.nxv2i32.nxv4i32(<vscale x 4 x i32> undef, <vscale x 2 x i32> %subvec, i64 0)
  %outer = call <vscale x 8 x i32> @llvm.vector.insert.nxv4i32.nxv8i32(<vscale x 8 x i32> undef, <vscale x 4 x i32> %inner, i64 4)
  ret <vscale x 8 x i32> %outer
}


attributes #0 = { vscale_range(2,1024) }

declare <vscale x 4 x i1> @llvm.vector.insert.nxv1i1.nxv4i1(<vscale x 4 x i1>, <vscale x 1 x i1>, i64)
declare <vscale x 32 x i1> @llvm.vector.insert.nxv8i1.nxv32i1(<vscale x 32 x i1>, <vscale x 8 x i1>, i64)

declare <vscale x 16 x i8> @llvm.vector.insert.nxv1i8.nxv16i8(<vscale x 16 x i8>, <vscale x 1 x i8>, i64)

declare <vscale x 32 x half> @llvm.vector.insert.nxv1f16.nxv32f16(<vscale x 32 x half>, <vscale x 1 x half>, i64)
declare <vscale x 32 x half> @llvm.vector.insert.nxv2f16.nxv32f16(<vscale x 32 x half>, <vscale x 2 x half>, i64)

declare <vscale x 4 x i8> @llvm.vector.insert.nxv1i8.nxv4i8(<vscale x 4 x i8>, <vscale x 1 x i8>, i64 %idx)

declare <vscale x 4 x i32> @llvm.vector.insert.nxv2i32.nxv4i32(<vscale x 4 x i32>, <vscale x 2 x i32>, i64)
declare <vscale x 4 x i32> @llvm.vector.insert.nxv4i32.v2i32(<vscale x 4 x i32>, <2 x i32>, i64)

declare <vscale x 8 x i32> @llvm.vector.insert.nxv2i32.nxv8i32(<vscale x 8 x i32>, <vscale x 2 x i32>, i64 %idx)
declare <vscale x 8 x i32> @llvm.vector.insert.nxv4i32.nxv8i32(<vscale x 8 x i32>, <vscale x 4 x i32>, i64 %idx)

declare <vscale x 16 x i32> @llvm.vector.insert.nxv1i32.nxv16i32(<vscale x 16 x i32>, <vscale x 1 x i32>, i64 %idx)
declare <vscale x 16 x i32> @llvm.vector.insert.nxv2i32.nxv16i32(<vscale x 16 x i32>, <vscale x 2 x i32>, i64 %idx)
declare <vscale x 16 x i32> @llvm.vector.insert.nxv4i32.nxv16i32(<vscale x 16 x i32>, <vscale x 4 x i32>, i64 %idx)
declare <vscale x 16 x i32> @llvm.vector.insert.nxv8i32.nxv16i32(<vscale x 16 x i32>, <vscale x 8 x i32>, i64 %idx)

declare <vscale x 2 x i64> @llvm.vector.insert.nxv2i64.v3i64(<vscale x 2 x i64>, <3 x i64>, i64 %idx)