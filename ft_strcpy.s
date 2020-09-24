# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcpy.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lborges- <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/04/28 19:41:10 by lborges-          #+#    #+#              #
#    Updated: 2020/04/28 19:41:13 by lborges-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

; RDI is the first input = Destination
; RSI is the second input = Source
; RAX is the return	

section .text
	global ft_strcpy

ft_strcpy:
	push rdx					; Char that will be copied
	push rcx					; Counter
	mov rcx, 0x0				; Start counter rcx at zero 
	cmp rsi, byte 0x0			; Test for a NULL source
	jz _null					; If source is null return Source
	
_copy:
	cmp byte [rsi + rcx], 0		; Verify if it's the end of the source 
	jz _end						; Returns the destination
	mov dl, byte [rsi + rcx]	; Copy the src's byte to auxiliar
	mov byte [rdi + rcx], dl	; Copy from aux to dest
	inc rcx						; Increment the counter
	jmp _copy					; Restart the loop

_end:
	mov byte [rdi + rcx], 0x0	; Insert the "\0"
	mov	rax, rdi				; Mov to rax to return the dest
	pop	rcx
	pop rdx
	ret

_null:	
	mov	rax, rsi
	pop	rcx
	pop rdx
	ret
