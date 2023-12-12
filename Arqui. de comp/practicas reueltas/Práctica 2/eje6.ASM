;Escribir un programa que solicite el ingreso de un número (de un dígito)
;por teclado y muestre en pantalla dicho 
;número expresado en letras. Luego que solicite el ingreso
;de otro y así sucesivamente. Se debe finalizar la ejecución al 
;ingresarse en dos vueltas consecutivas el número cero. 

org 1000h
msj1 DB "INGRESE UN NUMERO:"
fin1 DB ?
msj2 DB "   no ingreso un numero "
fin2 DB ? 
msj3 DB "   es cero   "
fin3 DB ? 
msj4 DB "   es uno   " 
fin4 DB ?
msj5 DB "   es dos   "
fin5 DB ?
msj6 DB " ***termino la ejecucion*** "
fin6 DB ?
org 1500h
num DB ? 
msj7 db "   "
fin7 DB ? 
org 3000h
comparar: cmp CL, 030h
          jz es_cero
          cmp CL, 031h
          jz es_uno
          cmp CL, 032h
          jz es_dos
         
          
no_num:mov bx, offset msj2
       mov al, offset fin2- offset msj2 
       int 7
       jmp lazo
       
        
es_cero: inc dl ; si llega a dos 0 anda a fin  
         mov bx, offset msj3
         mov al, offset fin3-offset msj3
         int 7
         cmp dL,02h 
         jz fin
         jmp lazo

es_uno: mov bx , offset msj4 
        mov al, offset fin4- offset msj4
        int 7 
        jmp lazo

es_dos:mov bx, offset msj5
      mov al, offset fin5-offset msj5
      int 7 
      jmp lazo
ret
org 2000h
      mov dl, 0 
lazo: mov bx, offset msj1
      mov al, offset fin1-offset msj1
      int 7 ; imprimo msj1 
      mov bx, offset num 
      int 6 ; ingreso caracter 
      mov CL, [BX] ; en CL va a estar el caracter ingresado 
      call comparar 
      
      
fin: mov bx, offset msj6
    mov AL, offset fin6- offset msj6
    int 7
int 0 
end
