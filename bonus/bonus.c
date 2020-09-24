/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   bonus.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: user42 <marvin@42.fr>                      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/09/10 15:50:49 by user42            #+#    #+#             */
/*   Updated: 2020/09/10 15:52:37 by user42           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../libasm.h"

void	aux(t_list *t)
{
	printf("Len: %i\nData:             %s\n", ft_list_size(t), (char *)t->data);
	printf("Next->Data:       %s\n", (char *)t->next->data);
	printf("Next->Next->Data: %s\n", (char *)t->next->next->data);
	printf("\n-----------------\n");
	ft_list_sort(&t);
	printf("Len: %i\nData:             %s\n", ft_list_size(t), (char *)t->data);
	printf("Next->Data:       %s\n", (char *)t->next->data);
	printf("Next->Next->Data: %s\n", (char *)t->next->next->data);
}

int		main(void)
{
	t_list	*t;
	t_list	*t1;
	t_list	*t2;

	t = (t_list *)malloc(2 * sizeof(t_list));
	t->data = (char *)malloc(7);
	t->data = "ABCDRT";
	t->next = NULL;
	printf("Len: %i\nData: %s\n", ft_list_size(t), (char *)t->data);
	t1 = (t_list *)malloc(sizeof(t_list));
	t1->data = (char *)malloc(7);
	t1->data = "Dhdohd";
	t1->next = NULL;
	ft_list_push_front(&t, t1);
	printf("Len: %i\nData:      %s\n", ft_list_size(t), (char *)t->data);
	printf("Pointer:   %p\n", t->next);
	printf("Nxt->Data: %s\n", (char *)t->next->data);
	printf("Pointer:   %p\n", t->next->next);
	t2 = (t_list *)malloc(sizeof(t_list));
	t2->data = (char *)malloc(7);
	t2->data = "B42424";
	t2->next = NULL;
	ft_list_push_front(&t, t2);
	aux(t);
}
