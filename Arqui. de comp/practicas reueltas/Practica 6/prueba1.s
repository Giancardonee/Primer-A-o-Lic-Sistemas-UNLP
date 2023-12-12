.data
Dir_control: .word 0x10000
Dir_data:    .word 0x10008
str_uno:         .asciiz "Ingresaste un uno"
str_dos:         .asciiz "Ingresaste un dos"
str_tres:        .asciiz "Ingresaste un tres"
str_cuatro:      .asciiz "Ingresaste un cuatro"
str_cinco:       .asciiz "Ingresaste un cinco"
Tabla:           .word 1,2,3,4,5,6,7,8
.code
daddi $sp, $sp, 0x400 # reservo espacio para usar la pila

ld $a0, Dir_control($zero)
ld $a1, Dir_data($zero)

daddi $s0, $zero, 8; cod.8 = ingresar numero
daddi $t3,$zero, 8 ; longitud
; $t2 desplazamiento
nop
nop
nop

jal ingreso
nop
nop
nop
halt


ingreso: daddi $sp,$sp,-8
         sd $ra,0 ($sp)   #PUSH DE $RA (DIREC. DE RETORNO)


            sd $s0, 0($a0) ; mando cod.8 a CONTROL
            ld $t0, 0($a1) ; ingreso num a través de DATA, y lo guardo en $t0

     #recorro vector, si el numero ingresado, está en el vector, que salte a muestra
loop:  ld $t1, Tabla($t2)
       beq $t0, $t1, subrutina_2
       daddi $t3, $t3, -1 ; dec long
       daddi $t2, $t2, 8  ; desplazamiento
       bnez $t3, loop
       j volver



subrutina_2: jal muestra
nop
nop
nop

volver: ld $ra, 0($sp)  #POP DE $RA (DIREC. DE RETORNO)
        daddi $sp, $sp, 8
    jr $ra

muestra: daddi $s7,$zero, 1
         beq $s7, $t0, Es_uno # SI SON IGUALES, SALTA A ES_UNO

         nop
         nop
         nop

ret: jr $ra

Es_uno: daddi $s6,$zero, str_uno
        sd $s6,0 ($t1)
        daddi $s5,$zero,4
        sd $s5,0 ($t0)
        j ret

