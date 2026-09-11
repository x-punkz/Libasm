section     .text
    global ft_read
    extern __errno_location

ft_read:
    mov rax, 0
    syscall

    cmp rax, 0
    jl .error

    ret

    .error:
        neg rax
        mov r10, rax

        sub rsp, 8
        call __errno_location wrt ..plt
        sub rsp, 8

        mov dword [rax], r10d

        mov rax, -1
        ret



