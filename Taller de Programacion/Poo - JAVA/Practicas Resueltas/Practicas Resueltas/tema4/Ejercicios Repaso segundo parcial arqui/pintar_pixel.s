#Modifique el programa de modo que las coordenadas y color del punto sean
#ingresados por teclado.

.data
coorX: .byte 24             # coordenada X de un punto
coorY: .byte 24             # coordenada Y de un punto
color: .byte 255, 0, 255, 0 # color: máximo rojo + máximo azul => magenta
CONTROL: .word 0x10000
DATA: .word 0x10008

.text
ld $s6, CONTROL($zero)      # $s6 = dirección de CONTROL
ld $s7, DATA($zero)         # $s7 = dirección de DATA

daddi $t0, $zero, 7         # $t0 = 7 -> función 7: limpiar pantalla gráfica
sd $t0, 0($s6)              # CONTROL recibe 7 y limpia la pantalla gráfica



ld $s0, coorX($zero)       # $s0 = valor de coordenada X
sb $s0, 5($s7)              # DATA+5 recibe el valor de coordenada X
ld $s1, coorY($zero)       # $s1 = valor de coordenada Y
sb $s1, 4($s7)              # DATA+4 recibe el valor de coordenada Y
ld $s2, color($zero)       # $s2 = valor de color a pintar
sw $s2, 0($s7)              # DATA recibe el valor del color a pintar
daddi $t0, $zero, 5         # $t0 = 5 -> función 5: salida gráfica
sd $t0, 0($s6)              # CONTROL recibe 5 y produce el dibujo del punto
halt
