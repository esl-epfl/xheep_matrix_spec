; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc --mtriple=loongarch64 < %s | FileCheck --check-prefix=LA64 %s

define i8 @atomicrmw_uinc_wrap_i8(ptr %ptr, i8 %val) {
; LA64-LABEL: atomicrmw_uinc_wrap_i8:
; LA64:       # %bb.0:
; LA64-NEXT:    slli.d $a2, $a0, 3
; LA64-NEXT:    bstrins.d $a0, $zero, 1, 0
; LA64-NEXT:    ori $a3, $zero, 255
; LA64-NEXT:    sll.w $a4, $a3, $a2
; LA64-NEXT:    ld.w $a3, $a0, 0
; LA64-NEXT:    andi $a2, $a2, 24
; LA64-NEXT:    nor $a4, $a4, $zero
; LA64-NEXT:    andi $a1, $a1, 255
; LA64-NEXT:    .p2align 4, , 16
; LA64-NEXT:  .LBB0_1: # %atomicrmw.start
; LA64-NEXT:    # =>This Loop Header: Depth=1
; LA64-NEXT:    # Child Loop BB0_3 Depth 2
; LA64-NEXT:    srl.w $a5, $a3, $a2
; LA64-NEXT:    addi.w $a6, $a3, 0
; LA64-NEXT:    andi $a7, $a5, 255
; LA64-NEXT:    addi.d $a5, $a5, 1
; LA64-NEXT:    sltu $a7, $a7, $a1
; LA64-NEXT:    xori $a7, $a7, 1
; LA64-NEXT:    masknez $a5, $a5, $a7
; LA64-NEXT:    andi $a5, $a5, 255
; LA64-NEXT:    sll.w $a5, $a5, $a2
; LA64-NEXT:    and $a3, $a3, $a4
; LA64-NEXT:    or $a5, $a3, $a5
; LA64-NEXT:  .LBB0_3: # %atomicrmw.start
; LA64-NEXT:    # Parent Loop BB0_1 Depth=1
; LA64-NEXT:    # => This Inner Loop Header: Depth=2
; LA64-NEXT:    ll.w $a3, $a0, 0
; LA64-NEXT:    bne $a3, $a6, .LBB0_5
; LA64-NEXT:  # %bb.4: # %atomicrmw.start
; LA64-NEXT:    # in Loop: Header=BB0_3 Depth=2
; LA64-NEXT:    move $a7, $a5
; LA64-NEXT:    sc.w $a7, $a0, 0
; LA64-NEXT:    beqz $a7, .LBB0_3
; LA64-NEXT:    b .LBB0_6
; LA64-NEXT:  .LBB0_5: # %atomicrmw.start
; LA64-NEXT:    # in Loop: Header=BB0_1 Depth=1
; LA64-NEXT:    dbar 20
; LA64-NEXT:  .LBB0_6: # %atomicrmw.start
; LA64-NEXT:    # in Loop: Header=BB0_1 Depth=1
; LA64-NEXT:    bne $a3, $a6, .LBB0_1
; LA64-NEXT:  # %bb.2: # %atomicrmw.end
; LA64-NEXT:    srl.w $a0, $a3, $a2
; LA64-NEXT:    ret
  %result = atomicrmw uinc_wrap ptr %ptr, i8 %val seq_cst
  ret i8 %result
}

