#ifndef  LIBASM_H
# define LIBASM_H

#include <string.h>
#include <unistd.h>

typedef struct	s_list
{
	void	*data;
	struct	s_list	*next;

}	t_list;

size_t  ft_strlen(const char *s);
int		ft_strcmp(const char *s1, const char *s2);
char	*ft_strcpy(char *dst, const char *src);
ssize_t ft_write(int fd, const void *buf, size_t count);
ssize_t ft_read(int  fd  , void  *buf, size_t  count);
char	*ft_strdup(const char *s);
void    *ft_calloc(size_t count, size_t size);
void	ft_list_push_front(t_list **begin_list, void *data);
unsigned int ft_list_size(t_list *begin_list);

#endif
