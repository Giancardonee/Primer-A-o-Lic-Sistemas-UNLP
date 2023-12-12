org 1000h 
car DB "a"

org 3000h
Es_vocal: cmp BYTE PTR [BX],0 
           jz fin
           cmp BYTE PTR [BX], 61h ; comparo si es 'a'
           jz Si
           cmp BYTE PTR [BX], 61h ; comparo si es 'e'
           jz Si
           cmp BYTE PTR [BX], 61h ; comparo si es 'i'
           jz Si
           cmp BYTE PTR [BX], 61h ; comparo si es 'o'
           jz Si
           cmp BYTE PTR [BX], 61h ; comparo si es 'u'
           jz Si
           mov DX, 0
           jmp fin
          
          
          Si: mov DX, 1
          
 fin:ret
org 2000h
mov BX, offset car 
call Es_vocal
hlt
end