define i16 @atomicrmw_uinc_wrap_i16(ptr %ptr, i16 %val) {
; LA64-LABEL: atomicrmw_uinc_wrap_i16:
; LA64:       # %bb.0:
; LA64-NEXT:    slli.d $a2, $a0, 3
; LA64-NEXT:    bstrins.d $a0, $zero, 1, 0
; LA64-NEXT:    lu12i.w $a3, 15
; LA64-NEXT:    ori $a3, $a3, 4095
; LA64-NEXT:    sll.w $a4, $a3, $a2
; LA64-NEXT:    ld.w $a3, $a0, 0
; LA64-NEXT:    andi $a2, $a2, 24
; LA64-NEXT:    nor $a4, $a4, $zero
; LA64-NEXT:    bstrpick.d $a1, $a1, 15, 0
; LA64-NEXT:    .p2align 4, , 16
; LA64-NEXT:  .LBB1_1: # %atomicrmw.start
; LA64-NEXT:    # =>This Loop Header: Depth=1
; LA64-NEXT:    # Child Loop BB1_3 Depth 2
; LA64-NEXT:    srl.w $a5, $a3, $a2
; LA64-NEXT:    addi.w $a6, $a3, 0
; LA64-NEXT:    bstrpick.d $a7, $a5, 15, 0
; LA64-NEXT:    addi.d $a5, $a5, 1
; LA64-NEXT:    sltu $a7, $a7, $a1
; LA64-NEXT:    xori $a7, $a7, 1
; LA64-NEXT:    masknez $a5, $a5, $a7
; LA64-NEXT:    bstrpick.d $a5, $a5, 15, 0
; LA64-NEXT:    sll.w $a5, $a5, $a2
; LA64-NEXT:    and $a3, $a3, $a4
; LA64-NEXT:    or $a5, $a3, $a5
; LA64-NEXT:  .LBB1_3: # %atomicrmw.start
; LA64-NEXT:    # Parent Loop BB1_1 Depth=1
; LA64-NEXT:    # => This Inner Loop Header: Depth=2
; LA64-NEXT:    ll.w $a3, $a0, 0
; LA64-NEXT:    bne $a3, $a6, .LBB1_5
; LA64-NEXT:  # %bb.4: # %atomicrmw.start
; LA64-NEXT:    # in Loop: Header=BB1_3 Depth=2
; LA64-NEXT:    move $a7, $a5
; LA64-NEXT:    sc.w $a7, $a0, 0
; LA64-NEXT:    beqz $a7, .LBB1_3
; LA64-NEXT:    b .LBB1_6
; LA64-NEXT:  .LBB1_5: # %atomicrmw.start
; LA64-NEXT:    # in Loop: Header=BB1_1 Depth=1
; LA64-NEXT:    dbar 20
; LA64-NEXT:  .LBB1_6: # %atomicrmw.start
; LA64-NEXT:    # in Loop: Header=BB1_1 Depth=1
; LA64-NEXT:    bne $a3, $a6, .LBB1_1
; LA64-NEXT:  # %bb.2: # %atomicrmw.end
; LA64-NEXT:    srl.w $a0, $a3, $a2
; LA64-NEXT:    ret
  %result = atomicrmw uinc_wrap ptr %ptr, i16 %val seq_cst
  ret i16 %result
}

define i32 @atomicrmw_uinc_wrap_i32(ptr %ptr, i32 %val) {
; LA64-LABEL: atomicrmw_uinc_wrap_i32:
; LA64:       # %bb.0:
; LA64-NEXT:    ld.w $a2, $a0, 0
; LA64-NEXT:    addi.w $a1, $a1, 0
; LA64-NEXT:    .p2align 4, , 16
; LA64-NEXT:  .LBB2_1: # %atomicrmw.start
; LA64-NEXT:    # =>This Loop Header: Depth=1
; LA64-NEXT:    # Child Loop BB2_3 Depth 2
; LA64-NEXT:    addi.d $a3, $a2, 1
; LA64-NEXT:    addi.w $a4, $a2, 0
; LA64-NEXT:    sltu $a2, $a4, $a1
; LA64-NEXT:    xori $a2, $a2, 1
; LA64-NEXT:    masknez $a3, $a3, $a2
; LA64-NEXT:  .LBB2_3: # %atomicrmw.start
; LA64-NEXT:    # Parent Loop BB2_1 Depth=1
; LA64-NEXT:    # => This Inner Loop Header: Depth=2
; LA64-NEXT:    ll.w $a2, $a0, 0
; LA64-NEXT:    bne $a2, $a4, .LBB2_5
; LA64-NEXT:  # %bb.4: # %atomicrmw.start
; LA64-NEXT:    # in Loop: Header=BB2_3 Depth=2
; LA64-NEXT:    move $a5, $a3
; LA64-NEXT:    sc.w $a5, $a0, 0
; LA64-NEXT:    beqz $a5, .LBB2_3
; LA64-NEXT:    b .LBB2_6
; LA64-NEXT:  .LBB2_5: # %atomicrmw.start
; LA64-NEXT:    # in Loop: Header=BB2_1 Depth=1
; LA64-NEXT:    dbar 20
; LA64-NEXT:  .LBB2_6: # %atomicrmw.start
; LA64-NEXT:    # in Loop: Header=BB2_1 Depth=1
; LA64-NEXT:    bne $a2, $a4, .LBB2_1
; LA64-NEXT:  # %bb.2: # %atomicrmw.end
; LA64-NEXT:    move $a0, $a2
; LA64-NEXT:    ret
  %result = atomicrmw uinc_wrap ptr %ptr, i32 %val seq_cst
  ret i32 %result
}

