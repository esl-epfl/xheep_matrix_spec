// NOTE: Assertions have been autogenerated by utils/update_cc_test_checks.py
// REQUIRES: aarch64-registered-target
// RUN: %clang_cc1 -fclang-abi-compat=latest -triple aarch64-none-linux-gnu -target-feature +sve -S -disable-O0-optnone -Werror -Wall -emit-llvm -o - %s | opt -S -passes=mem2reg,tailcallelim | FileCheck %s
// RUN: %clang_cc1 -fclang-abi-compat=latest -triple aarch64-none-linux-gnu -target-feature +sve -S -disable-O0-optnone -Werror -Wall -emit-llvm -o - -x c++ %s | opt -S -passes=mem2reg,tailcallelim | FileCheck %s -check-prefix=CPP-CHECK
// RUN: %clang_cc1 -fclang-abi-compat=latest -DSVE_OVERLOADED_FORMS -triple aarch64-none-linux-gnu -target-feature +sve -S -disable-O0-optnone -Werror -Wall -emit-llvm -o - %s | opt -S -passes=mem2reg,tailcallelim | FileCheck %s
// RUN: %clang_cc1 -fclang-abi-compat=latest -DSVE_OVERLOADED_FORMS -triple aarch64-none-linux-gnu -target-feature +sve -S -disable-O0-optnone -Werror -Wall -emit-llvm -o - -x c++ %s | opt -S -passes=mem2reg,tailcallelim | FileCheck %s -check-prefix=CPP-CHECK
// RUN: %clang_cc1 -fclang-abi-compat=latest -triple aarch64-none-linux-gnu -target-feature +sve -S -disable-O0-optnone -Werror -Wall -o /dev/null %s
#include <arm_sve.h>

#ifdef SVE_OVERLOADED_FORMS
// A simple used,unused... macro, long enough to represent any SVE builtin.
#define SVE_ACLE_FUNC(A1,A2_UNUSED,A3,A4_UNUSED) A1##A3
#else
#define SVE_ACLE_FUNC(A1,A2,A3,A4) A1##A2##A3##A4
#endif

// CHECK-LABEL: @test_svabs_s8_z(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = tail call <vscale x 16 x i8> @llvm.aarch64.sve.abs.nxv16i8(<vscale x 16 x i8> zeroinitializer, <vscale x 16 x i1> [[PG:%.*]], <vscale x 16 x i8> [[OP:%.*]])
// CHECK-NEXT:    ret <vscale x 16 x i8> [[TMP0]]
//
// CPP-CHECK-LABEL: @_Z15test_svabs_s8_zu10__SVBool_tu10__SVInt8_t(
// CPP-CHECK-NEXT:  entry:
// CPP-CHECK-NEXT:    [[TMP0:%.*]] = tail call <vscale x 16 x i8> @llvm.aarch64.sve.abs.nxv16i8(<vscale x 16 x i8> zeroinitializer, <vscale x 16 x i1> [[PG:%.*]], <vscale x 16 x i8> [[OP:%.*]])
// CPP-CHECK-NEXT:    ret <vscale x 16 x i8> [[TMP0]]
//
svint8_t test_svabs_s8_z(svbool_t pg, svint8_t op)
{
  return SVE_ACLE_FUNC(svabs,_s8,_z,)(pg, op);
}

// CHECK-LABEL: @test_svabs_s16_z(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = tail call <vscale x 8 x i1> @llvm.aarch64.sve.convert.from.svbool.nxv8i1(<vscale x 16 x i1> [[PG:%.*]])
// CHECK-NEXT:    [[TMP1:%.*]] = tail call <vscale x 8 x i16> @llvm.aarch64.sve.abs.nxv8i16(<vscale x 8 x i16> zeroinitializer, <vscale x 8 x i1> [[TMP0]], <vscale x 8 x i16> [[OP:%.*]])
// CHECK-NEXT:    ret <vscale x 8 x i16> [[TMP1]]
//
// CPP-CHECK-LABEL: @_Z16test_svabs_s16_zu10__SVBool_tu11__SVInt16_t(
// CPP-CHECK-NEXT:  entry:
// CPP-CHECK-NEXT:    [[TMP0:%.*]] = tail call <vscale x 8 x i1> @llvm.aarch64.sve.convert.from.svbool.nxv8i1(<vscale x 16 x i1> [[PG:%.*]])
// CPP-CHECK-NEXT:    [[TMP1:%.*]] = tail call <vscale x 8 x i16> @llvm.aarch64.sve.abs.nxv8i16(<vscale x 8 x i16> zeroinitializer, <vscale x 8 x i1> [[TMP0]], <vscale x 8 x i16> [[OP:%.*]])
// CPP-CHECK-NEXT:    ret <vscale x 8 x i16> [[TMP1]]
//
svint16_t test_svabs_s16_z(svbool_t pg, svint16_t op)
{
  return SVE_ACLE_FUNC(svabs,_s16,_z,)(pg, op);
}

