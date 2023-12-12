# hacer un programa que recorra un vector de numeros, y muestre  en pantalla
# la cantidad de numeros mayores a MAX

.data
Dir_control:   .word 0x10000
Dir_data:      .word 0x10008

MAX:           .word 7
long:          .word 9
cant_mayores:  .word 0
vector:        .word 5,4,7,8,99,66,464,24,3
.code
ld $s0, Dir_control ($zero)
ld $s1, Dir_data    ($zero)

ld $a0, MAX  ($zero)             # $a0 = MAX
ld $a1, long ($zero)


jal recorrer_vector
sd $vo, cant_mayores ($zero)
jal imprimir

halt

recorrer_vector:    daddi $v0, $zero, 0   # inicializo contador de max
                    daddi $t0, $zero, 0   # inicializo desplazamiento en 0
        loopardo: ld $t1, vector ($t0)
                  beq $t1, $a0, Siguiente
# si ambos registros son iguales, no deberia contarlo, por lo tanto
# tenemos que pasar a la siguiente posicion, si es que hay.

                  slt $t2, $t1, $a0
# compara el valor traido del vector, con el maximo.
# si es menor que el maximo, entonces $t2 = 1
# si es mayor que el maximo, entonces $t2, 0

                  bnez $t2, Siguiente

Cuento_max: daddi $v0, $v0, 1

Siguiente: daddi $t0, $t0, 8   # incremento el desplazamiento, sumando 8
           daddi $a1, $a1, -1  # decremento longitud
           bnez  $a1, loopardo


           jr $ra


imprimir:    daddi $t8, $zero, 1
             sd $v0,0 ($s1)
             sd $t8,0 ($s0)

             jr $ra


