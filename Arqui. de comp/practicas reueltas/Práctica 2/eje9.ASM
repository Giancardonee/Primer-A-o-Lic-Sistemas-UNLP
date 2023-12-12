//Escribir un programa que aguarde el ingreso de una clave de cuatro caracteres por teclado sin visualizarla 
//en pantalla. En  caso de coincidir con una clave predefinida (y guardada en memoria) que muestre el mensaje
 // "Acceso permitido", caso contrario el mensaje "Acceso denegado". 

org 1000h 
msj1 DB "ingrese la clave de 4 caracteres "
fin1 DB  ? 
msj2 DB "ACCESO PERMITIDO "
fin2 db ? 
msj3 DB "ACCESO DENEGADO"
fin3 DB ? 

org 1500h
c1 DB ? 
c2 DB ? 
c3 DB ? 
c4 DB ? 
cont DB 4

org 3000h
; contraseña predefinida Abc7

NO_ES: mov bx, offset msj3 
        mov al, offset fin3- offset msj3 
        int 7 
        ; IMPRIMO acceso denegado 


ret 

corroborar: cmp c1, 041h  ; comparo si es "A"
            jnz NO_ES 
            cmp c2, 062h ; comparo si es "b"
            jnz NO_ES
            cmp c3, 063h ; comparo si es "c" 
            jnz NO_ES
            cmp 7,037h ; comparo si es "7"
            jnz NO_ES
            jmp CORRECTO 

RET 

CORRECTO: mov bx, offset msj2
          mov al, offset fin2- offset msj2
          int 7 
         ; IMPRIME acceso permitido   
RET
org 2000h
mov bx, offset msj1 
mov al, offset fin1- offset msj1
int 7 

mov bx, offset c1 
int 6 

mov bx, offset c2 
int 6 
mov bx, offset c3 
int 6 

mov bx, offset c4 
int 6 

call corroborar
int 0 
end
