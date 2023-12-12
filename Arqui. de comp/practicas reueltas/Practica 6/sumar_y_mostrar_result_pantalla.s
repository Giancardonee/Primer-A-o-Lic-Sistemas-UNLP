# hacer un programa que sume A y B,
# y que muestre el resultado en pantalla

.data
Dir_control: .word 0x10000
Dir_data:    .word 0x10008
A:           .word 10
B:           .word 7
.code
# cargamos direcciones en registros
LD $t0, Dir_control($zero)
LD $t1, Dir_data($zero)

# cargamos memoria a regustro
ld $t2, A($zero)
ld $t3, B($zero)
dadd $t5, $t2, $t3 ; sumo A y B y guardo el res el $t5

sd $t5, 0($t1) ; mando el resultado de la suma a data

daddi $t6, $zero, 1 ; cod 1 = suma entero sin signo
sd $t6, 0($t0)
halt


