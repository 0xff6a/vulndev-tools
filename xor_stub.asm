section .data

section .bss

section .text

  global _start

_start:
  MOV EAX,00404C05          ; save start address to EAX
  XOR BYTE PTR DS:[EAX],0D  ; XOR contents of EAX with our key
  INC EAX                   ; increment EAX
  CMP EAX,0040A76F          ; check if we have reached the final address
  JLE SHORT 0040A775        ; if not continue to loop
  PUSH EBP;                 ; restore first hijacked command
  MOV EBP,ESP               ; restore second hijacked command
  PUSH -1                   ; restore third hijacked command
  JMP 00404C05              ; jump back to our starting point
