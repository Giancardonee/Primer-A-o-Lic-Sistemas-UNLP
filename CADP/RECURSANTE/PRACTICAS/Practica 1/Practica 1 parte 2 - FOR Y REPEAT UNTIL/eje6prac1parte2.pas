{6. Realizar un programa que lea información de 200 productos de un supermercado. De cada producto
se lee código y precio (cada código es un número entre 1 y 200). Informar en pantalla:
- Los códigos de los dos productos más baratos.
- La cantidad de productos de más de 16 pesos con código par.}

program seis;
type
rango_Codigo = 1..200; 
var
codigo, codigoMin1,codigoMin2: rango_Codigo; 
i,cantProd_parMayor: integer; 
precio, min1,min2: real; 
begin
min1:= 9999; 
min2:= 9999; 
cantProd_parMayor:= 0 ;   
codigoMin2:=  1;  // preguntar si debo inicializar en 0 o en 1
codigoMin1:=  1 ;  // pregunta si debo inicializar en 0 o en 1
  for i := 1 to 4 do 
     begin
        write('Ingrese el codigo del producto: '); 
        readln(codigo); 
        write('Ingrese el precio del producto: '); 
        readln(precio);
            if ( precio < min1 ) then 
					  begin 
					        min2:= min1; 
					        min1:= precio; 
					        codigoMin2:= codigoMin1 ; 
					        codigoMin1:= codigo ;
					  end 
           else if ( precio < min2 ) then 
                      begin
                           min2:= precio; 
                           codigoMin2:= codigo ;
                       end;
          if (precio > 16) and (( codigo mod 2 )= 0) then 
				cantProd_parMayor:= cantProd_parMayor + 1 ;
				
	writeln ;
     end;// end del for
     writeln ('Los codigos de los dos productos mas baratos son: ( 1 ) ', CodigoMin1, ' y  ( 2 ) ',codigoMin2 ); 
     writeln ('La cantidad de productos que salen mas de 16 pesos con codigo par son: ',cantProd_parMayor); 
end.