define i64 @atomicrmw_uinc_wrap_i64(ptr %ptr, i64 %val) {
; LA64-LABEL: atomicrmw_uinc_wrap_i64:
; LA64:       # %bb.0:
; LA64-NEXT:    ld.d $a2, $a0, 0
; LA64-NEXT:    .p2align 4, , 16
; LA64-NEXT:  .LBB3_1: # %atomicrmw.start
; LA64-NEXT:    # =>This Loop Header: Depth=1
; LA64-NEXT:    # Child Loop BB3_3 Depth 2
; LA64-NEXT:    move $a3, $a2
; LA64-NEXT:    addi.d $a2, $a2, 1
; LA64-NEXT:    sltu $a4, $a3, $a1
; LA64-NEXT:    xori $a4, $a4, 1
; LA64-NEXT:    masknez $a4, $a2, $a4
; LA64-NEXT:  .LBB3_3: # %atomicrmw.start
; LA64-NEXT:    # Parent Loop BB3_1 Depth=1
; LA64-NEXT:    # => This Inner Loop Header: Depth=2
; LA64-NEXT:    ll.d $a2, $a0, 0
; LA64-NEXT:    bne $a2, $a3, .LBB3_5
; LA64-NEXT:  # %bb.4: # %atomicrmw.start
; LA64-NEXT:    # in Loop: Header=BB3_3 Depth=2
; LA64-NEXT:    move $a5, $a4
; LA64-NEXT:    sc.d $a5, $a0, 0
; LA64-NEXT:    beqz $a5, .LBB3_3
; LA64-NEXT:    b .LBB3_6
; LA64-NEXT:  .LBB3_5: # %atomicrmw.start
; LA64-NEXT:    # in Loop: Header=BB3_1 Depth=1
; LA64-NEXT:    dbar 20
; LA64-NEXT:  .LBB3_6: # %atomicrmw.start
; LA64-NEXT:    # in Loop: Header=BB3_1 Depth=1
; LA64-NEXT:    bne $a2, $a3, .LBB3_1
; LA64-NEXT:  # %bb.2: # %atomicrmw.end
; LA64-NEXT:    move $a0, $a2
; LA64-NEXT:    ret
  %result = atomicrmw uinc_wrap ptr %ptr, i64 %val seq_cst
  ret i64 %result
}

