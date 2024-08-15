OUT = out
PROG ?= matmul

default: run
.PHONY: run build clean $(OUT)/$(PROG).elf

run: $(OUT)/$(PROG).elf
	spike --isa=RV32IMC_xmatrix pk -s $<

build: $(OUT)/$(PROG).elf

$(OUT)/$(PROG).elf: 
	@mkdir -p $(OUT)
	@make -C $(PROG)/ OUT=$(shell pwd)/$(OUT)

clean:
	rm -rf out/
