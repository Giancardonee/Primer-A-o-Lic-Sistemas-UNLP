# El siguiente programa multiplica por 2 los elementos de un arreglo llamado datos y genera un nuevo arreglo llamado res.
# Ejecutar el programa en el simulador winmips64 con la opción Delay Slot habilitada.

.data
cant: .word 8
datos: .word 1, 2, 3, 4, 5, 6, 7, 8
res: .word 0
 .code
 dadd r1, r0, r0
 ld r2, cant(r0)
loop: ld r3, datos(r1)
 daddi r2, r2, -1
 dsll r3, r3, 1 #desplaza 1 a la izquierda
 sd r3, res(r1)
 #se trae el valor del vector datos y lo guarda en el vector res
 daddi r1, r1, 8 #lo hace para avanzar de posicion en vector
 bnez r2, loop # si no es 0, vuelve a loopear
 nop
 halt

 #EL DELAY SLOT (SALTO RETARDADO) ejecuta la proxima instrruccion del salto si o si -
 # en este ejemplo, pusimos una instruccion NOP abajo del bnez, porque si no se ejecutaria la instruccion de halt



# usa r1 para desplazamiento
# r2 = CANT  {para saber si llego al final}
