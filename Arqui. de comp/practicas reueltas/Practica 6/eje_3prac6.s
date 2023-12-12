# NOS PIDE HACER DOS SUBRUTINAS, LA PRIMERA "INGRESO" DEBE SOLICITAR DOS NUMEROS
#  Y LA SEGUNDA SUBRUTINA "RESULTADO" DEBE SUMAR LOS DOS NUMEROS
#  Y IMPRIMIR EN PANTALLA EL RESULTADO


# en este programa, tenemos un anidamiento de subrutinas, se produce cuando
# dentro una subturina, llamamos a otra subrutina. Si hacemos esto tenemos que tener cuidado
# con el registro de retorno ($RA) tiene que ser "salvado" mediante un "push" y "pop".

#como no tenemos las instrucciones de push, y pop, lo tenemos que hacer manualmente

# IMPORTANTISIMO: SIEMPRE QUE SEPAMOS QUE VAMOS A HACER UN ANIDAMIENTO DE SUBRUTINAS
# TENEMOS QUE RESERVAR ESPACIO EN LA PILA, PARA PODER USARLA. EN ESTE CASO, ESTA EN LA PRIMER
# INSTRUCCION DEL PROGRAMA

.data
Dir_control: .word 0x10000
Dir_data:    .word 0x10008
.code
daddi $sp, $sp, 0x400      #reservo espacio para usar la pila
ld $a0,Dir_control($zero)
ld $a1,Dir_data($zero)

jal ingreso
halt

ingreso: daddi $sp, $sp, -8
         sd $ra,0 ($sp)     #PUSH $RA

        daddi $s0, $zero, 8 # cod.8 leer num
    #ingreso primer num
         sd $s0, 0($a0)      # le paso cod. a CONTROL
         ld $t0, 0($a1)      # ingreso num1.  $t0 = num1
    #ingreso segundo num
         sd $s0, 0($a0)      #le paso cod.8 a CONTROL
         ld $t1, 0($a1)      #ingreso num2.   $t1= num2


# una vez que tengo los dos numeros ingresados, en registros, voy a la segunda subrutina
        jal resultado

volver: ld $ra, 0($sp)
        daddi $sp, $sp, 8 #POP $RA
        jr $ra


resultado: dadd $t2, $t1,$t0 # sumo num1 y num2 , guardo el resultado en $t2
           sd $t2, 0($a1)
           daddi $s0,$zero, 1 #cod.1 imprimir entero sin signo
           sd $s0, 0($a0)
           jr $ra


