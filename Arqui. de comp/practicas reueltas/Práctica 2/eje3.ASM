org 1000h
mayus DB 041h
minus DB 061h
org 2000h
mov cl, mayus
mov dl, minus 
lazo: mov [bx], cl
      inc byte ptr [bx]
      mov [bx], al 
      inc al ; contador 
      cmp al, 50
      jz fin 
      jmp lazo
fin:int 7
int 0 
end
