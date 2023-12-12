# ESTE PROGRAMA CONVIERTE UN ENTERO A FLOTANTE

.data
A:   .word 8

.code
ld r1, A ($zero)
mtc1 r1, f2       # copia el valor entero, en un registro flotante
cvt.d.l f2, f2    # convierte a flotante un valor entero
halt
