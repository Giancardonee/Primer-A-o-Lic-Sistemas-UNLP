# El siguiente programa recorre un vector (variable tabla en este ejemplo)
# el programa finaliza si encuentra el num 7
# si el numero 7 esta en el vector, al finalizar el programa R10 = 1
# si el numero 7 no se encuentra en el vector al finalizar el programa R10 = 0

#la variable long tiene la cantidad de elementos de la tabla
#cada vez que entre en el loop, se va a decrementar long
#el programa finaliza cuando encuentra el numero 7 (si es que está)
#o cuando long sea igual a 0


.data
tabla: .word 20, 1, 14, 3, 2, 58, 18, 7, 12, 11
num: .word 7
long: .word 10

.code
 ld r1, long(r0)
 ld r2, num(r0)
 dadd r3, r0, r0
 dadd r10, r0, r0

 ;r1 = long
 ;r2 = num
 ;r4 = tabla
 ;dec long
 ;avanza posiciob de la tabla
 ;si el valor de la tabla es 7, termina el programa

loop: ld r4, tabla(r3)
 beq r4, r2, listo
 daddi r1, r1, -1
 daddi r3, r3, 8
 bnez r1, loop
 j fin
listo: daddi r10, r0, 1
fin: halt

