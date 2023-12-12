# convertir a un entero, un valor en punto flotante, almacenado en el registro f9
# y dejarlo en el registro r5

# ASI CONVIERTO DE FLOTANTE A ENTRO.
# PRIMERO CONVIERTO A ENTERO, DOS REGISTROS FLOTANTES
# LUEGO COPIO EL VALOR DONDE CONVERTI EL ENTERO, EN UN REGISTRO FLOTANTE
.data
A:  .double 4.00
.code
l.d f9, A(r0)
cvt.l.d f9, f9 # convierto el registro f9, en valor entero
mfc1 r5, f9    # copio el valor del registro f9, en un registro entero
halt





