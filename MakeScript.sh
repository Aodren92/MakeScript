
rm -f Makefile


if [ "$1" == "" ]
then
	echo "usage : ./Makefile.sh executable_name Use_libft[0/1]"
else
	RM="rm -f"
	LAST=$(date "+%Y/%m/%d %H:%M:%S")
	CREAT="Created: $LAST by abureau"
	UPDATE="Updated: $LAST by abureau"
################################### HEADER #####################################
echo "#******************************************************************************#" >> Makefile
echo "#                                                                              #" >> Makefile
echo "#                                                         :::      ::::::::    #" >> Makefile
echo "#    Makefile                                           :+:      :+:    :+:    #" >> Makefile
echo "#                                                     +:+ +:+         +:+      #" >> Makefile
echo "#    By: abureau <marvin@42.fr>                     +#+  +:+       +#+         #" >> Makefile
echo "#                                                 +#+#+#+#+#+   +#+            #" >> Makefile
echo "#    $CREAT           #+#    #+#              #" >> Makefile
echo "#    $UPDATE          ###   ########.fr        #" >> Makefile
echo "#                                                                              #" >> Makefile
echo "#******************************************************************************#" >> Makefile
################################# HEADER #####################################

################################## SRC  ######################################
	echo "\nNAME = $1" >> Makefile
	INDEX=0
	NBRFILES=-1
	TAB='\x09'
	for FILES in *.c
	do
			let "NBRFILES = NBRFILES + 1"
	done
	for FILES in *.c
	do
		if [ "$INDEX" == "0" ]
		then
			echo "\nSRC = ./$FILES \\" >> Makefile
		elif [ "$INDEX" == "$NBRFILES" ]
		then
			echo "$TAB./$FILES" >> Makefile
		else
			echo "$TAB./$FILES \\" >> Makefile
		fi
			let "INDEX = INDEX + 1"
	done
################################## SRC  ######################################

	echo "\nCC = clang\n\nOBJ = \$(SRC:.c=.o)\n\nCFLAGS = -Wall -Werror -Wextra" >> Makefile
	echo "\nall: \$(NAME)\n\n\$(NAME): \$(OBJ)" >> Makefile
	
	if [ $2 == "1" ]
	then
		echo "$TAB\$(CC) -o \$@ \$^ -I libft/includes -L libft/ -lft" >> Makefile
		echo "\n%.o: %.c\n$TAB\$(CC) \$(CFLAGS) -I libft/includes -o \$@ -c \$<" >> Makefile
	else
		echo "$TAB\$(CC) -o \$@ \$^" >> Makefile
		echo "\n%.o: %.c\n$TAB\$(CC) \$(CFLAGS) -o \$@ -c \$<" >> Makefile
	fi
	echo "\nclean:\n$TAB$RM \$(OBJ)\n" >> Makefile
	echo "fclean: clean\n$TAB$RM \$(NAME)\n" >> Makefile
	echo "re: fclean all" >> Makefile
fi

cat Makefile
