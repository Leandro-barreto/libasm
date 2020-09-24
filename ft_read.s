# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_read.s                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lborges- <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/04/28 19:41:41 by lborges-          #+#    #+#              #
#    Updated: 2020/04/28 19:41:42 by lborges-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

; RDI - First argument = int fd
; RSI - Second Argument = char *buff
; RDX - Third Argument = size_t Buff_size 
section .text
	global ft_read
	extern ft_strlen
	extern __errno_location
	
ft_read:
	mov rax, 0		; Specify sys_read call
	mov rbx, rdi	; Specify File Descriptor
	mov rcx, rsi	; Pass addres of the buffer to read to
	mov rdx, rdx 	; Pass the number of chars to read
	syscall
	cmp rax, 0		
	jl _err			; if doesn't work, jmp to error
	ret

_err:
	mov		rdi, rax		; Using rdi to call _errno_location 
	neg		rdi					
	call	__errno_location	; Recording in _errno
	mov		[rax], rdi
	mov		rax, -1				; Return -1
	ret
