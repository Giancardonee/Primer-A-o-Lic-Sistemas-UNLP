***ESTE PROGRAMA NO LO PUDE TERMINAR PARA QUE FUNCIONE CORRECTAMENTE***
 TENGAN EN CUENTA QUE SE DEBE EJECUTAR CON LA OPCION DELAY SLOT HABILITADA. HABRIA QUE HACER UN REORDENAMIENTO DE CODIGO, Y PUEDE SER QUE HAYA QUE MODIFICAR ALGUNAS INSTRUCCIONES



#Escribir un programa que implemente el siguiente fragmento escrito en un lenguaje de alto nivel:
#       while a > 0 do
#   begin
#             x := x + y;
#             a := a - 1;
#    end;
#Ejecutar con la opción Delay Slot habilitada
.data
a: .word -2
x: .word 5
y: .word 7

.code
ld r1, a(r0)
ld r2, x(r0)
ld r3, y(r0)

# while a > 0
beqz r1, fin # si R1 ( A ) es igual a 0, salta a fin.

#si r1 no es igual a 0, compara r1 con 0 para ver si es mayor o menor
slti r4, r1, 0
# si r1>0  entonces R5 = 0
# si r1<0 entonces  R5 = 1


# comparamos R5, depende el valor que tiene.

# si R5 = 0,  SALTA A PROCEDURE
# si R5 = 1 , TERMINA EL PROGRAMA
beqz r5, procedure


fin: halt


nop
procedure: dadd r2, r2, r3  # x:= x + y
           daddi r1, r1, -1 # a:= a - 1
           j fin

