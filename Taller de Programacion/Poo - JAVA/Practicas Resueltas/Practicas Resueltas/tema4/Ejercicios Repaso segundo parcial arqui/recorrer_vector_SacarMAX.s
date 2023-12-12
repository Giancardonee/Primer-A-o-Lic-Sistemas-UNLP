# calcular el maximo, de un vector de numeros

# este programa calcula el maximo de un vector de numeros, y almacena
# el valor maximo en la variable max
.data
max:    .word 0
vector: .word 5,12,777,45,3,55,44,78,97,54
long:   .word 10
.code
ld $t0, max($zero)     # $T0 [ va a ser mi valor max ]
daddi $s0,$zero, 0     # $S0 [ desplazamiento para recorrer vector ]
ld $s1, long($zero)    # $S1 [ va a tener la longitud del vector ]

loop:   ld $t1, vector ($s0)    # recorro vector
        slt $t8, $t1, $t0
# si el numero traido del vector, es menor al maximo, entonces $t8 = 1
# si el numero traido del vector, es mayor al maximo, entonces $t8 = 0

        beqz $t8, actualizar_max # Si $t8 = 0 [jmp actualizar max ]

siguiente: daddi $s1, $s1, -1   # [ decremento longitud ]
           daddi $s0, $s0, 8    # [ incremento desplazamiento ]
           beqz $s1, fin        # [ si long = 0 es porque llegue al final ]
           j loop

actualizar_max: daddi $t0, $t1, 0  # actualizo el maximo
                    j siguiente

fin: sd $t0, max ($zero)        # guardo el maximo en la variable max
        halt


