#En este programa tenemos dos variables  (A y B)
#Las cuales las pasamos a distintos registros con la instruccion LD
#luego las almacenamos de registro a memoria con la instruccion SD

#R0= registro que siempre vale 0 *NO ADMITE MODIFICACIONES*
#Instruccion LD :cargamos el valor DESDE MEMORIA, A UN REGISTRO

#Instruccion SD :almacenamos el valor de un registro, en una variable(memoria)

 .data
A: .word 1
B: .word 2
 .code
 ld r1, A(r0)
 ld r2, B(r0)
 sd r2, A(r0)
 sd r1, B(r0)
halt 
