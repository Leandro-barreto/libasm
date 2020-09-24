NAME = libasm.a

TESTNAME = exec

CLANG = clang

FLAG = -Wall -Wextra -Werror

NA = nasm

NAFLAG = -f elf64

SRC = ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s

SRC_B = bonus/ft_list_push_front_bonus.s bonus/ft_list_size_bonus.s bonus/ft_list_sort_bonus.s

OBJ = $(SRC:.s=.o)

OBJ_B = $(SRC_B:.s=.o)

all:		$(NAME)

$(NAME):	$(OBJ)
			ar rcs $(NAME) $(OBJ)

%.o : %.s
	$(NA) $(NAFLAG) $<

clean:
	rm -f $(OBJ) $(OBJ_B)

fclean: clean
		rm -f $(NAME)
		rm -f $(TESTNAME)

re: 		fclean all

bonus:	$(OBJ) $(OBJ_B)
		ar rcs $(NAME) $(OBJ) $(OBJ_B)

test:
	$(CLANG) $(FLAG) main.c -L. -lasm $(NAME) -o $(TESTNAME)

test_bonus:
	$(CLANG) $(FLAG) bonus/bonus.c -L. -lasm $(NAME) -o $(TESTNAME)

run: test
	./$(TESTNAME)

run_bonus:	test_bonus
			./$(TESTNAME)

.PHONY: all clean fclean re