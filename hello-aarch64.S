; Hello World Assembly Version (ARM64 aka. AArch64)
; using ARM EABI syscalls 64 (write), 93 (exit)
;
; On your RaspberryPi 4 (or any other system with ARM64 tooling) you can use:
; as -o hello-aarch64.o hello-aarch64.S
; ld -s -o hello-aarch64 hello-aarch64.o
; on any other architecture you could use gcc-aarch64-linux-gnu to cross-compile :)
.data
hlo:
    .asci       "This is a write() ARM64 syscall!\n"    ; Message to write as ASCII string
len = . - hlo                                           ; Length of our string, we need this to allocate the correct buffer length later

.text

.globl _start
_start:
    ; Prepare the write() call. Arguments are expected in registers x0-x5:
    mov x0, #1      ; set file descriptor to STDOUT(1)
    ldr x1, =hlo    ; set x1 points to the start of our Message string
    ldr x2, =len    ; set x2 to the size of our output buffer
    mov w8, #64     ; use syscall 64 (write)...
    svc #0          ; ...and invoke it.

    ; Cleanup and exit the program using the exit() syscall:
    mov x0, #0      ; set exit status (0 OK)
    mov w8, #93     ; execute syscall 93 (exit)...
    svc #0          ; ...and invoke it.