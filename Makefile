# You probably want to override this to a kernel build for your VM.
KERNEL_TREE_PATH?=/lib/modules/$(shell uname -r)/build

EXTRA_CFLAGS = -DDEBUG

obj-m += kgup-repro.o

all: gup-repro kgup-repro.ko

gup-repro: gup-repro.c
	gcc -Wall -g gup-repro.c -o gup-repro

kgup-repro.ko: kgup-repro.c
	make -C $(KERNEL_TREE_PATH) M=$(PWD) modules

clean:
	make -C $(KERNEL_TREE_PATH) M=$(PWD) clean
	rm -f gup-repro

.PHONY: all clean
