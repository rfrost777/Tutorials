;##################################################################
;#  Custom Shell Code injection PoC - 
;#  Outputs a string to STDOUT and exits.
;##################################################################
global _start           ; define entry label

section .text
_start:
    jmp INFOSTRING      ; unconditional jump to label INFOSTRING

RESUME:
    mov rax, 0x1        ;
    mov rdi, 0x1        ;
    pop rsi             ; ... where we pop it from the stack into rsi
    mov rdx, 0xd        ;
    syscall             ; invoke system_call

    mov rax, 0x3c       ; 
    mov rdi, 0x0        ; set return code 0 (RET_SUCCESS)
    syscall

INFOSTRING:
    call RESUME         ; return to code execution, which, in turn
                        ; pushes the address of our string onto the stack...
    db "Hello World! - Shell Code POC", 0xd, 0xa