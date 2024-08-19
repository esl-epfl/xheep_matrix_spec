# X-HEEP Matrix Spec

### Version: 0.1

The X-HEEP Matrix Extension is closely derived from the [T-HEAD RVM proposal](https://github.com/XUANTIE-RV/riscv-matrix-extension-spec/tree/master). However, a number of features are absent to maintain hardware simplicity and efficiency. This document discusses these details.

# Memory

## Registers
There are 8 tile registers, `m0-m7`, each holding a 4x4 matrix of 32-bit values. Smaller datatypes like 8-bit and 16-bit can be packed into this space, yielding 4x16 and 4x8 configurations. However, the same load instructions are used; only the arithmetic changes (more below).

## System memory model

The accelerator does not guarantee memory coherency with the CPU. That is, the effects of a matrix accelerator store instruction may not be visible in a load to the same address from the CPU, despite being in program order. The opposite is also true, a CPU store instruction may not be immediately visible to a matrix load.

Note that this is not modeled in the Spike simulator, all of the instructions will appear to have sequential consistency.

# Instructions

## Matrix multiplication

Let `S` represent the size of individual matrix elements in bytes. Let `ms1` hold matrix `A[4][16/S]`, `ms2` hold `B[4][16/S]`, and `md` hold `C[4][4]`. The pseudocode for the matrix multiplication instruction `<mnemonic> md, ms1, ms2` is

```c
for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
        for (int k = 0; k < (16/S); k++) {
            C[i][j] += A[i][k] * B[j][k];
        }
    }
}
```
That is, the instruction computes C += A * B^T.  Below, the available mnemonics for different datatypes are given.

| operand type | accumulator type | S | mnemonic |
|-----| ------- | - | - |
| fp32 | fp32 | 4 | fmmacc.s |
| int32 | int32 | 4 | mmasa.w |
| int16 | int32 | 2 | mmada.h |
| int8 | int32 | 1 | mmaqa.b |

## Zero

Clear register `md` with 0s:  
```
mzero md
```

## Load/store

Load/store from address in `rs1`, row stride in bytes in `rs2`, for register `md`/`ms1`:

```
mld.w md, (rs1), rs2
mst.w ms1, (rs1), rs2
```

Element stride is assumed to be 4 in bytes; only 32-bit word memory instructions are available. 

# Instruction Encoding

All instructions share `7'b0101011` (CUSTOM 1) as the major opcode, and func3 is `3'b000`.

## Arithmetic

|31 27 | 26 25 | 24 | 23 21 | 20 18 | 17 15 | 14 12 | 11 10 | 9 7 | 6 0 | mnemonic |
| ----- | ---- | --- | ---- | ----- | ----- | ----- | ----- | --- | --- | -- |
| 00001 | 00 | 0 | ms2 | ms1 | md | func3 | 10 | 000 | major opcode | fmmacc.s 
| 11110 | 00 | 0 | ms2 | ms1 | md | func3 | 10 | 000 | major opcode | mmasa.w
| 11100 | 00 | 0 | ms2 | ms1 | md | func3 | 01 | 000 | major opcode | mmada.h
| 00010 | 00 | 0 | ms2 | ms1 | md | func3 | 00 | 000 | major opcode | mmaqa.b
| 11111 | 00 | 0 | 000 | 000 | md | func3 | 00 | 000 | major opcode | mzero

## Load/store

|31 27 |26 25 |24 20 |19 15 |14 12 |11 10 |9 7 |6 0 | mnemonic | 
| ---- | ---- |----- | ---- | ---- | ---- | -- | -- | ------- |
|00000	|10 |	rs2	|rs1	|func3	|10	|md	|major opcode	| mld.w |
|00001	|10 |	rs2	|rs1	|func3	|10	|ms1	|major opcode	|mst.w |

# Toolchain/Simulator

See [BUILDING.md](BUILDING.md) for instructions.