// CHECK-LABEL: @test_svabs_s32_z(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = tail call <vscale x 4 x i1> @llvm.aarch64.sve.convert.from.svbool.nxv4i1(<vscale x 16 x i1> [[PG:%.*]])
// CHECK-NEXT:    [[TMP1:%.*]] = tail call <vscale x 4 x i32> @llvm.aarch64.sve.abs.nxv4i32(<vscale x 4 x i32> zeroinitializer, <vscale x 4 x i1> [[TMP0]], <vscale x 4 x i32> [[OP:%.*]])
// CHECK-NEXT:    ret <vscale x 4 x i32> [[TMP1]]
//
// CPP-CHECK-LABEL: @_Z16test_svabs_s32_zu10__SVBool_tu11__SVInt32_t(
// CPP-CHECK-NEXT:  entry:
// CPP-CHECK-NEXT:    [[TMP0:%.*]] = tail call <vscale x 4 x i1> @llvm.aarch64.sve.convert.from.svbool.nxv4i1(<vscale x 16 x i1> [[PG:%.*]])
// CPP-CHECK-NEXT:    [[TMP1:%.*]] = tail call <vscale x 4 x i32> @llvm.aarch64.sve.abs.nxv4i32(<vscale x 4 x i32> zeroinitializer, <vscale x 4 x i1> [[TMP0]], <vscale x 4 x i32> [[OP:%.*]])
// CPP-CHECK-NEXT:    ret <vscale x 4 x i32> [[TMP1]]
//
svint32_t test_svabs_s32_z(svbool_t pg, svint32_t op)
{
  return SVE_ACLE_FUNC(svabs,_s32,_z,)(pg, op);
}

// CHECK-LABEL: @test_svabs_s64_z(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = tail call <vscale x 2 x i1> @llvm.aarch64.sve.convert.from.svbool.nxv2i1(<vscale x 16 x i1> [[PG:%.*]])
// CHECK-NEXT:    [[TMP1:%.*]] = tail call <vscale x 2 x i64> @llvm.aarch64.sve.abs.nxv2i64(<vscale x 2 x i64> zeroinitializer, <vscale x 2 x i1> [[TMP0]], <vscale x 2 x i64> [[OP:%.*]])
// CHECK-NEXT:    ret <vscale x 2 x i64> [[TMP1]]
//
// CPP-CHECK-LABEL: @_Z16test_svabs_s64_zu10__SVBool_tu11__SVInt64_t(
// CPP-CHECK-NEXT:  entry:
// CPP-CHECK-NEXT:    [[TMP0:%.*]] = tail call <vscale x 2 x i1> @llvm.aarch64.sve.convert.from.svbool.nxv2i1(<vscale x 16 x i1> [[PG:%.*]])
// CPP-CHECK-NEXT:    [[TMP1:%.*]] = tail call <vscale x 2 x i64> @llvm.aarch64.sve.abs.nxv2i64(<vscale x 2 x i64> zeroinitializer, <vscale x 2 x i1> [[TMP0]], <vscale x 2 x i64> [[OP:%.*]])
// CPP-CHECK-NEXT:    ret <vscale x 2 x i64> [[TMP1]]
//
svint64_t test_svabs_s64_z(svbool_t pg, svint64_t op)
{
  return SVE_ACLE_FUNC(svabs,_s64,_z,)(pg, op);
}

// CHECK-LABEL: @test_svabs_s8_m(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = tail call <vscale x 16 x i8> @llvm.aarch64.sve.abs.nxv16i8(<vscale x 16 x i8> [[INACTIVE:%.*]], <vscale x 16 x i1> [[PG:%.*]], <vscale x 16 x i8> [[OP:%.*]])
// CHECK-NEXT:    ret <vscale x 16 x i8> [[TMP0]]
//
// CPP-CHECK-LABEL: @_Z15test_svabs_s8_mu10__SVInt8_tu10__SVBool_tS_(
// CPP-CHECK-NEXT:  entry:
// CPP-CHECK-NEXT:    [[TMP0:%.*]] = tail call <vscale x 16 x i8> @llvm.aarch64.sve.abs.nxv16i8(<vscale x 16 x i8> [[INACTIVE:%.*]], <vscale x 16 x i1> [[PG:%.*]], <vscale x 16 x i8> [[OP:%.*]])
// CPP-CHECK-NEXT:    ret <vscale x 16 x i8> [[TMP0]]
//
svint8_t test_svabs_s8_m(svint8_t inactive, svbool_t pg, svint8_t op)
{
  return SVE_ACLE_FUNC(svabs,_s8,_m,)(inactive, pg, op);
}

