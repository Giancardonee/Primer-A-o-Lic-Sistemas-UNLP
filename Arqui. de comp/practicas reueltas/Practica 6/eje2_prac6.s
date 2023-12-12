# Escriba un programa que utilice sucesivamente dos subrutinas:
# La primera, denominada "ingreso" , debe solicitar el ingreso por teclado de un número entero (de un dígito), verificando que el valor ingresado realmente sea un dígito

# La segunda subrutina denominada "muestra", debe mostrar el valor del digito ingresado con palabras, EJ si se ingresa el 4, el programa debe mostrar "CUATRO"

#CREO QUE SE PUEDE HACER UN VECTOR, TABLA PARA IR RECORRIENDOLA, Y SI EL NUMERO QUE INGRESAMOS, ESTÁ EN EL VECTOR, QUE SALTE. PERO YO OPTÉ POR ESTA OPCION.

#NO HACE FALTA ESCRIBIR TODOS LOS NUMEROS
# MIENTRAS QUE EL PROGRAMA FUNCIONE CON 3 NUMEROS YA ES SUFICIENTE.

#LO UNICO QUE LE FALTA AL PROGRAMA, ES VER COMO HACER PARA COMPARAR SI EL NUMERO INGRESADO
#ES MENOR A 0, QUE SALTE A VOLVER Y QUE AL RETORNAR, FINALIZA EL PROGRAMA.


.data
Dir_control: .word 0x10000
Dir_data:    .word 0x10008
str_cero:    .asciiz "Se ingreso el numero cero"
str_uno:     .asciiz "Se ingreso el numero uno"
str_dos:     .asciiz "Se ingreso el numero dos"
str_tres:    .asciiz "Se ingreso el numero tres"
str_cuatro:  .asciiz "Se ingreso el numero cuatro"
str_cinco:   .asciiz "Se ingreso el numero cinco"
str_seis:    .asciiz "Se ingreso el numero seis"
str_siete:   .asciiz "Se ingreso el numero siete"
str_ocho:    .asciiz "Se ingreso el numero ocho"
str_nueve:   .asciiz "Se ingreso el numero nueve"

.code
daddi $sp, $sp, 0x400      # reservo espacio para usar la pila
ld $a0, Dir_control($zero)
ld $a1, Dir_data($zero)

jal ingreso

halt


ingreso: daddi $sp, $sp, -8
         sd $ra, 0($sp)

         daddi $s0, $s0, 8
         sd $s0, 0($a0)    # le paso a control cod.8
         ld $s1,0 ($a1)    # le paso a DATA el valor ingresado
 # tengo que verificar que el valor ingresado sea un digito entre 1 y 9

        slti $t0, $s1,0
        # si el num ingresado es menor a 0 entonces $t0=1
        #como nosotros queremos que salte si el numero es mayor a 0 entonces:
        #si $t1=1 que vaya a volver. porq es distinto de [0....9]
       bnez $t0, volver

        slti $t0,$s1,10 #si el num ingresado es menor a 10 entonces $t0=1
        beqz $t0, volver#si $t0=0 es xq lo que se ingresó es mayor a 10


         jal muestra

volver: ld $ra,0($sp)
        daddi $sp, $sp, 8
        jr $ra



muestra: daddi $t1, $zero, 0
         beq $t1, $s1, Es_cero

         daddi $t1, $zero, 1
         beq $t1, $s1, Es_uno

         daddi $t1, $zero, 2
         beq $t1, $s1, Es_dos

         daddi $t1, $zero, 3
         beq $t1, $s1, Es_tres

         daddi $t1, $zero, 4
         beq $t1, $s1, Es_cuatro

         daddi $t1, $zero, 5
         beq $t1, $s1, Es_cinco

         daddi $t1, $zero, 6
         beq $t1, $s1, Es_seis

         daddi $t1, $zero, 7
         beq $t1, $s1, Es_siete

         daddi $t1, $zero, 8
         beq $t1, $s1, Es_ocho

         daddi $t1, $zero, 9
         beq $t1, $s1, Es_nueve
         nop
         nop
         jr $ra

Es_cero: daddi $t2, $zero, str_cero
         sd $t2, 0 ($a1)
         daddi $t3,$zero, 4
         sd $t3,0 ($a0)

         jr $ra

Es_uno: daddi $t2, $zero, str_uno
         sd $t2, 0 ($a1)
         daddi $t3,$zero, 4
         sd $t3,0 ($a0)

         jr $ra

Es_dos:  daddi $t2, $zero, str_dos
          sd $t2,0 ($a1)
          daddi $t3, $zero, 4
          sd $t3,0($a0)

            jr $ra


Es_tres:  daddi $t2, $zero, str_tres
          sd $t2,0 ($a1)
          daddi $t3, $zero, 4
          sd $t3,0($a0)

            jr $ra

Es_cuatro:  daddi $t2, $zero, str_cuatro
            sd $t2,0 ($a1)
            daddi $t3, $zero, 4
            sd $t3,0($a0)

            jr $ra
Es_cinco:  daddi $t2, $zero, str_cinco
          sd $t2,0 ($a1)
          daddi $t3, $zero, 4
          sd $t3,0($a0)

            jr $ra
            jr $ra
Es_seis:  daddi $t2, $zero, str_seis
          sd $t2,0 ($a1)
          daddi $t3, $zero, 4
          sd $t3,0($a0)

            jr $ra

            jr $ra
Es_siete:  daddi $t2, $zero, str_siete
          sd $t2,0 ($a1)
          daddi $t3, $zero, 4
          sd $t3,0($a0)

            jr $ra
            jr $ra
Es_ocho:  daddi $t2, $zero, str_ocho
          sd $t2,0 ($a1)
          daddi $t3, $zero, 4
          sd $t3,0($a0)

            jr $ra

            jr $ra
Es_nueve:  daddi $t2, $zero, str_nueve
          sd $t2,0 ($a1)
          daddi $t3, $zero, 4
          sd $t3,0($a0)

            jr $ra


