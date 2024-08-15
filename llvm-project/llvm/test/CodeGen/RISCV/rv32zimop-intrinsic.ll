; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv32 -mattr=+experimental-zimop -verify-machineinstrs < %s \
; RUN:   | FileCheck %s -check-prefix=RV32ZIMOP

declare i32 @llvm.riscv.mopr.i32(i32 %a, i32 %b)

define i32 @mopr0_32(i32 %a) nounwind {
; RV32ZIMOP-LABEL: mopr0_32:
; RV32ZIMOP:       # %bb.0:
; RV32ZIMOP-NEXT:    mop.r.0 a0, a0
; RV32ZIMOP-NEXT:    ret
  %tmp = call i32 @llvm.riscv.mopr.i32(i32 %a, i32 0)
  ret i32 %tmp
}

define i32 @mopr31_32(i32 %a) nounwind {
; RV32ZIMOP-LABEL: mopr31_32:
; RV32ZIMOP:       # %bb.0:
; RV32ZIMOP-NEXT:    mop.r.31 a0, a0
; RV32ZIMOP-NEXT:    ret
  %tmp = call i32 @llvm.riscv.mopr.i32(i32 %a, i32 31)
  ret i32 %tmp
}

declare i32 @llvm.riscv.moprr.i32(i32 %a, i32 %b, i32 %c)

define i32 @moprr0_32(i32 %a, i32 %b) nounwind {
; RV32ZIMOP-LABEL: moprr0_32:
; RV32ZIMOP:       # %bb.0:
; RV32ZIMOP-NEXT:    mop.rr.0 a0, a0, a1
; RV32ZIMOP-NEXT:    ret
  %tmp = call i32 @llvm.riscv.moprr.i32(i32 %a, i32 %b, i32 0)
  ret i32 %tmp
}

define i32 @moprr7_32(i32 %a, i32 %b) nounwind {
; RV32ZIMOP-LABEL: moprr7_32:
; RV32ZIMOP:       # %bb.0:
; RV32ZIMOP-NEXT:    mop.rr.7 a0, a0, a1
; RV32ZIMOP-NEXT:    ret
  %tmp = call i32 @llvm.riscv.moprr.i32(i32 %a, i32 %b, i32 7)
  ret i32 %tmp
}
