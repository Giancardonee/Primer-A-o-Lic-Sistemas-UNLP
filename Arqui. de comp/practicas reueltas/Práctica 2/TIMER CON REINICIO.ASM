; timer con reinicio 


; constantes
PIC EQU 20H
EOI EQU 20H 
IMR EQU 21H
INT1 EQU 25H

; CONSTANTES DEL TIMER 
CONT EQU 10H 
COMP EQU 11H 

org 1000h
flag db 0
msj db "PASARON 10'SEG , TE QUIERO "
fin db ? 

org 160 ; 40 x 4 = 160 tabla de vectores
IP_clock DW rut_clock


org 3000h
rut_clock: push ax
          mov bx, offset msj
          mov al, offset fin- offset msj
          int 7
          MOV AL,0     ; timer con reset 
          OUT CONT, AL  ; reseteo cont 
          mov al, 20h
          out EOI, al
          
           pop ax


iret

ORG 2000H
 
 cli ; desactivo int 
 
 ; 1) conf imr , habilito int 
 mov al, 11111101b ; habilito timer
 out IMR, al
 
 ; 2) conf int 
 mov al, 40 ; 40 x 4= 160 
 out INT1, al
 
 ; conf contador, inicializo 
 mov al, 0
 out CONT, al
 
 ; conf cada cuanto quiero que interrumpa 
 
 mov al, 10
 out COMP, al
 
 sti ; activo int 

lazo: cmp flag ,1 
      jnz lazo

END
