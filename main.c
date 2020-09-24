/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: lborges- <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/09/07 16:20:59 by lborges-          #+#    #+#             */
/*   Updated: 2020/09/07 19:57:17 by lborges-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"

void	test_strcpy(void)
{
	char *str1;
	char *str2;

	printf("\n---------FT_STRCPY---------\n");
	str1 = malloc(1);
	str2 = malloc(1);
	printf("\033[0;32mLibasm\033[0m: %s\n", ft_strcpy(str1, ""));
	printf("\033[0;31mSystem\033[0m: %s\n", strcpy(str2, ""));
	ft_strcpy(str1, "Lorem ipsum dolor sit amet,consectetur adipiscing");
	printf("\033[0;32mLibasm\033[0m: %s\n", str1);
	fflush(stdout);
	strcpy(str2, "Lorem ipsum dolor sit amet,consectetur adipiscing");
	printf("\033[0;31mSystem\033[0m: %s\n", str2);
}

void	test_strlen(void)
{
	int n;
	int m;

	printf("---------FT_STRLEN---------\n");
	n = ft_strlen("");
	m = strlen("");
	printf("\033[0;32mLibasm\033[0m: %i\n", n);
	printf("\033[0;31mSystem\033[0m: %i\n", m);
	n = ft_strlen("Lorem ipsum dolor sit amet, consectetur adipiscing elit,");
	m = strlen("Lorem ipsum dolor sit amet, consectetur adipiscing elit,");
	printf("\033[0;32mLibasm\033[0m: %i\n", n);
	printf("\033[0;31mSystem\033[0m: %i\n", m);
	test_strcpy();
}

void	test_strcmp(void)
{
	int	n;
	int	m;

	printf("\n---------FT_STRCMP---------\n");
	printf("\033[0;32mLibasm\033[0m: %i\n", ft_strcmp("", ""));
	printf("\033[0;31mSystem\033[0m: %i\n", strcmp("", ""));
	n = ft_strcmp("", "Lorem ipsum dolor sit amet consectetur adipiscing elit");
	m = strcmp("", "Lorem ipsum dolor sit amet consectetur adipiscing elit");
	printf("\033[0;32mLibasm\033[0m: %i\n", n);
	printf("\033[0;31mSystem\033[0m: %i\n", m);
	n = ft_strcmp("Lorem ipsum dolor sit amet, consectetur adipiscing ", "");
	m = strcmp("Lorem ipsum dolor sit amet, consectetur adipiscing ", "");
	printf("\033[0;32mLibasm\033[0m: %i\n", n);
	printf("\033[0;31mSystem\033[0m: %i\n", m);
	printf("\033[0;32mLibasm\033[0m: %i\n", ft_strcmp("irure ", "irure "));
	printf("\033[0;31mSystem\033[0m: %i\n", strcmp("irure ", "irure "));
}

void	test_strdup(void)
{
	char	*src;
	char	*dest;
	char	*dest1;

	src = malloc(20);
	src = "Lorem 1234 keadwe 789";
	printf("\n---------FT_STRDUP---------\n");
	printf("\033[0;32mLibasm\033[0m: %s\n", ft_strdup(""));
	printf("\033[0;31mSystem\033[0m: %s\n", strdup(""));
	dest = ft_strdup(src);
	printf("\033[0;32mLibasm\033[0m: %s\n", dest);
	dest1 = strdup(src);
	printf("\033[0;31mSystem\033[0m: %s\n", dest1);
}

int		main(void)
{
	int		fd;
	char	buf[13];

	test_strlen();
	test_strcmp();
	printf("\n---------FT_WRITE---------\n");
	fd = open("WriteRead", O_WRONLY | O_CREAT, S_IRUSR | S_IWUSR);
	printf("%sLibasm%s: %li %i\n", G, N, ft_write(1, "Libasm\n", 7), errno);
	printf("%sSystem%s: %li %i\n", R, N, write(1, "System\n", 7), errno);
	printf("%sLibasm%s: %li %i\n", G, N, ft_write(fd, "Libasm F\n", 12), errno);
	printf("%sSystem%s: %li %i\n", R, N, write(fd, "System File\n", 12), errno);
	printf("%sLibasm%s: %li %i\n", G, N, ft_write(fd + 5, "Libas\n", 7), errno);
	printf("%sSystem%s: %li %i\n", R, N, write(fd + 5, "System\n", 7), errno);
	close(fd);
	fd = open("WriteRead", O_RDONLY);
	errno = 0;
	printf("\n---------FT_READ----------\n");
	printf("%sLibasm%s: %li %i\n", G, N, ft_read(1, buf, 7), errno);
	printf("%sSystem%s: %li %i\n", R, N, read(1, buf, 7), errno);
	printf("%sLibasm%s: %li %i\n", G, N, ft_read(fd, buf, 10), errno);
	printf("%sSystem%s: %li %i\n", R, N, read(fd, buf, 10), errno);
	printf("%sLibasm%s: %li %i\n", G, N, ft_read(fd + 5, buf, 7), errno);
	printf("%sSystem%s: %li %i\n", R, N, read(fd + 5, buf, 7), errno);
	close(fd);
	test_strdup();
}
