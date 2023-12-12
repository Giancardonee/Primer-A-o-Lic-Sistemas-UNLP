{implementar un programa que lea por teclado 
dos numeros enteros, y los imprima en orden inverso
es decir si se ingresaron los nros 4 y 8  debera imprimir: 
'se ingresaron los numeros 8 y 4}

program uno; 
var
n1,n2: integer; 
begin
	write('Ingrese el primer numero: '); 
		readln(n1); 
	write('Ingrese el segundo numero: '); 
		readln(n2); 
		
		write('----> Se ingresaron los numeros ',n2, '  y ' , n1); 
end.
