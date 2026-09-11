; Os argumentos ja vem nos registradores certos q a syscall usa, entao com a main em c, n preciso me preocupar

section     .text
    global ft_write
    extern __errno_location                 ; Para tratar erros igual à funçao original

ft_write:
    mov rax, 1                              ; Codigo syscall 'write' do linux
    syscall                                 ; Transfere o controle pro kernel

    cmp rax, 0                              ; O linux retorna erro de siscall negativos.
    jl .error                               ; Se rax for menor q zero, deu erro e ele pula pro .error

    ret                                     ; Se deu certo, RAX já contém o número de bytes escritos e pode retornar.

    .error:
        neg rax                             ; Converto o valor negativo do rax para positivo pro linux tratar.
        mov r10, rax                        ; Salvo esse codigo de erro em um reg temporario

        sub rsp, 8                          ; Alinha a pilha p chamar a funçao externa do C.
        call __errno_location wrt ..plt     ; Devolve o enderço do errno em rax. (wrt ..plt ) gera a relocalização correta para sistemas PIE. e nao da erro de copilaçao
        add rsp, 8                          ; Desfaz o alinhamento

        mov dword [rax], r10d               ; Grava o cod do erro em r10 dentro do errno (d é de dword)

        mov rax, -1                         ; Retorno de erro como na original
        ret