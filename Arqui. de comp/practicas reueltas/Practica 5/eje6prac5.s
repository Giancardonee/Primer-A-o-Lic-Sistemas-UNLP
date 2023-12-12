.data
valor1: .word 16
valor2: .word 4
result: .word 0

 .text
ld $a0, valor1($zero)
ld $a1, valor2($zero)
jal a_la_potencia
sd $v0, result($zero)
halt
a_la_potencia: daddi $v0, $zero, 1 # inicializo $v0 = 1
 lazo: slt $t1, $a1, $zero # cmp $a1 con 0, SI $a1 es menor, deja $st1= 1
bnez $t1, terminar
daddi $a1, $a1, -1
dmul $v0, $v0, $a0
j lazo
 terminar: jr $ra

 # $a0 = 16
 # $a1 = 4
