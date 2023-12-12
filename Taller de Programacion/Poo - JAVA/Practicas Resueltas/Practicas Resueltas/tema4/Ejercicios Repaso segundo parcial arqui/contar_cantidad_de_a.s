# este programa cuenta la cantidad de letras "a" de una cadena
# y muestra en pantañña la cantidad de letras a

.data
Dir_control:   .word 0x10000
Dir_data:      .word 0x10008
cant_a:        .word 0
car_a:         .asciiz "a"
cadena:        .asciiz "argentina campeon del mundial pa"

.code
ld $s6, Dir_control ($zero)
ld $s7, Dir_data    ($zero)

ld $a0, car_a ($zero)

jal recorrer_vector
sd $v0, cant_a ($zero)
jal imprimir_resultado


halt

recorrer_vector:    daddi $t1, $zero, 0
   loop:            lbu   $t0, cadena ($t1)
                    beqz  $t0, fin
                    beq   $t0, $a0, Es_a

siguiente:          daddi $t1, $t1, 1
            j loop

   Es_a:            daddi $v0, $v0 ,1
                j siguiente

fin:   jr $ra



imprimir_resultado:  daddi $t8, $zero, 1
                     sd $v0, 0 ($s7)
                     sd $t8, 0 ($s6)

                  jr $ra


