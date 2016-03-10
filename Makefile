#******************************************************************************#
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: abureau <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/03/09 17:25:39 by abureau           #+#    #+#              #
#    Updated: 2016/03/09 17:25:39 by abureau          ###   ########.fr        #
#                                                                              #
#******************************************************************************#

NAME = a.out

SRC = ./main.c \

CC = clang

OBJ = $(SRC:.c=.o)

CFLAGS = -Wall -Werror -Wextra

all: $(NAME)

$(NAME): $(OBJ)
	$(CC) -o $@ $^ -I libft/includes -L libft/ -lft

%.o: %.c
	$(CC) $(CFLAGS) -I libft/includes -o $@ -c $<

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

re: fclean all
