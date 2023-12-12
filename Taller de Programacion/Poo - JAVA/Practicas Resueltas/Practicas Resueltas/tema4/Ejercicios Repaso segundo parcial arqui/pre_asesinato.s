.data
control: .word 0x10000
data:    .word 0x10008
coorX:   .byte 35
coorY:   .byte 10
color:   .byte 255, 0, 255, 0
.code

ld $a0, control ($zero)
ld $a1, data    ($zero)

ld $t0, coorX ($zero)
sb $t0, 5 ($a1) # coorX = DATA + 5

ld $t1, coorY ($zero)
sb $t1, 4 ($a1) # coorY = DATA + 4

ld $t2, color ($zero)
sw $t2, 0 ($a1) # color = DATA

daddi $s0, $zero, 5
sd $s0, 0($a0)

halt



