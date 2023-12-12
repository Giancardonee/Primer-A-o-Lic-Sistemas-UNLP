{4. Realizar un programa que lea un número real X. Luego, deberá leer números reales hasta que se
ingrese uno cuyo valor sea exactamente el doble de X (el primer número leído)}

{Este programa se puede hacer sin utilizar una variable extra: , o
* utilizando una variable adicional: Doble_numero}

program cuatro; 
var
numero,Doble_numero: integer; 
begin
	write('Ingrese un numero: '); 
		readln(numero); 
	    Doble_numero:= numero * 2;
			while ( numero <> Doble_numero )do
				begin
					write('Ingrese un numero: '); 
						readln(numero); 
				end; 
				writeln; // salto de linea
		writeln ('-----> Se ingreso el doble del primer numero leido '); 
end.
