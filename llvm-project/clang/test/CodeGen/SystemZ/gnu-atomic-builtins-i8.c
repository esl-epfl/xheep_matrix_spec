// NOTE: Assertions have been autogenerated by utils/update_cc_test_checks.py
// RUN: %clang_cc1 -triple s390x-linux-gnu -O1 -emit-llvm %s -o - | FileCheck %s
//
// Test GNU atomic builtins for int8_t.

#include <stdatomic.h>
#include <stdint.h>

// CHECK-LABEL: @f1(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = load atomic i8, ptr [[PTR:%.*]] seq_cst, align 1
// CHECK-NEXT:    ret i8 [[TMP0]]
//
int8_t f1(int8_t *Ptr) {
  return __atomic_load_n(Ptr, memory_order_seq_cst);
}

// CHECK-LABEL: @f2(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = load atomic i8, ptr [[PTR:%.*]] seq_cst, align 1
// CHECK-NEXT:    store i8 [[TMP0]], ptr [[RET:%.*]], align 1
// CHECK-NEXT:    ret i8 [[TMP0]]
//
int8_t f2(int8_t *Ptr, int8_t *Ret) {
  __atomic_load(Ptr, Ret, memory_order_seq_cst);
  return *Ret;
}

// CHECK-LABEL: @f3(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    store atomic i8 [[VAL:%.*]], ptr [[PTR:%.*]] seq_cst, align 1
// CHECK-NEXT:    ret void
//
void f3(int8_t *Ptr, int8_t Val) {
  __atomic_store_n(Ptr, Val, memory_order_seq_cst);
}

// CHECK-LABEL: @f4(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = load i8, ptr [[VAL:%.*]], align 1
// CHECK-NEXT:    store atomic i8 [[TMP0]], ptr [[PTR:%.*]] seq_cst, align 1
// CHECK-NEXT:    ret void
//
void f4(int8_t *Ptr, int8_t *Val) {
  __atomic_store(Ptr, Val, memory_order_seq_cst);
}

// CHECK-LABEL: @f5(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = atomicrmw xchg ptr [[PTR:%.*]], i8 [[VAL:%.*]] seq_cst, align 1
// CHECK-NEXT:    ret i8 [[TMP0]]
//
int8_t f5(int8_t *Ptr, int8_t Val) {
  return __atomic_exchange_n(Ptr, Val, memory_order_seq_cst);
}

// CHECK-LABEL: @f6(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = load i8, ptr [[VAL:%.*]], align 1
// CHECK-NEXT:    [[TMP1:%.*]] = atomicrmw xchg ptr [[PTR:%.*]], i8 [[TMP0]] seq_cst, align 1
// CHECK-NEXT:    store i8 [[TMP1]], ptr [[RET:%.*]], align 1
// CHECK-NEXT:    ret i8 [[TMP1]]
//
int8_t f6(int8_t *Ptr, int8_t *Val, int8_t *Ret) {
  __atomic_exchange(Ptr, Val, Ret, memory_order_seq_cst);
  return *Ret;
}

// CHECK-LABEL: @f7(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = load i8, ptr [[EXP:%.*]], align 1
// CHECK-NEXT:    [[TMP1:%.*]] = cmpxchg ptr [[PTR:%.*]], i8 [[TMP0]], i8 [[DES:%.*]] seq_cst seq_cst, align 1
// CHECK-NEXT:    [[TMP2:%.*]] = extractvalue { i8, i1 } [[TMP1]], 1
// CHECK-NEXT:    br i1 [[TMP2]], label [[CMPXCHG_CONTINUE:%.*]], label [[CMPXCHG_STORE_EXPECTED:%.*]]
// CHECK:       cmpxchg.store_expected:
// CHECK-NEXT:    [[TMP3:%.*]] = extractvalue { i8, i1 } [[TMP1]], 0
// CHECK-NEXT:    store i8 [[TMP3]], ptr [[EXP]], align 1
// CHECK-NEXT:    br label [[CMPXCHG_CONTINUE]]
// CHECK:       cmpxchg.continue:
// CHECK-NEXT:    ret i1 [[TMP2]]
//
_Bool f7(int8_t *Ptr, int8_t *Exp, int8_t Des) {
  return __atomic_compare_exchange_n(Ptr, Exp, Des, 0,
                                     memory_order_seq_cst, memory_order_seq_cst);
}

// CHECK-LABEL: @f8(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = load i8, ptr [[EXP:%.*]], align 1
// CHECK-NEXT:    [[TMP1:%.*]] = load i8, ptr [[DES:%.*]], align 1
// CHECK-NEXT:    [[TMP2:%.*]] = cmpxchg ptr [[PTR:%.*]], i8 [[TMP0]], i8 [[TMP1]] seq_cst seq_cst, align 1
// CHECK-NEXT:    [[TMP3:%.*]] = extractvalue { i8, i1 } [[TMP2]], 1
// CHECK-NEXT:    br i1 [[TMP3]], label [[CMPXCHG_CONTINUE:%.*]], label [[CMPXCHG_STORE_EXPECTED:%.*]]
// CHECK:       cmpxchg.store_expected:
// CHECK-NEXT:    [[TMP4:%.*]] = extractvalue { i8, i1 } [[TMP2]], 0
// CHECK-NEXT:    store i8 [[TMP4]], ptr [[EXP]], align 1
// CHECK-NEXT:    br label [[CMPXCHG_CONTINUE]]
// CHECK:       cmpxchg.continue:
// CHECK-NEXT:    ret i1 [[TMP3]]
//
_Bool f8(int8_t *Ptr, int8_t *Exp, int8_t *Des) {
  return __atomic_compare_exchange(Ptr, Exp, Des, 0,
                                   memory_order_seq_cst, memory_order_seq_cst);
}

