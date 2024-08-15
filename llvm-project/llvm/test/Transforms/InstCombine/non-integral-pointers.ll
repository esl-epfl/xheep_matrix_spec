; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -passes=instcombine -S < %s | FileCheck %s

target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128-ni:4"
target triple = "x86_64-unknown-linux-gnu"

define ptr addrspace(4) @f_0() {
; CHECK-LABEL: @f_0(
; CHECK-NEXT:    ret ptr addrspace(4) getelementptr (i8, ptr addrspace(4) null, i64 50)
;
  %result = getelementptr i8, ptr addrspace(4) null, i64 50
  ret ptr addrspace(4) %result
}

define ptr addrspace(3) @f_1() {
; inttoptr is fine here since addrspace(3) is integral.
; CHECK-LABEL: @f_1(
; CHECK-NEXT:    ret ptr addrspace(3) inttoptr (i64 50 to ptr addrspace(3))
;
  %result = getelementptr i8, ptr addrspace(3) null, i64 50
  ret ptr addrspace(3) %result
}

define void @f_2(ptr %ptr0, ptr %ptr1) {
; It is not okay to convert the load/store pair to load and store
; integers, since pointers in address space 4 are non-integral.
; CHECK-LABEL: @f_2(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[VAL:%.*]] = load ptr addrspace(4), ptr [[PTR0:%.*]], align 8
; CHECK-NEXT:    store ptr addrspace(4) [[VAL]], ptr [[PTR1:%.*]], align 8
; CHECK-NEXT:    ret void
;
entry:
  %val = load ptr addrspace(4), ptr %ptr0
  store ptr addrspace(4) %val, ptr %ptr1
  ret void
}

define void @f_3(ptr %ptr0, ptr %ptr1) {
; It *is* okay to convert the load/store pair to load and store
; integers, since pointers in address space 3 are integral.
; CHECK-LABEL: @f_3(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[VAL:%.*]] = load ptr addrspace(3), ptr [[PTR0:%.*]], align 8
; CHECK-NEXT:    store ptr addrspace(3) [[VAL]], ptr [[PTR1:%.*]], align 8
; CHECK-NEXT:    ret void
;
entry:
  %val = load ptr addrspace(3), ptr %ptr0
  store ptr addrspace(3) %val, ptr %ptr1
  ret void
}

define i64 @g(ptr %gp) {
; CHECK-LABEL: @g(
; CHECK-NEXT:    [[DOTPRE:%.*]] = load ptr addrspace(4), ptr [[GP:%.*]], align 8
; CHECK-NEXT:    [[V74:%.*]] = call ptr addrspace(4) @alloc()
; CHECK-NEXT:    [[V75:%.*]] = addrspacecast ptr addrspace(4) [[V74]] to ptr
; CHECK-NEXT:    [[V77:%.*]] = getelementptr i8, ptr [[V75]], i64 -8
; CHECK-NEXT:    store ptr addrspace(4) [[DOTPRE]], ptr [[V77]], align 8
; CHECK-NEXT:    [[V81:%.*]] = load i64, ptr [[V77]], align 8
; CHECK-NEXT:    ret i64 [[V81]]
;
  %.pre = load ptr addrspace(4), ptr %gp, align 8
  %v74 = call ptr addrspace(4) @alloc()
  %v75 = addrspacecast ptr addrspace(4) %v74 to ptr
  %v77 = getelementptr ptr addrspace(4), ptr %v75, i64 -1
  store ptr addrspace(4) %.pre, ptr %v77, align 8
  %v81 = load i64, ptr %v77, align 8
  ret i64 %v81
}

define i64 @g2(ptr addrspace(4) %gp) {
; CHECK-LABEL: @g2(
; CHECK-NEXT:    [[DOTPRE:%.*]] = load ptr, ptr addrspace(4) [[GP:%.*]], align 8
; CHECK-NEXT:    [[V74:%.*]] = call ptr addrspace(4) @alloc()
; CHECK-NEXT:    [[V77:%.*]] = getelementptr i8, ptr addrspace(4) [[V74]], i64 -8
; CHECK-NEXT:    store ptr [[DOTPRE]], ptr addrspace(4) [[V77]], align 8
; CHECK-NEXT:    [[V81_CAST:%.*]] = ptrtoint ptr [[DOTPRE]] to i64
; CHECK-NEXT:    ret i64 [[V81_CAST]]
;
  %.pre = load ptr, ptr addrspace(4) %gp, align 8
  %v74 = call ptr addrspace(4) @alloc()
  %v77 = getelementptr ptr, ptr addrspace(4) %v74, i64 -1
  store ptr %.pre, ptr addrspace(4) %v77, align 8
  %v81 = load i64, ptr addrspace(4) %v77, align 8
  ret i64 %v81
}

declare ptr addrspace(4) @alloc()

define i64 @f_4(ptr addrspace(4) %v0) {
; CHECK-LABEL: @f_4(
; CHECK-NEXT:    [[V6:%.*]] = call i64 @f_5(ptr addrspace(4) [[V0:%.*]])
; CHECK-NEXT:    ret i64 [[V6]]
;
  %v6 = call i64 @f_5(ptr addrspace(4) %v0)
  ret i64 %v6
}

declare i64 @f_5(i64)