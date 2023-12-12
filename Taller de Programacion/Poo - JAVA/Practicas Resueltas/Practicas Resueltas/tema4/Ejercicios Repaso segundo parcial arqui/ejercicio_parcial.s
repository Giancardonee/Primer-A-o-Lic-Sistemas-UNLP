# ESTE ENUNCIADO ESTABA EN UNO DE LOS PARCIALES QUE VIMOS EN CLASE.

#  escriba un programa que lea una cadena de caracteres por teclado
#  hasta que se lea el 0, el programa deberá imprimmir la cadena ingresada
#  en orden normal, e inverso




.data
cadena_inversa:    .asciiz ""
car_0:             .asciiz "0"
Dir_control:       .word 0x10000
Dir_data:          .word 0x10008
cadena_ingresada:  .asciiz ""
.code
ld $a0, Dir_control($zero)
ld $a1, Dir_data   ($zero)
ld $t0, car_0($zero)
jal ingresar_car
jal invertir_cadena
jal imprimir
halt


ingresar_car: daddi $s0, $zero, 9 # Cod.9 ingresar caracter
              daddi $s1, $zero, 0 #longitud
              daddi $s2, $zero, 0 #desplazamiento

loop1:          sd $s0, 0($a0)
              lbu $s3,0($a1)
              sb $s3, cadena_ingresada($s2)
              daddi $s1, $s1, 1   # inc longitud
              daddi $s2, $s2, 1   # inc desplazamiento
              bne $s3,$t0, loop1
              jr $ra


invertir_cadena: daddi $t1, $zero,-1#no me acuerdo xq puse -1, pero con 0 no funciona
                 daddi $t7, $zero, -1
loop2:           lbu $t0, cadena_ingresada ($s2)
                 sb  $t0, cadena_inversa   ($t1)
                 daddi $s1, $s1, -1     # dec longitud
                 daddi $s2, $s2, -1     # dec desplazamiento de cadena ingresada
                 daddi $t1, $t1, 1      # inc desplazamiento de cadena inversa
                 bne $s1, $t7, loop2

                 jr $ra






imprimir: daddi $s4,$zero, 4      # Cod.4 imprimir string
          daddi $s5, $zero, cadena_ingresada
          sd $s5, 0($a1)          # Pasamos offset cadena_ingresada a DATA
          sd $s4, 0($a0)         # Cod.4 a control [imprime string]

  # aca deberia imorimirnos la cadena en el orden que ingresamos los caracteres

  # ahora imprimo cadena inversa
         daddi $s7, $zero, cadena_inversa
         sd $s7,0 ($a1)           # Pasamos offset cadena_inversa a DATA
         sd $s4,0 ($a0)           # Cod.4 a control [imprime string]

          jr $ra