// CHECK-LABEL: @f9(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = atomicrmw add ptr [[PTR:%.*]], i8 [[VAL:%.*]] seq_cst, align 1
// CHECK-NEXT:    [[TMP1:%.*]] = add i8 [[TMP0]], [[VAL]]
// CHECK-NEXT:    ret i8 [[TMP1]]
//
int8_t f9(int8_t *Ptr, int8_t Val) {
  return __atomic_add_fetch(Ptr, Val, memory_order_seq_cst);
}

// CHECK-LABEL: @f10(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = atomicrmw sub ptr [[PTR:%.*]], i8 [[VAL:%.*]] seq_cst, align 1
// CHECK-NEXT:    [[TMP1:%.*]] = sub i8 [[TMP0]], [[VAL]]
// CHECK-NEXT:    ret i8 [[TMP1]]
//
int8_t f10(int8_t *Ptr, int8_t Val) {
  return __atomic_sub_fetch(Ptr, Val, memory_order_seq_cst);
}

// CHECK-LABEL: @f11(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = atomicrmw and ptr [[PTR:%.*]], i8 [[VAL:%.*]] seq_cst, align 1
// CHECK-NEXT:    [[TMP1:%.*]] = and i8 [[TMP0]], [[VAL]]
// CHECK-NEXT:    ret i8 [[TMP1]]
//
int8_t f11(int8_t *Ptr, int8_t Val) {
  return __atomic_and_fetch(Ptr, Val, memory_order_seq_cst);
}

// CHECK-LABEL: @f12(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = atomicrmw xor ptr [[PTR:%.*]], i8 [[VAL:%.*]] seq_cst, align 1
// CHECK-NEXT:    [[TMP1:%.*]] = xor i8 [[TMP0]], [[VAL]]
// CHECK-NEXT:    ret i8 [[TMP1]]
//
int8_t f12(int8_t *Ptr, int8_t Val) {
  return __atomic_xor_fetch(Ptr, Val, memory_order_seq_cst);
}

// CHECK-LABEL: @f13(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = atomicrmw or ptr [[PTR:%.*]], i8 [[VAL:%.*]] seq_cst, align 1
// CHECK-NEXT:    [[TMP1:%.*]] = or i8 [[TMP0]], [[VAL]]
// CHECK-NEXT:    ret i8 [[TMP1]]
//
int8_t f13(int8_t *Ptr, int8_t Val) {
  return __atomic_or_fetch(Ptr, Val, memory_order_seq_cst);
}

// CHECK-LABEL: @f14(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = atomicrmw nand ptr [[PTR:%.*]], i8 [[VAL:%.*]] seq_cst, align 1
// CHECK-NEXT:    [[TMP1:%.*]] = and i8 [[TMP0]], [[VAL]]
// CHECK-NEXT:    [[TMP2:%.*]] = xor i8 [[TMP1]], -1
// CHECK-NEXT:    ret i8 [[TMP2]]
//
int8_t f14(int8_t *Ptr, int8_t Val) {
  return __atomic_nand_fetch(Ptr, Val, memory_order_seq_cst);
}

// CHECK-LABEL: @f15(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = atomicrmw add ptr [[PTR:%.*]], i8 [[VAL:%.*]] seq_cst, align 1
// CHECK-NEXT:    ret i8 [[TMP0]]
//
int8_t f15(int8_t *Ptr, int8_t Val) {
  return __atomic_fetch_add(Ptr, Val, memory_order_seq_cst);
}

// CHECK-LABEL: @f16(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = atomicrmw sub ptr [[PTR:%.*]], i8 [[VAL:%.*]] seq_cst, align 1
// CHECK-NEXT:    ret i8 [[TMP0]]
//
int8_t f16(int8_t *Ptr, int8_t Val) {
  return __atomic_fetch_sub(Ptr, Val, memory_order_seq_cst);
}

// CHECK-LABEL: @f17(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = atomicrmw and ptr [[PTR:%.*]], i8 [[VAL:%.*]] seq_cst, align 1
// CHECK-NEXT:    ret i8 [[TMP0]]
//
int8_t f17(int8_t *Ptr, int8_t Val) {
  return __atomic_fetch_and(Ptr, Val, memory_order_seq_cst);
}

// CHECK-LABEL: @f18(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = atomicrmw xor ptr [[PTR:%.*]], i8 [[VAL:%.*]] seq_cst, align 1
// CHECK-NEXT:    ret i8 [[TMP0]]
//
int8_t f18(int8_t *Ptr, int8_t Val) {
  return __atomic_fetch_xor(Ptr, Val, memory_order_seq_cst);
}

// CHECK-LABEL: @f19(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = atomicrmw or ptr [[PTR:%.*]], i8 [[VAL:%.*]] seq_cst, align 1
// CHECK-NEXT:    ret i8 [[TMP0]]
//
int8_t f19(int8_t *Ptr, int8_t Val) {
  return __atomic_fetch_or(Ptr, Val, memory_order_seq_cst);
}

// CHECK-LABEL: @f20(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = atomicrmw nand ptr [[PTR:%.*]], i8 [[VAL:%.*]] seq_cst, align 1
// CHECK-NEXT:    ret i8 [[TMP0]]
//
int8_t f20(int8_t *Ptr, int8_t Val) {
  return __atomic_fetch_nand(Ptr, Val, memory_order_seq_cst);
}