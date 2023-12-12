# imprimir en pantalla HOLA <i> 10...1
.data
Dir_control: .word 0x10000
Dir_data:    .word 0x10008
msj:         .asciiz "HOLA "
nl:          .asciiz "\n"
.code
ld $t0, Dir_control($zero)
ld $t1, Dir_data($zero)

; paso offset de msj a $t2
daddi $t2, $zero, msj
daddi $t3, $zero, nl

;codigos a imprimir
daddi $t4, $zero,4 ; imprimir string
daddi $t5, $zero,1 ; imprimir entero sin signo

; contador de i
daddi $t6, $zero, 10
# cargo offset msj
# cargo cod 4 imprimir
# cargo i
# cargo cod 1 imprimir entero
# cargo salto de linea
# cargo cod 4
loopardo: sd $t2, 0($t1) ; cargo msj en data
          sd $t4, 0($t0) ; cargo cod4 en control [imprimo string]
          sd $t6, 0($t1) ; cargo <i> en data
          sd $t5, 0($t0) ; cargo cod1 en control [imprimo num entero]
          sd $t3, 0($t1)
          sd $t4, 0($t0)
          daddi $t6, $t6, -1
          bnez $t6, loopardo
          halt




