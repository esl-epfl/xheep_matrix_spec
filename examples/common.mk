CC = "${RISCV}/bin/clang"
ASFLAGS = -march=rv32imc_xtheadmatrix0p1 -menable-experimental-extensions 
CFLAGS = -O2 -g3 $(ASFLAGS) 
