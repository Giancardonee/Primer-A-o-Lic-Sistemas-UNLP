# ESTE PROGRAMA IMPRIME 10 VECES LA CADENA CAR_1

.data
Dir_control:   .word 0x10000
Dir_data:      .word 0x10008
CAR_1:         .asciiz "ARQUIECTURA DE COMP.  "
.text
ld $a0, Dir_control ($zero)
ld $a1, Dir_data    ($zero)
 #$a0 = CONTROL
 #$a1 = DATA

#ACA INICIALIZO EN 10 UN REGISTRO CONTADOR
daddi $t0, $zero, 10

#GUARDO OFFSET CADENA EN UN REGISTRO
daddi $s0, $zero, CAR_1    # $s0   = OFFSET CAR_1
daddi $s1, $zero, 4        # COD.4 = IMPRIMIR STRING

loop: sd $s0, 0($a1) # MANDO OFFSET CAR_1 A DATA
      sd $s1, 0($a0) # MANDO COD.4 [IMPRIMIR STRING] A CONTROL
      daddi $t0, $t0, -1 # DEC CANTIDAD A IMPRIMIR
      bnez $t0, loop     # SI ES 0 ES PORQUE YA IMPRIMI 10 VECES

      halt



