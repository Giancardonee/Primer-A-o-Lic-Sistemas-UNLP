#El sig programa compara 3 valores
#n1, n2,n3
#si son iguales, lo guarda en la variable RES

.data
n1: .word 1
n2: .word 3
n3: .word 3
RES: .word 0

.code
LD r1, n1(r0)
LD r2, n2(r0)
LD r3, n3(r0)
daddi r4, r0, 0
comp_1: beq r1,r2, iguales_1
comp_2: beq r2,r3, iguales_2
comp_3: beq r1,r3, iguales_3
fin: sd r4,RES(r0)
     halt

iguales_1: daddi r4,r4,1
           j comp_2

iguales_2: daddi r4,r4,1
           j comp_3

iguales_3: daddi r4, r4,1
           j fin




