# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_list_sort_bonus.s                               :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lborges- <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/04/28 19:41:41 by lborges-          #+#    #+#              #
#    Updated: 2020/04/28 19:41:42 by lborges-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
    global ft_list_sort
    extern ft_write

section .data
    msg db ". ", 10
    lenMsg equ $-msg     

ft_list_sort:
    push    r8              ; Auxiliar variable
    push    r9              ; Auxiliar variable 2
    push    r10             ; Current list
    push    r13             ; Index List
    mov     r10, [rdi]
    cmp     r10, 0
    jz      _ret
    mov     r13, [r10 + 8]
    cmp     r13, 0
    jz      _ret
    jmp     _loop2

_loop1:
    mov     r10, [r10 + 8]  ;The next addres of the list
    cmp     r10, 0
    jz      _ret
    mov     r13, [r10 + 8]
        
_loop2:
    cmp     r13, 0x0
    jz      _loop1
    mov     rsi, [r10]      ;Get the adrres of the list's next
    mov     rdi, [r13]      ;Get the adrres of the list's next
    jmp    _ft_strcmp     	;If NULL returns the value of RAX
_fas:
    cmp     rax, 0          ;
    jl      _swap   	    ;value of RAX + 1
_ctn: 
    mov     r13, [r13 + 8]  ;The next addres of the list
    jmp     _loop2

_swap:
    mov r8, [r10]   ;temp = current->data;
    mov r9, [r13]   
    mov [r10], r9   ;current->data = index->data 
    mov [r13], r8   ;index->data = temp;
    jmp _ctn    

_ret:
    pop     r13
    pop     r10
    pop     r9
    pop     r8
    ret

_ft_strcmp:
	push	rcx						; Counter
	mov		rcx, 0x0				; Set counter to zero

_compare:
	xor     rax, rax
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
	jmp     _fas

_sub:
	sub		rax, rbx	;Return s1 - s2
	jmp     _fas