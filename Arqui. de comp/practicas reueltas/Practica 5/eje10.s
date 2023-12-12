# Este programa cuenta la cantidad de numeros impares
#  dentro de una subrutina es_impar
; referencias:
;$a0= valor de tabla
;$a1= longitud
;$v0= cantidad de numeros impares

.data
Tabla: .word 2,3,4,5,6,7,8,9
Long:  .word 8
Cant_impares: .word 0
.code
ld $a1, Long($zero)
ld $a0, Tabla($zero)
jal es_impar
sd $v0, Cant_impares($zero)

es_impar: LD $a0, Tabla($t0)
          andi $t1, $a0,1
          #$t1 = 0 par
          #$t1 = 1 impar
          bnez $t1, impar
          beqz $a1, fin
siguiente: daddi $a1, $a1, -1 ; dec long
           daddi $t0,$t0, 8   ; desplazamiento
           j es_impar
impar: daddi $v0,$v0, 1
       j siguiente

fin: jr $ra