define i8 @atomicrmw_udec_wrap_i8(ptr %ptr, i8 %val) {
; LA64-LABEL: atomicrmw_udec_wrap_i8:
; LA64:       # %bb.0:
; LA64-NEXT:    slli.d $a4, $a0, 3
; LA64-NEXT:    bstrins.d $a0, $zero, 1, 0
; LA64-NEXT:    andi $a2, $a4, 24
; LA64-NEXT:    ori $a5, $zero, 255
; LA64-NEXT:    ld.w $a3, $a0, 0
; LA64-NEXT:    sll.w $a4, $a5, $a4
; LA64-NEXT:    nor $a4, $a4, $zero
; LA64-NEXT:    andi $a5, $a1, 255
; LA64-NEXT:    .p2align 4, , 16
; LA64-NEXT:  .LBB4_1: # %atomicrmw.start
; LA64-NEXT:    # =>This Loop Header: Depth=1
; LA64-NEXT:    # Child Loop BB4_3 Depth 2
; LA64-NEXT:    srl.w $a6, $a3, $a2
; LA64-NEXT:    addi.w $a7, $a3, 0
; LA64-NEXT:    andi $t0, $a6, 255
; LA64-NEXT:    addi.d $a6, $a6, -1
; LA64-NEXT:    sltui $t1, $t0, 1
; LA64-NEXT:    sltu $t0, $a5, $t0
; LA64-NEXT:    masknez $a6, $a6, $t0
; LA64-NEXT:    maskeqz $t0, $a1, $t0
; LA64-NEXT:    or $a6, $t0, $a6
; LA64-NEXT:    masknez $a6, $a6, $t1
; LA64-NEXT:    maskeqz $t0, $a1, $t1
; LA64-NEXT:    or $a6, $t0, $a6
; LA64-NEXT:    andi $a6, $a6, 255
; LA64-NEXT:    sll.w $a6, $a6, $a2
; LA64-NEXT:    and $a3, $a3, $a4
; LA64-NEXT:    or $a6, $a3, $a6
; LA64-NEXT:  .LBB4_3: # %atomicrmw.start
; LA64-NEXT:    # Parent Loop BB4_1 Depth=1
; LA64-NEXT:    # => This Inner Loop Header: Depth=2
; LA64-NEXT:    ll.w $a3, $a0, 0
; LA64-NEXT:    bne $a3, $a7, .LBB4_5
; LA64-NEXT:  # %bb.4: # %atomicrmw.start
; LA64-NEXT:    # in Loop: Header=BB4_3 Depth=2
; LA64-NEXT:    move $t0, $a6
; LA64-NEXT:    sc.w $t0, $a0, 0
; LA64-NEXT:    beqz $t0, .LBB4_3
; LA64-NEXT:    b .LBB4_6
; LA64-NEXT:  .LBB4_5: # %atomicrmw.start
; LA64-NEXT:    # in Loop: Header=BB4_1 Depth=1
; LA64-NEXT:    dbar 20
; LA64-NEXT:  .LBB4_6: # %atomicrmw.start
; LA64-NEXT:    # in Loop: Header=BB4_1 Depth=1
; LA64-NEXT:    bne $a3, $a7, .LBB4_1
; LA64-NEXT:  # %bb.2: # %atomicrmw.end
; LA64-NEXT:    srl.w $a0, $a3, $a2
; LA64-NEXT:    ret
  %result = atomicrmw udec_wrap ptr %ptr, i8 %val seq_cst
  ret i8 %result
}

