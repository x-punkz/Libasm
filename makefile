NAME = libasm.a
CC = cc
NASM = nasm -f elf64
INCLUDES =
SRCS = src/ft_strlen.s \
src/ft_strcmp.s \
src/ft_strcpy.s \
src/ft_write.s  \

H_SRCS = libasm.h

all: $(NAME)

.s:.o
	$(NASM) -s $< -o $@

clean:
	rm -f $(OBJ)
fclean: clean
	rm -f $(NAME)

re: fclean all