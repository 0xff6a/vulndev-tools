;
; Sleep in Windows XP SP2
;
[SECTION .text]
; set the code to be 32-bit
; Tip: If you don't have this line in more complex shellcode,
;    the resulting instructions may end up being different to
;    what you were expecting.
BITS 32

  global _start

_start:
; clear the eax register
; Tip: xor is great for zeroing out registers to clear previous values.
xor eax,eax
; move address of Sleep to ebx that we gained from "./arwin.exe Kernel32.dll Sleep"
mov ebx, 0x7c802442
; pause for 5000ms by putting 5000 into ax (8 bit eax register)
; Tip: ax is the lower half of eax. Using ax when possible reduces
;    the instruction size, and therefore the shellcode size.
mov ax, 5000
; push eax onto the stack as the first parameter to the Sleep function.
; Tip: When functions are called, the parameters are pulled from the stack.
push eax
; call the address of Sleep(ms) located in ebx
; Tip: Sleep has one parameter and will pull this from the stack.
call ebx

