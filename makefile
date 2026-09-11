NAME = libasm.a
CC = cc
NASM = nasm -f elf64
INCLUDES = libasm.h

SRCS = src/ft_strlen.s \
src/ft_strcmp.s \
src/ft_strcpy.s \
src/ft_write.s  \
src/ft_read.s	\
src/ft_strdup.s \
src/ft_calloc.s \

OBJS = $(SRCS:.s=.o)

all: $(NAME)

$(NAME): $(OBJS)
	ar rcs $(NAME) $(OBJS)
	@echo "$(NAME) criada com sucesso!"

.s.o: $(INCLUDES)
	$(NASM) -s $< -o $@

clean:
	rm -f $(OBJS)
	@echo "Arquivos .o removidos!"

fclean: clean
	rm -f $(NAME)
	@echo "Biblioteca apagada"

re: fclean all

.PHONY: all clean fclean re