;##################################################################
;#  Custom Shell Code injection PoC - Linux x64
;#  Outputs a string to STDOUT and exits.
;##################################################################
global _start           ; define entry label

section .text

_start:
    jmp INFOSTRING      ; unconditional jump to label INFOSTRING

RESUME:
    mov rax, 0x01       ; invoke write64() syscall
    mov rdi, 0x01       ; set file descriptor STDOUT_FILENO to STDOUT(1)
    pop rsi             ; ... where we pop it from the stack into rsi
    mov rdx, 0x1F       ; let's hope that I counted the buffer length correctly:
                        ; 29 byte + \r + \n = 31 or 0x1F byte length
    syscall             ; fingers crossed, request the write

    mov rax, 0x3C       ; invoke exit64() syscall
    mov rdi, 0x0        ; set exit value (0 = EXIT_SUCCESS)
    syscall             ; request termination

INFOSTRING:
    call RESUME         ; return to code execution, which, in turn
                        ; pushes the address of our string onto the stack...
    db "Hello World! - Shell Code POC", 0x0D, 0x0A