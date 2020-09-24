# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_list_size_bonus.s                               :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lborges- <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/04/28 19:41:41 by lborges-          #+#    #+#              #
#    Updated: 2020/04/28 19:41:42 by lborges-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
    global ft_list_size

ft_list_size:
    mov     rcx, 0			;Start counter
    cmp     rdi, 0x0
    je      _ret
    inc     rcx
    jmp     _loop

_loop:
    mov     rsi, [rdi + 8]      ;Get the adrres of the list's next
    cmp     rsi, 0x0    		;Compare the address
    je      _ret				;If NULL returns the value of RAX
    inc     rcx					;value of RAX + 1
    mov     rdi, [rdi + 8]  	;The next addres of the list
    jmp     _loop

_ret:
    mov     rax, rcx
    ret
