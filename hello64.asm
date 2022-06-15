; Hello World Assembly Version (IA-64)
; using POSIX syscalls 0x04 (write), 0x01 (exit)
; TODO: write an IA-x64 version of this...

SECTION .DATA
  helloText:      db 'This is a write() 64bit syscall!', 0x0A  ; Output, followed by "\n" character
  helloLen:       equ $-helloText                        ; get sizeof(helloText), needed for write() later

SECTION .TEXT
  GLOBAL _main        ; define entry label

_main:
  ; write the string buffer to STDOUT via write() POSIX systemcall
  mov rax, 1          ; invoke write64() syscall
  mov rdi, 1          ; set file descriptor to STDOUT(1)
  mov rsi, helloText  ; pointer to the string buffer
  mov rdx, helloLen   ; size of the buffer
  syscall             ; request a write

  ; Quit the program in an orderly fashion:
  mov rax, 60         ; invoke exit64() syscall
  mov rdi, 0          ; set exit value (0 = OK)
  syscall             ; request termination
