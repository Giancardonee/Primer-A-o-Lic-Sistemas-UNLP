# este programa lee una cadena de 5 caracteres
# y la almacena en memoria

.data
Dir_control: .word 0x10000
Dir_data:    .word 0x10008
cadena:      .asciiz "....."
.code
ld $t0, Dir_control($zero)
ld $t1, Dir_data($zero)
daddi $t3, $zero, 9 ; cod.9 leer caracteres
daddi $t4, $zero, 0 ; desplazamiento
daddi $t5, $zero, 5 ; longitud

loop: sd $t3, 0($t0) ; le paso cod.9 a control
      lbu $t6,0($t1) ; cargo desde data 1 byte
      sb  $t6,cadena($t4)
      daddi $t4, $t4, 1 ;desplazamiento
      daddi $t5, $t5,-1; longitud
      bnez $t5, loop

   ; si entra aca es porque $t5 = 0
   ; osea llegó al fin de la cadena

   daddi $t5, 0,cadena ;mando offset de cadena a $t5
   sd $t5,0 ($t1)      ;mando a data el offset de la cadena
   daddi $t6, $zero, 4 ;$t6: cod.4 = codigo para imprimir string
   sd $t6, 0($t0)      ;pongo cod.4 en control
   halt