// CHECK-LABEL: @test_svabs_s16_m(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = tail call <vscale x 8 x i1> @llvm.aarch64.sve.convert.from.svbool.nxv8i1(<vscale x 16 x i1> [[PG:%.*]])
// CHECK-NEXT:    [[TMP1:%.*]] = tail call <vscale x 8 x i16> @llvm.aarch64.sve.abs.nxv8i16(<vscale x 8 x i16> [[INACTIVE:%.*]], <vscale x 8 x i1> [[TMP0]], <vscale x 8 x i16> [[OP:%.*]])
// CHECK-NEXT:    ret <vscale x 8 x i16> [[TMP1]]
//
// CPP-CHECK-LABEL: @_Z16test_svabs_s16_mu11__SVInt16_tu10__SVBool_tS_(
// CPP-CHECK-NEXT:  entry:
// CPP-CHECK-NEXT:    [[TMP0:%.*]] = tail call <vscale x 8 x i1> @llvm.aarch64.sve.convert.from.svbool.nxv8i1(<vscale x 16 x i1> [[PG:%.*]])
// CPP-CHECK-NEXT:    [[TMP1:%.*]] = tail call <vscale x 8 x i16> @llvm.aarch64.sve.abs.nxv8i16(<vscale x 8 x i16> [[INACTIVE:%.*]], <vscale x 8 x i1> [[TMP0]], <vscale x 8 x i16> [[OP:%.*]])
// CPP-CHECK-NEXT:    ret <vscale x 8 x i16> [[TMP1]]
//
svint16_t test_svabs_s16_m(svint16_t inactive, svbool_t pg, svint16_t op)
{
  return SVE_ACLE_FUNC(svabs,_s16,_m,)(inactive, pg, op);
}

// CHECK-LABEL: @test_svabs_s32_m(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = tail call <vscale x 4 x i1> @llvm.aarch64.sve.convert.from.svbool.nxv4i1(<vscale x 16 x i1> [[PG:%.*]])
// CHECK-NEXT:    [[TMP1:%.*]] = tail call <vscale x 4 x i32> @llvm.aarch64.sve.abs.nxv4i32(<vscale x 4 x i32> [[INACTIVE:%.*]], <vscale x 4 x i1> [[TMP0]], <vscale x 4 x i32> [[OP:%.*]])
// CHECK-NEXT:    ret <vscale x 4 x i32> [[TMP1]]
//
// CPP-CHECK-LABEL: @_Z16test_svabs_s32_mu11__SVInt32_tu10__SVBool_tS_(
// CPP-CHECK-NEXT:  entry:
// CPP-CHECK-NEXT:    [[TMP0:%.*]] = tail call <vscale x 4 x i1> @llvm.aarch64.sve.convert.from.svbool.nxv4i1(<vscale x 16 x i1> [[PG:%.*]])
// CPP-CHECK-NEXT:    [[TMP1:%.*]] = tail call <vscale x 4 x i32> @llvm.aarch64.sve.abs.nxv4i32(<vscale x 4 x i32> [[INACTIVE:%.*]], <vscale x 4 x i1> [[TMP0]], <vscale x 4 x i32> [[OP:%.*]])
// CPP-CHECK-NEXT:    ret <vscale x 4 x i32> [[TMP1]]
//
svint32_t test_svabs_s32_m(svint32_t inactive, svbool_t pg, svint32_t op)
{
  return SVE_ACLE_FUNC(svabs,_s32,_m,)(inactive, pg, op);
}

