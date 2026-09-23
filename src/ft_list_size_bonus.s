section .text
    global ft_list_size

ft_list_size:
    xor rax, rax

    mov r10, rdi
    .loop:
        cmp r10, 0
        je .done
        inc rax
        mov r10, qword [r10 + 8]
        jmp .loop
    
    .done:
        ret