#Escriba la subrutina ES_VOCAL, que determina si un carácter es vocal o no,
# ya sea mayúscula o minúscula. La rutina debe recibir el carácter
# y debe retornar el valor 1 si el carácter es una vocal, o 0 en caso contrario

.data
CAR:          .ascii "L"
vocales:      .asciiz "AEIOUaeiou"
msj_si:       .asciiz "El caracter es vocal"
msj_no:       .asciiz "El caracter no es vocal"
Dir_control:  .word 0x10000
Dir_data:     .word 0x10008
.code
ld $t8, Dir_control($zero)
ld $t7, Dir_data   ($zero)


lbu $a0, CAR($zero)
jal ES_VOCAL
bnez $v0, imprimo_si

imprimo_no: jal NoEsVocal
    j final

imprimo_si: jal SiEsVocal



final: halt


ES_VOCAL:   daddi $t1, $zero, 0    #Desplazamiento de vocales
            daddi $v0, $zero, 0    #$vo= contiene 1 si es vocal, 0 si no es vocal

loopardo:    lbu $t0, vocales($t1)
             beqz $t0, fin
             beq $a0, $t0, SI_ES_VOCAL
             daddi $t1, $t1, 1     #incremento desplazamiento en cadenas de car (1 byte)
             j loopardo

SI_ES_VOCAL: daddi $v0, $v0, 1
      fin:   jr $ra


SiEsVocal: daddi $t0, $zero, msj_si
           sd $t0, 0($t7) # mando offser msj a data
           daddi $t1, $zero, 4 # cod.4 Imprime string
           sd $t1, 0($t8)
    jr $ra


NoEsVocal: daddi $t0, $zero, msj_no
           sd $t0, 0($t7) # mando offset msj a data
           daddi $t1, $zero, 4 # cod.4 Imprime string
           sd $t1, 0 ($t8)
     jr $ra
