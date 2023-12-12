# Este programa imprime un entero sin signo
.data
Dir_control: .word 0x10000
Dir_data:    .word 0x10008
num:         .word 5
.code
#cargamos las direcciones en registros
ld $t2, Dir_control($zero)
ld $t3, Dir_data($zero)

ld $t1, num($zero)
sd $t1, 0($t3) # guardamos el numero en DATA
daddi $t1, $zero, 1 # 1 = codigo para imprimir entero sin singo
sd $t1,0($t2) # imprimo

halt
