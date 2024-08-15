include ../common.mk 

DTYPES := fp32 int8 int16 int32
HEADERS = $(foreach dtype,$(DTYPES),matrixMul_$(dtype).h)
SCRIPTS = $(foreach dtype,$(DTYPES),gen_stimuli_$(dtype).py)
PROG = matmul

$(OUT)/$(PROG).elf: $(OUT)/$(PROG).o
	$(CC) $(LDFLAGS) -o $@ $^

$(OUT)/$(PROG).o: main.c $(HEADERS)
	$(CC) $(CFLAGS) -o $@ -c $<

matrixMul_%.h: gen_stimuli_%.py
	python3 $<