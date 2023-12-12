//Escribir un programa que efectúe la suma de dos números (de un dígito cada uno) ingresados por teclado y 
//muestre el resultado en la pantalla de comandos. Recordar que el código de cada caracter ingresado 
//no coincide con el número que representa y que el resultado puede necesitar ser expresado con 2 dígitos. 

org 1000h 
msj DB "  ingrese un numero:  "
fin1 DB ?

msj2 DB " EL RESULTADO DE LA SUMA ES:  "
fin2 DB ?
org 1500h
n1 DB ?
n2 DB ?
totalA DB 0
totalB DB ? 


org 3000H

validar: mov bx, offset msj2
    mov al, offset fin2 -offset msj
    int 7 ; "IMPRIMO EL RESULTADO ES"  

    mov bx, offset totalB 
    mov al, 1 
    int 7

RET 

convertir: mov CL, n1 ;  
    sub CL, 030h ; para que quede solo un digito 
    mov DL, n2 
    add CL, DL
    cmp CL, 3Ah 
    js validar 
    ; si el result es > 9 // resto 10 
    inc totalA ; el numero va a ser de dos digitos 
    /// en el primer digito está el 1
    mov cl, totalB 


    mov bx, offset msj2
    mov al, offset fin2 -offset msj
    int 7 ; "IMPRIMO EL RESULTADO ES"  
    
    mov bx, offset totalB
    mov al, 2 ; imprime "los dos digitos"  
    int 7 
    

RET 

pedirnum: mov bx, offset n1 
    int 6 ; ingreso n1 
    mov bx, offset n2 
    int 6 ; ingreso n2
    call convertir 

RET

org 2000H
mov bx, offset msj 
mov al, offset fin1- offset msj 
int 7 

call pedirnum 

int 0 
END
