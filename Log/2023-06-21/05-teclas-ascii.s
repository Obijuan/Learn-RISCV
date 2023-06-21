#-----------------------------------------------------------------
#-- Ejemplo de lectura de teclas
#-- Todo lo leido se imprime en la consola, como numero entero
#-- (para ver su codigo ascii)
#-- (Puerto serie)
#-----------------------------------------------------------------

	.eqv ENTER 10
	.eqv ESC 27

	#-- Constantes del sistema operativo
	.eqv EXIT 10
	.eqv PRINT_INT 1


	.data
msg:	.string "Pulsa ESC para terminar\n"
msg2:   .string "\nFin\n"
	.text
	
	#-- Inicializar la UART
	jal UART_init

	#-- Imprimir mensaje
	la a0, msg
	jal UART_print
	
bucle:	
	#-- Esperar hasta que se apriete una tecla
	jal UART_key
	
	#-- Si la tecla es ESC terminar...
	li t0, ESC
	beq a0,t0,fin
	
	#-- Imprimir la tecla (como entero)
	li a7, PRINT_INT
	ecall
	
	#-- Repetir
	j bucle
	
fin:	

	la a0, msg2
	jal UART_print

	#-- Hemos terminado con la UART
	jal UART_close
	
	#-- Terminar
	li a7, EXIT
	ecall
	
inf:
	j inf
	


