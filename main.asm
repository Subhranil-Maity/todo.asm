format ELF64 executable

include 'linux.asm'
include 'deffn.asm'
include 'include.asm'
include 'var.asm'

backlog = 100

segment readable executable
entry main
define_print
main:
		; int3
		log msg_starting_server
		log msg_seting_socket
		
		;socket(AF_INET, SOCK_STREAM, 0);
		; int3
		socket AF_INET, SOCK_STREAM, 0 
		cerr
		mov qword [server_fd], rax
		; server socket structure
		mov [server_soc_family], AF_INET 
		; mov [server_soc_port], 16415 
		mov [server_soc_port], 8080 
		mov [server_soc_addr], INADDR_ANY
		
		log msg_binding_socket

		bind [server_fd], server_soc_family, socket_in_size
		cerr
		
		log msg_list_socket

		listen [server_fd], backlog
		cerr
		main_loop:
		log msg_accepting_socket
		accept [server_fd], server_soc_family, socket_in_size 
		log msg_accepted_socket
		cerr
		mov qword [client_fd], rax
		close [client_fd]
		jmp main_loop
		
		close [server_fd]

		log ok
		exit 0
error:
		close [client_fd]
		close [server_fd]
		log errr
		exit -1
segment readable writeable
defconst
defvar
defsockconst