define i16 @atomicrmw_udec_wrap_i16(ptr %ptr, i16 %val) {
; LA64-LABEL: atomicrmw_udec_wrap_i16:
; LA64:       # %bb.0:
; LA64-NEXT:    slli.d $a4, $a0, 3
; LA64-NEXT:    bstrins.d $a0, $zero, 1, 0
; LA64-NEXT:    andi $a2, $a4, 24
; LA64-NEXT:    lu12i.w $a3, 15
; LA64-NEXT:    ori $a5, $a3, 4095
; LA64-NEXT:    ld.w $a3, $a0, 0
; LA64-NEXT:    sll.w $a4, $a5, $a4
; LA64-NEXT:    nor $a4, $a4, $zero
; LA64-NEXT:    bstrpick.d $a5, $a1, 15, 0
; LA64-NEXT:    .p2align 4, , 16
; LA64-NEXT:  .LBB5_1: # %atomicrmw.start
; LA64-NEXT:    # =>This Loop Header: Depth=1
; LA64-NEXT:    # Child Loop BB5_3 Depth 2
; LA64-NEXT:    srl.w $a6, $a3, $a2
; LA64-NEXT:    addi.w $a7, $a3, 0
; LA64-NEXT:    bstrpick.d $t0, $a6, 15, 0
; LA64-NEXT:    addi.d $a6, $a6, -1
; LA64-NEXT:    sltui $t1, $t0, 1
; LA64-NEXT:    sltu $t0, $a5, $t0
; LA64-NEXT:    masknez $a6, $a6, $t0
; LA64-NEXT:    maskeqz $t0, $a1, $t0
; LA64-NEXT:    or $a6, $t0, $a6
; LA64-NEXT:    masknez $a6, $a6, $t1
; LA64-NEXT:    maskeqz $t0, $a1, $t1
; LA64-NEXT:    or $a6, $t0, $a6
; LA64-NEXT:    bstrpick.d $a6, $a6, 15, 0
; LA64-NEXT:    sll.w $a6, $a6, $a2
; LA64-NEXT:    and $a3, $a3, $a4
; LA64-NEXT:    or $a6, $a3, $a6
; LA64-NEXT:  .LBB5_3: # %atomicrmw.start
; LA64-NEXT:    # Parent Loop BB5_1 Depth=1
; LA64-NEXT:    # => This Inner Loop Header: Depth=2
; LA64-NEXT:    ll.w $a3, $a0, 0
; LA64-NEXT:    bne $a3, $a7, .LBB5_5
; LA64-NEXT:  # %bb.4: # %atomicrmw.start
; LA64-NEXT:    # in Loop: Header=BB5_3 Depth=2
; LA64-NEXT:    move $t0, $a6
; LA64-NEXT:    sc.w $t0, $a0, 0
; LA64-NEXT:    beqz $t0, .LBB5_3
; LA64-NEXT:    b .LBB5_6
; LA64-NEXT:  .LBB5_5: # %atomicrmw.start
; LA64-NEXT:    # in Loop: Header=BB5_1 Depth=1
; LA64-NEXT:    dbar 20
; LA64-NEXT:  .LBB5_6: # %atomicrmw.start
; LA64-NEXT:    # in Loop: Header=BB5_1 Depth=1
; LA64-NEXT:    bne $a3, $a7, .LBB5_1
; LA64-NEXT:  # %bb.2: # %atomicrmw.end
; LA64-NEXT:    srl.w $a0, $a3, $a2
; LA64-NEXT:    ret
  %result = atomicrmw udec_wrap ptr %ptr, i16 %val seq_cst
  ret i16 %result
}

define i32 @atomicrmw_udec_wrap_i32(ptr %ptr, i32 %val) {
; LA64-LABEL: atomicrmw_udec_wrap_i32:
; LA64:       # %bb.0:
; LA64-NEXT:    ld.w $a2, $a0, 0
; LA64-NEXT:    addi.w $a3, $a1, 0
; LA64-NEXT:    .p2align 4, , 16
; LA64-NEXT:  .LBB6_1: # %atomicrmw.start
; LA64-NEXT:    # =>This Loop Header: Depth=1
; LA64-NEXT:    # Child Loop BB6_3 Depth 2
; LA64-NEXT:    addi.d $a4, $a2, -1
; LA64-NEXT:    addi.w $a5, $a2, 0
; LA64-NEXT:    sltui $a2, $a5, 1
; LA64-NEXT:    sltu $a6, $a3, $a5
; LA64-NEXT:    masknez $a4, $a4, $a6
; LA64-NEXT:    maskeqz $a6, $a1, $a6
; LA64-NEXT:    or $a4, $a6, $a4
; LA64-NEXT:    masknez $a4, $a4, $a2
; LA64-NEXT:    maskeqz $a2, $a1, $a2
; LA64-NEXT:    or $a4, $a2, $a4
; LA64-NEXT:  .LBB6_3: # %atomicrmw.start
; LA64-NEXT:    # Parent Loop BB6_1 Depth=1
; LA64-NEXT:    # => This Inner Loop Header: Depth=2
; LA64-NEXT:    ll.w $a2, $a0, 0
; LA64-NEXT:    bne $a2, $a5, .LBB6_5
; LA64-NEXT:  # %bb.4: # %atomicrmw.start
; LA64-NEXT:    # in Loop: Header=BB6_3 Depth=2
; LA64-NEXT:    move $a6, $a4
; LA64-NEXT:    sc.w $a6, $a0, 0
; LA64-NEXT:    beqz $a6, .LBB6_3
; LA64-NEXT:    b .LBB6_6
; LA64-NEXT:  .LBB6_5: # %atomicrmw.start
; LA64-NEXT:    # in Loop: Header=BB6_1 Depth=1
; LA64-NEXT:    dbar 20
; LA64-NEXT:  .LBB6_6: # %atomicrmw.start
; LA64-NEXT:    # in Loop: Header=BB6_1 Depth=1
; LA64-NEXT:    bne $a2, $a5, .LBB6_1
; LA64-NEXT:  # %bb.2: # %atomicrmw.end
; LA64-NEXT:    move $a0, $a2
; LA64-NEXT:    ret
  %result = atomicrmw udec_wrap ptr %ptr, i32 %val seq_cst
  ret i32 %result
}

