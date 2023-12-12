# potencia de 2

.data
B: .word 8
.code
daddi r1, r0, 1
ld r2,B(r0)

loopardo: dsll r1, r1, 1
      # desplazo a la izquierda [elevo por 2]
         daddi r2, r2, -1 #dec veces que quiero que rote a izq
         bnez r2, loopardo #si r2 no es 0, anda a loopardo
halt
