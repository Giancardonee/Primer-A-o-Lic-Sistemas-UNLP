# Recorrer un arreglo llamado TABLA, que cuente con
# 15 elementos. (en este caso vamos a usar menos elementos)
# El programa debe generar:
# un nuevo arreglo, a partir de la direccion NUEVO
# que tenga, aquellos elementos de la TABLA, mayores a
# MAX, tambien se debe establecer la cantidad de elementos
# de este nuevo arreglo en la direccion cantidad

.data
tabla:    .word 0,4,8,16,20,22,24,26,40
long:     .word 9
max:      .word 16
cantidad: .word 0
nuevo:    .word 0
.code
ld $t2, long ($zero)
ld $t3, max  ($zero)

daddi $t1, $zero, 0 # cantidad

daddi $s0, $zero, 0 # desplazamiento tabla
daddi $s1, $zero, 0 # desplazamiento nuevo


loop: ld $t7, tabla ($s0)    #me traigo un elemento de la tabla a $t7
#comparo que NO sean iguales
    beq $t7, $t3, SIGUIENTE
#comparo si es menor o mayor a 16
    slt $t0, $t7, $t3
# si el elemento es mayor, $t0 = 0
# si el elemento es menor, $t0 = 1
    bnez $t0, SIGUIENTE

# si es mayor, entraria aca abajo
es_mayor:  sd $t7, nuevo($t6) # guardo el elemento en $t7
           daddi $t6, $t6, 8  # desplazamiento para nuevo
           daddi $t1, $t1, 1  # cantidad de numeros mayores

SIGUIENTE: daddi $s0, $s0,  8 # aumento desplazamiento tabla
           daddi $t2, $t2, -1 # dec longitud
           bnez $t2, loop     # mientras que no llegué al final, vuelvo a comparar

sd $t1, cantidad ($zero)
fin: halt




