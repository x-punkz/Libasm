;Entrada: RDI = ponteiro da string recebida em C
;Retorno: RAX = registrador de 64 bits q vai receber a contagem de caracteres
;Label com ponto: Em montadores como NASM existem labels globais(sem ponto) e labels locais(com ponto), loop e done sao labels locais

section     .text
    global ft_strlen   ;  global serve que o arquivo em C (ou outro arquivo Assembly) consiga enxergar e chamar essa label.

ft_strlen:
    xor rax, rax        ; Zerando o registrador

.loop:

    cmp byte [rdi + rax], 0   ; Compara o char atual com nulo (0), usamos byte pq cada char da string ocupa 1 byte
    je .done            ; Se encontrar o nulo (0), pula pra label .done

    inc rax             ; Incremento rdi (o ponteiro)
    jmp .loop           ; pulo pra label .loop de novo

.done:
    ret                 ; Retorna. Aqui ele retornará o rax, que foi incrementado