# este programa lee numeros hasta que se ingrese el num 0
# luego imprime en pantalla la suma de esos numeros

.data
Dir_control: .word 0x10000
Dir_data:    .word 0x10008
.code
ld $t0, Dir_control ($zero)
ld $t1, Dir_data($zero)

daddi $t7, $zero, 8 ; cod. leer num
daddi $t6, $zero, 0 ; inicializo resultado en 0

loopardo: sd $t7, 0 ($t0) ; le paso [cod.8] a control
          ld $t2, 0 ($t1) ; leo num
  #si el numero ingresado = 0, jmp fin
          beqz $t2, fin
          dadd $t3, $t3, $t2
  #t3 es mi variable resultado
          j loopardo

fin: sd $t3, 0($t1) ; le paso el resultado a DATA
     daddi $t5, $zero, 1; $t5= [cod.1] imprime entero ss
     ; imprimo
     sd $t5, 0 ($t0)
     halt
