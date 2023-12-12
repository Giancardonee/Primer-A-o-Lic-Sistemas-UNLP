# este programa imprime en pantalla un string
.data
Dir_control: .word 0x10000
Dir_data:    .word 0x10008
cadena:      .asciiz " Estudiantes de la patria"
.code
ld $t0, Dir_control($zero)
ld $t1, Dir_data   ($zero)

# le tengo que pasar offset cadena a data
# despues pasatle el num4 a Dir_control

loop: daddi $t2, $zero, cadena
      daddi $t3, $zero, 4

      sd $t2, 0($t1)
      sd $t3, 0($t0)

      j loop
halt
