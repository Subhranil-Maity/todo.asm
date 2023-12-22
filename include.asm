  macro syscall4 arg0, arg1, arg2, arg3{
		
	mov rax, arg0
	mov rdi, arg1
	mov rsi, arg2
	mov rdx, arg3
	syscall
}
macro syscall2 arg0, arg1{
		
	mov rax, arg0
	mov rdi, arg1

	syscall
}
macro syscall3 arg0, arg1, arg2{
		
	mov rax, arg0
	mov rdi, arg1
	mov rsi, arg2
	syscall
}
macro syscall2 arg0, arg1{
		
	mov rax, arg0
	mov rdi, arg1
	syscall
}

macro printdata data{
		push r8
		push rdi
		
		mov  r8, data
		mov  rdi, STDOUT
		call print
		
		pop rdi
		pop r8
}
macro log data{
		printdata logpre 
		printdata data
		; printdata ln
}
macro exit code{
		syscall2 EXIT, code
}

macro jdefstr name, value{
		name db value, 0
}
macro defstr name, value{
		name db value, 10, 0
}
macro defint name, value{
		name db value
}
;; fd - FILE DISCRIPTOR 
;; data - PTR TO DATA
macro write fd, data, len{
		syscall4 WRITE, fd, data, len
}
macro cerr{
		cmp rax, 0
		jl error
}
;socket (int __domain, int __type, int __protocol)
macro socket domain, type, protocol{
		syscall4 SOCKET, domain, type, protocol	
}

; struct sockaddr_in {
;          short            sin_family;   2 dw  
;          unsigned short   sin_port;     2 dw
;          struct in_addr   sin_addr;     4 dd
;          char             sin_zero[8];  8 dq
; };
; int bind (int __fd, __CONST_SOCKADDR_ARG __addr, socklen_t __len)
macro bind fd, ptr_socket, size{
		syscall4 BIND, fd, ptr_socket, size
} 
;int listen (int __fd, int __n) 
macro listen fd, n{
		syscall3 LISTEN, fd, n
}
;int accept (int __fd, __SOCKADDR_ARG __addr, socklen_t *__restrict __addr_len);
macro accept fd, ptr_socket, size{
		syscall4 ACCEPT, fd, ptr_socket, size		
}
macro close fd {
	syscall2 CLOSE, fd	
}
