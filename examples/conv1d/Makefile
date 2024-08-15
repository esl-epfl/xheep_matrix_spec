include ../common.mk 

PROG = conv1d

$(OUT)/$(PROG).elf: $(OUT)/$(PROG).o $(OUT)/conv1d_exo.o
	$(CC) $(LDFLAGS) -o $@ $^

$(OUT)/$(PROG).o: main.c exo/conv1d_exo.h conv1Di32.h
	$(CC) $(CFLAGS) -o $@ -c $<

$(OUT)/conv1d_exo.o: exo/conv1d_exo.c
	$(CC) $(CFLAGS) -o $@ -c $<

exo/conv1d_exo.h: exo/conv1d_exo.c
exo/conv1d_exo.c: exo/conv1d.py
	exocc -o exo/ --stem conv1d_exo exo/conv1d.py

conv1Di32.h: gen_stimuli.py
	python3 $<