NAME = libasm.a
CC = cc
NASM = nasm -f elf64
INCLUDES = libasm.h

GREEN = \033[3;32m
RED = \033[1;31m
RESET = \033[0m

SRCS = src/ft_strlen.s \
src/ft_strcmp.s \
src/ft_strcpy.s \
src/ft_write.s  \
src/ft_read.s	\
src/ft_strdup.s \
src/ft_calloc.s \

BONUS_SRC = src/ft_list_push_front_bonus.s \
src/ft_list_size_bonus.s \

OBJS = $(SRCS:.s=.o)
BONUS_OBJS = $(BONUS_SRC:.s=.o)

all: $(NAME)

$(NAME): $(OBJS)
	ar rcs $(NAME) $(OBJS)
	@echo "\n     $(GREEN)$(NAME) criada com sucesso!$(RESET)"

bonus: $(OBJS) $(BONUS_OBJS)
		ar rcs $(NAME) $(OBJS) $(BONUS_OBJS)
		@echo "$(GREEN)$(NAME) criada com sucesso com Bonus!$(RESET)"

.s.o:
	$(NASM) $< -o $@

$(OBJS): $(INCLUDES)
$(BONUS_OBJS): $(INCLUDES)

clean:
	@rm -f $(OBJS) $(BONUS_OBJS)
	@echo "     $(GREEN)Arquivos .o removidos!$(RESET)"

fclean: clean
	@rm -f $(NAME)
	@echo "     $(RED)Biblioteca apagada$(RESET)"

re: fclean all

.PHONY: all bonus clean fclean re