// CHECK-LABEL: @test_svabs_s64_m(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = tail call <vscale x 2 x i1> @llvm.aarch64.sve.convert.from.svbool.nxv2i1(<vscale x 16 x i1> [[PG:%.*]])
// CHECK-NEXT:    [[TMP1:%.*]] = tail call <vscale x 2 x i64> @llvm.aarch64.sve.abs.nxv2i64(<vscale x 2 x i64> [[INACTIVE:%.*]], <vscale x 2 x i1> [[TMP0]], <vscale x 2 x i64> [[OP:%.*]])
// CHECK-NEXT:    ret <vscale x 2 x i64> [[TMP1]]
//
// CPP-CHECK-LABEL: @_Z16test_svabs_s64_mu11__SVInt64_tu10__SVBool_tS_(
// CPP-CHECK-NEXT:  entry:
// CPP-CHECK-NEXT:    [[TMP0:%.*]] = tail call <vscale x 2 x i1> @llvm.aarch64.sve.convert.from.svbool.nxv2i1(<vscale x 16 x i1> [[PG:%.*]])
// CPP-CHECK-NEXT:    [[TMP1:%.*]] = tail call <vscale x 2 x i64> @llvm.aarch64.sve.abs.nxv2i64(<vscale x 2 x i64> [[INACTIVE:%.*]], <vscale x 2 x i1> [[TMP0]], <vscale x 2 x i64> [[OP:%.*]])
// CPP-CHECK-NEXT:    ret <vscale x 2 x i64> [[TMP1]]
//
svint64_t test_svabs_s64_m(svint64_t inactive, svbool_t pg, svint64_t op)
{
  return SVE_ACLE_FUNC(svabs,_s64,_m,)(inactive, pg, op);
}

// CHECK-LABEL: @test_svabs_s8_x(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = tail call <vscale x 16 x i8> @llvm.aarch64.sve.abs.nxv16i8(<vscale x 16 x i8> undef, <vscale x 16 x i1> [[PG:%.*]], <vscale x 16 x i8> [[OP:%.*]])
// CHECK-NEXT:    ret <vscale x 16 x i8> [[TMP0]]
//
// CPP-CHECK-LABEL: @_Z15test_svabs_s8_xu10__SVBool_tu10__SVInt8_t(
// CPP-CHECK-NEXT:  entry:
// CPP-CHECK-NEXT:    [[TMP0:%.*]] = tail call <vscale x 16 x i8> @llvm.aarch64.sve.abs.nxv16i8(<vscale x 16 x i8> undef, <vscale x 16 x i1> [[PG:%.*]], <vscale x 16 x i8> [[OP:%.*]])
// CPP-CHECK-NEXT:    ret <vscale x 16 x i8> [[TMP0]]
//
svint8_t test_svabs_s8_x(svbool_t pg, svint8_t op)
{
  return SVE_ACLE_FUNC(svabs,_s8,_x,)(pg, op);
}

// CHECK-LABEL: @test_svabs_s16_x(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = tail call <vscale x 8 x i1> @llvm.aarch64.sve.convert.from.svbool.nxv8i1(<vscale x 16 x i1> [[PG:%.*]])
// CHECK-NEXT:    [[TMP1:%.*]] = tail call <vscale x 8 x i16> @llvm.aarch64.sve.abs.nxv8i16(<vscale x 8 x i16> undef, <vscale x 8 x i1> [[TMP0]], <vscale x 8 x i16> [[OP:%.*]])
// CHECK-NEXT:    ret <vscale x 8 x i16> [[TMP1]]
//
// CPP-CHECK-LABEL: @_Z16test_svabs_s16_xu10__SVBool_tu11__SVInt16_t(
// CPP-CHECK-NEXT:  entry:
// CPP-CHECK-NEXT:    [[TMP0:%.*]] = tail call <vscale x 8 x i1> @llvm.aarch64.sve.convert.from.svbool.nxv8i1(<vscale x 16 x i1> [[PG:%.*]])
// CPP-CHECK-NEXT:    [[TMP1:%.*]] = tail call <vscale x 8 x i16> @llvm.aarch64.sve.abs.nxv8i16(<vscale x 8 x i16> undef, <vscale x 8 x i1> [[TMP0]], <vscale x 8 x i16> [[OP:%.*]])
// CPP-CHECK-NEXT:    ret <vscale x 8 x i16> [[TMP1]]
//
svint16_t test_svabs_s16_x(svbool_t pg, svint16_t op)
{
  return SVE_ACLE_FUNC(svabs,_s16,_x,)(pg, op);
}

