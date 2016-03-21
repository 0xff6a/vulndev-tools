section .data

section .bss

section .text

  global _start

_start:
  ; Encode the .text section with random key 79A717FB
  MOV EAX,00404C05                ; save start address to EAXv
  XOR BYTE PTR DS:[EAX],79        ; XOR contents of EAX with key[0]
  INC EAX                         ; increment EAX
  XOR BYTE PTR DS:[EAX],A7        ; XOR contents of EAX with key[1]
  INC EAX                         ; increment EAX
  XOR BYTE PTR DS:[EAX],17        ; XOR contents of EAX with key[2]
  INC EAX                         ; increment EAX
  XOR BYTE PTR DS:[EAX],FB        ; XOR contents of EAX with key[3]
  INC EAX                         ; increment EAX
  CMP EAX,0040A76A                ; check if we have reached the final address
  JLE SHORT 0040A775              ; if not continue to loop

  ; Restore execution flow
  PUSH EBP;                       ; restore first hijacked command
  MOV EBP,ESP                     ; restore second hijacked command
  PUSH -1                         ; restore third hijacked command
  JMP 00404C05                    ; jump back to our starting point

