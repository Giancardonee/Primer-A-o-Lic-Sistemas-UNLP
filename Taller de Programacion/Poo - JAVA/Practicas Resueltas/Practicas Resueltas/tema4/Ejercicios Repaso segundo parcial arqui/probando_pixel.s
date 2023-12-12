.data
Dir_control: .word 0x10000
Dir_data:    .word 0x10008
CoorX:       .byte 5
CoorY:       .byte 24
Color:       .byte 200,0,200, 150
.text
ld $a0, Dir_control($zero)
ld $a1, Dir_data($zero)

LD $t0, CoorX($zero)
sb $t0, 5($a1) # DATA + 5 COOR X

LD $t1, CoorY($zero)
sb $t1, 4 ($a1)# DATA + 4 COOR Y

LD $t2, Color($zero)
SW $t2, 0 ($a1)

daddi $t3, $zero, 5
sd $t3, 0($ao)

halt




