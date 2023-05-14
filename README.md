# GUP repro

## What it does

Reproduces the issue (somewhat) addressed in the patch series [mm/gup: disallow
GUP writing to file-backed mappings by default][0].

The steps being:-

1. Map some file-backed memory.
2. msync it so it's clean.
3. Use a kernel module to GUP-pin it.
4. Write to the file.
5. msync again so it's clean.
6. Trigger the kernel module to write/mark dirty.
7. ???
8. Profit.

## Building and using

A `make` should suffice, to build against a specific kernel (and you should
really be doing this in qemu so this is advised), specify the kernel tree path
like:-

```
make KERNEL_TREE_PATH=/path/to/your/kernel
```

Then, in the vm, simply `sudo insmod kgup-repro.ko` and `sudo ./gup-repro`.

The warning should appear in `dmesg`.

__IMPORTANT:__ The code relies on the test file `test.txt`. This can be
regenerated using the `gen-test-txt.sh` script. Make sure to copy this to the VM
along with the binaries.

## Disclaimer

It'd be unwise to run this on a host system you care about, please do prefer a
VM, but if things do explode then it's not my fault yada yada ;)

All code is GPLv2.

[0]:https://lore.kernel.org/all/cover.1683235180.git.lstoakes@gmail.com/
