# hacer un programa que lea 5 numeros enteros, y los guarde
# en un vector

.data
Dir_control: .word 0x10000
Dir_data:    .word 0x10008
Vector:      .word 0,0,0,0,0
.code
ld $t0,Dir_control ($zero)
ld $t1,Dir_data($zero)

daddi $t2, $zero, 8 ; cod [leer Num]
daddi $t3, $zero, 0 ; desplazamiento
daddi $t4, $zero, 5 ; longitud

loopardo: sd $t2, 0($t0)
          ld $t5, 0($t1)
          sd $t5, Vector($t3)
          daddi $t3, $t3, 8 ; inc desplazamiento
          daddi $t4, $t4,-1 ; dec longitud
          bnez $t4, loopardo

          halt
