#-----------------------------------------------------------------
#-- Ejemplo de impresion de una cadena a traves de la UART
#-- (Puerto serie)
#-----------------------------------------------------------------

	#-- Constantes del sistema operativo
	.eqv EXIT 10


	.data
msg:	.string "Bienvenido al sistema...\n"
msg2:   .string "Login: "

	.text
	
	#-- Inicializar la UART
	jal UART_init

	#-- Imprimir un mensaje
	la a0, msg
	jal UART_print
	
	#-- Imprimir otro mensaje
	la a0, msg2
	jal UART_print
	
	
	#-- Hemos terminado con la UART
	jal UART_close
	
	#-- Terminar
	li a7, EXIT
	ecall
	
inf:
	j inf
	


