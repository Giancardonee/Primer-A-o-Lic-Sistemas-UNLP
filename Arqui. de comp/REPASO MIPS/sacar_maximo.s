# este programa calcula un MAXIMO de un vector
# ademas, debo calcular un minimo
.data
vector:    .word 8,6,44,22,134,45,78,89
max:       .word 0
min:       .word 0
longitud:  .word 8

.code
ld $s3, minimo   ($zero)
ld $s0, max      ($zero)
ld $s1, longitud ($zero)

daddi $s2, $zero, 0

loop:      ld $t0, vector ($s2)
           slt $t8, $t0, $s0
 # si $t0 es menor que el maxmimo, $t8 = 1
 # si $t0 es mayor que el maximo,  $t8 = 0
          bnez $t8, siguiente_posicion
          j actualizar_max

siguiente_posicion: daddi $s1, $s1, -1       # decremento longitud
                    daddi $s2, $s2,  8       # incremendo desplazamiento
                    bnez $s1, loop

                    j fin


actualizar_max: daddi $s0, $t0, 0
                j siguiente_posicion





fin:   sd $s0, max ($zero)
        halt
