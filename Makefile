all:
	g++ -Wall variables.cpp -o ./bin/variables
	g++ -Wall input.cpp -o ./bin/input
	g++ -Wall types.cpp -o ./bin/types
	gcc pointers.c -o ./bin/pointers

debug:
	g++ -Wall variables.cpp -g -o ./bin/variables_dbg
	g++ -Wall input.cpp -g -o ./bin/input_dbg
	g++ -Wall types.cpp -g -o ./bin/types_dbg

asm:
	nasm -f elf64 -o ./bin/hello.o hello.asm
	ld -e "main" -o ./bin/hello ./bin/hello.o
	nasm -f elf64 -o ./bin/hello64.o hello64.asm
	ld -o ./bin/hello64 ./bin/hello64.o

clean:
	rm ./bin/*
