{9. Realizar un programa que lea un carácter, que puede ser “+” (suma) o “-” (resta); si se ingresa otro
carácter, debe informar un error y finalizar. Una vez leído el carácter de suma o resta, deberá leerse
una secuencia de números enteros que finaliza con 0. El programa deberá aplicar la operación leída
con la secuencia de números, e imprimir el resultado final.
Por ejemplo:
○ Si se lee el carácter “-” y la secuencia 4 3 5 -6 0 , deberá imprimir: 2 (4 – 3 – 5 - (-6) )
○ Si se lee el carácter “+” y la secuencia -10 5 6 -1 0, deberá imprimir 0 ( -10 + 5 + 6 + (-1) )}

program nueve;
var
operacion: Char; 
num,res: integer; 
begin
res:= 0 ;
 write ('Ingrese una operacion a realizar ( + o - ): ');
	readln (operacion); 
	 if (operacion = '+') or (operacion ='-') then 
		begin
		    write('Ingrese un numero: '); 
              readln(num); 
               while ( num <>0 ) do 
					 begin
							if (operacion = '+') then
							  res:= res + num 
							else 
							   res:= res - num;
							 
				       write('Ingrese un numero: '); 
				       readln(num); 
					 end; // end del while
			writeln ('El resultado de la operacion ingresada ( ',operacion, ' ) es: ',res); 
		end // end del if
     else 
        writeln('No se ingreso una operacion valida.')
end.
