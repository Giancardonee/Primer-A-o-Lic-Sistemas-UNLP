# este programa muestra en pantalla un vector de numeros

.data
Dir_control: .word 0x10000
Dir_data:    .word 0x10008
vector:      .word 7, 0, -23, 45, -11
.code
ld $t5, Dir_control($zero)
ld $t6, Dir_data ($zero)

# 2 cod imprimir negativos
daddi $t4, $0, 2

# long
daddi $t1, $zero, 5

#desplazamiento
daddi $t2, $zero, 0


loop: ld $t0, vector($t2)
      sd $t0, 0 ($t6)
      sd $t4, 0 ($t5)
      daddi $t2, $t2, 8
      daddi $t1, $t1, -1
      bnez $t1, loop

      halt

