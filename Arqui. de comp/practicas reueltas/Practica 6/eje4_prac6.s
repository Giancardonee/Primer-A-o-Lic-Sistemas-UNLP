.data
Dir_control:       .word 0x10000
Dir_data:          .word 0x10008
clave_ingresada:   .asciiz "...."
clave_predefinida: .asciiz "edlp"
correcto:          .asciiz "Bienvenido"
incorrecto:        .asciiz "ERROR"
.code
ld $a0, Dir_control($zero)
ld $a1, Dir_data($zero)


jal char
jal respuesta

halt
# para hacer la subrutina char, tengo que tener en cuenta tres cosas:
# Desplazamiento, cod de ingresar char, y longitud
char:   daddi $t0, $zero, 9 ; cod.9 [ingresar de a un caracter]
        daddi $t1, $zero, 4 ; longitud
        daddi $t2, $zero, 0 ; desplazamiento
loop:   sd $t0, 0($a0)               # le paso cod.9 a control
        lbu $s0,0($a1)               # ingreso el car, lo guardo en $s0
        sb $s0, clave_ingresada($t2) #guardo el car ingresado, en memoria
        daddi $t2, $t2, 1            #incremento desplazamiento
        daddi $t1,$t1, -1            #decremento longitud
        bnez $t1, loop               #mientras $t1 sea DISTINTO de 0, anda a loop

        jr $ra


# para hacer la subrutina respuesta, tengo que guardar ambas cadenas
# (clave_ingresada | y | clave_predefinida) en distintos registros
# tengo que comparar ambos registros, en el caso que sean iguales, que salte a la #etiqueta iguales, y que muestre en pantalla "Bienvenido"
# Si no son iguaes ,el programa no salta, por lo tanto va a mostrar en pantalla ERROR

respuesta: ld $s1, clave_ingresada($zero)
           ld $s2, clave_predefinida($zero)
           beq $s1, $s2, clave_correcta

clave_incorrecta: daddi $s3, $zero, incorrecto # copio en $s3 offset de Error
                  sd $s3, 0($a1)               # mando la cadena a DATA
                  daddi $s4, $zero, 4          # cod.4 [imprimir string]
                  sd $s4, 0($a0)               # le paso cod.4 a control, e imprime msj "ERROR"

            j fin

clave_correcta: daddi $s3,$zero, correcto
                sd $s3,0 ($a1)
                daddi $s4, $zero, 4
                sd $s4,0 ($a0)

            fin: jr $ra



