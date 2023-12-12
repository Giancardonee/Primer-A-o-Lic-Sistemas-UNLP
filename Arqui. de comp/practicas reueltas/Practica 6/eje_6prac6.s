# Este programa debe ingresar por teclado los puntos de coordenadas X e Y
# y luego ingresar los 4 bytes de color.


# LEER LA SUBRUTINA, DENTRO DE LA SUBRUTINA ESTA ESPECIFICADO COMO INGRESAR LOS VALORES
# ESTARIA BUENO IMPRIMIR EN PANTALLA EL VALOR A INGRESAR. PERO NO LO PIDE, Y ASI FUNCIONA 100%
.data
Dir_control: .word 0x10000
Dir_data:    .word 0x10008
color:       .byte 0,0,0,0

.code
ld $a0, Dir_control($zero)
ld $a1, Dir_data($zero)


#Dentro de esta subrutina se tienen que ir ingresandO los siguientes valores:
#   coorX
#   coorY
#   color
# OBVIAMENTE QUEDARIA MEJOR MOSTRANDO EN PANTALLA LO QUE QUEREMOS QUE IMPRIMA
jal ingresar

daddi $t0,$zero,7
sd $t0, 0($a0)        #Limpiar pantalla

sb $s1, 5($a1)        # pasamos coor X a DATA + 5
sb $t7, 4($a1)        # pasamos coor Y a DATA + 4
ld $s6, color($zero)  # cargamos color en $s6
sw $s6, 0($a1)        # pasamos color a DATA

daddi $s7, $zero, 5   # cod.5 para imprimir pixel
sd $s7, 0($a0)        # control= cod.5

halt

ingresar: daddi $s0, $zero,8
          sd $s0, 0($a0)       # paso cod.8 a control [ingresar num]
          ld $s1, 0($a1)       # $s1, es el valor de COOR X

          sd $s0, 0($a0)       # paso cod.8 a control [ingresar num]
          ld $t7, 0($a1)       # $s2, es el valor de COOR Y

# AHORA DEBEMOS INGRESAR LOS 4 BYTES DE COLOR,LO HACEMOS MEDIANTE UNA TABLA
   daddi $s3, $zero, 4 ; long
   daddi $s4, $zero, 0 ; desplazamiento
   #$s0= 8 [cod.8   ingresar numero ]
loop:   sd $s0, 0($a0)
        ld $s5, 0($a1)
# INGRESAMOS NUMEROS [TENDRIA QUE SER DE 0 A 255]
        sb $s5, color($s4)
        daddi $s4, $s4,  1
        daddi $s3, $s3, -1
        bnez $s3, loop
            jr $ra
