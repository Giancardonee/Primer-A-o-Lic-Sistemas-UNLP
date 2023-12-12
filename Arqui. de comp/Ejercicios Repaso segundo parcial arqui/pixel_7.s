#  Se desea realizar la demostración de la transformación de un carácter
#  codificado en ASCII a su visualización en una matriz
#  . Escriba un programa que realice tal demostración
#  solicitando el ingreso por teclado de un carácter para luego mostrarlo en la
#  pantalla gráfica de la terminal.


# ESTE EJERCICIO SOLO FUNCIONA SI SE INGRESA EL NUMERO 7
# SI NO SE INGRESA EL NUM 7. NO SE MUESTRA NADA EN PANTALLA


.data
Dir_control: .word 0x10000
Dir_data:    .word 0x10008
CoorX:       .byte 12        #Guardar en DATA + 5
CoorY:       .byte 35        #Guardar en DATA + 4
Color:       .byte 120,0,0, 120
msj_ingrese_num:  .asciiz "Ingrese un numero"
.code
ld $a0, Dir_control($zero)
ld $a1, Dir_data   ($zero)

ld $t0, CoorX($zero)
ld $t1, CoorY($zero)



jal imprimir_msj
jal ingresar_num

daddi $s7, $zero, 7
bne   $s7,  $s4 , fin


jal num_7




fin: halt





imprimir_msj: daddi $s7, $zero, msj_ingrese_num  # offset ingresar_num
               sd $s7,0 ($a1)                    # paso offset "msj" a DATA
               daddi $s6, $zero, 4               # cod.4 codigo imprimis string
               sd $s6, 0 ($a0)                   # paso cod.4 a control

                jr $ra


ingresar_num: daddi $s5, $zero, 8   # cod.8 = ingresar num
              sd $s5, 0 ($a0)       # paso cod.8 a control

              sd $s4, 0 ($a1)       # ingreso el numero desde DTA
                jr $ra


num_7: sb $t0,5 ($a1) #CoorX
       sb $t1,4 ($a1) #CoorY

       ld $t2, Color ($zero) #Color
       sw $t2, 0($a1)

       daddi $s0, $zero, 5
       sd $s0, 0($a0)

       daddi $t0, $t0, 1

       bne $t1, $t0, num_7

       daddi $s1, $zero, 34
       sb $s1, 5($a1) # CoorX
       sb $s1, 4($a1) # CoorY

       sd $s0,0 ($a0) # le paso cod.5 a control

loop2: sb $s1, 5($a1) #CoorX
       sb $s1, 4($a1) #CoorY

       sd $s0,0 ($a0)   #le paso cod.5 a control

       daddi $s3, $zero, 12

       daddi $s1, $s1, -1


       bne $s3, $s1, loop2


     # en este loop necesito ir uno a la derecha, y uno hacia arriba
loop3: sb $s1, 5($a1) #CoorX
       sb $s1, 4($a1) #CoorY

       sd $s0,0 ($a0)   #le paso cod.5 a control

        daddi $s1, $s1, 1

        bne $t1, $s1, loop3
       jr $ra



