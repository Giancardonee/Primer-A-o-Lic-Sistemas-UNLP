; definir dos variables, A y B, con valores 4 y 5 
;Definir una variable C sin un valor 
;Cargar los valores A y B en registros, sumar los valores 
; y guardar el resultado en C 

.data
A: .word 4
B: .word 5
C: .word 0
.code
ld r1, A(r0)    #me traigo el valor  de memoria a un registro |||| MSX: mov [registro], A

ld r2, B(r0)    # me traigo el valor  de memoria a un registro |||| MSX: mov [registro], B

dadd r3, r2, r1 # sumo r2 y r2, y almaceno el resultado en r3

sd r3, C(r0)        # guardo el registro en memoria | mov C, [registro]

halt
