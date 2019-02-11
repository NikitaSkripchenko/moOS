Plan:
1. ~~Set the environment~~
2. ~~Make the Bootloader for 16bit system~~
3. Make the boot loader available for 32bit
4. Write and build the Kernel
5. Load Kernel
6. Connect hardware I/o
7. Handle interrupts
8. Implement a shell
9. Implement a stdlib.c

You need:
- nasm (brew install nasm)
- qemu (brew install qemu)

to compile:
nasm -f boot_sect.asm -o boot_sect.bin

to run with qemu:
qemu-system-x86_64 boot_sect.bin
