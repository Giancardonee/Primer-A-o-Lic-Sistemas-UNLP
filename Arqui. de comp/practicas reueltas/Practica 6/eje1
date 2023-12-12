# cambiar el programa que nos dan, para que en vez del mensaje predefinido
# "Hola Mundo", sea ingresado por teclado, en lugar de ser un mensaje fijo


.data
Dir_control: .word 0x10000
Dir_data:    .word 0x10008
cadena:      .asciiz ".........."
.code
ld $t0, Dir_control($zero)
ld $t1, Dir_data ($zero)

; 3 cuentas a tener en cuenta:
; desplazamiento, cod. e/s, longitud

daddi $t2, $zero, 0 ; desplazamiento
daddi $t3, $zero, 9 ; [cod.ingresar car]
daddi $t4, $zero, 10; longitud

loop:   sd $t3, 0($t0) ; paso cod.9 a control
        lbu $t5,0($t1) ; cargo desde data, un caracter a $t5
        sb $t5,cadena($t2) ;guardo caracter en cadena

;incrementar desplazamiento
;decrementar longitud, si longitud no es 0, jmp loop
;si longitud es 0, Va a imprimir la cadena en pantalla
;usamos cod.4 para imprimir

        daddi $t2, $t2, 1 ; como son bytes, incrementamos de a 1
        daddi $t4, $t4, -1; dec long
        bnez $t4, loop
Imprimir: daddi $t4, $zero, cadena ; $t4= offset cadena
          sd $t4,0 ($t1) ; paso a data offset cadena
          daddi $t7, $zero, 4
          sd $t7,0 ($t0) ; paso cod.4(imprimir) a control
          halt