// CHECK-LABEL: @test_svabs_s32_x(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = tail call <vscale x 4 x i1> @llvm.aarch64.sve.convert.from.svbool.nxv4i1(<vscale x 16 x i1> [[PG:%.*]])
// CHECK-NEXT:    [[TMP1:%.*]] = tail call <vscale x 4 x i32> @llvm.aarch64.sve.abs.nxv4i32(<vscale x 4 x i32> undef, <vscale x 4 x i1> [[TMP0]], <vscale x 4 x i32> [[OP:%.*]])
// CHECK-NEXT:    ret <vscale x 4 x i32> [[TMP1]]
//
// CPP-CHECK-LABEL: @_Z16test_svabs_s32_xu10__SVBool_tu11__SVInt32_t(
// CPP-CHECK-NEXT:  entry:
// CPP-CHECK-NEXT:    [[TMP0:%.*]] = tail call <vscale x 4 x i1> @llvm.aarch64.sve.convert.from.svbool.nxv4i1(<vscale x 16 x i1> [[PG:%.*]])
// CPP-CHECK-NEXT:    [[TMP1:%.*]] = tail call <vscale x 4 x i32> @llvm.aarch64.sve.abs.nxv4i32(<vscale x 4 x i32> undef, <vscale x 4 x i1> [[TMP0]], <vscale x 4 x i32> [[OP:%.*]])
// CPP-CHECK-NEXT:    ret <vscale x 4 x i32> [[TMP1]]
//
svint32_t test_svabs_s32_x(svbool_t pg, svint32_t op)
{
  return SVE_ACLE_FUNC(svabs,_s32,_x,)(pg, op);
}

// CHECK-LABEL: @test_svabs_s64_x(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = tail call <vscale x 2 x i1> @llvm.aarch64.sve.convert.from.svbool.nxv2i1(<vscale x 16 x i1> [[PG:%.*]])
// CHECK-NEXT:    [[TMP1:%.*]] = tail call <vscale x 2 x i64> @llvm.aarch64.sve.abs.nxv2i64(<vscale x 2 x i64> undef, <vscale x 2 x i1> [[TMP0]], <vscale x 2 x i64> [[OP:%.*]])
// CHECK-NEXT:    ret <vscale x 2 x i64> [[TMP1]]
//
// CPP-CHECK-LABEL: @_Z16test_svabs_s64_xu10__SVBool_tu11__SVInt64_t(
// CPP-CHECK-NEXT:  entry:
// CPP-CHECK-NEXT:    [[TMP0:%.*]] = tail call <vscale x 2 x i1> @llvm.aarch64.sve.convert.from.svbool.nxv2i1(<vscale x 16 x i1> [[PG:%.*]])
// CPP-CHECK-NEXT:    [[TMP1:%.*]] = tail call <vscale x 2 x i64> @llvm.aarch64.sve.abs.nxv2i64(<vscale x 2 x i64> undef, <vscale x 2 x i1> [[TMP0]], <vscale x 2 x i64> [[OP:%.*]])
// CPP-CHECK-NEXT:    ret <vscale x 2 x i64> [[TMP1]]
//
svint64_t test_svabs_s64_x(svbool_t pg, svint64_t op)
{
  return SVE_ACLE_FUNC(svabs,_s64,_x,)(pg, op);
}

// CHECK-LABEL: @test_svabs_f16_z(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = tail call <vscale x 8 x i1> @llvm.aarch64.sve.convert.from.svbool.nxv8i1(<vscale x 16 x i1> [[PG:%.*]])
// CHECK-NEXT:    [[TMP1:%.*]] = tail call <vscale x 8 x half> @llvm.aarch64.sve.fabs.nxv8f16(<vscale x 8 x half> zeroinitializer, <vscale x 8 x i1> [[TMP0]], <vscale x 8 x half> [[OP:%.*]])
// CHECK-NEXT:    ret <vscale x 8 x half> [[TMP1]]
//
// CPP-CHECK-LABEL: @_Z16test_svabs_f16_zu10__SVBool_tu13__SVFloat16_t(
// CPP-CHECK-NEXT:  entry:
// CPP-CHECK-NEXT:    [[TMP0:%.*]] = tail call <vscale x 8 x i1> @llvm.aarch64.sve.convert.from.svbool.nxv8i1(<vscale x 16 x i1> [[PG:%.*]])
// CPP-CHECK-NEXT:    [[TMP1:%.*]] = tail call <vscale x 8 x half> @llvm.aarch64.sve.fabs.nxv8f16(<vscale x 8 x half> zeroinitializer, <vscale x 8 x i1> [[TMP0]], <vscale x 8 x half> [[OP:%.*]])
// CPP-CHECK-NEXT:    ret <vscale x 8 x half> [[TMP1]]
//
svfloat16_t test_svabs_f16_z(svbool_t pg, svfloat16_t op)
{
  return SVE_ACLE_FUNC(svabs,_f16,_z,)(pg, op);
}

