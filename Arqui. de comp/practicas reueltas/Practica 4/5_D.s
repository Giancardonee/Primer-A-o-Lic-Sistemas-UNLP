# ESTE PROGRAMA SE EJECUTA CON LA OPCION DELAY SLOT HABILITADA
# APROVECHAMOS LA CONFIGURACION DE DELAY SLOT, Y USAMOS UNA INSTRUCCION UTIL ABAJO DEL SALTO
# ESA INSTRUCCION SE VA A EJECUTAR SIEMPRE, SI O SI.

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
  #lo hace para avanzar de posicion en vector
 bnez r2, loop
 daddi r1, r1, 8
 halt


