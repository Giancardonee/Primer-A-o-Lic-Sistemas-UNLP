# este programa imprime en pantalla grafica, una G (media deforme )en color verde

.data
Dir_control:   .word 0x10000
Dir_data:      .word 0x10008

color:         .byte 0,255,0,0

CoorY:         .byte 40
CoorX:         .byte 32
.code

ld $s0, Dir_control ($zero)
ld $s1, Dir_data($zero)

ld $t0, CoorY ($zero)
ld $t1, CoorX ($zero)
ld $t2, color ($zero)

daddi $t4, $zero, 8
daddi $t5, $zero, 15
 loop1:       sb $t0, 4 ($s1)                     # CoorY a DATA + 4
              sb $t1, 5 ($s1)                     # CoorX a DATA + 5

              sw $t2, 0 ($s1)                     # Color a DATA

              daddi $t3, $zero, 5
              sd $t3, 0 ($s0)
              daddi $t1, $t1, -1
              bne $t1,$t4, loop1

loop2:        sb $t0, 4 ($s1)                     # CoorY a DATA + 4
              sb $t1, 5 ($s1)                     # CoorX a DATA + 5

              sw $t2, 0 ($s1)                     # Color a DATA

              daddi $t3, $zero, 5
              sd $t3, 0 ($s0)
              daddi $t0, $t0, -1
              bne $t0, $t5, loop2
              daddi $t4, $zero, 32


loop3:         sb $t0, 4 ($s1)                     # CoorY a DATA + 4
              sb $t1, 5 ($s1)                     # CoorX a DATA + 5

              sw $t2, 0 ($s1)                     # Color a DATA

              daddi $t3, $zero, 5
              sd $t3, 0 ($s0)
              daddi $t1, $t1, 1
              bne $t1, $t4, loop3
              daddi $t4, $zero, 30

loop4:        sb $t0, 4 ($s1)                     # CoorY a DATA + 4
              sb $t1, 5 ($s1)                     # CoorX a DATA + 5

              sw $t2, 0 ($s1)                     # Color a DATA

              daddi $t3, $zero, 5
              sd $t3, 0 ($s0)
              daddi $t0, $t0, 1
              bne $t0, $t4, loop4
              daddi $t4, $zero,  20

loop5:        sb $t0, 4 ($s1)                     # CoorY a DATA + 4
              sb $t1, 5 ($s1)                     # CoorX a DATA + 5

              sw $t2, 0 ($s1)                     # Color a DATA

              daddi $t3, $zero, 5
              sd $t3, 0 ($s0)
              daddi $t1, $t1, -1
              bne $t1, $t4, loop5




halt

