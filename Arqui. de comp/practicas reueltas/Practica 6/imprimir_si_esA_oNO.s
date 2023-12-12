# leer un caracter, y verificar si es "A"
#si es A, se debe mostrar: el caracter es A
#si NO es A, se debe mostrar: el caracter no es A

.data
Dir_control: .word 0x10000
Dir_data:    .word 0x10008
car_a:       .asciiz "A"
msj_es_a:    .asciiz "EL CARACTER ES A"
msj_no_es_a: .asciiz "EL CARACTER NO ES A"
.code
ld $t0, Dir_control($zero)
ld $t1, Dir_data($zero)

lbu $t7, car_a($zero)
; $t7= "A" ; esto lo hago para comparar mas adelante

daddi $t6, $zero, 9 ; [COD.9 leer caracter]
sd  $t6,0 ($t0) ; le paso cod.9 a control
lbu $t2,0($t1)

beq $t2, $t7, Es_A
# compara el car ingresado con "A", si es A va a Es_A
; si no es A, va a entrar en la etiqueta No_es_a
No_es_a: daddi $t5,$zero, msj_no_es_a
j imprimir

Es_A: daddi $t5, $zero, msj_es_a
imprimir: sd $t5, 0($t1) ; mando msj a DATA
          daddi $t6, $zero, 4 ; paso [COD.4 imprimir msj]
          sd $t6,0 ($t0)
          halt


