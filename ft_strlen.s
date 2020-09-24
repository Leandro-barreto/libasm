# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strlen.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lborges- <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/04/28 19:39:56 by lborges-          #+#    #+#              #
#    Updated: 2020/04/28 19:40:19 by lborges-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global ft_strlen

	; RDI is the input of the fucntion
	; RAX is the value that will be returned

ft_strlen:
	mov	rax, 0x0			; Move zero to rax to start counter

_comp:	
    cmp	byte [rdi+rax],0x0	; Compare byte with '\0'
	jz	_end		        ; With byte equal '\0' jump to end
	inc	rax		            ; Increment rax 
	jmp	_comp		        ; Restart the loop

_end:
	ret			; Returns the counter rax
