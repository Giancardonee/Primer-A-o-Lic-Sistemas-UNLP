# este programa lee numeros hasta que se ingrese el num 0
# luego imprime en pantalla la suma de esos numeros

.data
Dir_control: .word 0x10000
Dir_data:    .word 0x10008
cero:        .double 0
.code
ld $t0, Dir_control ($zero)
ld $t1, Dir_data($zero)

daddi $t7, $zero, 8 ; cod. leer num
l.d f0,cero($zero) ; variable resultado
l.d f1,cero($zero) ; variable para comparar flag

loopardo: sd $t7, 0 ($t0) ; le paso [cod.8] a control
          l.d f2, ($t1) ; leo num
  #si el numero ingresado es 0, f2 y f1 van a ser iguales
  # se activa el flag, si flag=1 salta a fin
          c.eq.d f1,f2
          bc1t fin
          add.d f0, f0, f2
          j loopardo

fin: s.d f0, 0($t1) ; le paso el resultado a DATA
     daddi $t5, $zero, 3; $t5= [cod.3] imprime en punto flotante
     ; imprimo
     sd $t5, 0 ($t0)
     halt
