# Este programa recorre un vector de letras, y cuenta la cantidad de veces que está
# repetida la letra a
# el programa debe imprimir en pantalla la cantidad de veces que se encontró la letra a
# si no se encontró, el programa debera mostrar, "no se encontro la letra a "
.data
cadena:        .asciiz  "Aeeeioupddf"
car_buscado:   .asciiz  "a"
cant:          .word 0
msj:           .asciiz  "No se encontro ningun caracter a "
Dir_control:   .word 0x10000
Dir_data:      .word 0x10008
.code
ld $s0, Dir_control ($zero)
ld $s1, Dir_data    ($zero)

lbu $a0, car_buscado($zero)

jal recorrer_Vector
sd $v0, cant($zero)
jal imprimir

halt


recorrer_Vector: ld $v0, cant ($zero)
                 daddi $t2, $zero, 0
    loopardo:    lbu  $t1, cadena ($t2)
                 beq  $t1, $a0, Es_a          #si ambos registros son iguales, salta a Es_a
                 beqz $t1, fin
inc_posicion: daddi $t2, $t2, 1
         j loopardo


    fin:     jr $ra


Es_a: daddi $v0, $v0, 1
        j inc_posicion




imprimir: beqz $v0, ninguna_a

hay_alguna_a: sd $v0, 0 ($s1)
              daddi $t7, $zero, 1
              sd $t7, 0($s0)



j fin

ninguna_a:  daddi $t8, $zero, msj
            sd $t8, 0($s1)
            daddi $t7, $zero, 4
            sd $t7, 0($s0)

        fin:    jr $ra

