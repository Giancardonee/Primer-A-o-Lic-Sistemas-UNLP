; dadas dos variables A y B 
; Calcular el maximo entre los dos y guardar el resultado en C 
; asumir que A= 4 y B= 10 

.data
A: .word 4
B: .word 10
C: .word 0 

.code
#siempre que tengamos que usar variables, tenemos que cargar los valores de memoria en registros
# usando LD, <registro>, [variable](r0)
LD r1, A(r0)
LD r2, B(r0)

# CALCULO MAX
slt r3, r1, r2 # r3 = 1 [si y solo si  r1 < r2]

bnez r3, mayorB #Si r3 NO es igual a 0, salta a la dirección mayorB

#Si entra aca, es porque A es mayor
sd r1, C(r0) # R1 [A] ES MAYOR
j fin 

mayorB: sd r2, C(r0) # R2 [B] ES MAYOR


fin: halt
; r1 = A 
; r2 = B
