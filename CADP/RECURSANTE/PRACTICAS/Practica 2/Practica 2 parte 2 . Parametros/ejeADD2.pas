{ Realice un programa modularizado que lea 10 pares de números (X,Y) e informe, para cada par de
números, la suma y el producto de todos los números entre X e Y.
Por ejemplo, dado el par (3,6), debe informar:
“La suma es 18“ (obtenido de calcular 3+4+5+6)
“El producto es 360“ (obtenido de calcular 3*4*5*6) }

program eje2ADD; 
const 
 paresDeNros_aLeer = 5 ;
 
 function sumarNros (n1,n2: integer): integer; 
 var
 i,,suma: integer; 
 begin
 suma:= 0 ; 
  for i:= n1 to n2 do 
     suma:= suma + i; 
 sumarNros:= suma; 
 end; 
 
 function productosNros (n1,n2:integer): integer ; 
 var
 i,producto: integer; 
 begin
 producto:= 1 ; 
			for i:= n1 to n2 do 
             producto:= producto * i; 
   productosNros:= producto; 
 end; 
 
 procedure LeerNumeros (var n1,n2: integer); 
   begin
     write ('Ingrese el primer numero ( numero menor ): '); 
       readln(n1);
      write ('Ingrese el segundo numero ( numero mayor ): '); 
       readln (n2); 
   end;  

var
n1,n2: integer; 
begin
LeerNumeros(n1,n2); 
writeln ('La suma es: ',sumarNros(n1,n2)); 
writeln ('El producto de los numeros es: ',productosNros(n1,n2)); 
end.
