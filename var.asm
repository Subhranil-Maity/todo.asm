macro defconst{
		defstr author, "Subhranil-Maity"

		defstr msg_starting_server, "Starting Server"
		defstr msg_seting_socket, "Seting Up Socket"
		defstr msg_binding_socket, "Binding Socket"
		defstr msg_list_socket, "Listening Socket"
		defstr msg_accepting_socket, "Acccepting Socket"
		defstr msg_accepted_socket, "Seting Up Socket"
		defstr errr, "ERROR"
		defstr ok, "OK"
		jdefstr logpre, "[*] "
}
;; db - 1
;; dw - 2
;; dd - 4 
;; dq - 8
macro defvar{
		server_fd dq -1
		client_fd dq -1
}
macro defsockconst{
; struct sockaddr_in 
;          short            sin_family;   2 dw  
;          unsigned short   sin_port;     2 dw
;          struct in_addr   sin_addr;     4 dd
;          char             sin_zero[8];  8 dq
		
		; struc sockaddr_in 
		server_soc_family    dw 0  
		server_soc_port      dw 0
		server_soc_addr      dd 0
		server_soc_zero      dq 0
		
		socket_in_size = $ - server_soc_family
		; server_soc sockaddr_in
		; client_soc sockaddr_in
}
