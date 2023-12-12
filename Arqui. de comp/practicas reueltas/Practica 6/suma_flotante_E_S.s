# este programa suma dos numeros en punto flotante
# y los imprime en pantalla.
# (utilizando el cod 3 para punto flotante)

.data
Dir_control: .word 0x10000
Dir_data:    .word 0x10008
A:           .double 5
B:           .double 15.05

.text
# cargo en registros las dir de control y data
ld $t1, Dir_control($zero)
ld $t2, Dir_data($zero)
#cargo en registros p.f A y B

l.d f0, A ($zero)
l.d f1, B ($zero)
# suma de registros p.f
add.d f2, f1, f0
#almaceno registro p.f en DATA
s.d f2, 0($t2)
#inicializo un registro para usar cod 3
daddi $t3, $zero, 3
sd $t3, 0($t1)
halt




