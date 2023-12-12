{Realizar un programa que ingrese 40 numeros por teclado
y saque el porcentaje de los numeros multiplos de 3}

// En este caso vamos a cargar 5 numeros
program eje1Teoria; 

const
	Cantidad = 5; 
	
var
i,num,cantMultiplos: integer;
porcentaje: real ; 
begin
cantMultiplos:= 0 ; 
	for i:= 1 to Cantidad do 
		begin
			write('Ingrese un numero: '); 
				readln(num); 
				   if ((num MOD 3) = 0) then
						cantMultiplos:= cantMultiplos + 1 ;
		end;
porcentaje:= ((cantMultiplos *100) /Cantidad) ;
writeln(); 
writeln('El porcentaje de numero multiplos de 3 son: %',porcentaje:2:1); 
end.