// CHECK-LABEL: @test_svabs_f32_z(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = tail call <vscale x 4 x i1> @llvm.aarch64.sve.convert.from.svbool.nxv4i1(<vscale x 16 x i1> [[PG:%.*]])
// CHECK-NEXT:    [[TMP1:%.*]] = tail call <vscale x 4 x float> @llvm.aarch64.sve.fabs.nxv4f32(<vscale x 4 x float> zeroinitializer, <vscale x 4 x i1> [[TMP0]], <vscale x 4 x float> [[OP:%.*]])
// CHECK-NEXT:    ret <vscale x 4 x float> [[TMP1]]
//
// CPP-CHECK-LABEL: @_Z16test_svabs_f32_zu10__SVBool_tu13__SVFloat32_t(
// CPP-CHECK-NEXT:  entry:
// CPP-CHECK-NEXT:    [[TMP0:%.*]] = tail call <vscale x 4 x i1> @llvm.aarch64.sve.convert.from.svbool.nxv4i1(<vscale x 16 x i1> [[PG:%.*]])
// CPP-CHECK-NEXT:    [[TMP1:%.*]] = tail call <vscale x 4 x float> @llvm.aarch64.sve.fabs.nxv4f32(<vscale x 4 x float> zeroinitializer, <vscale x 4 x i1> [[TMP0]], <vscale x 4 x float> [[OP:%.*]])
// CPP-CHECK-NEXT:    ret <vscale x 4 x float> [[TMP1]]
//
svfloat32_t test_svabs_f32_z(svbool_t pg, svfloat32_t op)
{
  return SVE_ACLE_FUNC(svabs,_f32,_z,)(pg, op);
}

// CHECK-LABEL: @test_svabs_f64_z(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = tail call <vscale x 2 x i1> @llvm.aarch64.sve.convert.from.svbool.nxv2i1(<vscale x 16 x i1> [[PG:%.*]])
// CHECK-NEXT:    [[TMP1:%.*]] = tail call <vscale x 2 x double> @llvm.aarch64.sve.fabs.nxv2f64(<vscale x 2 x double> zeroinitializer, <vscale x 2 x i1> [[TMP0]], <vscale x 2 x double> [[OP:%.*]])
// CHECK-NEXT:    ret <vscale x 2 x double> [[TMP1]]
//
// CPP-CHECK-LABEL: @_Z16test_svabs_f64_zu10__SVBool_tu13__SVFloat64_t(
// CPP-CHECK-NEXT:  entry:
// CPP-CHECK-NEXT:    [[TMP0:%.*]] = tail call <vscale x 2 x i1> @llvm.aarch64.sve.convert.from.svbool.nxv2i1(<vscale x 16 x i1> [[PG:%.*]])
// CPP-CHECK-NEXT:    [[TMP1:%.*]] = tail call <vscale x 2 x double> @llvm.aarch64.sve.fabs.nxv2f64(<vscale x 2 x double> zeroinitializer, <vscale x 2 x i1> [[TMP0]], <vscale x 2 x double> [[OP:%.*]])
// CPP-CHECK-NEXT:    ret <vscale x 2 x double> [[TMP1]]
//
svfloat64_t test_svabs_f64_z(svbool_t pg, svfloat64_t op)
{
  return SVE_ACLE_FUNC(svabs,_f64,_z,)(pg, op);
}

// CHECK-LABEL: @test_svabs_f16_m(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = tail call <vscale x 8 x i1> @llvm.aarch64.sve.convert.from.svbool.nxv8i1(<vscale x 16 x i1> [[PG:%.*]])
// CHECK-NEXT:    [[TMP1:%.*]] = tail call <vscale x 8 x half> @llvm.aarch64.sve.fabs.nxv8f16(<vscale x 8 x half> [[INACTIVE:%.*]], <vscale x 8 x i1> [[TMP0]], <vscale x 8 x half> [[OP:%.*]])
// CHECK-NEXT:    ret <vscale x 8 x half> [[TMP1]]
//
// CPP-CHECK-LABEL: @_Z16test_svabs_f16_mu13__SVFloat16_tu10__SVBool_tS_(
// CPP-CHECK-NEXT:  entry:
// CPP-CHECK-NEXT:    [[TMP0:%.*]] = tail call <vscale x 8 x i1> @llvm.aarch64.sve.convert.from.svbool.nxv8i1(<vscale x 16 x i1> [[PG:%.*]])
// CPP-CHECK-NEXT:    [[TMP1:%.*]] = tail call <vscale x 8 x half> @llvm.aarch64.sve.fabs.nxv8f16(<vscale x 8 x half> [[INACTIVE:%.*]], <vscale x 8 x i1> [[TMP0]], <vscale x 8 x half> [[OP:%.*]])
// CPP-CHECK-NEXT:    ret <vscale x 8 x half> [[TMP1]]
//
svfloat16_t test_svabs_f16_m(svfloat16_t inactive, svbool_t pg, svfloat16_t op)
{
  return SVE_ACLE_FUNC(svabs,_f16,_m,)(inactive, pg, op);
}

