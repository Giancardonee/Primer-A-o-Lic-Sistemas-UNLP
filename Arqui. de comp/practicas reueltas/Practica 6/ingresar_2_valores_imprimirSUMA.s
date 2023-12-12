#este programa lee dos numeros , e imprime la suma en pantalla

.data
Dir_control: .word 0x10000
Dir_data:    .word 0x10008

.code
ld $t0, Dir_control($zero)
ld $t1, Dir_data($zero)

daddi $t7, $zero, 8 ; cod leer num

sd $t7, 0($t0); le cargo cod. 8 a control
ld $t2, 0($t1); leo num1 ($t1 es DATA, tener en cuenta)

sd $t7, 0($t0); le cargo cod. 8 a control
ld $t3, 0 ($t1); leo num2 ($t1 es DATA, tener en cuenta)

;hago la suma de enteros

dadd $t4, $t3, $t2

; hacemos de cuenta que el resultado es positivo, entoonces
daddi $t7, $zero, 1 ; cod. 1 imprimir entero

sd $t4, 0($t1); le paso el resultado de la suma a DATA
sd $t7, 0($t0); le paso cod.1 a control para imprimir enteros
halt







