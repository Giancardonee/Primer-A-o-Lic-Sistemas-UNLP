# el programa debe ingresar dos valores ( A y B) por teclado.
# se deberá hacer el siguiente calculo:   (A-B) x C

# en este programa, restamos dos numeros ingresados, y multiplica el resultado x 10, el cual
# imprime en pantalla

.data
A:  .word 0
B:  .word 0
C:  .word 10

Dir_control:    .word 0x10000
Dir_data:       .word 0x10008
.code
ld $a0, Dir_control ($zero)
ld $a1, Dir_data    ($zero)
ld $t0, C           ($zero)
    jal ingresar_numeros
    jal hacer_calculo
    jal imprimir_resultado



halt

ingresar_numeros: daddi $t1, $zero, 8
                  sd $t1, 0 ($a0)           # le paso cod.8 a control
                  ld $v0, 0 ($a1)           # ingreso A


                  sd $t1, 0 ($a0)           # le paso cod.8 a control
                  ld $v1, 0 ($a1)           # ingreso B

                  sd $v0, A ($zero)
                  sd $v1, B ($zero)

        jr $ra


hacer_calculo:   dsub $t2, $v0,$v1     # ( guarda en $t2= (A - B)
                 dmul $v0, $t2, $t0    # ( multiplica t2 x 10 y guarda el resultado en $vo)
                 jr $ra

imprimir_resultado: sd $v0, 0 ($a1)
                    daddi $t3, $zero, 1 # cod1. imprimo numero entero
                    sd $t3, 0 ($a0)

                    jr $ra
