; Hello World Assembly Version (Intel-x86)
; using Linux syscalls 0x04 (write), 0x01 (exit)
; TODO: write an IA-x64 version of this...

SECTION .DATA
  helloText:      db 'This is a write() syscall!', 10  ; Output, followed by "\n" character
  helloLen:       equ $-helloText                      ; get sizeof(helloText), needed for write() later

SECTION .TEXT
  GLOBAL _main        ; define entry label

_main:
  ; "man 2 syscall" and "man 2 write" to find out how to invoke write()
  mov eax, 4          ; invoke write() syscall
  mov ebx, 1          ; set filedesc to STDOUT(1)
  mov ecx, helloText  ; pointer to our buffer
  mov edx, helloLen   ; size of the buffer
  int 80h             ; request interrupt from the kernel

  ; Quit the program in an orderly fashion:
  mov eax, 1          ; invoke exit() syscall
  mov ebx, 0          ; set return value (0 = OK)
  int 80h             ; request termination from kernel
