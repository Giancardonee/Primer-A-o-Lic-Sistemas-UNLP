{Realizar un programa que lea 2 números enteros desde teclado e informe en pantalla cuál de los
dos números es el mayor. Si son iguales debe informar en pantalla lo siguiente: “Los números leídos
son iguales”.}

program uno; 
var
n1,n2: integer; 
begin
	write('Ingrese el primer numero: ') ; 
		readln(n1); 
	write('Ingrese el segundo numero: '); 
		readln(n2); 
		
		writeln; 
		
		if ( n1 > n2 ) then 
			writeln('El primer numero es el numero mayor ')
		else if ( n2 > n1 ) then
			writeln('El segundo numero es el numero mayor')
		else 
			writeln('Los numeros son iguales'); 
end.
