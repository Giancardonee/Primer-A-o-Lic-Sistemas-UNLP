# Para entender 100% este programa debemos saber que es una cadena de bits, sus posociones, y sus valores.
#Este programa hace un corrimiento a la izquierda 3 veces
# Imaginemos que tenemos una cadena de Bits, R1 como es igual a 1
#  nos paramos en la primera posocion1 de una cadena de 8 bits
#  y vamos aumentando la posicion a medida que se ejecuta la instruccion DSLL

.data
A: .word 1
B: .word 3
 .code
 ld r1, A(r0)
 ld r2, B(r0)

loop: dsll r1, r1, 1   # corro a izq
      daddi r2, r2, -1 # r2 es nuestro contador, decrementamos una vez que corremos una posocion a izq
      bnez r2, loop    # Mientras que r2 NO sea igual a 0, vuelve al loop, hace el corrimiento a izq y dec la cantidad

#cuando r2 sea igual a 0, va a ejecutar la instruccion de halt y va a terminar el programa :)
halt
