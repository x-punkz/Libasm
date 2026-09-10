#include <unistd.h>
#include <stdio.h>
ssize_t ft_write(int fd, const void *buf, size_t count);

int main(void)
{
    printf("-> %ld\n", ft_write(-2, "daniel\n", 7));
    ft_write(1, "nathan\n", 7);
    ft_write(1, "daniel\n", 7);
}