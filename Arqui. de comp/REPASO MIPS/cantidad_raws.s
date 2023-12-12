.data
A:  .word 3
B:  .word 5
C:  .word 0
asd: .word 0
.code
ld r1, A ($zero)
ld r2, B ($zero)

daddi r3, r0, 0


      daddi r1, r1, -1
      ld r1, asd ($zero)
      dadd r3, r3, r2
      sd r3, C ($zero)
      halt
