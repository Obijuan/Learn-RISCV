#-----------------------------------------------------------------
#-- Ejemplo de envio de la cadena "HI" (caracter a caracter)  
#-- por la UART del modulo "Keyboard and Display MMIO Simulator"
#-----------------------------------------------------------------

	#-- Constantes del sistema operativo
	.eqv EXIT 10


	.text
	
	#-- Inicializar la UART
	jal UART_init

	#-- Imprimir un mensaje, caracter a caracter
	li a0, 'H'
	jal UART_tx
	
	li a0, 'I'
	jal UART_tx
	
	
	#-- Esperar a que el ultimo caracter se
	#-- termine de enviar, antes de terminar
	jal UART_tx_wait
	
	#-- Terminar
	li a7, EXIT
	ecall
	
inf:
	j inf
	


