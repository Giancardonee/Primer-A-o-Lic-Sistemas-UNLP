# Este programa carga  A y B en un registros, y luego invierte los valores de A con B

.data
A: .word 1
B: .word 2

.code
#Cargo variables de memoria a registros con LD
    ld r1, A(r0)
    ld r2, B(r0)


#Cargo registros en variables con SD
    sd r1, B(r0)
    sd r2, A(r0)
halt
# antes
; A= 1  B= 2

# despues
; A= 2 B=1
