# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strdup.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lborges- <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/04/28 19:41:24 by lborges-          #+#    #+#              #
#    Updated: 2020/04/28 19:41:27 by lborges-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

; RDI - First argument = String to duplicate

section .text
	global ft_strdup
	extern ft_strcpy
	extern ft_strlen

ft_strdup:	
	push	r12
	mov		r12, rdi	; Using R12 as aux
	call	ft_strlen	; Using the strlen
	mov		rdi, rax	; Recording the returned value of strlen in rdi
	inc		rdi			; Length + 1 for the '/0'
	extern	malloc		
	call	malloc		; Calling malloc with rdi as input
	cmp		rax, 0x0	; Verifying malloc error
	jz		exit
	mov		rdi, rax	; Copying the allocatated memory to rdi
	mov		rsi, r12	
	call	ft_strcpy	; Calling strcpy - RDI = Dest, RSI = Source

exit:
	pop		r12
	ret					; Returning RAX of the strcpy
