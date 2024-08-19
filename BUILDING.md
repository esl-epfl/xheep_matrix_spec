# Installation

Components: (bold = custom, included in this repo)
* RISC-V GNU Toolchain
	* Target = riscv32-unknown-elf
	* Need GCC to build newlib, we also use the GNU linker.
* **LLVM Toolchain**
	* Tell built clang to use the GNU linker and C startup scripts + newlib but use its own assembler.
* **riscv-opcodes**
	* Needed to build Spike
* **riscv-isa-sim**
	* Version of spike simulator with matrix support
* riscv-pk
    * To go with spike

## Setup directories

Assuming you are at the root of this repository, create a directory to store builds and other cloned repos:

```bash
mkdir temp
cd temp
export RVM_TEMP_DIR=`pwd`/
```

The remaining command blocks first change directory to the temp dir given by the variable set above.

**We assume throughout this guide that `$RISCV` is the prefix where you install everything!**

Make sure to define it as an environment variable e.g. `export RISCV=/opt/riscv_matrix_toolchain`.

Finally make sure it is in `$PATH`: `export PATH=$RISCV/bin:$PATH`

## Install GCC, LLVM dependencies

`TODO: probably build-essential, bison, cmake, etc?`

## RISC-V GNU Toolchain

```bash
cd $RVM_TEMP_DIR./
git clone --branch 2022.01.17 --recursive https://github.com/riscv/riscv-gnu-toolchain
cd riscv-gnu-toolchain
./configure --prefix=$RISCV --with-abi=ilp32 --with-arch=rv32imc --with-cmodel=medlow
make
```
(same instructions as on x-heep page, but maintaining it here for reference)

## LLVM Toolchain

```bash
cd $RVM_TEMP_DIR./
mkdir llvm-build
cd llvm-build
cmake -DCMAKE_BUILD_TYPE="Release"   \
      -DBUILD_SHARED_LIBS=True -DLLVM_USE_SPLIT_DWARF=True \
      -DCMAKE_INSTALL_PREFIX="$RISCV"   \
      -DLLVM_OPTIMIZED_TABLEGEN=True -DLLVM_BUILD_TESTS=False   \
      -DDEFAULT_SYSROOT="$RISCV/riscv32-unknown-elf"  \
      -DLLVM_DEFAULT_TARGET_TRIPLE="riscv32-unknown-elf" \
      -DLLVM_ENABLE_PROJECTS="clang" \
      -DLLVM_TARGETS_TO_BUILD="RISCV"  \
      ../../llvm-project/llvm
cmake --build . --target install
```

## riscv-pk

```bash
cd $RVM_TEMP_DIR./
git clone https://github.com/riscv-software-src/riscv-pk.git
cd riscv-pk
# old version used
git checkout 9637e60b96b21a7f85a85bf033b87f64fb823b6c

mkdir build
cd build
../configure --prefix=$RISCV --host=riscv32-unknown-elf
make
make install
```

## riscv-opcodes

```bash
cd $RVM_TEMP_DIR./
cd ../riscv-opcodes
# assuming pip is installed and available
pip install -r requirements.txt
make install
```

## Spike

### Install dependencies

On Ubuntu:

```bash
apt install device-tree-compiler libboost-regex-dev
```
On Ubuntu 20.04 I was getting errors at configure time about Boost ASIO libraries, so I also had to do:
```bash
apt install libboost-all-dev
```

### Build

```bash
cd $RVM_TEMP_DIR./
mkdir build-spike
cd build-spike
../../riscv-isa-sim/configure --prefix=$RISCV --with-target=riscv32-unknown-elf
make -j$(nproc)
make install
```

## Test that everything is working
Now assuming you are in the root of the repository:
```bash
cd examples/
PROG=matmul make run
# should see "Pass!" in the output
```

If you see a bunch of warnings about a mismatched ISA version when linking, that is fine.