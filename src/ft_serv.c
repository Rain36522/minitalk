/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_serv.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: pudry <pudry@student.42lausanne.ch>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/09/11 14:00:35 by pudry             #+#    #+#             */
/*   Updated: 2024/09/11 14:00:35 by pudry            ###   ########.ch       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

static int	ft_power(int ipuisance)
{
	int	i;

	i = 2;
	if (ipuisance == 0)
		return (1);
	while (ipuisance > 1)
	{
		i *= 2;
		ipuisance --;
	}
	return (i);
}

int	ft_bin_to_int(char *s)
{
	int	i;
	int	j;
	int	ipower;

	i = 0;
	while (s[i])
		i ++;
	if (i != 8)
		return (0);
	j = 0;
	i = 0;
	ipower = 7;
	while (i < 8)
	{
		if (s[i] == '1')
			j += ft_power(ipower);
		i ++;
		ipower --;
	}
	return (j);
}

char	*ft_str(char *str, char *s_bin)
{
	char	c;

	c = (char)ft_bin_to_int(s_bin);
	str = ft_add_str(str, c);
	if (!str)
		return (NULL);
	if (c == '\0')
	{
		ft_printf("%s\n", str);
		free(str);
		return (NULL);
	}
	return (str);
}

void	sig_handler_usr(int signum)
{
	static char	*s_bin;
	static int	ibit;
	static char	*str;

	if (!s_bin || !ibit)
	{
		s_bin = (char *) malloc(sizeof(char) * 9);
		if (!s_bin)
			return ;
		s_bin[8] = '\0';
		ibit = 0;
	}
	if (signum == 30)
		s_bin[ibit] = '0';
	else
		s_bin[ibit] = '1';
	ibit ++;
	if (ibit >= 8)
	{
		str = ft_str(str, s_bin);
		ibit = 0;
		free(s_bin);
	}
}

int	main(void)
{
	pid_t	pid;

	signal(SIGUSR1, sig_handler_usr);
	signal(SIGUSR2, sig_handler_usr);
	pid = getpid();
	ft_printf("pid : %i\n", pid);
	while (1)
		usleep(1);
	return (0);
}
