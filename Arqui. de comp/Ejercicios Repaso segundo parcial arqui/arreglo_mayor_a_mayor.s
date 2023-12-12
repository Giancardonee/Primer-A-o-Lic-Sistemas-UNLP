.data
tabla:  .word 2,3,4,5,6,7,8,9,9,9,5,4,3,2,3
mayor: .word 6
cantidad:  .word 15
total:     .word 0
nueva_tabla: .word 0
.code
daddi $t0, $zero, nueva_tabla
daddi $t1, $zero, 0

ld $s7,mayor($zero)
ld $s6, cantidad ($zero)
ld $s5, total ($zero)
daddi $t2, $t2, 0
loop: ld $s0, tabla($t1)
      slt $t3, $s0, $s7
# si el num de la tabla es < al mayot, entonces $t2= 1
      bnez $t3, siguiente
      beq $s0, $s7, siguiente


es_mayor: daddi $s5, $s5, 1
    sd $s0 ,nueva_tabla($t2)
          daddi $t2, $t2, 8
         sd $s5, total ($zero)

siguiente: daddi $t1, $t1, 8
           daddi $s6, $s6, -1
           bnez $s6 , loop

           halt

