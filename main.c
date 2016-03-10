/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: abureau <marvin@42.fr>                     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/03/09 16:04:05 by abureau           #+#    #+#             */
/*   Updated: 2016/03/09 18:27:34 by abureau          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <stdlib.h>
#include "libft/includes/libft.h"
static int generateheader(const char *login, char ***header)
{
	int i;
	char c[2];
	char **head;

	char *date = NULL;
	i = 0;

	c[1] = '\0';
	head = (char**) malloc(sizeof(char*) + 11);
	while(i++ < 11)
		head[i] = (char*)malloc(sizeof(char) + 80 );

	head[0] = "#******************************************************************************#";
	head[1] = "#                                                                              #";
	head[2] = "#                                                         :::      ::::::::    #";
	head[3] = "#    Makefile                                           :+:      :+:    :+:    #";
	head[4] = "#                                                     +:+ +:+         +:+      #";
	head[5] = ft_strjoin("#    By: ", login);
	head[5] = ft_strjoin(head[5], " <");
	head[5] = ft_strjoin(head[5], login);
	head[5] = ft_strjoin(head[5], "@student.42.fr>");
	while (ft_strlen(head[5]) < 52)
		head[5] = ft_strjoin(head[5], " ");
	head[5] = ft_strjoin(head[5], "+#+  +:+       +#+         #");
	head[6] = "#                                                 +#+#+#+#+#+   +#+            #";
	head[7] = "#    Created: ";
	FILE *sortie  = popen("date \"+%Y/%m/\%d %H:%M:\%S\"", "r");
	if (sortie == NULL)
	{
		printf("ERROR OPEN");
		exit(0);
	}
	while ((c[0] = fgetc(sortie)) != EOF)
		if (c[0] == '\n')
		;
		else
			if (date)
			date = ft_strjoin(date, c);
			else
			date = ft_strdup(c);
			head[7] = ft_strjoin(head[7], date);
	head[7] = ft_strjoin(head[7], " by ");
	head[7] = ft_strjoin(head[7], login);
		
	while (ft_strlen(head[7]) < 55)
		head[7] = ft_strjoin(head[7], " ");
	head[7] = ft_strjoin(head[7], "#+#    #+#              #");
	pclose(sortie);

	head[8] = "#    Updated: ";
			head[8] = ft_strjoin(head[8], date);
	head[8] = ft_strjoin(head[8], " by ");
	head[8] = ft_strjoin(head[8], login);
	while (ft_strlen(head[8]) < 54)
		head[8] = ft_strjoin(head[8], " ");
	head[8] = ft_strjoin(head[8], "###   ########.fr        #");
	head[9] = head[1];
	head[10] = head[0];



		*header = head;
	return (0);
}

int main(int argc, char **argv)
{
	char	login[50];
	char	**header;

	argc =0;
	argv = 0;
	
	printf("Greation du MakeScript \n\nCreation du Header: \ntapez votre login\n\n");
	scanf("%s", login);
	
	generateheader(login, &header);
	for (int i = 0; i <= 10; i++)
		printf("%s\n",header[i]);

}
