# este programa solicita el ingreso de un numero, si el numero es 1
# el programa imprime en pantalla, se ingresó el numero 1
# de lo contrario, el programa finaliza

.data
Dir_control: .word 0x10000
Dir_data:    .word 0x10008
cadena_ocho:  .asciiz "ocho "
.code
ld $t0, Dir_control($zero)
ld $t1, Dir_data($zero)

daddi $s0, $s0, 8 # codigo ingresar caracter
sd $s0, 0($t0) # mando cod.8 a control
ld $t5, 0($t1) # ingreso un numero a traves de DATA, y lo guardo en $t1
 daddi $t7,$zero, 4 ; cod.4 codigo para imprimir
 beq $t5, $s0, Es_ocho
 nop
 nop


fin: halt

Es_ocho: daddi $t8, $zero ,cadena_ocho
         sd $t8, 0 ($t1) ; mando offset de cadena a DATA

         sd $t7,0 ($t0)
         #supuestamente, tendria que imprimir y finaliza el programa
         j fin

