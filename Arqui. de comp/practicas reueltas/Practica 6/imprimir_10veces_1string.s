# este programa imprime 10 veces un mensaje en pantalla
# en la misma linea

.data
Dir_control: .word 0x10000
Dir_data:    .word 0x10008
msj:         .asciiz "Arq. de Computadoras"
.code
#cargo variables en registros
ld $t0, Dir_control($zero)
ld $t1, Dir_data($zero)

#paso offset msj a $t2
daddi $t2, $zero, msj
#mando cadena a DATA
sd $t2, 0($t1)

# cod de operacion 4 = imprime string
daddi $t3,$zero, 4
sd $t3, 0($zero)
daddi $t4, $zero, 10
loop: sd $t3, 0($t0)
      daddi $t4, $t4, -1
      bnez $t4, loop
      halt








