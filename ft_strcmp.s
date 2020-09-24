# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcmp.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lborges- <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/04/28 19:40:58 by lborges-          #+#    #+#              #
#    Updated: 2020/04/28 19:41:00 by lborges-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global ft_strcmp

ft_strcmp:
	push	rcx						; Counter
	mov		rcx, 0x0				; Set counter to zero

_compare:
	mov		al, byte [rdi + rcx]	;writing the char of s1 in the last byte of rax 
	cmp		al, 0x0					;If '\0' end function
	je		_end
	mov		bl, byte [rsi + rcx]	; writing the char of s1 in the last byte of rbx 
	cmp 	bl, 0x0					; If '\0' end function
	je		_end
	cmp		bl, al					; Compare the chars
	jne 	_end					; If not equal, end function
	inc		rcx						; Increment the counter
	jmp		_compare				; Keep the loop going

_end:
	mov		al, byte [rdi + rcx] 	; Mov char of s1 to rax
	mov		bl, byte [rsi + rcx]	; Mov char of s2 to rbx
	pop		rcx
	cmp		al, bl				 	; [s2 - s1] into rax
	je 		_equal
	jne 	_sub

_equal:
	mov		rax, 0	;Return 0 if equal
	ret

_sub:
	sub		rax, rbx	;Return s1 - s2
	ret