define i64 @atomicrmw_udec_wrap_i64(ptr %ptr, i64 %val) {
; LA64-LABEL: atomicrmw_udec_wrap_i64:
; LA64:       # %bb.0:
; LA64-NEXT:    ld.d $a2, $a0, 0
; LA64-NEXT:    .p2align 4, , 16
; LA64-NEXT:  .LBB7_1: # %atomicrmw.start
; LA64-NEXT:    # =>This Loop Header: Depth=1
; LA64-NEXT:    # Child Loop BB7_3 Depth 2
; LA64-NEXT:    move $a3, $a2
; LA64-NEXT:    addi.d $a2, $a2, -1
; LA64-NEXT:    sltui $a4, $a3, 1
; LA64-NEXT:    sltu $a5, $a1, $a3
; LA64-NEXT:    masknez $a2, $a2, $a5
; LA64-NEXT:    maskeqz $a5, $a1, $a5
; LA64-NEXT:    or $a2, $a5, $a2
; LA64-NEXT:    masknez $a2, $a2, $a4
; LA64-NEXT:    maskeqz $a4, $a1, $a4
; LA64-NEXT:    or $a4, $a4, $a2
; LA64-NEXT:  .LBB7_3: # %atomicrmw.start
; LA64-NEXT:    # Parent Loop BB7_1 Depth=1
; LA64-NEXT:    # => This Inner Loop Header: Depth=2
; LA64-NEXT:    ll.d $a2, $a0, 0
; LA64-NEXT:    bne $a2, $a3, .LBB7_5
; LA64-NEXT:  # %bb.4: # %atomicrmw.start
; LA64-NEXT:    # in Loop: Header=BB7_3 Depth=2
; LA64-NEXT:    move $a5, $a4
; LA64-NEXT:    sc.d $a5, $a0, 0
; LA64-NEXT:    beqz $a5, .LBB7_3
; LA64-NEXT:    b .LBB7_6
; LA64-NEXT:  .LBB7_5: # %atomicrmw.start
; LA64-NEXT:    # in Loop: Header=BB7_1 Depth=1
; LA64-NEXT:    dbar 20
; LA64-NEXT:  .LBB7_6: # %atomicrmw.start
; LA64-NEXT:    # in Loop: Header=BB7_1 Depth=1
; LA64-NEXT:    bne $a2, $a3, .LBB7_1
; LA64-NEXT:  # %bb.2: # %atomicrmw.end
; LA64-NEXT:    move $a0, $a2
; LA64-NEXT:    ret
  %result = atomicrmw udec_wrap ptr %ptr, i64 %val seq_cst
  ret i64 %result
}