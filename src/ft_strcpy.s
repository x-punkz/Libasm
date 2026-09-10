section     .text
    global  ft_strcpy

ft_strcpy:
    xor rax, rax

    .loop:
        cmp byte [rsi + rax], 0
        je .done
        mov r8b, byte [rsi + rax]
        mov byte [rdi + rax], r8b

        inc rax
        jmp .loop
    
    .done:
        mov byte [rdi + rax], 0     ; Adiciono o nulo no final da string
        mov rax, rdi                ; Movo o ponteiro de rdi para rax,p ele retornar o ponteiro
        ret