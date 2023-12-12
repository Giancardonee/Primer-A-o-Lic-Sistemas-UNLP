# este programa imprime un numero entero sin signo, usando el cod.1
# para i
.data
Dir_control:    .word 0x10000
Dir_data:       .word 0x10008
.text
ld $a0, Dir_control ($zero)
ld $a1, Dir_data    ($zero)

daddi $t0, $zero, 1234
sd $t0, 0($a1)
daddi $t1, $zero, 1
sd $t1, 0($a0)

halt


# ingreso numero entero sin signo
