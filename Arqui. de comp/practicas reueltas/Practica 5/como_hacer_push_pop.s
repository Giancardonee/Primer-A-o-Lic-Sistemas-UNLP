# este ejemplo intercambia los valores
#  de r4 y r5 a traves de la pila
# obviamente no lo va a correr el simulador, no esta redactado
#  para correr el programa. Basicamente explica como manejar la pila
#  intercambiando los valores de los registros


#reservo espacio para usar la pila
daddi $sp ,$zero, 0x400

#inicializo mis registros, para intercambiar valor
$a0= 10 = R4
$a0= 4  = R5

daddi $a0,$zero,10
daddi $a1,$zero, 4


$sp = R29
#para hacer un push de R4 hacemos
daddi $sp, $sp, -8
sd    $a0 ,0 ($sp)
#ahora hacemos el push de r5
daddi $sp, $sp, -8
sd    $a1, 0 ($sp)


#popeamos: para popear hacemos el procedimiento al reves
#ponemos el valor de $a1 en $a0
#primer pop
ld $a0, 0($sp)
daddi $sp, $sp,8

#segundo pop
ld $a1, 0 ($sp)
daddi $sp, $sp, 8


