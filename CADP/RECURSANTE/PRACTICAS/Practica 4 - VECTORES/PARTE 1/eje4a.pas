{ se dispone de un vector de 100 numeros enteros   
*  realizar los siguientes modulos :  }

//La constante DimF tiene valor 100

{a) posicion: dado un número X y el vector de números, retorna la posición del número X en dicho vector,
o el valor -1 en caso de no encontrarse. }
function BuscarPos (v: vector; x: integer): integer; 
var
pos : integer; 
seguir : boolean; 
begin
pos:= 1 ; 
seguir := True; 
			while ( (pos <= DimF) and (seguir = True)) do 
				begin
						if (v[pos] = x ) then  { si encontre el elemento, seguir = false }
							seguir = false
						else 
							pos:= pos + 1 ;    { si no encontre el elemento, sigo avanando por el vector }
				end; 
	if ( seguir = false ) then 
			BuscarPos:= pos { retorno la posicion donde se encuentra el elemento}
	else
			BuscarPos:= -1 ;   { si retorno -1 es porque no se encontro el elemento } 
end;  
 
 
