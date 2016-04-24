#******************************************************************************#
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: abureau <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/04/24 17:13:18 by abureau           #+#    #+#              #
#    Updated: 2016/04/24 17:13:18 by abureau          ###   ########.fr        #
#                                                                              #
#******************************************************************************#

NAME = test

SRC = ./main.c

CC = gcc

OBJ = $(SRC:.c=.o)

CFLAGS = 

all: $(NAME)

$(NAME): $(OBJ)
	$(CC) -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -o $@ -c $<

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

re: fclean all
