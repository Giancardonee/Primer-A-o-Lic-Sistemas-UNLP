org 1000h ; variables 
txt db "ooLVSAs"
fin db 00h
org 3000h
CONTAR_MIN: mov cx,00h
incio: cmp BYTE PTR [bx],97
js sig
cmp BYTE PTR [bx],123
jns sig
inc cx
sig: inc bx
cmp BYTE PTR [bx],0
jnz incio
final: ret
org 2000h
mov bx,offset txt
call CONTAR_MIN
hlt
end
