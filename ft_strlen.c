#include <stdio.h>
#include <string.h>

size_t ft_strlen(char *str);
int main(void)
{
    printf("%zu\n", ft_strlen("debora"));
    printf("%zu\n", strlen("debora"));
}