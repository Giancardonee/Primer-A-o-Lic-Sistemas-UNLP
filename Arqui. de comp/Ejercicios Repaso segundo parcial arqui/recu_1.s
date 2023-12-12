# El siguiente programa hace una suma de numeros en punto flotante
# y los multiplica por un numero ingresado
# y guarda el resultado en la variable RES

.data
A: .double 15.0
AA: .double 55.0
RES:  .double 0
Control:  .word 0x10000
Data:     .word 0x10008

.code
ld $a1, Control($zero)
ld $a0, Data   ($zero)
l.d f1, A ($zero)
l.d f2, AA($zero)

# para ingresar caracter, uso la opcion 8 en control
# y despues en data hago un l.d para cargar el valor ingresado en registro

add.d f3, f2,f1 # suma A y AA y guarda el resultado en f3

#ahora ingreso valor por teclado:
daddi $t0, $zero, 8
sd $t0, 0($a1)
l.d f5, 0($a0)

# una vez que cargue el valor ingresado, se lo multiplico a la suma
# de esos dos numeros en memoria

mul.d f0, f5,f3
nop
nop
nop
s.d f0, RES($zero)
halt










