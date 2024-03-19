; System calls
SYS_READ equ 0
SYS_WRITE equ 1
SYS_EXIT equ 60

STDIN equ 0
STDOUT equ 1
STDERR equ 2

EXIT_SUCCESS equ 0
EXIT_FAILURE equ 1

; ASCII CHARACTERS
NUL equ 0x0
BS equ 0x8
HT equ 0x9
LF equ 0xA

%macro exit 1
    mov rax, SYS_EXIT
    mov rdi, %1
    syscall
%endmacro