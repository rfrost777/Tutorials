; Hello World Assembly Version (IA-64)
; using POSIX syscalls 0x01 (write), 0x3C (exit)

global _start        ; define entry label

section .text

_start:

  ; write the string buffer to STDOUT via write() POSIX systemcall
  mov rax, 0x01       ; invoke write64() syscall
  mov rdi, 0x01       ; set file descriptor STDOUT_FILENO to STDOUT(1)
  mov rsi, helloText  ; pointer to the string buffer
  mov rdx, helloLen   ; size of the buffer
  syscall             ; request a write

  ; Quit the program in an orderly fashion:
  mov rax, 0x3C         ; invoke exit64() syscall
  mov rdi, 0x00         ; set exit value (0 = EXIT_SUCCESS)
  syscall               ; request termination

section .rodata

    helloText:      db 'This is a write() 64bit syscall!', 0x0A ; Output, followed by "\n" character
    helloLen:       equ $ - helloText                        	  ; get sizeof(helloText), needed for write() later
