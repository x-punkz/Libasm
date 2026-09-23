#include <stdio.h>
#include <stdlib.h>
#include "../libasm.h"

// Essa main testa tanto a list_push_front, quanto a list_size.
// o teste de stress é o mesmo pras duas.

int main(void)
{
    // ==========================================
    // TESTE DE STRESS: Teste de Estresse (Lista Gigante)
    // ==========================================
    t_list *huge_list = NULL;
    t_list  *my_list = NULL;
    t_list *current;
    t_list *next_node;
    t_list *next_node2;
    int items = 500000;

    printf("[TESTE DE STRESS] Criando lista com %d elementos...\n", items);
    for (int i = 0; i < items; i++)
    {
        // Passamos um ponteiro estático qualquer apenas para preencher o data
        ft_list_push_front(&huge_list, "stress");
    }

    printf("Contando elementos com ft_list_size...\n");
    unsigned int size = ft_list_size(huge_list);
    
    if (size == items) {
        printf("SUCESSO! tamanho da lista ->  %u\n\n", size);
    } else {
        printf("ERRO! Esperado %d, mas obteve %u\n\n", items, size);
    }

    // --- Limpando a memória do teste de estresse ---
    current = huge_list;
    while (current)
    {
        next_node = current->next;
        free(current);
        current = next_node;
    }

    // =====================================================
    // --- TESTE COMUM: Criando 3 nós e printando eles ---
    // =====================================================
    printf("[TESTE DE COMUM] Criando lista com 3 elementos...\n");
    ft_list_push_front(&my_list, " Fine?");
    ft_list_push_front(&my_list, "evaluator!");
    ft_list_push_front(&my_list ,"Hello ");

    printf("tamanho da lista -> %d\n", ft_list_size(my_list));

    current = my_list;
    while (current)
    {
        printf("%s", (char *)current->data);
        current = current->next;
    }

    // --- Limpando a memoria do teste comum ---
        // --- Limpando a memória do teste de estresse ---
    current = my_list;
    while (current)
    {
        next_node2 = current->next;
        free(current);
        current = next_node2;
    } 
    printf("\n");
    return (0);
}