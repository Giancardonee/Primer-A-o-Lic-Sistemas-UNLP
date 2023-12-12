# En este programa se debe ingresar dos valores para pintar un pixel
# en las coordenadas ingresadas, se debe ingresar:

# primero la Coordenada Y
# segundo la Coordenada X

.data
msj_CoorY:    .asciiz "ingrese la CoorY (del 1 al 49):  "
msj_CoorX:    .asciiz "ingrese la CoorX (del 1 al 49):  "

Dir_control:  .word 0x10000
Dir_data:     .word 0x10008
CoorY:        .byte 0
CoorX:        .byte 0
color:        .byte 0,255,0,0

.code
ld $s6, Dir_control ($zero)
ld $s7, Dir_data    ($zero)

jal ingresar_CoorY
sd $v0, CoorY ($zero)

jal ingresar_CoorX
sd $v0, CoorX ($zero)

# una vez que tengo los dos valores ingresados, guardados en memroai
# puedo pintar el pixel, con el color que esta guardado en memoria tamb

jal pintar_pixel

halt

ingresar_CoorY: daddi $t0, $zero, msj_CoorY  # $t0 = offset msj_CoorY
                sd $t0, 0 ($s7)              # mando la cadena a DATA
                daddi $t1, $zero, 4          # cod.4 imprimir string
                sd $t1, 0 ($s6)              # le paso a control el cod.4

            # Ahora tengo que ingresar la CoorY
# para ingresar un numero, tengo que usar el cod.8 y pasarselo a control
# despues leer el numero desde data.
               daddi $t1, $zero, 8
               sd $t1, 0 ($s6)               # le paso cod.8 a control
               ld $v0, 0 ($s7)               # $v0= el numero ingresado

               jr $ra


ingresar_CoorX: daddi $t0, $zero, msj_CoorX  # $t0 = offset msj_CoorX
                sd $t0, 0 ($s7)              # mando cadena a DATA

                daddi $t1, $zero, 4          # cod.4 imprimir string
                sd $t1, 0 ($s6)              # le paso a control cod.4
           # Ahora tengo que ingresar la CoorX
# para ingresar un numero, tengo que usar el cod.8 y pasarselo a control
# despues leer el numero desde data.
               daddi $t1, $zero, 8
               sd $t1, 0 ($s6)               # le paso cod.8 a control
               ld $v0, 0 ($s7)               # $v0= el numero ingresado

               jr $ra


pintar_pixel: ld $t8, CoorY ($zero)
              sb $t8, 4     ($s7)   # mando a DATA + 4, la coorY

              ld $t7, CoorX ($zero)
              sb $t7, 5     ($s7)   # mando a DATA + 5, la coorX

              ld $t6, color ($zero)
              sw $t6, 0     ($s7)   # mando a DATA, el color

              daddi $t1, $zero, 5   # $t1= 5 [cod.5 pintar pixel]
              sd $t1, 0 ($s6)       # mando cod5 a control

              jr $ra






