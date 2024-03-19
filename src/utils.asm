%include "src/macros.asm"

section .text
    global print_str

print_str:
    push rbp
    mov rbp, rsp

    mov rax, [rsp + 16]     ; Get pointer to string
    push rax                ; Save pointer for printing the string later 
    mov rcx, 0              ; Counter for length of the string

count_loop:
    cmp byte [rax], NUL
    je end_count_loop

    inc rax
    inc rcx
    jmp count_loop
end_count_loop:

    ; Print the string
    mov rax, SYS_WRITE
    mov rdi, STDOUT
    pop rsi
    mov rdx, rcx
    syscall

    mov rsp, rbp
    pop rbp
    ret