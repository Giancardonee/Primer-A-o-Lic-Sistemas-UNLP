{5. Modifique el ejercicio anterior para que, luego de leer el número X, se lean a lo sumo 10 números
reales. La lectura deberá finalizar al ingresar un valor que sea el doble de X, o al leer el décimo
número, en cuyo caso deberá informarse “No se ha ingresado el doble de X”.}

program cinco; 
var
x,Doble_x,contador: integer; 
encontre:boolean; 
begin
encontre:= false; 
contador:= 0 ; 
	write('Ingrese un numero: '); 
		readln(x); 
Doble_x:= ( x* 2); 		
			while (( x <>Doble_x  ) and ( contador < 10 ) and (encontre = false)) do 
					begin
							contador:= contador + 1 ;
							write ('Ingrese un numero: ') ; 
							readln (x); 
									if ( x = Doble_x) then 
												encontre:= true; 
					end ;
					
					writeln ; // salto de linea
					 
				if (not encontre) then 	
					writeln('No se encontro el doble de ',Doble_x/2:2:0)
				else
						writeln('Se encontro el doble de ',Doble_x/2:2:0)
					
end.

