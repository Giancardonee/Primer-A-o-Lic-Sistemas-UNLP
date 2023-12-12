.data
tabla1:  .word 15,11,14
tabla2:  .word 0,0,0

.code
daddi r1, r0, 0
daddi r2, r0, 3

loop:   ld r3, tabla1 (r1)
        daddi r3,r3,1           # 3 atasco raw
        sd r3, tabla2 (r1)
        daddi r1, r1, 8
        daddi r2, r2, -1        # 3 atasco raw
        bnez r2, loop           # 2 bts
halt

instrucciones: 21
raws: 6
bts: 2
atascos_totales: 8

cpi= 4 + atascos_totales + instrucciones / instrucciones

cpi= 4 + 8 +21 / 21 = 33/21 = 1.571
