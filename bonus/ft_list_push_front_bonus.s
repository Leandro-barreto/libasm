# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_list_push_front_bonus.s                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lborges- <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/04/28 19:41:41 by lborges-          #+#    #+#              #
#    Updated: 2020/04/28 19:41:42 by lborges-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
    global  ft_list_push_front
    extern  malloc
; RDI = **lst
; RSI = *new
; new->next = *lst;
; *lst = new;

ft_list_push_front:
	cmp		rdi, 0	    	; if ret == NULL
	je		_end	    	; then return
	mov		rcx, [rdi]      ; 
	mov		[rsi + 8], rcx	; new->next = *lst
	mov		[rdi], rsi		; *lst = new

_end:
    ret