// CHECK-LABEL: @test_svabs_f32_m(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = tail call <vscale x 4 x i1> @llvm.aarch64.sve.convert.from.svbool.nxv4i1(<vscale x 16 x i1> [[PG:%.*]])
// CHECK-NEXT:    [[TMP1:%.*]] = tail call <vscale x 4 x float> @llvm.aarch64.sve.fabs.nxv4f32(<vscale x 4 x float> [[INACTIVE:%.*]], <vscale x 4 x i1> [[TMP0]], <vscale x 4 x float> [[OP:%.*]])
// CHECK-NEXT:    ret <vscale x 4 x float> [[TMP1]]
//
// CPP-CHECK-LABEL: @_Z16test_svabs_f32_mu13__SVFloat32_tu10__SVBool_tS_(
// CPP-CHECK-NEXT:  entry:
// CPP-CHECK-NEXT:    [[TMP0:%.*]] = tail call <vscale x 4 x i1> @llvm.aarch64.sve.convert.from.svbool.nxv4i1(<vscale x 16 x i1> [[PG:%.*]])
// CPP-CHECK-NEXT:    [[TMP1:%.*]] = tail call <vscale x 4 x float> @llvm.aarch64.sve.fabs.nxv4f32(<vscale x 4 x float> [[INACTIVE:%.*]], <vscale x 4 x i1> [[TMP0]], <vscale x 4 x float> [[OP:%.*]])
// CPP-CHECK-NEXT:    ret <vscale x 4 x float> [[TMP1]]
//
svfloat32_t test_svabs_f32_m(svfloat32_t inactive, svbool_t pg, svfloat32_t op)
{
  return SVE_ACLE_FUNC(svabs,_f32,_m,)(inactive, pg, op);
}

// CHECK-LABEL: @test_svabs_f64_m(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = tail call <vscale x 2 x i1> @llvm.aarch64.sve.convert.from.svbool.nxv2i1(<vscale x 16 x i1> [[PG:%.*]])
// CHECK-NEXT:    [[TMP1:%.*]] = tail call <vscale x 2 x double> @llvm.aarch64.sve.fabs.nxv2f64(<vscale x 2 x double> [[INACTIVE:%.*]], <vscale x 2 x i1> [[TMP0]], <vscale x 2 x double> [[OP:%.*]])
// CHECK-NEXT:    ret <vscale x 2 x double> [[TMP1]]
//
// CPP-CHECK-LABEL: @_Z16test_svabs_f64_mu13__SVFloat64_tu10__SVBool_tS_(
// CPP-CHECK-NEXT:  entry:
// CPP-CHECK-NEXT:    [[TMP0:%.*]] = tail call <vscale x 2 x i1> @llvm.aarch64.sve.convert.from.svbool.nxv2i1(<vscale x 16 x i1> [[PG:%.*]])
// CPP-CHECK-NEXT:    [[TMP1:%.*]] = tail call <vscale x 2 x double> @llvm.aarch64.sve.fabs.nxv2f64(<vscale x 2 x double> [[INACTIVE:%.*]], <vscale x 2 x i1> [[TMP0]], <vscale x 2 x double> [[OP:%.*]])
// CPP-CHECK-NEXT:    ret <vscale x 2 x double> [[TMP1]]
//
svfloat64_t test_svabs_f64_m(svfloat64_t inactive, svbool_t pg, svfloat64_t op)
{
  return SVE_ACLE_FUNC(svabs,_f64,_m,)(inactive, pg, op);
}

