; definir dos variables A y B, con valores 4 y 5 respectivamente
; definir C y D sin valor 
; Calcular C = A+2*B y D = C/A+1

.data
A: .word 4
B: .word 5
C: .word 0
D: .word 0 

.code
ld r1,A(r0) ; mov r1, A 
ld r2,B(r0); mov r2, B 

daddi r3, r0, 2 # inicializo r3 = 2
dmul r4, r3, r2  # multiplico 2*B, Para luego sumarlo a A

dadd r5, r1, r4 # Sumo A + (2*B)

sd r5, C(r0) #Guardo el valor de A+(2*B) en la variable C  || mov C, r5

ddiv r6, r5, r1 # C/A
daddi r6, r6, 1 # D= C/A+1

sd r6, D(r0) # Guardo el valor del registro r6 en D

halt
; r1= A
; r2= B
; r3= 2 
; r4= 2xB
; r5= A+2*B (C)
;r6 = C/A

