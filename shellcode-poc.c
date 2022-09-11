/*************************************************
/       Custom Shellcode PoC
/
/   [1] compile custom_shellcode.asm using: nasm -f elf64 custom_shellcode.asm
/       and link it: ld custom_shellcode.o -o custom_shellcode
/
/   [2] extract the .text section:
/       objcopy -j .text -O binary custom_shellcode custom_shellcode.text
/
/   [3] use xxd for an easy hex-value copy-pasta:
/       xxd -i custom_shellcode.text
/
/   [4] compile this program using:
/       gcc -g -Wall -z execstack shellcode_poc.c -o shellcode_poc
/       to disable NX protection, because we are naughty with stack and the
/       data segment here.
/
*************************************************/
#include <stdio.h>

int main(int argc, char **argv) {
    // copy-paste your xxd output here
    unsigned char custom_shellcode[] = {
        0xeb, 0x1e, 0xb8, 0x01, 0x00, 0x00, 0x00, 0xbf, 0x01, 0x00, 0x00, 0x00,
        0x5e, 0xba, 0x1f, 0x00, 0x00, 0x00, 0x0f, 0x05, 0xb8, 0x3c, 0x00, 0x00,
        0x00, 0xbf, 0x00, 0x00, 0x00, 0x00, 0x0f, 0x05, 0xe8, 0xdd, 0xff, 0xff,
        0xff, 0x48, 0x65, 0x6c, 0x6c, 0x6f, 0x20, 0x57, 0x6f, 0x72, 0x6c, 0x64,
        0x21, 0x20, 0x2d, 0x20, 0x53, 0x68, 0x65, 0x6c, 0x6c, 0x20, 0x43, 0x6f,
        0x64, 0x65, 0x20, 0x50, 0x4f, 0x43, 0x0d, 0x0a
    };

    // and inject the bytecode with this:
    (*(void(*)())custom_shellcode)();
    return 0;
} //end main