.data
A:      .word 0
B:      .word 0
C:      .word 0
RES:    .word 0
Dir_control:   .word 0x10000
Dir_data:      .word 0x10008
.code
        ld $s0, Dir_control($zero)               # $S0 = CONTROL
        ld $s1, Dir_data   ($zero)               # $S1 = DATA

        daddi $t8, $zero, 8                      # $t8 = 8  |||| para pasar a control

        sd $t8, 0($s0)                           # se le pasa cod.8 a control para ingresar numeros
        ld $a0, 0($s1)                           # ingresamos valor A
        sd $a0, A ($zero)                        # guardamos en memoria el valor ingreados

        sd $t8, 0($s0)                           # se le pasa cod.8 a control para ingresar numeros
        ld $a1, 0($s1)                           # ingresamos valor B
        sd $a1, B ($zero)                        # guardamos en memoria el valor ingresado

        sd $t8, 0($s0)                           # se le pasa cod.8 a control para ingresar numeros
        ld $a2, 0($s1)                           # ingresamos el valor C
        sd $a2, C ($zero)                        # guardamos en memoria el valor ingresado

        jal calculo
        jal imprimir
halt

calculo:     dsub  $t0, $a0, $a1                 # $t0 = (A - B )
             dadd $t1, $zero, $a2                # $t1 = C

 loop:           dmul $t0, $t0, $a2                   # $a2 = C
                 daddi $t1, $t1, -1
                 bnez $t1, loop

                 dadd $v0, $t0, $zero
                 jr $ra


imprimir: sd $v0, 0($s1)                          # mando el num a imprimir a DATA
          daddi $t5, $zero, 1
          sd $t5, 0 ($s0)

          jr $ra






