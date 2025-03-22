all: wynnos.iso
kernel.o: kernel/kernel.c
    x86_64-elf-gcc -ffreestanding -O2 -Wall -Wextra -c $< -o $@
kernel.bin: kernel.o linker.ld
    x86_64-elf-ld -o $@ -T linker.ld kernel.o
iso: kernel.bin
    mkdir -p iso/boot/grub
    cp kernel.bin iso/boot/
    cp grub/grub.cfg iso/boot/grub/
    grub-mkrescue -o wynnos.iso iso/
clean:
    rm -rf build iso wynnos.iso
