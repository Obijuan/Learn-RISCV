#-----------------------------------------------------------------
#-- Ejemplo de impresion de una cadena a traves de la UART
#-- (Puerto serie)
#-----------------------------------------------------------------

	#-- Constantes del sistema operativo
	.eqv EXIT 10


	.data
msg:	.string "Pulsa una tecla..."
msg2:   .string "OK! Tecla: "

	.text
	
	#-- Inicializar la UART
	jal UART_init

	#-- Imprimir un mensaje
	la a0, msg
	jal UART_print
	
	
	#-- Esperar hasta que se apriete una tecla
	jal UART_key
	
	#-- Guardar tecla
	mv s1, a0
	
	#-- Imprimir otro mensaje
	la a0, msg2
	jal UART_print
	
	#-- Imprimir tecla
	mv a0, s1
	jal UART_tx
	
	
	#-- Hemos terminado con la UART
	jal UART_close
	
	#-- Terminar
	li a7, EXIT
	ecall
	
inf:
	j inf
	


