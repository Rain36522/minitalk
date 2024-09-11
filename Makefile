# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pudry <pudry@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/10/27 09:01:54 by pudry             #+#    #+#              #
#    Updated: 2024/09/11 14:14:52 by pudry            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

RESET = \033[0m
BLUE = \\033[1;34m
WHITE = \\033[0;37m
YELLOW = \\033[0;33m
RED = \\033[1;31m
GREEN = \\033[1;32m
BRWN = \\033[0; 33m

NAME_CLT = client
NAME_SRV = serveur
CC = gcc
FLAGS = -Wall -Wextra -Werror
PRINTF = ft_printf/libftprintf.a
INCLUDES = -I ft_printf/includes -I ft_printf/libft/includes -I includes
# -L $(PRINTF) -lft


SRC_SRV = src/ft_serv.c src/ft_serv2.c
SRC_CLT = src/ft_client.c

OBJ_SRV = $(SRC_SRV:src/%.c=objet/%.o)
OBJ_CLT = $(SRC_CLT:src/%.c=objet/%.o)

all : $(OBJ_SRV) $(OBJ_CLT)
	@make -C ft_printf/
	@$(CC) $(FLAGS) $(OBJ_SRV) $(PRINTF) -o $(NAME_SRV)
	@$(CC) $(FLAGS) $(OBJ_CLT) $(PRINTF) -o $(NAME_CLT)


clt : $(OBJ_CLT)
	@make -C ft_printf/
	@$(CC) $(FLAGS) $(OBJ_CLT) $(PRINTF) -o $(NAME_CLT)


srv : $(OBJ_SRV)
	@make -C ft_printf/
	@$(CC) $(FLAGS) $(OBJ_SRV) $(PRINTF) -o $(NAME_SRV)

clean :
	@rm -f $(OBJ_CLT) $(OBJ_SRV)
	@make clean -C ft_printf/

fclean : clean
	@rm -f $(NAME_CLT) $(NAME_SRV) 
	@make fclean -C ft_printf/

re : fclean all

objet/%.o: src/%.c
	@mkdir -p $(dir $@)
	@$(CC) $(FLAGS) -c $< -o $@ $(INCLUDES)

header :
	@echo "${GREEN}"
	@echo "		   __________"
	@echo "		 . ---------- ."
	@echo "		 | .--------. |"
	@echo "		 | | ${BLUE}COMPILE${GREEN}| |       __________       ___"
	@echo "		 | | ${BLUE}FILE${GREEN}   | |      /__________\\    {~${RED}.${GREEN}_${RED}.${GREEN}~}"  
	@echo "	.--------|  --------  |------|    --=-- |-----( Y )---."
	@echo "	|         ----,-.-----       |o ======  |    ()~*~()  | "
	@echo "	|       ______|_|_______     |__________|    (_)-(_)  | "
	@echo "	|      /  %%%%%%%%%%%%  \\                             | "
	@echo "	|     /  %%%%%%%%%%%%%%  \\                            | "
	@echo "	|     ^^^^^^^^^^^^^^^^^^^^                            | "
	@echo "	+-----------------------------------------------------+"
	@echo "	^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ "
	@echo "${RESET}"



.PHONY : fclean re all header clean cnt check leak