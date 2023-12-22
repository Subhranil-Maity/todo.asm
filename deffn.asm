macro define_print fd{
print:
		push r9
		s_p_loop:
				movzx r9, byte[r8]
				test r9, r9
						jz e_p_loop
				; mov rdi,          ; file descriptor 1 (stdout)
				mov rax, WRITE         ; syscall number for sys_write
				mov rdx, 1         ; length of the character to be printed
				mov rsi, r8        ; pointer to the character to be printed
				syscall

				inc r8
				jmp s_p_loop
		e_p_loop:
		pop r9
		ret
}