// CHECK-LABEL: @test_svabs_f16_x(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = tail call <vscale x 8 x i1> @llvm.aarch64.sve.convert.from.svbool.nxv8i1(<vscale x 16 x i1> [[PG:%.*]])
// CHECK-NEXT:    [[TMP1:%.*]] = tail call <vscale x 8 x half> @llvm.aarch64.sve.fabs.nxv8f16(<vscale x 8 x half> undef, <vscale x 8 x i1> [[TMP0]], <vscale x 8 x half> [[OP:%.*]])
// CHECK-NEXT:    ret <vscale x 8 x half> [[TMP1]]
//
// CPP-CHECK-LABEL: @_Z16test_svabs_f16_xu10__SVBool_tu13__SVFloat16_t(
// CPP-CHECK-NEXT:  entry:
// CPP-CHECK-NEXT:    [[TMP0:%.*]] = tail call <vscale x 8 x i1> @llvm.aarch64.sve.convert.from.svbool.nxv8i1(<vscale x 16 x i1> [[PG:%.*]])
// CPP-CHECK-NEXT:    [[TMP1:%.*]] = tail call <vscale x 8 x half> @llvm.aarch64.sve.fabs.nxv8f16(<vscale x 8 x half> undef, <vscale x 8 x i1> [[TMP0]], <vscale x 8 x half> [[OP:%.*]])
// CPP-CHECK-NEXT:    ret <vscale x 8 x half> [[TMP1]]
//
svfloat16_t test_svabs_f16_x(svbool_t pg, svfloat16_t op)
{
  return SVE_ACLE_FUNC(svabs,_f16,_x,)(pg, op);
}

// CHECK-LABEL: @test_svabs_f32_x(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = tail call <vscale x 4 x i1> @llvm.aarch64.sve.convert.from.svbool.nxv4i1(<vscale x 16 x i1> [[PG:%.*]])
// CHECK-NEXT:    [[TMP1:%.*]] = tail call <vscale x 4 x float> @llvm.aarch64.sve.fabs.nxv4f32(<vscale x 4 x float> undef, <vscale x 4 x i1> [[TMP0]], <vscale x 4 x float> [[OP:%.*]])
// CHECK-NEXT:    ret <vscale x 4 x float> [[TMP1]]
//
// CPP-CHECK-LABEL: @_Z16test_svabs_f32_xu10__SVBool_tu13__SVFloat32_t(
// CPP-CHECK-NEXT:  entry:
// CPP-CHECK-NEXT:    [[TMP0:%.*]] = tail call <vscale x 4 x i1> @llvm.aarch64.sve.convert.from.svbool.nxv4i1(<vscale x 16 x i1> [[PG:%.*]])
// CPP-CHECK-NEXT:    [[TMP1:%.*]] = tail call <vscale x 4 x float> @llvm.aarch64.sve.fabs.nxv4f32(<vscale x 4 x float> undef, <vscale x 4 x i1> [[TMP0]], <vscale x 4 x float> [[OP:%.*]])
// CPP-CHECK-NEXT:    ret <vscale x 4 x float> [[TMP1]]
//
svfloat32_t test_svabs_f32_x(svbool_t pg, svfloat32_t op)
{
  return SVE_ACLE_FUNC(svabs,_f32,_x,)(pg, op);
}

// CHECK-LABEL: @test_svabs_f64_x(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = tail call <vscale x 2 x i1> @llvm.aarch64.sve.convert.from.svbool.nxv2i1(<vscale x 16 x i1> [[PG:%.*]])
// CHECK-NEXT:    [[TMP1:%.*]] = tail call <vscale x 2 x double> @llvm.aarch64.sve.fabs.nxv2f64(<vscale x 2 x double> undef, <vscale x 2 x i1> [[TMP0]], <vscale x 2 x double> [[OP:%.*]])
// CHECK-NEXT:    ret <vscale x 2 x double> [[TMP1]]
//
// CPP-CHECK-LABEL: @_Z16test_svabs_f64_xu10__SVBool_tu13__SVFloat64_t(
// CPP-CHECK-NEXT:  entry:
// CPP-CHECK-NEXT:    [[TMP0:%.*]] = tail call <vscale x 2 x i1> @llvm.aarch64.sve.convert.from.svbool.nxv2i1(<vscale x 16 x i1> [[PG:%.*]])
// CPP-CHECK-NEXT:    [[TMP1:%.*]] = tail call <vscale x 2 x double> @llvm.aarch64.sve.fabs.nxv2f64(<vscale x 2 x double> undef, <vscale x 2 x i1> [[TMP0]], <vscale x 2 x double> [[OP:%.*]])
// CPP-CHECK-NEXT:    ret <vscale x 2 x double> [[TMP1]]
//
svfloat64_t test_svabs_f64_x(svbool_t pg, svfloat64_t op)
{
  return SVE_ACLE_FUNC(svabs,_f64,_x,)(pg, op);
}