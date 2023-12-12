# Este programa basico, multiplica dos variables
# y el resultado NO lo guarda en una variable, el resultado queda en un registro, en este vaso r3
.data
A: .word 2
B: .word 4

.code
ld r1,A(r0)
ld r2,B(r0)

dmul r3, r1,r2 # multiplicamos A y B, y guarda el resultado en r3

halt


; r1= 2
; r2= 4
; r3= resultado = 2*4 ( A * B )
