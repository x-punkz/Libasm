section     .text
    global ft_calloc
    extern malloc
    extern bzero

ft_calloc:
    xor rax, rax

    cmp rdi, 0
    jle .error
    cmp rsi, 0
    jle .error


    imul rdi, rsi               ; O i é pra mult 2 valores. O resultado da mult é salvo em rdi
    mov r12, rdi                ; Guardo o result em um reg seguro

    call malloc wrt ..plt
    test rax, rax               ; Testa o malloc p ver se n deu pau
    jz .error

    mov r13, rax                ; Guarda o ponteiro pro aloc em outro rg seguro

    mov rdi, r13                ; Primeiro arg do bzero, o destino
    mov rsi, r12                ; Segundo arg, o tamanho
    call bzero wrt ..plt

    mov rax, r13                ; p prevenir q rax n esteja bagunçado, mando o endereço do aloc novamente p ele antes de retronar
    
    ret

    .error:
        mov rax, 0
        ret
