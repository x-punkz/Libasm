; Retorno 0 se as letras forem iguais ate a string acabar e um se nao.

section     .text
    global  ft_strcmp

ft_strcmp:
    xor rax, rax

    mov r10, rdi
    and r10, rsi
    jz .error
    
    .loop:

        mov r8b, byte [rdi + rax]       ; Copio o char do primeiro argumento (rdi) para um registrador temporario (r8b(b de byte usado so p uma letra))
        mov r9b, byte [rsi + rax]       ; Copio o char do segundo argumento (rsi) para um registrador temporario (r9b)

        cmp r8b, r9b                    ; Comparo os dois registradores
        jne .done                ; jne jump not equal

        cmp r8b, 0                      ; Comparo a letra com num p ver se a string acabou
        je .done
        
        inc rax
        jmp .loop
    
    .done:
        sub r8b, r9b
        movsx rax, r8b
        ret

    .error:
        mov rax, -1
        ret