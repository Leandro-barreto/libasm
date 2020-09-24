# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_write.s                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lborges- <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/04/28 19:41:34 by lborges-          #+#    #+#              #
#    Updated: 2020/04/28 19:41:35 by lborges-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

; RDI first argument  = int fd
; RSI second argument = char *buff
; RDX third argument = int BUFF_SIZE
section .text
	global ft_write
	extern	__errno_location

ft_write:
	mov rax, 1		; Specify sys_write call
	mov rbx, rdi	; File descriptor
	mov rcx, rsi	; Pass addres of the string to write
	mov rdx, rdx 	; Pass the number of chars to write
	syscall
	cmp rax, 0		
	jl _err		; if doesn't work, write set flags carry to 1 so jmp exit error

_ret:
	mov rax, rdx	; Return the number of chars written
	ret

_err:
	mov		rdi, rax
	neg		rdi
	call	__errno_location
	mov		[rax], rdi
	mov		rax, -1
	ret