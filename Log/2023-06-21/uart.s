	#-- Direccion base de la UART
	.eqv UART_BASE 0xFFFF0000
	
	#-- Desplazamientos de los registros de la UART
	.eqv RX_STATUS 0x00
	.eqv RX_DATA   0x04
	.eqv TX_STATUS 0x08
	.eqv TX_DATA 0x0C
	
	
	#-- Mascaras para los bits
	.eqv TX_RDY 1   #-- Bit de transmisor listo
	.eqv RX_RDY 1   #-- Bit de receptor listo
	
	.text

#----------------------------------------------
#-- UART_init: Inicializacion de la UART
#-- La direccion base se deja en s0
#----------------------------------------------	
.global UART_init
UART_init:

	#-- s0: Direccion base de la UART
	li s0, UART_BASE
	ret
	
	
#--------------------------------------------------
#-- UART_tx_wait
#--
#--  Esperar hasta que el transmisor esté listo
#--------------------------------------------------
.global UART_tx_wait
UART_tx_wait:
	#-- Leer bit de Ready del registro de Status
	lw t0, TX_STATUS(s0)
	
	#-- Aislar el bit aplicando la mascara
	andi t0,t0,TX_RDY
	
	#-- Repetir hasta que el bit de ready se ponga a 1
	beq t0,zero, UART_tx_wait
	
	#-- Transmisor listo!
	ret
	

#----------------------------------------------------------
#-- UART_close
#-- Terminar de trabajar con la UART. Simplemente
#-- se espera hasta que se envíe el caracter que está
#-- actualmente en transmision (si lo hay)
#-----------------------------------------------------------
.global UART_close
UART_close:

	#-- Funcion intermedia BEGIN
	addi sp,sp,-16
	sw ra, 12(sp)

	#-- Esperar a que se termine de enviar
	#-- el ultimo caracter
	jal UART_tx_wait
	
	#-- Funcion intermedia END
	lw ra, 12(sp)
	addi sp,sp,16
	ret


	
#------------------------------------------------------
#-- UART_tx: Transmitir un caracter
#--
#------------------------------------------------------
.global UART_tx
UART_tx:

	#-- Crear la pila y guardar direccion de retorno
	addi sp, sp, -16
	sw ra, 12(sp)
	
	#-- Guardar el caracter a enviar en la pila
	sw a0, 0(sp)

	#-- Esperar hasta que el transmisor este listo
	jal UART_tx_wait
	
	
	#-- Recuperar caracter de la pila
	lw a0, 0(sp)
	
	#-- Enviar el caracter
	sw a0, TX_DATA(s0)
	
	
	#-- Recuperar direccion de retorno y limpiar la pila
	lw ra, 12(sp) 
	addi sp,sp, 16
	
	ret
	
#-------------------------------------------------------------
#-- UART_print: Imprimir una cadena a traves de la UART
#-- ENTRADAS:
#--   -a0: Direccion de la cadena
#--
#-- SALIDAS:
#--   -a0: Numero de caracteres impresos 
#-------------------------------------------------------------
.global UART_print
UART_print:
	
	#--- Funcion intermedia: PILA
	addi sp, sp, -16
	sw ra, 12(sp)
	
	#-- t0: Contador de caracteres
	li t0, 0
	
	#-- t1: Puntero al caracter actual
	mv t1, a0
	
	
next:
	#-- Leer caracter actual
	lb t2, 0(t1)
	
	#-- Si es 0, hemos terminado
	beq t2,zero,fin
	
	#-- Imprimir el caracter
	mv a0, t2
	jal UART_tx
	
	#-- Incrementar el contador de caracteres impresos
	addi t0,t0, 1
	
	#-- Apuntar al siguiente caracter
	addi t1,t1, 1
	
	#-- Siguiente caracter
	j next
	
	
fin:	#-- Meter el contador en a0
        mv a0, t0
        
        #-- Recuperar direccion de retorno
        lw ra, 12(sp)
        
        #-- Liberar pila
        addi sp,sp,16
        ret
	
	
#--------------------------------------------------
#-- Comprobar si hay caracter esperando o no
#-- SALIDA:
#--   0 : no se ha recibido caracter
#--   1 : Caracter recibido
#---------------------------------------------------
.global UART_car_waiting
UART_car_waiting:	

	
	
	#-- Leer registro de estado, para ver si ha llegado un caracter
	#-- o no
	lw a0, RX_STATUS(s0)
	
	#-- Aislar el bit de ready
	andi a0,a0,RX_RDY
	ret
	
	

	
#---------------------------------------------------
#-- UART_key
#-- Esperar hasta que se reciba una tcla
#-- DEVUELVE:
#--   La tecla recibida
#---------------------------------------------------
.global UART_key
UART_key:
	
	#-- Funcion intermedia
	addi sp,sp,-16 
	sw ra, 12(sp)
	
rx_wait:

	jal UART_car_waiting
	
	#-- Repetir mientras que el bit de Ready sea 0
	beq a0,zero, rx_wait
	
	#-- Se ha recibido un caracter
	#-- Leerlo del buffer
	lw a0, RX_DATA(s0)
	
	#-- Funcion intermedia
	lw ra, 12(sp)
	addi sp,sp,16
	ret
	
	

