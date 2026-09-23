# Libasm

Uma biblioteca de funções escritas puramente em **Assembly x64 (Sintaxe Intel)** para sistemas **Linux**, integrada de forma nativa com a linguagem C. Desenvolvida como parte do currículo da **42**.

O projeto foca no entendimento profundo da arquitetura de computadores, convenções de chamada de sistema (system calls), manipulação direta da memória (Stack e Heap) e gerenciamento de ponteiros.

---

## Funções Implementadas

### Parte Obrigatória (Mandatory)
* `ft_strlen` – Calcula o comprimento de uma string.
* `ft_strcpy` – Copia uma string para outra.
* `ft_strcmp` – Compara duas strings.
* `ft_write` – Escreve dados em um descritor de arquivo (`syscall 1`).
* `ft_read` – Lê dados de um descritor de arquivo (`syscall 0`).
* `ft_strdup` – Duplica uma string alocando memória dinamicamente.
* `ft_calloc` – Aloca memória limpando os bytes para zero.

### Parte Bônus (Estruturas de Dados)
* `ft_list_push_front` – Insere um novo elemento no início de uma lista encadeada genérica.
* `ft_list_size` – Conta o número de elementos de uma lista encadeada.

---

## Como Compilar e Usar

### Pré-requisitos
Certifique-se de ter o montador `nasm` instalado em seu ambiente Linux:
```bash
sudo apt update && sudo apt install nasm build-essential
```

### Compilação
O projeto utiliza um `Makefile` configurado para compilar os arquivos de forma otimizada e sem *warnings*:

1. Para compilar apenas a **parte obrigatória**:
   ```bash
   make
   ```
2. Para compilar incluindo as funções de **lista encadeada (bônus)**:
   ```bash
   make bonus
   ```

Ambos os comandos vão gerar o arquivo de biblioteca estática **`libasm.a`**.

---

## Exemplo de Uso no C

Crie um arquivo de teste (ex: `main.c`) incluindo o cabeçalho `libasm.h`:

```c
#include <stdio.h>
#include "libasm.h"

int main(void) {
    char *str = "Olá, Assembly!";
    
    // Testando a ft_strlen escrita em ASM
    printf("Tamanho da string: %zu\n", ft_strlen(str));
    return (0);
}
```

Para compilar o seu código C linkando com a biblioteca gerada, rode:
```bash
cc main.c libasm.a -o teste
./teste
```
