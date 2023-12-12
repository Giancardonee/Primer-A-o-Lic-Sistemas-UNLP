# Este programa pinta una linea de pixel en la poscion y = 40


.data
Dir_control:   .word 0x10000
Dir_data:      .word 0x10008
CoorY:         .byte 40
CoorX:         .byte 5
color:         .byte 255,0,0,0
.code
ld $s6, Dir_control ($zero)        # $s6= Dir.Control
ld $s7, Dir_data    ($zero)        # $s7= Dir.Data

# Ahora tengo que cargar los datos para imprimir pixel
ld $t0, CoorY ($zero)              # $t0= CoorY
sb $t0, 4($s7)                     # Data+4 recibe CoorY

ld $t1, CoorX ($zero)              # $t1= CoorX
sb $t1, 5($s7)                     # Data+5 recibe CoorX

ld $t2, color ($zero)
sw $t2, 0($s7)                     # Data recibe los 4 bytes del color

daddi $t8, $zero, 5                # Cod.5 = Pintar pixel
sd $t8, 0 ($s6)                    # le paso cod.5 a CONTROL

loop: daddi $t0, $t0, -1
      sb $t0, 4 ($s7)
      sd $t8, 0 ($s6)
      bnez $t0, loop


halt

