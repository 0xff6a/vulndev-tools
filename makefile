jmp-relative: jmp-relative.o
	ld -m elf_i386 jmp-relative.o -o jmp-relative

jmp-relative.o: jmp-relative.asm
	nasm -f elf32 -g -F stabs jmp-relative.asm

clean:
	rm jmp-relative
	rm jmp-relative.o
