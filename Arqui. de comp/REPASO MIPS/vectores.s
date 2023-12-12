# este programa recorre una tabla de numeros enteros, y guarda el elemento
# sumandole 5 , en una nueva tabla (TABLA 1 )

.data
Tabla1: .word 0,1,2,3,4,5,6,7,8
Tabla2: .word 0,0,0,0,0,0,0,0,0
Long:   .word 9
.code
daddi $t1, $zero, 0
ld $t2, Long ($zero)

loopardo: ld $s0, Tabla1 ($t1) # me traigo a $s0, el valor de tabla1
          daddi $s0, $s0, 5  # le sumo 5 al valor de tabla1
          sd $s0,Tabla2 ($t1)  # guardo el nuevo resultado en tabla2
          daddi $t1, $t1, 8    # inc desplazamiento
          daddi $t2, $t2, -1
          bnez $t2, loopardo


          halt

