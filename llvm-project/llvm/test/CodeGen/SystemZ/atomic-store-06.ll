; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py UTC_ARGS: --version 4
; Test float atomic stores.
;
; RUN: llc < %s -mtriple=s390x-linux-gnu | FileCheck %s

define void @f1(ptr %src, float %val) {
; CHECK-LABEL: f1:
; CHECK:       # %bb.0:
; CHECK-NEXT:    # kill: def $f0s killed $f0s def $f0d
; CHECK-NEXT:    lgdr %r0, %f0
; CHECK-NEXT:    srlg %r0, %r0, 32
; CHECK-NEXT:    st %r0, 0(%r2)
; CHECK-NEXT:    bcr 15, %r0
; CHECK-NEXT:    br %r14
  store atomic float %val, ptr %src seq_cst, align 4
  ret void
}