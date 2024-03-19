%include "src/macros.asm"

extern print_str

section .data
	text db "Hello, world", LF, NUL

section .text
	global _start

_start:
	push text
	call print_str

	; Exit program
	exit EXIT_SUCCESS
