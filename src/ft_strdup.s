section     .text
    global ft_strdup
    extern strlen
    extern strcpy
    extern malloc

ft_strdup:
    xor rax, rax

    cmp rdi, 0
    jz .error

    mov rbx, rdi            ; Tenho q passar p um registrador segurao(q nao e'sobescrito toda hora) como rbx
    call strlen wrt ..plt
    inc rax                 ; Incremento o rax pro byte nulo

    mov rdi, rax            ; Move o tamanho do retorno do len p rdi
    call malloc wrt ..plt   ; Malloc usa rdi como primeiro argumento e retorna em rax o endereço do aloc
    test rax, rax               ; Testa o malloc p ver se n deu pau
    jz .error
    
    mov rdi, rax            ; agora eu pego esse endereço e jogo p rdi de novo

    mov rsi, rbx            ; Passo a string p rsi(usado como segundo argumento)
    call strcpy wrt ..plt   ; A cpy usa a alocada em rdi como dst e a string em rsi como src e retorna a copia alocada no rax

    ret

    .error:
        mov rax, 0
        ret
