/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: user42 <marvin@42.fr>                      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/08/21 03:30:50 by user42            #+#    #+#             */
/*   Updated: 2020/09/09 16:52:10 by user42           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBASM_H
# define LIBASM_H

# include <stdio.h>
# include <unistd.h>
# include <string.h>
# include <sys/types.h>
# include <sys/stat.h>
# include <fcntl.h>
# include <stdlib.h>
# include <errno.h>

# define G "\033[0;32m"
# define R "\033[0;31m"
# define N "\033[0m"


extern int errno;
typedef struct	s_list
{
	void			*data;
	struct s_list	*next;
}				t_list;

size_t			ft_strlen(const char *s);
int				ft_strcmp(const char *s1, const char *s2);
char			*ft_strcpy(char *dest, const char *src);
char			*ft_strdup(const char *s);
ssize_t			ft_read(int fd, void *buf, size_t count);
ssize_t			ft_write(int fd, const void *buf, size_t count);
int				ft_list_size(t_list *lst);
void			ft_list_push_front(t_list **lst, t_list *new);
void			ft_list_sort(t_list **lst);

#endif
