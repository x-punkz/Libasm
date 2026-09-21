section .text
    global ft_list_push_front
    extern malloc

ft_list_push_front:
    ; Pra começar, salvo os endereços dos regs reservar na pilha
    push rbx
    push r12

    ; Agora passo o endereço de rdi e rsi p eles pq o malloc vai destrui-los
    mov r12, rdi
    mov rbx, rsi

    ; Aloco a memoria pro nó, como o malloc espera o rdi, passo o tamanho de bytes q vou querer pro rdi
    ; 16 pq sao 8 do ponteiro e 8 do dado 
    mov rdi, 16
    call malloc wrt ..plt

    ; Agora eu copio o dado p dentro de node->data
    mov qword [rax], rbx

    ; Faço o next apontar para o nó q atualmente esta no topo da lista
    mov rcx, qword [r12]            ; movo o endereço + dado do primeiro atual no (16 bytes) pro reg temporario
    mov qword [rax + 8], rcx        ; E coloco esse endereço, no next p apontar pra esse novo nó, ou seja 8 bytes a frente do endereço q esta em rax

    ; Atualizo a cabeça da lista pro novo endereço
    mov qword [r12], rax            ; *begin_list = novo_nó

    ; LImpo a pilha (reorganizo) e retorno
    pop r12
    pop rbx
    ret