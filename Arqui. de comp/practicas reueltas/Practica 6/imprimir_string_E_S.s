# este programa muestra un string en pantalla

.data
Dir_control: .word 0x10000
Dir_data:    .word 0x10008
msj:         .asciiz "dejo a su novio porque era un guarani"

.code
ld $t0, Dir_control ($zero)
ld $t1, Dir_data ($zero)

; necesito copiar la direc de string en un registro
; y despues pasar el registro a DATA
daddi $t3, $zero, msj ; copio offset de msj en $t3

sd $t3, 0($t1) ; mando offset de msj a DATA

daddi $t4, $zero, 4 ; cod de operacion string
sd $t4, 0($t0)     ; mando el cod a control, y imprime en pantalla
halt
