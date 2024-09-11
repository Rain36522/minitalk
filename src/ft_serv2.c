/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_serv2.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: pudry <pudry@student.42lausanne.ch>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/09/11 14:00:40 by pudry             #+#    #+#             */
/*   Updated: 2024/09/11 14:00:40 by pudry            ###   ########.ch       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

char	*ft_add_str(char *str, char c)
{
	int		isize;
	char	*ptr;
	int		i;

	if (str)
		isize = ft_strlen(str);
	else
		isize = 0;
	ptr = (char *) malloc(sizeof(char) * (2 + isize));
	if (!ptr)
		return (NULL);
	ptr[isize + 1] = '\0';
	i = 0;
	while (i < isize)
	{
		ptr[i] = str[i];
		i ++;
	}
	ptr[isize] = c;
	if (str)
		free(str);
	return (ptr);
}
